package com.ruoyi.order.domin.enity;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单对象 sys_orders
 *
 * @author ChenGuanzhou
 * @date 2024-06-17
 */
public class Orders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private String number;

    /** 订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款 */
    @Excel(name = "订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款")
    private Long status;

    /** 下单用户 */
    @Excel(name = "下单用户")
    private Long userId;

    /** 地址id */
    @Excel(name = "地址id")
    private Long addressBookId;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderTime;

    /** 结账时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结账时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkoutTime;

    /** 支付方式 1微信,2支付宝 */
    @Excel(name = "支付方式 1微信,2支付宝")
    private Long payMethod;

    /** 支付状态 0未支付 1已支付 2退款 */
    @Excel(name = "支付状态 0未支付 1已支付 2退款")
    private Long payStatus;

    /** 实收金额 */
    @Excel(name = "实收金额")
    private BigDecimal amount;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 用户名称 */
    @Excel(name = "用户名称")
    private String userName;

    /** 收货人 */
    @Excel(name = "收货人")
    private String consignee;

    /** 订单取消原因 */
    @Excel(name = "订单取消原因")
    private String cancelReason;

    /** 订单拒绝原因 */
    @Excel(name = "订单拒绝原因")
    private String rejectionReason;

    /** 订单取消时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "订单取消时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date cancelTime;

    /** 预计送达时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计送达时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date estimatedDeliveryTime;

    /** 配送状态  1立即送出  0选择具体时间 */
    @Excel(name = "配送状态  1立即送出  0选择具体时间")
    private Integer deliveryStatus;

    /** 送达时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "送达时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deliveryTime;

    /** 打包费 */
    @Excel(name = "打包费")
    private Long packAmount;

    /** 餐具数量 */
    @Excel(name = "餐具数量")
    private Long tablewareNumber;

    /** 餐具数量状态  1按餐量提供  0选择具体数量 */
    @Excel(name = "餐具数量状态  1按餐量提供  0选择具体数量")
    private Integer tablewareStatus;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setNumber(String number)
    {
        this.number = number;
    }

    public String getNumber()
    {
        return number;
    }
    public void setStatus(Long status)
    {
        this.status = status;
    }

    public Long getStatus()
    {
        return status;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setAddressBookId(Long addressBookId)
    {
        this.addressBookId = addressBookId;
    }

    public Long getAddressBookId()
    {
        return addressBookId;
    }
    public void setOrderTime(Date orderTime)
    {
        this.orderTime = orderTime;
    }

    public Date getOrderTime()
    {
        return orderTime;
    }
    public void setCheckoutTime(Date checkoutTime)
    {
        this.checkoutTime = checkoutTime;
    }

    public Date getCheckoutTime()
    {
        return checkoutTime;
    }
    public void setPayMethod(Long payMethod)
    {
        this.payMethod = payMethod;
    }

    public Long getPayMethod()
    {
        return payMethod;
    }
    public void setPayStatus(Long payStatus)
    {
        this.payStatus = payStatus;
    }

    public Long getPayStatus()
    {
        return payStatus;
    }
    public void setAmount(BigDecimal amount)
    {
        this.amount = amount;
    }

    public BigDecimal getAmount()
    {
        return amount;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }
    public void setConsignee(String consignee)
    {
        this.consignee = consignee;
    }

    public String getConsignee()
    {
        return consignee;
    }
    public void setCancelReason(String cancelReason)
    {
        this.cancelReason = cancelReason;
    }

    public String getCancelReason()
    {
        return cancelReason;
    }
    public void setRejectionReason(String rejectionReason)
    {
        this.rejectionReason = rejectionReason;
    }

    public String getRejectionReason()
    {
        return rejectionReason;
    }
    public void setCancelTime(Date cancelTime)
    {
        this.cancelTime = cancelTime;
    }

    public Date getCancelTime()
    {
        return cancelTime;
    }
    public void setEstimatedDeliveryTime(Date estimatedDeliveryTime)
    {
        this.estimatedDeliveryTime = estimatedDeliveryTime;
    }

    public Date getEstimatedDeliveryTime()
    {
        return estimatedDeliveryTime;
    }
    public void setDeliveryStatus(Integer deliveryStatus)
    {
        this.deliveryStatus = deliveryStatus;
    }

    public Integer getDeliveryStatus()
    {
        return deliveryStatus;
    }
    public void setDeliveryTime(Date deliveryTime)
    {
        this.deliveryTime = deliveryTime;
    }

    public Date getDeliveryTime()
    {
        return deliveryTime;
    }
    public void setPackAmount(Long packAmount)
    {
        this.packAmount = packAmount;
    }

    public Long getPackAmount()
    {
        return packAmount;
    }
    public void setTablewareNumber(Long tablewareNumber)
    {
        this.tablewareNumber = tablewareNumber;
    }

    public Long getTablewareNumber()
    {
        return tablewareNumber;
    }
    public void setTablewareStatus(Integer tablewareStatus)
    {
        this.tablewareStatus = tablewareStatus;
    }

    public Integer getTablewareStatus()
    {
        return tablewareStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("number", getNumber())
                .append("status", getStatus())
                .append("userId", getUserId())
                .append("addressBookId", getAddressBookId())
                .append("orderTime", getOrderTime())
                .append("checkoutTime", getCheckoutTime())
                .append("payMethod", getPayMethod())
                .append("payStatus", getPayStatus())
                .append("amount", getAmount())
                .append("remark", getRemark())
                .append("phone", getPhone())
                .append("address", getAddress())
                .append("userName", getUserName())
                .append("consignee", getConsignee())
                .append("cancelReason", getCancelReason())
                .append("rejectionReason", getRejectionReason())
                .append("cancelTime", getCancelTime())
                .append("estimatedDeliveryTime", getEstimatedDeliveryTime())
                .append("deliveryStatus", getDeliveryStatus())
                .append("deliveryTime", getDeliveryTime())
                .append("packAmount", getPackAmount())
                .append("tablewareNumber", getTablewareNumber())
                .append("tablewareStatus", getTablewareStatus())
                .toString();
    }
}
