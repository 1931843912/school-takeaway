package com.ruoyi.dish.domin.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

// 定义口味实体类
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DFlavorEntity {
    private Long id;
    private Long userId;
    private Long dishId;
    private String name;
    private String value;
}