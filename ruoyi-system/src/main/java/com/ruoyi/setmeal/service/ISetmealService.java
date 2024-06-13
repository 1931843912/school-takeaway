package com.ruoyi.setmeal.service;

import com.ruoyi.setmeal.domain.entity.Setmeal;
import java.util.List;


/**
 * 套餐Service接口
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
public interface ISetmealService {
    /**
     * 查询套餐
     *
     * @param id 套餐主键
     * @return 套餐
     */
    public Setmeal selectSetmealById(Long id);

    /**
     * 查询套餐列表
     *
     * @param setmeal 套餐
     * @return 套餐集合
     */
    public List<Setmeal> selectSetmealList(Setmeal setmeal);
}
