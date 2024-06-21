package com.ruoyi.user.service.impl;


import com.ruoyi.user.entity.constant.MessageConstant;
import com.ruoyi.user.entity.context.BaseContext;
import com.ruoyi.user.entity.dto.UserLoginDTO;
import com.ruoyi.user.entity.exception.LoginFailedException;
import com.ruoyi.user.entity.po.User;
import com.ruoyi.user.entity.properties.WeChatProperties;
import com.ruoyi.user.mapper.WeChatUserMapper;
import com.ruoyi.user.service.WeChatUserService;
import com.ruoyi.user.utils.HttpClientUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class WeChatUserServiceImpl implements WeChatUserService {

    //微信服务接口地址
    public static final String WX_LOGIN = "https://api.weixin.qq.com/sns/jscode2session";

    @Resource
    private WeChatProperties weChatProperties;
    @Resource
    private WeChatUserMapper weChatUserMapper;

    /**
     * 微信登录
     * @param userLoginDTO
     * @return
     */
    public User wxLogin(UserLoginDTO userLoginDTO) {
        String openid = getOpenid(userLoginDTO.getCode());
        System.out.println(openid);
        //判断openid是否为空，如果为空表示登录失败，抛出业务异常
        if(openid == null){
            throw new LoginFailedException(MessageConstant.LOGIN_FAILED);
        }

        //判断当前用户是否为新用户
        User user = weChatUserMapper.getByOpenid(openid);

        //如果是新用户，自动完成注册
        if(user == null){
            user = User.builder()
                    .openid(openid)
                    .createTime(LocalDateTime.now())
                    .build();
            weChatUserMapper.insert(user);
        }
        Long userId = weChatUserMapper.getUser(openid);
        //存入线程
        BaseContext.setCurrentId(userId);
        System.out.println(userId);

        //返回这个用户对象
        return user;
    }

    /**
     * 调用微信接口服务，获取微信用户的openid
     * @param code
     * @return
     */
    private String getOpenid(String code){
        //调用微信接口服务，获得当前微信用户的openid
        Map<String, String> map = new HashMap<>();
        map.put("appid",weChatProperties.getAppid());
        map.put("secret",weChatProperties.getSecret());
        map.put("js_code",code);
        map.put("grant_type","authorization_code");
        String json = HttpClientUtil.doGet(WX_LOGIN, map);

        JSONObject jsonObject = JSON.parseObject(json);
        String openid = jsonObject.getString("openid");
        return openid;
    }
}
