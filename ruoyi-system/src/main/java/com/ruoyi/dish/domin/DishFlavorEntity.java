package com.ruoyi.dish.domin;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

import java.io.Serializable;

@Data
public class DishFlavorEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * $column.columnComment
     */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long userId;

    /**
     * 菜品
     */
    @Excel(name = "菜品")
    private Long dishId;

    /**
     * 口味名称
     */
    @Excel(name = "口味名称")
    private String name;

    /**
     * 口味数据list
     */
    @Excel(name = "口味数据list")
    private String value;
}