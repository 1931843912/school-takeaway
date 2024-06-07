package com.ruoyi.web.service_user;



import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.web.entity_user.SysAddressBookEntity;
import com.ruoyi.web.utils_user.PageUtils;

import java.util.Map;

/**
 * 地址簿
 *
 * @author Franklin
 * @date 2024-06-07 10:57:43
 */
public interface SysAddressBookService extends IService<SysAddressBookEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

