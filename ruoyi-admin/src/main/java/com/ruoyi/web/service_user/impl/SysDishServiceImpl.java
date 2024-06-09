package com.ruoyi.web.service_user.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.entity_user.SysDishEntity;
import com.ruoyi.web.entity_user.vo.DishVO;
import com.ruoyi.web.mapper.SysDishDao;
import com.ruoyi.web.service_user.SysDishService;
import com.ruoyi.web.utils_user.CopyTools;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("sysDishService")
public class SysDishServiceImpl extends ServiceImpl<SysDishDao, SysDishEntity> implements SysDishService {
    @Resource
    SysDishDao sysDishDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SysDishEntity> page = this.page(
                new Query<SysDishEntity>().getPage(params),
                new QueryWrapper<SysDishEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<DishVO> getDishByIdList(Long id) {
        QueryWrapper<SysDishEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("category_id",id);
        List<DishVO> dishList = sysDishDao.selectList(queryWrapper).stream().map(sysDishEntity -> {
            return CopyTools.copy(sysDishEntity, DishVO.class);
        }).collect(Collectors.toList());
        return dishList;
    }


}