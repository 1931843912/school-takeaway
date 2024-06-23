package com.ruoyi.web.controller.user;

import com.ruoyi.user.entity.dto.OrdersPaymentDTO;
import com.ruoyi.user.entity.dto.OrdersSubmitDTO;
import com.ruoyi.user.entity.po.AddressBook;
import com.ruoyi.user.entity.po.Orders;
import com.ruoyi.user.entity.vo.EstimatedDeliveryTimeVO;
import com.ruoyi.user.entity.vo.OrderPaymentVO;
import com.ruoyi.user.entity.vo.OrderSubmitVO;
import com.ruoyi.user.entity.vo.OrderVO;
import com.ruoyi.user.result.PageResult;
import com.ruoyi.user.result.Result;
import com.ruoyi.user.service.UserAddressBookService;
import com.ruoyi.user.service.UserOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController("userOrderController")
@RequestMapping("/user/order")
@Api(tags = "用户端订单相关接口")
@Slf4j
public class UserOrderController {


    @Resource
    private UserOrderService orderService;
    @Resource
    private UserAddressBookService userAddressBookService;

    /**
     * 用户下单
     *
     * @param ordersSubmitDTO
     * @return
     */
    @PostMapping("/submit")
    @ApiOperation("用户下单")
    //Todo 参数增加String openid
    public Result<OrderSubmitVO> submit(@RequestBody OrdersSubmitDTO ordersSubmitDTO) {
        log.info("用户下单，参数为：{}", ordersSubmitDTO);
//        Long userId = userService.getUserId(openid);
        Long addressBookId = ordersSubmitDTO.getAddressBookId();
        for (int i = 0 ; i < 999 ; i++){
            addressBookId += 1;
            if (userAddressBookService.getById(addressBookId) != null){
                ordersSubmitDTO.setAddressBookId(addressBookId);
                break;
            }
        }
        OrderSubmitVO orderSubmitVO = orderService.submitOrder(ordersSubmitDTO);
        return Result.success(orderSubmitVO);
    }

    /**
     * 订单支付
     *
     * @param ordersPaymentDTO
     * @return
     */
    @PutMapping("/payment")
    @ApiOperation("订单支付")
    public Result<EstimatedDeliveryTimeVO> payment(@RequestBody OrdersPaymentDTO ordersPaymentDTO) throws Exception {
//        log.info("订单支付：{}", ordersPaymentDTO);
//        OrderPaymentVO orderPaymentVO = orderService.payment(ordersPaymentDTO);
//        log.info("生成预支付交易单：{}", orderPaymentVO);
       EstimatedDeliveryTimeVO vo =  new EstimatedDeliveryTimeVO();
       vo.setEstimatedDeliveryTime("20min");
        return Result.success(vo);

    }

    /**
     * 历史订单查询
     *
     * @param page
     * @param pageSize
     * @param status   订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消
     * @return
     */
    @GetMapping("/historyOrders")
    @ApiOperation("历史订单查询")
    public Result<PageResult> page(int page, int pageSize, Integer status) {
        PageResult pageResult = orderService.pageQuery4User(page, pageSize, status);
        return Result.success(pageResult);
    }

    /**
     * 查询订单详情
     *
     * @param id
     * @return
     */
    @GetMapping("/orderDetail/{id}")
    @ApiOperation("查询订单详情")
    public Result<OrderVO> details(@PathVariable("id") Long id) {
        OrderVO orderVO = orderService.details(id);
        return Result.success(orderVO);
    }

    /**
     * 用户取消订单
     *
     * @return
     */
    @PutMapping("/cancel/{id}")
    @ApiOperation("取消订单")
    public Result cancel(@PathVariable("id") Long id) throws Exception {
        orderService.userCancelById(id);
        return Result.success();
    }

    /**
     * 再来一单
     *
     * @param id
     * @return
     */
    @PostMapping("/repetition/{id}")
    @ApiOperation("再来一单")
    public Result repetition(@PathVariable Long id) {
        orderService.repetition(id);
        return Result.success();
    }

    /**
     * 客户催单
     *
     * @param id
     * @return
     */
    @GetMapping("/reminder/{id}")
    @ApiOperation("客户催单")
    public Result reminder(@PathVariable("id") Long id) {
        orderService.reminder(id);
        return Result.success();
    }

}
