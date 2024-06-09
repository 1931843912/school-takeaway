package com.ruoyi.web.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.entity_user.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户信息表
 * 
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 11:04:10
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUserEntity> {
	
}
