package com.ruoyi.category.service;

import com.ruoyi.common.core.domain.entity.Category;

import java.util.List;

/**
 * 菜品及套餐分类Service接口
 */
public interface CategoryService {
    /**
     * 查询菜品及套餐分类列表
     *
     * @return 菜品及套餐分类集合
     */
    public List<Category> selectSysCategoryList();
    /**
     * 查询菜品及套餐分类(商家)
     *
     * @param userId 菜品及套餐分类主键
     * @return 菜品及套餐分类
     */
    public Category selectSysCategoryByUserId(Long userId);
    /**
     * 新增菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    public int insertSysCategory(Category category);

    /**
     * 修改菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    public int updateSysCategory(Category category);

    /**
     * 批量删除菜品及套餐分类
     *
     * @param ids 需要删除的菜品及套餐分类主键集合
     * @return 结果
     */
    public int deleteSysCategoryByIds(Long[] ids);

    /**
     * 删除菜品及套餐分类信息
     *
     * @param id 菜品及套餐分类主键
     * @return 结果
     */
    public int deleteSysCategoryById(Long id);
}
