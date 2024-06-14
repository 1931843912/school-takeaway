package com.ruoyi.web.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.entity_user.SysDishEntity;
import com.ruoyi.web.entity_user.vo.DishVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜品
 * 
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@Mapper
public interface SysDishDao extends BaseMapper<SysDishEntity> {

}
