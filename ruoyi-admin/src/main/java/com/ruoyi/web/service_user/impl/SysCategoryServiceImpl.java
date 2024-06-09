package com.ruoyi.web.service_user.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.entity_user.SysCategoryEntity;
import com.ruoyi.web.mapper.SysCategoryDao;
import com.ruoyi.web.service_user.SysCategoryService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class SysCategoryServiceImpl extends ServiceImpl<SysCategoryDao, SysCategoryEntity> implements SysCategoryService {
    @Resource
    SysCategoryDao syscategoryDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Object type = params.get("type");
        QueryWrapper<SysCategoryEntity> queryWrapper = new QueryWrapper<>();
        IPage<SysCategoryEntity> page = this.page(
                new Query<SysCategoryEntity>().getPage(params),
                queryWrapper.eq("type",type)
        );

        return new PageUtils(page);
    }

}