package com.ruoyi.category.mapper;

import java.util.List;

import com.ruoyi.common.core.domain.entity.Category;
import org.apache.ibatis.annotations.Select;

/**
 * 菜品及套餐分类Mapper接口
 */
public interface CategoryMapper {
    /**
     * 查询菜品及套餐分类列表
     * @return 菜品及套餐分类集合
     */
    @Select("select * from sys_category")
    public List<Category> selectSysCategoryList();
}
