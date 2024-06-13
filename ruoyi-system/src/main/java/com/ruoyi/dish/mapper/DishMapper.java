package com.ruoyi.dish.mapper;

import com.ruoyi.common.core.domain.entity.Dish;

import java.util.List;

/**
 * 菜品Mapper接口
 *
 * @author xiaozhu
 * @date 2024-06-13
 */
public interface DishMapper {
    /**
     * 查询菜品
     *
     * @param id 菜品主键
     * @return 菜品
     */
    public Dish selectDishById(Long id);

    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    public List<Dish> selectDishList(Dish dish);

    /**
     * 查询最新的分类id
     *
     * @param id
     * @return 分类id
     */
    public int getLatestCategoryId(Long id);

    /**
     * 新增菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    public int insertDish(Dish dish);

    /**
     * 修改菜品
     *
     * @param dish 菜品
     * @return 结果
     */
    public int updateDish(Dish dish);

    /**
     * 删除菜品
     *
     * @param id 菜品主键
     * @return 结果
     */
    public int deleteDishById(Long id);

    /**
     * 批量删除菜品
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDishByIds(Long[] ids);
}
