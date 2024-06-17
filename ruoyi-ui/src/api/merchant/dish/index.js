import request from '@/utils/request'

// 查询菜品列表
export function listDish(query) {
  return request({
    url: '/admin/dish/list',
    method: 'get',
    params: query
  })
}

// 查询菜品详细
export function getDish(id) {
  return request({
    url: '/admin/dish/' + id,
    method: 'get'
  })
}

// 获取菜品口味
export function getDishFlavors(id) {
  return request({
    url: '/admin/dish/dishFlavors/' + id,
    method: 'get'
  })
}

// 新增菜品
export function addDish(data) {
  return request({
    url: '/admin/dish',
    method: 'post',
    data: data
  })
}

// 修改菜品
export function updateDish(data) {
  return request({
    url: '/admin/dish',
    method: 'put',
    data: data
  })
}

// 删除菜品
export function delDish(id) {
  return request({
    url: '/admin/dish/' + id,
    method: 'delete'
  })
}