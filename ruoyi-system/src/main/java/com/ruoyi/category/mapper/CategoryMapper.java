package com.ruoyi.category.mapper;

import com.ruoyi.category.domain.entity.Category;

import java.util.List;

/**
 * 菜品及套餐分类Mapper接口
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
public interface CategoryMapper {
    /**
     * 查询菜品及套餐分类
     */
    public Category selectCategoryById(Category category);

    /**
     * 查询菜品及套餐分类列表
     *
     * @param category 菜品及套餐分类
     * @return 菜品及套餐分类集合
     */
    public List<Category> selectCategoryList(Category category);

    /**
     * 新增菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    public int insertCategory(Category category);

    /**
     * 修改菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    public int updateCategory(Category category);

    /**
     * 删除菜品及套餐分类
     *
     * @param id 菜品及套餐分类主键
     * @return 结果
     */
    public int deleteCategoryById(Long id);

    /**
     * 批量删除菜品及套餐分类
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCategoryByIds(Long[] ids);
}