package com.ruoyi.web.controller.user;


import com.ruoyi.user.entity.constant.JwtClaimsConstant;
import com.ruoyi.user.entity.dto.UserLoginDTO;
import com.ruoyi.user.entity.po.User;
import com.ruoyi.user.entity.properties.JwtProperties;
import com.ruoyi.user.entity.vo.UserLoginVO;
import com.ruoyi.user.result.Result;
import com.ruoyi.user.service.WeChatUserService;
import com.ruoyi.user.utils.JwtUtil;
import com.ruoyi.web.entity_user.SysUserEntity;
import com.ruoyi.web.service_user.UserService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户信息表
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 11:04:10
 */
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private WeChatUserService weChatUserService;
    @Autowired
    private JwtProperties jwtProperties;

    /**
     * 获取营业状态
     * @return
     */
    @GetMapping("/shop/status")
    public R getStatus(Long userId){
        Integer status = userService.getShopStatus(userId);
        return R.ok().put("data", status);
    }
    /**
     * 退出登录
     */
    @PostMapping("/user/logout")
    public R logout(HttpSession session){
        session.invalidate();
        return R.ok();
    }
    /**
     * 微信登录
     * @param userLoginDTO
     * @return
     */
    @PostMapping("/user/login")
    @ApiOperation("微信登录")
    public Result<UserLoginVO> login(@RequestBody UserLoginDTO userLoginDTO){
        log.info("微信用户登录：{}",userLoginDTO.getCode());

        //微信登录
        User user = weChatUserService.wxLogin(userLoginDTO);

        //为微信用户生成jwt令牌
        Map<String, Object> claims = new HashMap<>();
        claims.put(JwtClaimsConstant.USER_ID,user.getId());
        String token = JwtUtil.createJWT(jwtProperties.getUserSecretKey(), jwtProperties.getUserTtl(), claims);

        UserLoginVO userLoginVO = UserLoginVO.builder()
                .id(user.getId())
                .openid(user.getOpenid())
                .token(token)
                .build();
        return Result.success(userLoginVO);
    }
}
