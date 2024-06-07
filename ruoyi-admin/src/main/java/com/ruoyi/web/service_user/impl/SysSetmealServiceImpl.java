package com.ruoyi.web.service_user.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.entity_user.SysSetmealEntity;
import com.ruoyi.web.mapper.SysSetmealDao;
import com.ruoyi.web.service_user.SysSetmealService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.Query;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class SysSetmealServiceImpl extends ServiceImpl<SysSetmealDao, SysSetmealEntity> implements SysSetmealService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Object categoryId = params.get("categoryId");
        QueryWrapper<SysSetmealEntity> queryWrapper = new QueryWrapper<>();
        IPage<SysSetmealEntity> page = this.page(
                new Query<SysSetmealEntity>().getPage(params),
                queryWrapper.eq("category_id",categoryId)
        );

        return new PageUtils(page);
    }

}