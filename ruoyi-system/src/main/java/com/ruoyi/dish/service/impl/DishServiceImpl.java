package com.ruoyi.dish.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.Dish;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.dish.mapper.DishMapper;
import com.ruoyi.dish.service.IDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 菜品Service业务层处理
 *
 * @author xiaozhu
 * @date 2024-06-13
 */
@Service
public class DishServiceImpl implements IDishService {
    @Autowired
    private DishMapper dishMapper;

    /**
     * 查询菜品
     *
     * @param id 菜品主键
     * @return 菜品
     */
    @Override
    public Dish selectDishById(Long id) {
        return dishMapper.selectDishById(id);
    }

    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品
     */
    @Override
    public List<Dish> selectDishList(Dish dish) {
        return dishMapper.selectDishList(dish);
    }

    /**
     * 新增菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public int insertDish(Dish dish) {
        //创建时间
        dish.setCreateTime(DateUtils.getNowDate());
        Long userId = SecurityUtils.getUserId();
        //创建人
        dish.setCreateUser(userId);
        //查询当前商家的最新分类id
        int latestCategoryId = dishMapper.getLatestCategoryId(userId);
        dish.setCategoryId((long) latestCategoryId+1);
        return dishMapper.insertDish(dish);
    }

    /**
     * 修改菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    @Override
    public int updateDish(Dish dish) {
        dish.setUpdateTime(DateUtils.getNowDate());
        return dishMapper.updateDish(dish);
    }

    /**
     * 批量删除菜品
     *
     * @param ids 需要删除的菜品主键
     * @return 结果
     */
    @Override
    public int deleteDishByIds(Long[] ids) {
        return dishMapper.deleteDishByIds(ids);
    }

    /**
     * 删除菜品信息
     *
     * @param id 菜品主键
     * @return 结果
     */
    @Override
    public int deleteDishById(Long id) {
        return dishMapper.deleteDishById(id);
    }
}
