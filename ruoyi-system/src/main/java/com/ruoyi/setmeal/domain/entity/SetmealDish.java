package com.ruoyi.setmeal.domain.entity;

import java.math.BigDecimal;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 套餐菜品关系对象 sys_setmeal_dish
 *
 * @author xiaozhu
 * @date 2024-06-17
 */
public class SetmealDish extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 套餐id
     */
    @Excel(name = "套餐id")
    private Long setmealId;

    /**
     * 菜品id
     */
    @Excel(name = "菜品id")
    private Long dishId;

    /**
     * 菜品名称 （冗余字段）
     */
    @Excel(name = "菜品名称 ", readConverterExp = "冗=余字段")
    private String name;

    /**
     * 菜品单价（冗余字段）
     */
    @Excel(name = "菜品单价", readConverterExp = "冗=余字段")
    private BigDecimal price;

    /**
     * 菜品份数
     */
    @Excel(name = "菜品份数")
    private Long copies;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setSetmealId(Long setmealId) {
        this.setmealId = setmealId;
    }

    public Long getSetmealId() {
        return setmealId;
    }

    public void setDishId(Long dishId) {
        this.dishId = dishId;
    }

    public Long getDishId() {
        return dishId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setCopies(Long copies) {
        this.copies = copies;
    }

    public Long getCopies() {
        return copies;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("setmealId", getSetmealId())
                .append("dishId", getDishId())
                .append("name", getName())
                .append("price", getPrice())
                .append("copies", getCopies())
                .toString();
    }
}
