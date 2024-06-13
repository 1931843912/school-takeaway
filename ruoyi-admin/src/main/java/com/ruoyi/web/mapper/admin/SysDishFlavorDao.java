package com.ruoyi.web.mapper.admin;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.entity_admin.SysDishEntity;
import com.ruoyi.web.entity_admin.SysDishFlavorEntity;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜品及其口味
 * 
 * @author ChenGuanZhou
 * @email 2050743162@qq.com
 * @date 2024-06-13 20:43:43
 */
@Mapper
public interface SysDishFlavorDao extends BaseMapper<SysDishEntity> {

    /**
    * 批量插入口味数据
     * @param
    * */
    void insertBatch(List<SysDishFlavorEntity> flavors);
}
