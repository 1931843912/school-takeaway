package com.ruoyi.setmeal.domain.dto;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 套餐对象 sys_setmeal
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SetmealDTO extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 商家id
     */
    private Long userId;

    /**
     * 菜品分类id
     */
    @Excel(name = "菜品分类id")
    private Long categoryId;

    /**
     * 套餐名称
     */
    @Excel(name = "套餐名称")
    private String name;

    /**
     * 套餐价格
     */
    @Excel(name = "套餐价格")
    private BigDecimal price;

    /**
     * 售卖状态 0:停售 1:起售
     */
    @Excel(name = "售卖状态 0:停售 1:起售")
    private Long status;

    /**
     * 描述信息
     */
    @Excel(name = "描述信息")
    private String description;

    /**
     * 图片
     */
    @Excel(name = "图片")
    private String image;

    /**
     * 创建人
     */
    @Excel(name = "创建人")
    private Long createUser;

    /**
     * 修改人
     */
    @Excel(name = "修改人")
    private Long updateUser;

    private Long[] dishItems;
}
