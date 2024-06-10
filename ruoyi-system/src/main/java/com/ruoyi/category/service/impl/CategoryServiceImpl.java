package com.ruoyi.category.service.impl;

import java.util.List;

import com.ruoyi.category.mapper.CategoryMapper;
import com.ruoyi.common.core.domain.entity.Category;

import com.ruoyi.category.service.CategoryService;
import com.ruoyi.common.utils.DateUtils;
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
    /**
     * 查询菜品及套餐分类(商家)
     *
     * @param userId 菜品及套餐分类主键
     * @return 菜品及套餐分类
     */
    @Override
    public Category selectSysCategoryByUserId(Long userId)
    {
        return categoryMapper.selectSysCategoryByUserId(userId);
    }
    /**
     * 新增菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    @Override
    public int insertSysCategory(Category category)
    {
        category.setCreateTime(DateUtils.getNowDate());
        return categoryMapper.insertSysCategory(category);
    }

    /**
     * 修改菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    @Override
    public int updateSysCategory(Category category)
    {
        category.setUpdateTime(DateUtils.getNowDate());
        return categoryMapper.updateSysCategory(category);
    }

    /**
     * 批量删除菜品及套餐分类
     *
     * @param ids 需要删除的菜品及套餐分类主键
     * @return 结果
     */
    @Override
    public int deleteSysCategoryByIds(Long[] ids)
    {
        return categoryMapper.deleteSysCategoryByIds(ids);
    }

    /**
     * 删除菜品及套餐分类信息
     *
     * @param id 菜品及套餐分类主键
     * @return 结果
     */
    @Override
    public int deleteSysCategoryById(Long id)
    {
        return categoryMapper.deleteSysCategoryById(id);
    }
}