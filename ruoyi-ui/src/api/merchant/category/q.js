import request from '@/utils/request'
import { parseStrEmpty } from "@/utils/ruoyi";

// 查询分类列表
export function listCategory(query) {
  return request({
    url: '/merchant/cateogry/page',
    method: 'get',
    params: query
  })
}

// 查询商家新增分类的可见商家
export function getUser(category_id) {
  return request({
    url: '/system/user/' + parseStrEmpty(category_id),
    method: 'get'
  })
}

// 新增分类
export function addCategory(data) {
  return request({
    url: '/merchant/category',
    method: 'post',
    data: data
  })
}

// 修改分类
export function updateCategory(data) {
  return request({
    url: '/merchant/category',
    method: 'put',
    data: data
  })
}

// 删除分类
export function delCategory(category_id) {
  return request({
    url: '/merchant/category' + category_id,
    method: 'delete'
  })
}

// 分类密码重置
export function resetUserPwd(category_id, password) {
  const data = {
    category_id,
    password
  }
  return request({
    url: '/system/user/resetPwd',
    method: 'put',
    data: data
  })
}

// 分类状态修改
export function changeUserStatus(category_id, status) {
  const data = {
    category_id,
    status
  }
  return request({
    url: '/system/user/changeStatus',
    method: 'put',
    data: data
  })
}

// 查询分类个人信息
export function getUserProfile() {
  return request({
    url: '/system/user/profile',
    method: 'get'
  })
}

// 修改分类个人信息
export function updateCategoryProfile(data) {
  return request({
    url: '/system/user/profile',
    method: 'put',
    data: data
  })
}

// 分类密码重置
export function updateCategoryPwd(oldPassword, newPassword) {
  const data = {
    oldPassword,
    newPassword
  }
  return request({
    url: '/system/user/profile/updatePwd',
    method: 'put',
    params: data
  })
}

// 分类头像上传
export function uploadAvatar(data) {
  return request({
    url: '/system/user/profile/avatar',
    method: 'post',
    data: data
  })
}

// 查询授权角色
export function getAuthRole(category_id) {
  return request({
    url: '/system/user/authRole/' + category_id,
    method: 'get'
  })
}

// 保存授权角色
export function updateAuthRole(data) {
  return request({
    url: '/system/user/authRole',
    method: 'put',
    params: data
  })
}

// 查询部门下拉树结构
export function deptTreeSelect() {
  return request({
    url: '/system/user/deptTree',
    method: 'get'
  })
}
