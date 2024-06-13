package com.ruoyi.setmeal.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.setmeal.domain.entity.Setmeal;
import com.ruoyi.setmeal.mapper.SetmealMapper;
import com.ruoyi.setmeal.service.ISetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 套餐Service业务层处理
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
@Service
public class SetmealServiceImpl implements ISetmealService {
    @Autowired
    private SetmealMapper setmealMapper;

    /**
     * 查询套餐
     *
     * @param id 套餐主键
     * @return 套餐
     */
    @Override
    public Setmeal selectSetmealById(Long id) {
        return setmealMapper.selectSetmealById(id);
    }

    /**
     * 查询套餐列表
     *
     * @param setmeal 套餐
     * @return 套餐
     */
    @Override
    public List<Setmeal> selectSetmealList(Setmeal setmeal) {
        return setmealMapper.selectSetmealList(setmeal);
    }
}
