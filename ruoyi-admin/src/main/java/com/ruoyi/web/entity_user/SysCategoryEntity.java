package com.ruoyi.web.entity_user;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 菜品及套餐分类
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_category")
public class SysCategoryEntity implements Serializable {
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
	 * 类型   1 菜品分类 2 套餐分类
	 */
	private Integer type;
	/**
	 * 分类名称
	 */
	private String name;
	/**
	 * 顺序
	 */
	private Integer sort;
	/**
	 * 分类状态 0:禁用，1:启用
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
