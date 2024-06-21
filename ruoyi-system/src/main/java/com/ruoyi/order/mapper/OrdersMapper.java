package com.ruoyi.order.mapper;

import com.ruoyi.order.domin.dto.OrdersCancelDTO;
import com.ruoyi.order.domin.dto.OrdersRejectionDTO;
import com.ruoyi.order.domin.enity.Orders;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import java.util.List;

@Mapper
public interface OrdersMapper {
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
     * 删除订单
     *
     * @param id 订单主键
     * @return 结果
     */
    public int deleteSysOrdersById(Long id);

    /**
     * 批量删除订单
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysOrdersByIds(Long[] ids);

    /**
     * 接单
     *
     * @param orderId id
     * @return 结果
     */
    @Update("UPDATE sys_orders SET `status` = 3 WHERE id = #{orderId}")
    int takingOrdersById(Long orderId);

    /**
     * 拒绝订单
     *
     * @param ordersRejectionDTO 订单id及拒绝理由
     * @return 结果
     */
    int rejectOrdersById(OrdersRejectionDTO ordersRejectionDTO);


    /**
     * 取消订单
     *
     * @param ordersCancelDTO 订单id及取消理由
     * @return 结果
     */
    int cancelOrdersById(OrdersCancelDTO ordersCancelDTO);

    /**
     * 完成订单
     *
     * @param id id
     * @return 结果
     */
    @Update("UPDATE sys_orders SET `status` = 5 WHERE id = #{id}")
    int completeOrdersById(Long id);

    /**
     * 派送订单
     *
     * @param id id
     * @return 结果
     */
    @Update("UPDATE sys_orders SET `status` = 4 WHERE id = #{id}")
    int deliveryOrdersById(Long id);



    /**
     * 查询待接单订单
     *
     * @return 结果
     */
    @Select("SELECT * FROM sys_orders WHERE `status` = 2")
    List<Orders> getToBeConfirmed();

    /**
     * 查询待派送订单
     *
     * @return 结果
     */
    @Select("SELECT * FROM sys_orders WHERE `status` = 3")
    List<Orders> getConfirmed();

    /**
     * 查询派送中数量订单
     *
     * @return 结果
     */
    @Select("SELECT * FROM sys_orders WHERE `status` = 4")
    List<Orders> getDeliveryInProgress();

    @Select("SELECT * FROM sys_orders WHERE `status` = 5")
    List<Orders> getCompletedOrders();

    @Select("SELECT * FROM sys_orders WHERE `status` = 6")
    List<Orders> getCancelledOrders();
}
