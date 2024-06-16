package com.ruoyi.dish.domin.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.ruoyi.dish.domin.DishFlavorEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 菜品对象 sys_dish
 *
 * @author xiaozhu
 * @date 2024-06-16
 */
public class DishVo extends BaseEntity {
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
     * 菜品名称
     */
    @Excel(name = "菜品名称")
    private String name;

    /**
     * 菜品分类id
     */
    @Excel(name = "菜品分类id")
    private Long categoryId;

    /**
     * 菜品价格
     */
    @Excel(name = "菜品价格")
    private BigDecimal price;

    /**
     * 图片
     */
    @Excel(name = "图片")
    private String image;

    /**
     * 描述信息
     */
    @Excel(name = "描述信息")
    private String description;

    /**
     * 0 停售 1 起售
     */
    @Excel(name = "0 停售 1 起售")
    private Long status;

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

    //分类名称
    private String categoryName;
    //菜品关联的口味
    private List<DishFlavorEntity> flavors = new ArrayList<>();

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

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

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getStatus() {
        return status;
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
                .append("name", getName())
                .append("categoryId", getCategoryId())
                .append("price", getPrice())
                .append("image", getImage())
                .append("description", getDescription())
                .append("status", getStatus())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("createUser", getCreateUser())
                .append("updateUser", getUpdateUser())
                .toString();
    }
}