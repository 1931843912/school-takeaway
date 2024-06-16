package com.ruoyi.dish.mapper;

import com.ruoyi.dish.domin.dto.DishDTO;
import com.ruoyi.dish.domin.dto.DishEditDTO;
import com.ruoyi.dish.domin.entity.DFlavorEntity;
import com.ruoyi.dish.domin.vo.DishVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DishTMapper {
    /**
     * 查询菜品
     *
     * @param id 菜品主键
     * @return 菜品
     */
    public DishEditDTO selectDishById(Long id);

    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    List<DishVo> selectDishList(DishVo dish);

    // 新增菜品
    void insertDish(DishDTO dishDTO);

    // 更新菜品
    void updateDish(DishDTO dishDTO);

    //增加菜品口味
    void insertDishFlavors(DFlavorEntity dFlavorEntity);

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

    public int deleteDishFlavorsByIds(Long[] ids);
}