package com.ruoyi.web.service_user;



import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.web.entity_user.SysSetmealDishEntity;
import com.ruoyi.web.utils_user.PageUtils;

import java.util.List;
import java.util.Map;

/**
 * 套餐菜品关系
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
public interface SysSetmealDishService extends IService<SysSetmealDishEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<Long> getDishIds (Long id);
}

