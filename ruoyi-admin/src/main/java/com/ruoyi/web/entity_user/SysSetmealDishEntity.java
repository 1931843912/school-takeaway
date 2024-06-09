package com.ruoyi.web.entity_user;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 套餐菜品关系
 * 
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@Data
@TableName("sys_setmeal_dish")
public class SysSetmealDishEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 套餐id
	 */
	private Long setmealId;
	/**
	 * 菜品id
	 */
	private Long dishId;
	/**
	 * 菜品名称 （冗余字段）
	 */
	private String name;
	/**
	 * 菜品单价（冗余字段）
	 */
	private BigDecimal price;
	/**
	 * 菜品份数
	 */
	private Integer copies;

}
