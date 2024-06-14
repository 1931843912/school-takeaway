package com.ruoyi.dish.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.dish.domin.DishEntity;

import com.ruoyi.dish.domin.DishFlavorEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜品及其口味
 * 
 * @author ChenGuanZhou
 * @email 2050743162@qq.com
 * @date 2024-06-13 20:43:43
 */
@Mapper
public interface DishFlavorDao extends BaseMapper<DishEntity> {

    /**
    * 批量插入口味数据
     * @param flavors 口味集合
    * */
    void insertBatch(List<DishFlavorEntity> flavors);

    @Delete("delete from sys_dish_flavor where dish_id = #{dishId}")
    void deleteByDishId(Long dishId);
}
