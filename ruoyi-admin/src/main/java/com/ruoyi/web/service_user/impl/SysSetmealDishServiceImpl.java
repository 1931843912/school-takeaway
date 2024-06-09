package com.ruoyi.web.service_user.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.entity_user.SysSetmealDishEntity;
import com.ruoyi.web.mapper.SysSetmealDishDao;
import com.ruoyi.web.service_user.SysSetmealDishService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class SysSetmealDishServiceImpl extends ServiceImpl<SysSetmealDishDao, SysSetmealDishEntity> implements SysSetmealDishService {
    @Resource
    SysSetmealDishDao sysSetmealDishDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SysSetmealDishEntity> page = this.page(
                new Query<SysSetmealDishEntity>().getPage(params),
                new QueryWrapper<SysSetmealDishEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<Long> getDishIds(Long id) {
        QueryWrapper<SysSetmealDishEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("setmeal_id",id);
        List<SysSetmealDishEntity> sysSetmealDishEntities = sysSetmealDishDao.selectList(queryWrapper);
        List<Long> idList = sysSetmealDishEntities.stream().map(sysSetmealDishEntity -> {
            return sysSetmealDishEntity.getDishId();
        }).collect(Collectors.toList());
        return idList;
    }

}