import request from '@/utils/request'

// 查询菜品及套餐分类列表
export function listCategory(query) {
  return request({
    url: '/admin/category/list',
    method: 'get',
    params: query
  })
}

// 查询菜品及套餐分类详细
export function getCategory(id) {
  return request({
    url: '/admin/category/' + id,
    method: 'get'
  })
}

// 新增菜品及套餐分类
export function addCategory(data) {
  return request({
    url: '/admin/category',
    method: 'post',
    data: data
  })
}

// 修改菜品及套餐分类
export function updateCategory(data) {
  return request({
    url: '/admin/category',
    method: 'put',
    data: data
  })
}

// 删除菜品及套餐分类
export function delCategory(id) {
  return request({
    url: '/admin/category/' + id,
    method: 'delete'
  })
}
