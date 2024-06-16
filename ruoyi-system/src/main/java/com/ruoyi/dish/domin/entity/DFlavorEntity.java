package com.ruoyi.dish.domin.entity;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


// 定义口味实体类
@NoArgsConstructor
@AllArgsConstructor
@Data
public class DFlavorEntity extends BaseEntity{
    private Long id;
    private Long userId;
    private Long dishId;
    private String name;
    private String value;
}