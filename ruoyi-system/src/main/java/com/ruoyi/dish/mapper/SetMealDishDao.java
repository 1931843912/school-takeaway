package com.ruoyi.dish.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SetMealDishDao {
/**
 * 根据菜品id查询对应套餐id
 *     @param dishIds
 */
    List<Long> getSetmealIdsByDishIds(List<Long> dishIds);
}
