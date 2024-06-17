package com.ruoyi.web.mapper;

import com.ruoyi.web.entity_user.MerchantEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MerchantMapper {
    //查询商家列表
    public List<MerchantEntity> selectMerchantList();

    //查询商家招牌菜
    List<String> selectMerchantDishList(Long userId);
}
