package com.ruoyi.web.service_user.impl;

import com.ruoyi.web.entity_user.MerchantEntity;
import com.ruoyi.web.mapper.MerchantMapper;
import com.ruoyi.web.service_user.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MerchantServiceImpl implements MerchantService {
    @Autowired
    private MerchantMapper merchantMapper;

    @Override
    public List<MerchantEntity> selectMerchantList() {
        //先查询商家基本信息
        List<MerchantEntity> merchantEntities = merchantMapper.selectMerchantList();
        System.out.println(merchantEntities);
        //根据商家负责人查询招牌菜品3个
        for (MerchantEntity m:merchantEntities){
            m.setDishList(merchantMapper.selectMerchantDishList(m.getUserId()));
        }
        return merchantEntities;
    }
}
