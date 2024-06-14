package com.ruoyi.setmeal.domain.entity;

import java.math.BigDecimal;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 套餐对象 sys_setmeal
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
public class Setmeal extends BaseEntity {
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

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() {
        return categoryId;
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

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getStatus() {
        return status;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setCreateUser(Long createUser) {
        this.createUser = createUser;
    }

    public Long getCreateUser() {
        return createUser;
    }

    public void setUpdateUser(Long updateUser) {
        this.updateUser = updateUser;
    }

    public Long getUpdateUser() {
        return updateUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("categoryId", getCategoryId())
                .append("name", getName())
                .append("price", getPrice())
                .append("status", getStatus())
                .append("description", getDescription())
                .append("image", getImage())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("createUser", getCreateUser())
                .append("updateUser", getUpdateUser())
                .toString();
    }
}
