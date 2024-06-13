import request from '@/utils/request'

// 查询菜品列表
export function listDish(query) {
  return request({
    url: '/merchant/dish/list',
    method: 'get',
    params: query
  })
}

// 查询菜品详细
export function getDish(id) {
  return request({
    url: '/merchant/dish/' + id,
    method: 'get'
  })
}

// 新增菜品
export function addDish(data) {
  return request({
    url: '/merchant/dish',
    method: 'post',
    data: data
  })
}

// 修改菜品
export function updateDish(data) {
  return request({
    url: '/merchant/dish',
    method: 'put',
    data: data
  })
}

// 删除菜品
export function delDish(id) {
  return request({
    url: '/merchant/dish/' + id,
    method: 'delete'
  })
}
