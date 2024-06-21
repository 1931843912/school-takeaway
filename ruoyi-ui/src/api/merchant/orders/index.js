import request from '@/utils/request'

// 查询订单列表
export function listOrders(query) {
  return request({
    url: '/admin/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单详细
export function getOrders(id) {
  return request({
    url: '/admin/order/' + id,
    method: 'get'
  })
}

// 新增订单
export function addOrders(data) {
  return request({
    url: '/admin/order/',
    method: 'post',
    data: data
  })
}

// 修改订单
export function updateOrders(data) {
  return request({
    url: '/admin/order/',
    method: 'put',
    data: data
  })
}

// 删除订单
export function delOrders(id) {
  return request({
    url: '/admin/order/' + id,
    method: 'delete'
  })
}

// 各个状态的订单数量统计
export function getOrdersCount() {
  return request({
    url: '/admin/order/statistics',
    method: 'get'
  })
}


// 接单 status变成3
export function takingOrdersById(data) {
  return request({
    url: '/admin/order/confirm',
    method: 'put',
    data: data
  })
}

// 派送订单 status变成4
export function deliveryOrdersById(id) {
  return request({
    url: '/admin/order/delivery/' + id,
    method: 'put'
  })
}

// 完成订单 status变成5
export function completeOrdersById(id) {
  return request({
    url: '/admin/order/complete/' + id,
    method: 'put'
  })
}

// 取消订单 status变成6
export function cancelOrdersById(data) {
  return request({
    url: '/admin/order/cancel',
    method: 'put',
    data: data
  })
}

// 拒绝订单 status变成6
export function rejectOrdersById(data) {
  return request({
    url: '/admin/order/rejection',
    method: 'put',
    data: data
  })
}
