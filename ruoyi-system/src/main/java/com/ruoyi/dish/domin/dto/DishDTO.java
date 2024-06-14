package com.ruoyi.dish.domin.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import com.ruoyi.dish.domin.DishFlavorEntity;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 菜品
 *
 * @author ChenGuanzhou
 * @email 2050743162@qq.com
 * @date 2024-06-13
 */
@Data
public class DishDTO implements Serializable {
    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     *
     */
    private Integer userId;
    /**
     * 菜品名称
     */
    private String name;
    /**
     * 菜品分类id
     */
    private Long categoryId;
    /**
     * 菜品价格
     */
    private BigDecimal price;
    /**
     * 图片
     */
    private String image;
    /**
     * 描述信息
     */
    private String description;
    /**
     * 0 停售 1 起售
     */
    private Integer status;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 创建人
     */
    private Long createUser;
    /**
     * 修改人
     */
    private Long updateUser;

    /**
     * 口味
     */
    private List<DishFlavorEntity> flavors = new ArrayList<>();
}