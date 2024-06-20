package com.ruoyi.order.domin.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 订单概览数据
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderOverViewVO implements Serializable {
    //待接单数量 -2
    private Integer waitingOrders;

    //待派送数量 -3
    private Integer deliveredOrders;

    //派送中数量 -4
    private Integer deliveryIngOrders;

    //已完成数量 -5
    private Integer completedOrders;

    //已取消数量 -6
    private Integer cancelledOrders;

    //全部订单
    private Integer allOrders;
}
