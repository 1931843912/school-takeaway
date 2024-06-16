package com.ruoyi.dish.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.common.core.result.PageResult;
import com.ruoyi.dish.domin.DishEntity;
import com.ruoyi.dish.domin.dto.DishDTO;
import com.ruoyi.dish.domin.dto.DishPageQueryDTO;
import com.ruoyi.dish.domin.entity.Dish;
import com.ruoyi.dish.domin.vo.DishVo;

import java.util.List;

public interface DishService extends IService<DishService>{
    /**
     * 新增菜品以及对应口味数据
     *
     * @param dishDTO 菜品及其口味
     * @return 结果
     */
    public void insertSysDishWithFlavor(DishDTO dishDTO) throws JsonProcessingException;

    /**
     * 修改菜品
     *
     * @param Dish 菜品
     * @return 结果
     */
    public int updateSysDish(DishEntity Dish);

    /**
     * 删除菜品
     *
     * @param id 菜品主键
     * @return 结果
     */
    public int deleteSysDishById(Long id);

    /**
     * 批量删除菜品
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysDishByIds(Long[] ids);

    /**
     * 菜品分页查询
     *
     * @param dishPageQueryDTO 需要删除的数据主键集合
     * @return 分页结果
     */
    PageResult pageQuery(DishPageQueryDTO dishPageQueryDTO);


    /**
     * 查询菜品列表
     *
     * @param dish 菜品
     * @return 菜品集合
     */
    public List<DishVo> selectDishList(DishVo dish);

    /**
     * 根据菜品id获得菜品及其口味
     *     @param id 菜品id
     * @return菜品及其口味
     */
    DishVo getDishWithFlavorById(Long id);

    void deleteBatch(List<Long> ids);

    /**
     * 根据分类菜品id获得菜品
     *  @param id 分类菜品id
     * @return菜品
     */
    List<DishEntity>getDishByCategoryId(Long id);

    /**
     *     根据菜品id更新菜品状态
     *     @param id 菜品id
     */

    void changeStatusById(Long id,Integer status);

    void updateDishWithFlavor(DishDTO dishDTO);
}
