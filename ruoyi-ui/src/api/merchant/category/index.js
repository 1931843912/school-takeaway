import request from '@/utils/request'

// 查询菜品及套餐分类列表
export function listCategory(query) {
  return request({
    url: '/merchant/category/list',
    method: 'get',
    params: query
  })
}

// 查询菜品及套餐分类详细
export function getCategory(id) {
  return request({
    url: '/merchant/category/' + id,
    method: 'get'
  })
}

// 新增菜品及套餐分类
export function addCategory(data) {
  return request({
    url: '/merchant/category',
    method: 'post',
    data: data
  })
}

// 修改菜品及套餐分类
export function updateCategory(data) {
  return request({
    url: '/merchant/category',
    method: 'put',
    data: data
  })
}

// 删除菜品及套餐分类
export function delCategory(id) {
  return request({
    url: '/merchant/category/' + id,
    method: 'delete'
  })
}

//套餐状态修改
export function changeSetmealStatus(id,status){
  const data ={
    id,
    status
  }
  console.log(222)
  return request({
    url: '/merchant/category/changeSetmealStatus/',
    method: 'put',
    data:data
  })
}
