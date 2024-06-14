package com.ruoyi.category.service.impl;

import java.util.List;

import com.ruoyi.category.mapper.CategoryMapper;
import com.ruoyi.common.core.domain.entity.Category;

import com.ruoyi.category.service.CategoryService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 菜品及套餐分类Service业务层处理
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryMapper categoryMapper;

    /**
     * 查询菜品及套餐分类列表
     *
     * @return 菜品及套餐分类
     */
    @Override
    public List<Category> selectSysCategoryList(Long userId) {
        return categoryMapper.selectSysCategoryList(userId);
    }
    /**
     * 查询菜品及套餐分类(商家)
     * @return 菜品及套餐分类
     */
    @Override
    public Category selectSysCategoryByCategoryId(Long categoryId,Long userId)
    {
        Category category = new Category();
        category.setId(categoryId);
        category.setUserId(userId);
        return categoryMapper.selectSysCategoryByCategoryId(category);
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
        Long userId = SecurityUtils.getUserId();
        //创建时间
        category.setCreateTime(DateUtils.getNowDate());
        //type设置
        category.setType(2L);
        //创建人
        category.setCreateUser(userId);
        category.setUserId(userId);
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
        category.setUpdateUser(SecurityUtils.getUserId());
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