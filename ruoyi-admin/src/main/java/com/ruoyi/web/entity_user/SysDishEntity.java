package com.ruoyi.web.entity_user;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 菜品
 * 
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@Data
@TableName("sys_dish")
public class SysDishEntity implements Serializable {
	private static final long serialVersionUID = 1L;

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

}
