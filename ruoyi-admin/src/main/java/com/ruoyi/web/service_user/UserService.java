package com.ruoyi.web.service_user;



import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.web.entity_user.SysUserEntity;
import com.ruoyi.web.utils_user.PageUtils;

import java.util.Map;

/**
 * 用户信息表
 *
 * @author Franklin
 * @date 2024-06-07 11:04:10
 */
public interface UserService extends IService<SysUserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

