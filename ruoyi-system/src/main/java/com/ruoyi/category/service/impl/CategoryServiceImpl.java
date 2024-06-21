package com.ruoyi.category.service.impl;

import java.util.List;

import com.ruoyi.category.domain.entity.Category;
import com.ruoyi.category.mapper.CategoryMapper;
import com.ruoyi.category.service.CategoryService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 菜品及套餐分类Service业务层处理
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryMapper categoryMapper;

    /**
     * 查询菜品及套餐分类
     *
     * @param id 菜品及套餐分类主键
     * @return 菜品及套餐分类
     */
    @Override
    public Category selectCategoryById(Long id) {
        Category category = new Category();
        category.setUserId(SecurityUtils.getUserId());
        category.setId(id);
        return categoryMapper.selectCategoryById(category);
    }

    /**
     * 查询菜品及套餐分类列表
     *
     * @param category 菜品及套餐分类
     * @return 菜品及套餐分类
     */
    @Override
    public List<Category> selectCategoryList(Category category) {
        return categoryMapper.selectCategoryList(category);
    }

    /**
     * 新增菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    @Override
    public int insertCategory(Category category) {
        category.setCreateTime(DateUtils.getNowDate());
        category.setUpdateTime(DateUtils.getNowDate());
        category.setUserId(SecurityUtils.getUserId());
        category.setCreateUser(SecurityUtils.getUserId());
        category.setUpdateUser(SecurityUtils.getUserId());
        return categoryMapper.insertCategory(category);
    }

    /**
     * 修改菜品及套餐分类
     *
     * @param category 菜品及套餐分类
     * @return 结果
     */
    @Override
    public int updateCategory(Category category) {
        category.setUpdateTime(DateUtils.getNowDate());
        return categoryMapper.updateCategory(category);
    }

    /**
     * 批量删除菜品及套餐分类
     *
     * @param ids 需要删除的菜品及套餐分类主键
     * @return 结果
     */
    @Override
    public int deleteCategoryByIds(Long[] ids) {
        return categoryMapper.deleteCategoryByIds(ids);
    }

    /**
     * 删除菜品及套餐分类信息
     *
     * @param id 菜品及套餐分类主键
     * @return 结果
     */
    @Override
    public int deleteCategoryById(Long id) {
        return categoryMapper.deleteCategoryById(id);
    }
}