package com.ruoyi.web.service_user;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.web.entity_user.SysSetmealEntity;
import com.ruoyi.web.utils_user.PageUtils;

import java.util.Map;

/**
 * 套餐
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
public interface SysSetmealService extends IService<SysSetmealEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

