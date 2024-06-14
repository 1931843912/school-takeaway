package com.ruoyi.user.mapper;


import com.ruoyi.user.entity.po.OrderDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserOrderDetailMapper {
    /**
     * 批量插入订单明细数据
     * @param orderDetailList
     */
    void insertBatch(List<OrderDetail> orderDetailList);

    /**
     * 根据订单id查询订单明细
     * @param orderId
     * @return
     */
    @Select("select * from sys_order_detail where order_id = #{orderId}")
    List<OrderDetail> getByOrderId(Long orderId);
}
