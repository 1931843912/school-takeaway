package com.ruoyi.dish.mapper;

import com.ruoyi.dish.domin.dto.DishDTO;
import com.ruoyi.dish.domin.entity.DFlavorEntity;
import com.ruoyi.dish.domin.vo.DishVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DishTMapper {
    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    List<DishVo> selectDishList(DishVo dish);

    // 新增菜品
    void insertDish(DishDTO dishDTO);

    //增加菜品口味
    void insertDishFlavors(DFlavorEntity dFlavorEntity);
}