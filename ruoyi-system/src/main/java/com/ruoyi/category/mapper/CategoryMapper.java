package com.ruoyi.category.mapper;

import java.util.List;

import com.ruoyi.common.core.domain.entity.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 菜品及套餐分类Mapper接口
 */
@Mapper
public interface CategoryMapper {
    /**
     * 查询菜品及套餐分类列表
     * @return 菜品及套餐分类集合
     */
//    @Select("select * from sys_category")
    public List<Category> selectSysCategoryList();

    /**
     * 查询菜品及套餐分类
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
     * 删除菜品及套餐分类
     *
     * @param id 菜品及套餐分类主键
     * @return 结果
     */
    public int deleteSysCategoryById(Long id);

    /**
     * 批量删除菜品及套餐分类
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCategoryByIds(Long[] ids);
}
