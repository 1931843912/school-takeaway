package com.ruoyi.web.service_admin;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.common.core.result.PageResult;
import com.ruoyi.web.entity_admin.SysDishEntity;
import com.ruoyi.web.entity_admin.dto.DishDTO;
import com.ruoyi.web.entity_admin.dto.DishPageQueryDTO;


import java.util.List;
import java.util.Map;

/**
 * 菜品
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
public interface SysDishService extends IService<SysDishEntity> {


    /**
     * 新增菜品以及对应口味数据
     *
     * @param dishDTO 菜品及其口味
     * @return 结果
     */
    public int insertSysDishWithFlavor(DishDTO dishDTO);

    /**
     * 修改菜品
     *
     * @param sysDish 菜品
     * @return 结果
     */
    public int updateSysDish(SysDishEntity sysDish);

    /**
     * 删除菜品
     *
     * @param id 菜品主键
     * @return 结果
     */
    public int deleteSysDishById(Long id);

    /**
     * 批量删除菜品
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysDishByIds(Long[] ids);

    /**
     * 菜品分页查询
     *
     * @param dishPageQueryDTO 需要删除的数据主键集合
     * @return 分页结果
     */
    PageResult pageQuery(DishPageQueryDTO dishPageQueryDTO);
}

