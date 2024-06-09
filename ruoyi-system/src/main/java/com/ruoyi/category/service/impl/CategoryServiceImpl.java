package com.ruoyi.category.service.impl;

import java.util.List;

import com.ruoyi.category.mapper.CategoryMapper;
import com.ruoyi.common.core.domain.entity.Category;

import com.ruoyi.category.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 菜品及套餐分类Service业务层处理
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    /**
     * 查询菜品及套餐分类列表
     *
     * @return 菜品及套餐分类
     */
    @Override
    public List<Category> selectSysCategoryList() {
        return categoryMapper.selectSysCategoryList();
    }
}