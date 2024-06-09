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
}
