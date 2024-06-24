package com.ruoyi.order.service.impl;

import com.ruoyi.order.domin.dto.OrdersCancelDTO;
import com.ruoyi.order.domin.dto.OrdersRejectionDTO;
import com.ruoyi.order.domin.enity.Orders;
import com.ruoyi.order.domin.vo.OrderOverViewVO;
import com.ruoyi.order.mapper.OrdersMapper;
import com.ruoyi.order.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单Service业务层处理
 *
 * @author ChenGuanZhou
 * @date 2024-06-17
 */
@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersMapper sysOrdersMapper;

    /**
     * 查询订单
     *
     * @param id 订单主键
     * @return 订单
     */
    @Override
    public Orders selectSysOrdersById(Long id) {
        return sysOrdersMapper.selectSysOrdersById(id);
    }

    /**
     * 查询订单列表
     *
     * @param sysOrders 订单
     * @return 订单
     */
    @Override
    public List<Orders> selectSysOrdersList(Orders sysOrders) {
        return sysOrdersMapper.selectSysOrdersList(sysOrders);
    }

    /**
     * 新增订单
     *
     * @param sysOrders 订单
     * @return 结果
     */
    @Override
    public int insertSysOrders(Orders sysOrders) {
        return sysOrdersMapper.insertSysOrders(sysOrders);
    }

    /**
     * 修改订单
     *
     * @param sysOrders 订单
     * @return 结果
     */
    @Override
    public int updateSysOrders(Orders sysOrders) {
        return sysOrdersMapper.updateSysOrders(sysOrders);
    }

    /**
     * 批量删除订单
     *
     * @param ids 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteSysOrdersByIds(Long[] ids) {
        return sysOrdersMapper.deleteSysOrdersByIds(ids);
    }

    /**
     * 删除订单信息
     *
     * @param id 订单主键
     * @return 结果
     */
    @Override
    public int deleteSysOrdersById(Long id) {
        return sysOrdersMapper.deleteSysOrdersById(id);
    }

    /**
     * 接单
     *
     * @param orderId 订单id
     * @return 结果
     */
    @Override
    public int takingOrdersById(Long orderId) {
        return sysOrdersMapper.takingOrdersById(orderId);
    }

    /**
     * 拒绝订单
     *
     * @return 结果
     */
    @Override
    public int rejectOrdersById(Long id) {
        return sysOrdersMapper.rejectOrdersById(id);
    }

    /**
     * 取消订单
     *
     * @return 结果
     */
    @Override
    public int cancelOrdersById(Long id) {
        return sysOrdersMapper.cancelOrdersById(id);
    }

    /**
     * 完成订单
     *
     * @param id id
     * @return 结果
     */
    @Override
    public int completeOrdersById(Long id) {
        return sysOrdersMapper.completeOrdersById(id);
    }

    /**
     * 派送订单
     *
     * @param id id
     * @return 结果
     */
    @Override
    public int deliveryOrdersById(Long id) {
        return sysOrdersMapper.deliveryOrdersById(id);
    }

    /**
     * 各个状态的订单数量统计
     */
    @Override
    public OrderOverViewVO getOrdersCount() {

        Integer total = getConfirmed() + getToBeConfirmed() + getDeliveryInProgress()
                + getCompletedOrders() + getCancelledOrders();

        OrderOverViewVO orderOverViewVO = new OrderOverViewVO();
        orderOverViewVO.setWaitingOrders(getToBeConfirmed());
        orderOverViewVO.setDeliveredOrders(getConfirmed());
        orderOverViewVO.setDeliveryIngOrders(getDeliveryInProgress());
        orderOverViewVO.setCompletedOrders(getCompletedOrders());
        orderOverViewVO.setCancelledOrders(getCancelledOrders());
        orderOverViewVO.setAllOrders(total);

        return orderOverViewVO;
    }

    /**
     * 获取派送订单数量
     *
     * @return 派送订单数量
     */
    @Override
    public Integer getConfirmed() {

        List<Orders> confirmedList = sysOrdersMapper.getConfirmed();
        Integer confirmed = confirmedList.size();
        return confirmed;
    }

    /**
     * 获取派送中数量
     *
     * @return 派送中订单数量
     */
    @Override
    public Integer getDeliveryInProgress() {
        List<Orders> deliveryInProgressList = sysOrdersMapper.getDeliveryInProgress();
        Integer deliveryInProgress = deliveryInProgressList.size();
        return deliveryInProgress;
    }

    /**
     * 获取待接单订单数量
     *
     * @return 待接单订单数量
     */
    @Override
    public Integer getToBeConfirmed() {
        List<Orders> toBeConfirmedList = sysOrdersMapper.getToBeConfirmed();
        Integer toBeConfirmed = toBeConfirmedList.size();
        return toBeConfirmed;
    }

    @Override
    public Integer getCompletedOrders() {
        List<Orders> completedOrdersList = sysOrdersMapper.getCompletedOrders();
        Integer completedOrders = completedOrdersList.size();
        return completedOrders;
    }

    @Override
    public Integer getCancelledOrders() {
        List<Orders> cancelledOrdersList = sysOrdersMapper.getCancelledOrders();
        Integer cancelledOrders = cancelledOrdersList.size();
        return cancelledOrders;
    }
}
