package com.ruoyi.web.service_user.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.user.entity.po.User;
import com.ruoyi.user.mapper.WeChatUserMapper;
import com.ruoyi.web.entity_user.SysUserEntity;
import com.ruoyi.web.mapper.SysUserDao;
import com.ruoyi.web.service_user.UserService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl extends ServiceImpl<SysUserDao, SysUserEntity> implements UserService {
    @Resource
    SysUserDao sysUserDao;
    @Resource
    WeChatUserMapper weChatUserMapper;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SysUserEntity> page = this.page(
                new Query<SysUserEntity>().getPage(params),
                new QueryWrapper<SysUserEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public Integer getShopStatus(Long userid) {
        QueryWrapper<SysUserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userid);
        List<Integer> status = sysUserDao.selectList(queryWrapper).stream().map(SysUserEntity::getShopstatus).collect(Collectors.toList());
        return status.get(0);
    }

    @Override
    public Long getUserId(String openid) {
        return weChatUserMapper.getUser(openid);
    }

}