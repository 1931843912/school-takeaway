package com.ruoyi.order.service;

import com.ruoyi.order.domin.dto.OrdersCancelDTO;
import com.ruoyi.order.domin.dto.OrdersRejectionDTO;
import com.ruoyi.order.domin.enity.Orders;
import com.ruoyi.order.domin.vo.OrderOverViewVO;

import java.util.List;

/**
 * 订单Service接口
 *
 * @author ChenGuanZhou
 * @date 2024-06-17
 */
public interface OrdersService {
    /**
     * 查询订单
     *
     * @param id 订单主键
     * @return 订单
     */
    public Orders selectSysOrdersById(Long id);

    /**
     * 查询订单列表
     *
     * @param sysOrders 订单
     * @return 订单集合
     */
    public List<Orders> selectSysOrdersList(Orders sysOrders);

    /**
     * 新增订单
     *
     * @param sysOrders 订单
     * @return 结果
     */
    public int insertSysOrders(Orders sysOrders);

    /**
     * 修改订单
     *
     * @param sysOrders 订单
     * @return 结果
     */
    public int updateSysOrders(Orders sysOrders);

    /**
     * 批量删除订单
     *
     * @param ids 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteSysOrdersByIds(Long[] ids);

    /**
     * 删除订单信息
     *
     * @param id 订单主键
     * @return 结果
     */
    public int deleteSysOrdersById(Long id);

    int takingOrdersById(Long orderId);

    int rejectOrdersById(Long id);

    int cancelOrdersById(Long id);

    int completeOrdersById(Long id);

    int deliveryOrdersById(Long id);

    OrderOverViewVO getOrdersCount();

    Integer getConfirmed();

    Integer getDeliveryInProgress();

    Integer getToBeConfirmed();

    Integer getCompletedOrders();

    Integer getCancelledOrders();
}
