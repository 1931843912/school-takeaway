package com.ruoyi.web.entity_admin.vo;


import com.baomidou.mybatisplus.annotation.TableId;
import com.ruoyi.web.entity_admin.SysDishFlavorEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DishVO {
    @TableId
    private Long id;
    /**
     * 商家id
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

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 分类名称
     * */
    private String categoryName;

    /**
     * 菜品关联口味
     * */
    private List<SysDishFlavorEntity> flavors = new ArrayList<>();
}
