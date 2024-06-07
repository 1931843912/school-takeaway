package com.ruoyi.web.service_user.impl;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.entity_user.SysAddressBookEntity;
import com.ruoyi.web.mapper.SysAddressBookDao;
import com.ruoyi.web.service_user.SysAddressBookService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.Query;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class SysAddressBookServiceImpl extends ServiceImpl<SysAddressBookDao, SysAddressBookEntity> implements SysAddressBookService {
    @Resource
    SysAddressBookDao addressBookDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<SysAddressBookEntity> queryWrapper = new QueryWrapper<>();
        IPage<SysAddressBookEntity> page = this.page(
                new Query<SysAddressBookEntity>().getPage(params),
                queryWrapper.gt("is_default",params.get("default"))
        );

        return new PageUtils(page);
    }

}