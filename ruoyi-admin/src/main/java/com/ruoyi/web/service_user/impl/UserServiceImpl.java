package com.ruoyi.web.service_user.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.entity_user.SysUserEntity;
import com.ruoyi.web.mapper.SysUserDao;
import com.ruoyi.web.service_user.UserService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.Query;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class UserServiceImpl extends ServiceImpl<SysUserDao, SysUserEntity> implements UserService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SysUserEntity> page = this.page(
                new Query<SysUserEntity>().getPage(params),
                new QueryWrapper<SysUserEntity>()
        );

        return new PageUtils(page);
    }

}