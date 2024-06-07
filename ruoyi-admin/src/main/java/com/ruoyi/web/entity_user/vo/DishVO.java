package com.ruoyi.web.entity_user.vo;


import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DishVO {
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
}
