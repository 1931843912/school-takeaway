package com.ruoyi.web.entity_user;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 地址簿
 * 
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@Data
@TableName("sys_address_book")
public class SysAddressBookEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 用户id
	 */
	private Long userId;
	/**
	 * 收货人
	 */
	private String consignee;
	/**
	 * 性别
	 */
	private String sex;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * 省级区划编号
	 */
	private String provinceCode;
	/**
	 * 省级名称
	 */
	private String provinceName;
	/**
	 * 市级区划编号
	 */
	private String cityCode;
	/**
	 * 市级名称
	 */
	private String cityName;
	/**
	 * 区级区划编号
	 */
	private String districtCode;
	/**
	 * 区级名称
	 */
	private String districtName;
	/**
	 * 详细地址
	 */
	private String detail;
	/**
	 * 标签
	 */
	private String label;
	/**
	 * 默认 0 否 1是
	 */
	private Integer isDefault;

}
