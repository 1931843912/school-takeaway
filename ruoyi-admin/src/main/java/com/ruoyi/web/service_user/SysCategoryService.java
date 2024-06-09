package com.ruoyi.web.service_user;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.web.entity_user.SysCategoryEntity;
import com.ruoyi.web.utils_user.PageUtils;


import java.util.Map;

/**
 * 菜品及套餐分类
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
public interface SysCategoryService extends IService<SysCategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

