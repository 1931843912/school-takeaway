package com.ruoyi.web.entity_user;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 套餐
 * 
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@Data
@TableName("sys_setmeal")
public class SysSetmealEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 菜品分类id
	 */
	private Long categoryId;
	/**
	 * 套餐名称
	 */
	private String name;
	/**
	 * 套餐价格
	 */
	private BigDecimal price;
	/**
	 * 售卖状态 0:停售 1:起售
	 */
	private Integer status;
	/**
	 * 描述信息
	 */
	private String description;
	/**
	 * 图片
	 */
	private String image;
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

}
