package com.ruoyi.web.controller.order;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.order.domin.dto.OrdersCancelDTO;
import com.ruoyi.order.domin.dto.OrdersRejectionDTO;
import com.ruoyi.order.domin.enity.Orders;
import com.ruoyi.order.service.OrdersService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;


/**
 * 订单Controller
 *
 * @author ChenGuanZhou
 * @date 2024-06-17
 */
@RestController
@RequestMapping("/admin/order")
public class OrdersController extends BaseController {

    @Autowired
    private OrdersService sysOrdersService;

    /**
     * 查询订单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Orders sysOrders) {
        startPage();

        List<Orders> list = sysOrdersService.selectSysOrdersList(sysOrders);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Orders sysOrders) {
        List<Orders> list = sysOrdersService.selectSysOrdersList(sysOrders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        util.exportExcel(response, list, "订单数据");
    }

    /**
     * 获取订单详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(sysOrdersService.selectSysOrdersById(id));
    }

    /**
     * 各个状态的订单数量统计
     */
    @GetMapping("/statistics")
    public AjaxResult getOrdersCount() {
        return success(sysOrdersService.getOrdersCount());
    }

    /**
     * 新增订单
     */
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Orders sysOrders) {
        System.out.println(sysOrders);
        return success(sysOrdersService.insertSysOrders(sysOrders));
    }

    /**
     * 修改订单
     */
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Orders sysOrders) {
        return toAjax(sysOrdersService.updateSysOrders(sysOrders));

    }

    /**
     * 修改订单 —— 完成订单 status变成5
     */
    @Log(title = "完成订单", businessType = BusinessType.UPDATE)
    @PutMapping("/complete/{id}")
    public AjaxResult completeOrdersById(@PathVariable("id") Long id) // 添加了@PathVariable注解和id参数
    {
        int result = sysOrdersService.completeOrdersById(id);
        logger.info("完成订单", id);
        System.out.println("result:" + result);
//        return toAjax(result);
        return AjaxResult.success();
    }

    /**
     * 修改订单 —— 派送订单 status变成4
     */
    @Log(title = "派送订单", businessType = BusinessType.UPDATE)
    @PutMapping("/delivery/{id}")
    public AjaxResult deliveryOrdersById(@PathVariable("id") Long id) // 添加了@PathVariable注解和id参数
    {
        int result = sysOrdersService.deliveryOrdersById(id);
        return toAjax(result);
    }

    /**
     * 修改订单 —— 接单 status变成3
     */
    @Log(title = "接单", businessType = BusinessType.UPDATE)
    @PutMapping("/confirm/{id}")
    public AjaxResult takingOrdersById(@PathVariable("id") Long orderId) {
        return toAjax(sysOrdersService.takingOrdersById(orderId));
    }


    /**
     * 修改订单 —— 拒单 status变成6
     */
    @Log(title = "拒单", businessType = BusinessType.UPDATE)
    @PutMapping("/rejection/{id}")
    public AjaxResult rejectOrdersById(@PathVariable("id") Long id) {
        return toAjax(sysOrdersService.rejectOrdersById(id));
    }


    /**
     * 修改订单 —— 取消订单 status变成6
     */
    @Log(title = "取消订单", businessType = BusinessType.UPDATE)
    @PutMapping("/cancel/{id}")
    public AjaxResult cancelOrdersById(@PathVariable("id") Long id) {
        return toAjax(sysOrdersService.cancelOrdersById(id));
    }

    /**
     * 删除订单
     */
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysOrdersService.deleteSysOrdersByIds(ids));
    }
}
