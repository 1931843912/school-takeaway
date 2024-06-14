package com.ruoyi.dish.domin.dto;

import lombok.Data;
import java.io.Serializable;

/**
 * 菜品分页
 *
 * @author ChenGuanzhou
 * @email 2050743162@qq.com
 * @date 2024-06-13
 */
@Data
public class DishPageQueryDTO implements Serializable {

    private int page;

    private int pageSize;

    //菜品名称
    private String name;

    //分类d
    private Integer categoryId;

    //状态0表示禁用1表示启用
    private Integer status;
}
