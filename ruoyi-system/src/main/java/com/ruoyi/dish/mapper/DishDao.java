package com.ruoyi.dish.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;

import com.ruoyi.dish.domin.DishEntity;
import com.ruoyi.dish.domin.DishFlavorEntity;
import com.ruoyi.dish.domin.dto.DishPageQueryDTO;
import com.ruoyi.dish.domin.entity.DFlavorEntity;
import com.ruoyi.dish.domin.vo.DishVo;
import com.ruoyi.user.entity.po.Dish;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 菜品
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@Mapper
public interface DishDao extends BaseMapper<DishEntity> {

    Page<DishVo> pageQuery(DishPageQueryDTO dishPageQueryDTO);

    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    List<DishEntity> selectDishList(DishEntity dish);

    List<DFlavorEntity> getDishWithFlavorById(Long id);
    @Select("select * from sys_dish where.id = #{id}")
    DishEntity getDishById(Long id);

    @Select("select * from sys_dish where category_id = #{CategoryId}")
    List<DishEntity> getDishByCategoryId(Long CategoryId);

    @Update("UPDATE sys_dish SET status = #{status} WHERE id =#{id}")
    void changeStatusById(@Param("id") Long id, @Param("status") Integer status);


}
