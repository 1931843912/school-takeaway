package com.ruoyi.setmeal.mapper;

import com.ruoyi.category.domain.entity.Category;
import com.ruoyi.setmeal.domain.dto.SetmealDTO;
import com.ruoyi.setmeal.domain.entity.Setmeal;
import com.ruoyi.setmeal.domain.entity.SetmealDish;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 套餐Mapper接口
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
public interface SetmealMapper {
    /**
     * 查询套餐
     *
     * @param id 套餐主键
     * @return 套餐
     */
    public SetmealDTO selectSetmealById(Long id);

    //查询套餐该关联的菜品
    public List<Long> selectSetmealDishById(Long id);

    /**
     * 查询套餐列表
     *
     * @param setmeal 套餐
     * @return 套餐集合
     */
    public List<Setmeal> selectSetmealList(Setmeal setmeal);

    /**
     * 新增套餐
     */
    public int insertSetmeal(SetmealDTO setmealDTO);

    /**
     * 新增套餐菜品关系
     *
     * @param setmealDish 套餐菜品关系
     * @return 结果
     */
    public int insertSetmealDish(SetmealDish setmealDish);

    /**
     * 修改套餐
     *
     * @param setmeal 套餐
     * @return 结果
     */
    public int updateSetmeal(SetmealDTO setmeal);

    /**
     * 删除套餐
     *
     * @param id 套餐主键
     * @return 结果
     */
    public int deleteSetmealById(Long id);

    /**
     * 批量删除套餐
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSetmealByIds(Long[] ids);

    List<Setmeal> selectDishList(Long userId);

    //批量删除套餐关联菜品
    void deleteSetmealDishs(Long id);

    @Select("select * from sys_category where type=2 and user_id=#{userId} and status=0")
    List<Category> categoryList(Long userId);

    // int changeSetmealStatus(Setmeal setmeal);
}