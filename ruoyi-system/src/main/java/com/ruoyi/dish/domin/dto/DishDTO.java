package com.ruoyi.dish.domin.dto;


import com.ruoyi.common.annotation.Excel;
import com.ruoyi.dish.domin.DishFlavorEntity;
import com.ruoyi.dish.domin.entity.DFlavorEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DishDTO implements Serializable {

    private Long id;
    private Long userId;
    //菜品名称
    private String name;
    //菜品分类id
    private Long categoryId;
    //菜品价格
    private BigDecimal price;
    //图片
    private String image;
    //描述信息
    private String description;
    //0 停售 1 起售
    private Integer status;
    //口味
    private Map<String, String> flavors;

    private Long createUser;

    private Long updateUser;


    // private List<DishFlavorEntity> flavors = new ArrayList<>();


}
