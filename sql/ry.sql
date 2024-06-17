/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40)
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40)
 File Encoding         : 65001

 Date: 17/06/2024 16:02:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'sys_category', '菜品及套餐分类', NULL, NULL, 'Category', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'category', '菜品及套餐分类', 'xiaozhu', '0', '/', '{}', 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_dish', '商家菜品表', NULL, NULL, 'Dish', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'dish', '菜品', 'xiaozhu', '0', '/', '{}', 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26', NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_setmeal', '套餐', NULL, NULL, 'Setmeal', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'setmeal', '套餐', 'xiaozhu', '0', '/', '{}', 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13', NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_dish_flavor', '菜品口味关系表', NULL, NULL, 'SysDishFlavor', 'crud', '', 'com.ruoyi.system', 'system', 'flavor', '菜品口味关系', 'ruoyi', '0', '/', NULL, 'admin', '2024-06-16 21:10:31', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_setmeal_dish', '套餐菜品关系', NULL, NULL, 'SetmealDish', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'dish', '套餐菜品关系', 'xiaozhu', '0', '/', '{}', 'admin', '2024-06-17 11:23:16', '', '2024-06-17 11:23:43', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 2, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (2, 2, 'user_id', '所属商家', 'int(11)', 'Long', 'userId', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 2, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (3, 2, 'type', '类型   1 菜品分类 2 套餐分类', 'int(11)', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'category_list', 3, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (4, 2, 'name', '分类名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (5, 2, 'sort', '顺序', 'int(11)', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (6, 2, 'status', '分类状态 0:禁用，1:启用', 'int(11)', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 6, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (7, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (8, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '1', NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (9, 2, 'create_user', '创建人', 'bigint(20)', 'Long', 'createUser', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 9, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (10, 2, 'update_user', '修改人', 'bigint(20)', 'Long', 'updateUser', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 10, 'admin', '2024-06-09 23:24:18', '', '2024-06-14 14:46:46');
INSERT INTO `gen_table_column` VALUES (11, 3, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (12, 3, 'user_id', '商家id', 'int(11)', 'Long', 'userId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (13, 3, 'name', '菜品名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (14, 3, 'category_id', '菜品分类id', 'bigint(20)', 'Long', 'categoryId', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (15, 3, 'price', '菜品价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (16, 3, 'image', '图片', 'varchar(255)', 'String', 'image', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 6, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (17, 3, 'description', '描述信息', 'varchar(255)', 'String', 'description', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'editor', '', 7, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (18, 3, 'status', '0 停售 1 起售', 'int(11)', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 8, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (19, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (20, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (21, 3, 'create_user', '创建人', 'bigint(20)', 'Long', 'createUser', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 11, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (22, 3, 'update_user', '修改人', 'bigint(20)', 'Long', 'updateUser', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 12, 'admin', '2024-06-11 16:28:22', '', '2024-06-13 22:08:26');
INSERT INTO `gen_table_column` VALUES (23, 4, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (24, 4, 'user_id', '商家id', 'bigint(20)', 'Long', 'userId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (25, 4, 'category_id', '菜品分类id', 'bigint(20)', 'Long', 'categoryId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 3, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (26, 4, 'name', '套餐名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (27, 4, 'price', '套餐价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (28, 4, 'status', '售卖状态 0:停售 1:起售', 'int(11)', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 6, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (29, 4, 'description', '描述信息', 'varchar(255)', 'String', 'description', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'editor', '', 7, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (30, 4, 'image', '图片', 'varchar(255)', 'String', 'image', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 8, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (31, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (32, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (33, 4, 'create_user', '创建人', 'bigint(20)', 'Long', 'createUser', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 11, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (34, 4, 'update_user', '修改人', 'bigint(20)', 'Long', 'updateUser', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 12, 'admin', '2024-06-14 00:05:44', '', '2024-06-14 00:12:13');
INSERT INTO `gen_table_column` VALUES (35, 5, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-16 21:10:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 5, 'user_id', NULL, 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-16 21:10:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 5, 'dish_id', '菜品', 'bigint(20)', 'Long', 'dishId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-16 21:10:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 5, 'name', '口味名称', 'varchar(32)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-06-16 21:10:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 5, 'value', '口味数据list', 'varchar(255)', 'String', 'value', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-06-16 21:10:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 6, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-17 11:23:16', '', '2024-06-17 11:23:43');
INSERT INTO `gen_table_column` VALUES (41, 6, 'setmeal_id', '套餐id', 'bigint(20)', 'Long', 'setmealId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-17 11:23:16', '', '2024-06-17 11:23:43');
INSERT INTO `gen_table_column` VALUES (42, 6, 'dish_id', '菜品id', 'bigint(20)', 'Long', 'dishId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-17 11:23:16', '', '2024-06-17 11:23:43');
INSERT INTO `gen_table_column` VALUES (43, 6, 'name', '菜品名称 （冗余字段）', 'varchar(32)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-06-17 11:23:16', '', '2024-06-17 11:23:43');
INSERT INTO `gen_table_column` VALUES (44, 6, 'price', '菜品单价（冗余字段）', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-06-17 11:23:16', '', '2024-06-17 11:23:43');
INSERT INTO `gen_table_column` VALUES (45, 6, 'copies', '菜品份数', 'int(11)', 'Long', 'copies', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-17 11:23:16', '', '2024-06-17 11:23:43');

-- ----------------------------
-- Table structure for sys_address_book
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_book`;
CREATE TABLE `sys_address_book`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址簿' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_address_book
-- ----------------------------

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int(11) NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES (11, 1, 2, '酒水饮料', 10, 0, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1);
INSERT INTO `sys_category` VALUES (12, 1, 1, '传统主食', 9, 0, '2022-06-09 22:09:32', '2024-06-14 15:15:49', 1, 1);
INSERT INTO `sys_category` VALUES (13, 1, 2, '人气套餐', 12, 0, '2022-06-09 22:11:38', '2022-06-10 11:04:40', 1, 1);
INSERT INTO `sys_category` VALUES (15, 1, 2, '商务套餐', 13, 1, '2022-06-09 22:14:10', '2024-06-14 15:14:51', 1, 1);
INSERT INTO `sys_category` VALUES (16, 1, 2, '蜀味烤鱼', 4, 0, '2022-06-09 22:15:37', '2022-08-31 14:27:25', 1, 1);
INSERT INTO `sys_category` VALUES (17, 1, 2, '蜀味牛蛙', 5, 0, '2022-06-09 22:16:14', '2022-08-31 14:39:44', 1, 1);
INSERT INTO `sys_category` VALUES (18, 1, 2, '特色蒸菜', 6, 0, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1);
INSERT INTO `sys_category` VALUES (19, 1, 2, '新鲜时蔬', 7, 0, '2022-06-09 22:18:12', '2022-06-09 22:18:28', 1, 1);
INSERT INTO `sys_category` VALUES (20, 1, 2, '水煮鱼', 8, 0, '2022-06-09 22:22:29', '2022-06-09 22:23:45', 1, 1);
INSERT INTO `sys_category` VALUES (21, 1, 2, '汤类', 11, 0, '2022-06-10 10:51:47', '2022-06-10 10:51:47', 1, 1);
INSERT INTO `sys_category` VALUES (23, 1, 2, '99', 99, 0, '2024-06-10 16:30:19', NULL, NULL, NULL);
INSERT INTO `sys_category` VALUES (31, 1, 2, '101', 9, 0, '2024-06-10 16:52:57', '2024-06-10 17:31:05', 1, NULL);
INSERT INTO `sys_category` VALUES (34, 1, 2, '11', 11, 0, '2024-06-11 12:49:43', '2024-06-11 12:49:58', 1, 1);
INSERT INTO `sys_category` VALUES (35, 1, 2, '99', 99, 0, '2024-06-13 21:47:40', '2024-06-13 21:50:47', 1, 1);
INSERT INTO `sys_category` VALUES (36, 1, 1, '88', 88, 0, '2024-06-13 21:56:01', '2024-06-17 14:31:22', 1, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-31 10:15:17', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-31 10:15:17', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-31 10:15:17', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-05-31 10:15:17', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-31 10:15:17', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-05-31 10:15:17', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '小朱', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', 'admin', '2024-06-07 10:22:21');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', 'admin', '2024-06-14 14:17:34');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', 'ry', '2024-06-14 14:18:26');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '菜品分类', '1', 'sys_category_list', NULL, 'info', 'N', '0', 'admin', '2024-06-14 14:30:35', 'admin', '2024-06-14 15:27:06', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '套餐分类', '2', 'sys_category_list', NULL, 'info', 'N', '0', 'admin', '2024-06-14 14:30:48', 'admin', '2024-06-14 15:27:10', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 1, '微信', '1', 'payment_method', NULL, 'primary', 'N', '0', 'admin', '2024-06-14 15:20:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 2, '支付宝', '2', 'payment_method', NULL, 'primary', 'N', '0', 'admin', '2024-06-14 15:20:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 1, '未支付', '0', 'order_payment_status', NULL, 'warning', 'N', '0', 'admin', '2024-06-14 15:20:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 2, '已支付', '1', 'order_payment_status', NULL, 'primary', 'N', '0', 'admin', '2024-06-14 15:21:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 3, '退款', '2', 'order_payment_status', NULL, 'danger', 'N', '0', 'admin', '2024-06-14 15:21:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 1, '立即送出', '1', 'sent_status', NULL, 'primary', 'N', '0', 'admin', '2024-06-14 15:22:01', 'admin', '2024-06-14 15:22:06', NULL);
INSERT INTO `sys_dict_data` VALUES (38, 0, '选择具体时间', '0', 'sent_status', NULL, 'info', 'N', '0', 'admin', '2024-06-14 15:22:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 0, '待付款', '1', 'order_status', NULL, 'warning', 'N', '0', 'admin', '2024-06-14 15:23:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 0, '待接单', '2', 'order_status', NULL, 'warning', 'N', '0', 'admin', '2024-06-14 15:24:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 0, '已接单', '3', 'order_status', NULL, 'info', 'N', '0', 'admin', '2024-06-14 15:24:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (42, 0, '派送中', '4', 'order_status', NULL, 'info', 'N', '0', 'admin', '2024-06-14 15:24:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 0, '已完成', '5', 'order_status', NULL, 'success', 'N', '0', 'admin', '2024-06-14 15:24:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (44, 0, '已取消', '6', 'order_status', NULL, 'danger', 'N', '0', 'admin', '2024-06-14 15:25:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 0, '退款', '7', 'order_status', NULL, 'danger', 'N', '0', 'admin', '2024-06-14 15:25:13', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '套餐分类', 'sys_category_list', '0', 'admin', '2024-06-14 14:28:46', 'admin', '2024-06-14 14:37:32', 'type:1 菜品分类\ntyep:2 套餐分类');
INSERT INTO `sys_dict_type` VALUES (12, '订单支付方式', 'payment_method', '0', 'admin', '2024-06-14 15:19:35', 'admin', '2024-06-14 15:19:51', NULL);
INSERT INTO `sys_dict_type` VALUES (13, '订单支付状态', 'order_payment_status', '0', 'admin', '2024-06-14 15:20:38', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (14, '配送状态', 'sent_status', '0', 'admin', '2024-06-14 15:21:46', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (15, '订单状态', 'order_status', '0', 'admin', '2024-06-14 15:23:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dish
-- ----------------------------
DROP TABLE IF EXISTS `sys_dish`;
CREATE TABLE `sys_dish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(11) NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dish
-- ----------------------------
INSERT INTO `sys_dish` VALUES (46, 1, '王老吉', 11, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '', 0, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1);
INSERT INTO `sys_dish` VALUES (47, 1, '北冰洋', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', '<p>还是小时候的味道</p>', 0, '2022-06-10 09:18:49', '2022-06-10 09:18:49', 1, 1);
INSERT INTO `sys_dish` VALUES (48, 1, '雪花啤酒', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', '', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54', 1, 1);
INSERT INTO `sys_dish` VALUES (49, 1, '米饭', 12, 2.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', '<p>精选五常大米</p>', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17', 1, 1);
INSERT INTO `sys_dish` VALUES (50, 1, '馒头', 12, 1.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', '优质面粉', 1, '2022-06-10 09:34:28', '2022-06-10 09:34:28', 1, 1);
INSERT INTO `sys_dish` VALUES (51, 1, '老坛酸菜鱼', 20, 56.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2022-06-10 09:40:51', 1, 1);
INSERT INTO `sys_dish` VALUES (52, 1, '经典酸菜鮰鱼', 20, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', '<p>原料：酸菜，江团，鮰鱼</p>', 1, '2022-06-10 09:46:02', '2022-06-10 09:46:02', 1, 1);
INSERT INTO `sys_dish` VALUES (53, 1, '蜀味水煮草鱼', 20, 38.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37', 1, 1);
INSERT INTO `sys_dish` VALUES (54, 1, '清炒小油菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', '原料：小油菜', 1, '2022-06-10 09:51:46', '2022-06-10 09:51:46', 1, 1);
INSERT INTO `sys_dish` VALUES (55, 1, '蒜蓉娃娃菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37', 1, 1);
INSERT INTO `sys_dish` VALUES (56, 1, '清炒西兰花', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', '原料：西兰花', 1, '2022-06-10 09:55:44', '2022-06-10 09:55:44', 1, 1);
INSERT INTO `sys_dish` VALUES (57, 1, '炝炒圆白菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2022-06-10 09:58:35', 1, 1);
INSERT INTO `sys_dish` VALUES (58, 1, '清蒸鲈鱼', 18, 98.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28', 1, 1);
INSERT INTO `sys_dish` VALUES (59, 1, '东坡肘子', 18, 138.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03', 1, 1);
INSERT INTO `sys_dish` VALUES (60, 1, '梅菜扣肉', 18, 58.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2022-06-10 10:26:03', 1, 1);
INSERT INTO `sys_dish` VALUES (61, 1, '剁椒鱼头', 18, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54', 1, 1);
INSERT INTO `sys_dish` VALUES (62, 1, '金汤酸菜牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2022-06-10 10:33:05', 1, 1);
INSERT INTO `sys_dish` VALUES (63, 1, '香锅牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2022-06-10 10:35:40', 1, 1);
INSERT INTO `sys_dish` VALUES (64, 1, '馋嘴牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2022-06-10 10:37:52', 1, 1);
INSERT INTO `sys_dish` VALUES (66, 1, '江团鱼2斤', 16, 119.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2022-06-10 10:42:42', 1, 1);
INSERT INTO `sys_dish` VALUES (67, 1, '鮰鱼2斤', 16, 72.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', '原料：鮰鱼，黄豆芽，莲藕', 1, '2022-06-10 10:43:56', '2022-06-10 10:43:56', 1, 1);
INSERT INTO `sys_dish` VALUES (68, 1, '鸡蛋汤', 21, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', '配料：鸡蛋，紫菜', 1, '2022-06-10 10:54:25', '2022-06-10 10:54:25', 1, 1);
INSERT INTO `sys_dish` VALUES (69, 1, '平菇豆腐汤', 21, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', '配料：豆腐，平菇', 1, '2022-06-10 10:55:02', '2022-06-10 10:55:02', 1, 1);
INSERT INTO `sys_dish` VALUES (94, 1, '0', 17, 0.00, NULL, '<p><br></p>', 1, '2024-06-17 00:36:45', NULL, 1, NULL);
INSERT INTO `sys_dish` VALUES (95, 1, '9', 12, 9.00, NULL, NULL, 1, '2024-06-17 00:45:25', NULL, 1, NULL);
INSERT INTO `sys_dish` VALUES (96, 1, '3', 18, 3.00, NULL, NULL, 1, '2024-06-17 00:51:07', NULL, 1, NULL);
INSERT INTO `sys_dish` VALUES (97, 1, '88', 12, 88.00, '/profile/upload/2024/06/17/屏幕截图(1)_20240617013103A001.png', '<p>99</p>', 0, '2024-06-17 01:31:06', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `sys_dish_flavor`;
CREATE TABLE `sys_dish_flavor`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL,
  `dish_id` bigint(20) NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dish_flavor
-- ----------------------------
INSERT INTO `sys_dish_flavor` VALUES (40, NULL, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `sys_dish_flavor` VALUES (41, NULL, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (42, NULL, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `sys_dish_flavor` VALUES (45, NULL, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (46, NULL, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (47, NULL, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (48, NULL, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `sys_dish_flavor` VALUES (49, NULL, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `sys_dish_flavor` VALUES (50, NULL, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `sys_dish_flavor` VALUES (51, NULL, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `sys_dish_flavor` VALUES (52, NULL, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (86, NULL, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (87, NULL, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (88, NULL, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (89, NULL, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (92, NULL, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (93, NULL, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (94, NULL, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `sys_dish_flavor` VALUES (95, NULL, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (96, NULL, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (97, NULL, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (101, NULL, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (102, NULL, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (103, NULL, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (120, 1, 94, '辣度', '[\"9\",\"9\"]');
INSERT INTO `sys_dish_flavor` VALUES (121, 1, 95, '辣度', '[\"00\"]');
INSERT INTO `sys_dish_flavor` VALUES (122, 1, 96, '辣度', '[\"333\"]');
INSERT INTO `sys_dish_flavor` VALUES (123, 1, 96, '辣度', '[\"00\"]');
INSERT INTO `sys_dish_flavor` VALUES (124, 1, 97, '甜味', '[\"888\"]');
INSERT INTO `sys_dish_flavor` VALUES (125, 1, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (126, 1, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (127, 1, 49, '辣度', '[\"不辣\"]');
INSERT INTO `sys_dish_flavor` VALUES (128, 1, 46, '凉快', '[\"很凉快\"]');
INSERT INTO `sys_dish_flavor` VALUES (129, 1, 46, '凉快', '[\"很凉快\"]');

-- ----------------------------
-- Table structure for sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee`;
CREATE TABLE `sys_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO `sys_employee` VALUES (1, '管理员', 'admin', '123456', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-05-31 10:15:17', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-05-31 10:15:17', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-05-31 10:15:17', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-04 16:32:38');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-07 10:08:51');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 10:08:58');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 19:38:42');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 22:46:16');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 22:52:17');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-09 23:21:19');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-10 16:07:27');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 12:49:30');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 16:04:53');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-13 21:47:30');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 01:03:21');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 10:23:37');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 14:13:36');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-14 14:17:49');
INSERT INTO `sys_logininfor` VALUES (115, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 14:17:55');
INSERT INTO `sys_logininfor` VALUES (116, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-14 14:19:09');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 14:19:15');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-14 20:46:45');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-15 22:29:51');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 14:56:02');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-16 14:56:31');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 14:56:37');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-16 17:13:34');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 17:13:37');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 20:29:40');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-16 21:10:15');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 21:10:18');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-16 23:30:44');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-16 23:30:47');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 10:07:32');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 11:23:01');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 12:45:15');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 13:06:53');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-17 15:32:12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2008 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-05-31 10:15:16', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-05-31 10:15:16', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-05-31 10:15:16', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2024-05-31 10:15:16', 'admin', '2024-06-09 23:21:53', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-31 10:15:16', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-31 10:15:16', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-31 10:15:16', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-31 10:15:16', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-31 10:15:16', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-31 10:15:16', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-31 10:15:16', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-31 10:15:16', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-05-31 10:15:16', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-31 10:15:16', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-31 10:15:16', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-05-31 10:15:16', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-31 10:15:16', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-31 10:15:16', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-31 10:15:16', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-05-31 10:15:16', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-31 10:15:16', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-31 10:15:16', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-31 10:15:16', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-31 10:15:16', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '商家管理', 0, 5, 'merchant', NULL, NULL, 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2024-06-07 10:26:34', 'admin', '2024-06-07 10:28:47', '');
INSERT INTO `sys_menu` VALUES (2001, '分类列表', 2000, 1, 'category', 'merchant/category/index', NULL, 1, 0, 'C', '0', '0', 'merchant:category:list', '#', 'admin', '2024-06-07 10:28:13', 'admin', '2024-06-07 10:33:46', '');
INSERT INTO `sys_menu` VALUES (2002, '分类新增', 2001, 2, 'merchant:category:add', NULL, NULL, 1, 0, 'F', '0', '0', 'merchant:category:add', '#', 'admin', '2024-06-07 10:30:45', 'admin', '2024-06-09 20:50:28', '');
INSERT INTO `sys_menu` VALUES (2005, '菜品管理', 2000, 2, 'dish', 'merchant/dish/index', NULL, 1, 0, 'C', '0', '0', 'merchant:dish:index', '#', 'admin', '2024-06-09 20:52:49', 'admin', '2024-06-13 23:58:30', '');
INSERT INTO `sys_menu` VALUES (2006, '套餐管理', 2000, 3, 'setmeal', NULL, NULL, 1, 0, 'M', '0', '0', '', '#', 'admin', '2024-06-14 00:03:29', 'admin', '2024-06-14 00:03:41', '');
INSERT INTO `sys_menu` VALUES (2007, '套餐列表', 2006, 1, 'setmeal', 'merchant/setmeal/index', NULL, 1, 0, 'C', '0', '0', 'merchant:setmeal:index', '#', 'admin', '2024-06-14 00:04:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-05-31 10:15:17', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-31 10:15:17', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 310 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '在线用户', 7, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', '研发部门', '/monitor/online/bec35ed1-733a-4b74-ac9c-81410b10259f', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 16:32:30', 12);
INSERT INTO `sys_oper_log` VALUES (101, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', '研发部门', '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-04 16:32:54', 1038);
INSERT INTO `sys_oper_log` VALUES (102, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', '研发部门', '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"postCode\":\"ceo\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-04 16:33:10', 88);
INSERT INTO `sys_oper_log` VALUES (103, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"email\":\"ry@qq.com\",\"leader\":\"小朱\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:22:21', 44);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商家管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"bussiness\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:26:34', 22);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 10:26:34\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"商家管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"bussiness\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:26:55', 16);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分类管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"bussniess:category\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:28:13', 23);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 10:26:34\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"商家管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"merchant\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:28:47', 14);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 10:28:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"merchant:category\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:28:56', 22);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 10:28:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"merchant:category:list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:29:07', 26);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 10:28:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类列表\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"merchant:category:list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:29:28', 23);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分类新增\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"merchant:category:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:30:45', 19);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/category/index\",\"createTime\":\"2024-06-07 10:28:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"merchant:category:list\",\"perms\":\"merchant:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:31:25', 27);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/category/index\",\"createTime\":\"2024-06-07 10:28:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"category\",\"perms\":\"merchant:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:31:51', 15);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/category/index\",\"createTime\":\"2024-06-07 10:28:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"category\",\"perms\":\"merchant:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 10:33:46', 25);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 11:14:40', 15);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 11:14:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 11:18:15', 13);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/test/test/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试菜单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"test\",\"perms\":\"test:test:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 11:19:20', 12);
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-09 20:46:12', 13);
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-09 20:46:13', 5);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-07 10:30:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分类新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"merchant:category:add\",\"perms\":\"merchant:category:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 20:50:28', 19);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/dish/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"套餐管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"dish\",\"perms\":\"merchant:dish:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 20:52:49', 11);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-09 23:21:43', 12);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-31 10:15:16\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 23:21:53', 17);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-06-09 23:22:02', 4);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 23:22:06', 21);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 23:22:08', 11);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-06-09 23:22:13', 9);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_category\"}', NULL, 1, '导入失败：\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.gen_table_column\' doesn\'t exist\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-generator\\target\\classes\\mapper\\generator\\GenTableColumnMapper.xml]\r\n### The error may involve com.ruoyi.generator.mapper.GenTableColumnMapper.insertGenTableColumn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into gen_table_column (     table_id,      column_name,      column_comment,      column_type,      java_type,      java_field,      is_pk,      is_increment,      is_required,      is_insert,                     query_type,      html_type,           sort,      create_by,     create_time          )values(     ?,      ?,      ?,      ?,      ?,      ?,      ?,      ?,      ?,      ?,                     ?,      ?,           ?,      ?,     sysdate()          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.gen_table_column\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.gen_table_column\' doesn\'t exist', '2024-06-09 23:24:06', 61);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_category\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 23:24:18', 64);
INSERT INTO `sys_oper_log` VALUES (130, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:30:18\",\"id\":23,\"name\":\"99\",\"params\":{},\"sort\":99}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 16:30:18', 38);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"SysCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属商家\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类型   1 菜品分类 2 套餐分类\",\"columnId\":3,\"columnName\":\"type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"select\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 16:42:34', 96);
INSERT INTO `sys_oper_log` VALUES (132, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:44:14\",\"name\":\"99\",\"params\":{},\"sort\":99}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( name,             sort,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\n; Duplicate entry \'99\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'', '2024-06-10 16:44:14', 70);
INSERT INTO `sys_oper_log` VALUES (133, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:44:16\",\"name\":\"99\",\"params\":{},\"sort\":99,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( name,             sort,             status,             create_time )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\n; Duplicate entry \'99\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'', '2024-06-10 16:44:16', 5);
INSERT INTO `sys_oper_log` VALUES (134, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:46:18\",\"name\":\"99\",\"params\":{},\"sort\":9}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( name,             sort,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\n; Duplicate entry \'99\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'', '2024-06-10 16:46:18', 4);
INSERT INTO `sys_oper_log` VALUES (135, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:46:19\",\"name\":\"99\",\"params\":{},\"sort\":9,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( name,             sort,             status,             create_time )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\n; Duplicate entry \'99\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'', '2024-06-10 16:46:19', 6);
INSERT INTO `sys_oper_log` VALUES (136, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:46:23\",\"name\":\"99\",\"params\":{},\"sort\":9,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( name,             sort,             status,             create_time )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\n; Duplicate entry \'99\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'', '2024-06-10 16:46:23', 5);
INSERT INTO `sys_oper_log` VALUES (137, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:48:01\",\"createUser\":1,\"name\":\"99\",\"params\":{},\"sort\":9,\"status\":0,\"type\":2,\"userId\":1}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.common.core.domain.entity.Category\'', '2024-06-10 16:48:01', 19);
INSERT INTO `sys_oper_log` VALUES (138, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:48:52\",\"createUser\":1,\"name\":\"99\",\"params\":{},\"sort\":9,\"status\":0,\"type\":2,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( user_id,             type,             name,             sort,             status,             create_time,                          create_user )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\n; Duplicate entry \'99\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'', '2024-06-10 16:48:52', 93);
INSERT INTO `sys_oper_log` VALUES (139, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:52:04\",\"createUser\":1,\"name\":\"99\",\"params\":{},\"sort\":9,\"status\":0,\"type\":2,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( user_id,             type,             name,             sort,             status,             create_time,                          create_user )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'\n; Duplicate entry \'99\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'99\' for key \'idx_category_name\'', '2024-06-10 16:52:05', 86);
INSERT INTO `sys_oper_log` VALUES (140, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:52:56\",\"createUser\":1,\"id\":31,\"name\":\"101\",\"params\":{},\"sort\":9,\"status\":0,\"type\":2,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 16:52:56', 10);
INSERT INTO `sys_oper_log` VALUES (141, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:53:20\",\"createUser\":1,\"name\":\"传统主食\",\"params\":{},\"sort\":8,\"status\":0,\"type\":2,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'传统主食\' for key \'idx_category_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\category\\CategoryMapper.xml]\r\n### The error may involve com.ruoyi.category.mapper.CategoryMapper.insertSysCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_category          ( user_id,             type,             name,             sort,             status,             create_time,                          create_user )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'传统主食\' for key \'idx_category_name\'\n; Duplicate entry \'传统主食\' for key \'idx_category_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'传统主食\' for key \'idx_category_name\'', '2024-06-10 16:53:20', 8);
INSERT INTO `sys_oper_log` VALUES (142, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:53:56\",\"createUser\":1,\"id\":33,\"name\":\"传统主食\",\"params\":{},\"sort\":8,\"status\":0,\"type\":2,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 16:53:56', 10);
INSERT INTO `sys_oper_log` VALUES (143, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:53:56\",\"createUser\":1,\"id\":33,\"name\":\"传统主食\",\"params\":{},\"sort\":8,\"status\":1,\"type\":2,\"updateTime\":\"2024-06-10 17:29:36\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 17:29:36', 28);
INSERT INTO `sys_oper_log` VALUES (144, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:53:56\",\"createUser\":1,\"id\":33,\"name\":\"传统主食\",\"params\":{},\"sort\":8,\"status\":0,\"type\":2,\"updateTime\":\"2024-06-10 17:29:40\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 17:29:40', 8);
INSERT INTO `sys_oper_log` VALUES (145, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:53:56\",\"createUser\":1,\"id\":33,\"name\":\"传统主食\",\"params\":{},\"sort\":8,\"status\":0,\"type\":2,\"updateTime\":\"2024-06-10 17:29:47\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 17:29:47', 7);
INSERT INTO `sys_oper_log` VALUES (146, '菜品及套餐分类', 3, 'com.ruoyi.web.controller.category.CategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/merchant/category/33', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 17:30:54', 17);
INSERT INTO `sys_oper_log` VALUES (147, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-10 16:52:57\",\"createUser\":1,\"id\":31,\"name\":\"101\",\"params\":{},\"sort\":9,\"status\":0,\"type\":2,\"updateTime\":\"2024-06-10 17:31:04\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 17:31:04', 9);
INSERT INTO `sys_oper_log` VALUES (148, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-11 12:49:43\",\"createUser\":1,\"id\":34,\"name\":\"11\",\"params\":{},\"sort\":11,\"type\":2,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 12:49:43', 18);
INSERT INTO `sys_oper_log` VALUES (149, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-11 12:49:43\",\"createUser\":1,\"id\":34,\"name\":\"11\",\"params\":{},\"sort\":11,\"status\":0,\"type\":2,\"updateTime\":\"2024-06-11 12:49:51\",\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 12:49:51', 8);
INSERT INTO `sys_oper_log` VALUES (150, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-11 12:49:43\",\"createUser\":1,\"id\":34,\"name\":\"11\",\"params\":{},\"sort\":11,\"status\":1,\"type\":2,\"updateTime\":\"2024-06-11 12:49:57\",\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 12:49:57', 7);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_dish\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 16:28:22', 105);
INSERT INTO `sys_oper_log` VALUES (152, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 21:47:39\",\"createUser\":1,\"id\":35,\"name\":\"99\",\"params\":{},\"sort\":99,\"status\":0,\"type\":2,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 21:47:39', 14);
INSERT INTO `sys_oper_log` VALUES (153, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 21:47:40\",\"createUser\":1,\"id\":35,\"name\":\"99\",\"params\":{},\"sort\":99,\"status\":0,\"type\":2,\"updateTime\":\"2024-06-13 21:50:47\",\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 21:50:47', 5);
INSERT INTO `sys_oper_log` VALUES (154, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 21:56:01\",\"createUser\":1,\"id\":36,\"name\":\"88\",\"params\":{},\"sort\":88,\"status\":0,\"type\":2,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 21:56:01', 36);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dish\",\"className\":\"SysDish\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"商家id\",\"columnId\":12,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"菜品名称\",\"columnId\":13,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"菜品分类id\",\"columnId\":14,\"columnName\":\"category_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"category', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 22:06:41', 95);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dish\",\"className\":\"Dish\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-13 22:06:41\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"商家id\",\"columnId\":12,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-13 22:06:41\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"菜品名称\",\"columnId\":13,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-13 22:06:41\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"菜品分类id\",\"columnId\":14,\"columnName\":\"category_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 16:28:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 22:08:26', 49);
INSERT INTO `sys_oper_log` VALUES (157, '菜品', 1, 'com.ruoyi.web.controller.dish.DishController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 22:17:15\",\"image\":\"/profile/upload/2024/06/13/屏幕截图(1)_20240613221711A001.png\",\"name\":\"99\",\"params\":{},\"price\":99}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishMapper.insertDish-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish          ( name,                          price,             image,                                       create_time )           values ( ?,                          ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\n; Field \'category_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'category_id\' doesn\'t have a default value', '2024-06-13 22:17:15', 69);
INSERT INTO `sys_oper_log` VALUES (158, '菜品', 1, 'com.ruoyi.web.controller.dish.DishController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 22:30:59\",\"createUser\":1,\"image\":\"/profile/upload/2024/06/13/屏幕截图(2)_20240613223056A001.png\",\"name\":\"分类1\",\"params\":{},\"price\":12,\"status\":0}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 24', '2024-06-13 22:30:59', 25);
INSERT INTO `sys_oper_log` VALUES (159, '菜品', 1, 'com.ruoyi.web.controller.dish.DishController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 22:31:01\",\"createUser\":1,\"image\":\"/profile/upload/2024/06/13/屏幕截图(2)_20240613223056A001.png\",\"name\":\"分类1\",\"params\":{},\"price\":12,\"status\":0}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 24', '2024-06-13 22:31:01', 4);
INSERT INTO `sys_oper_log` VALUES (160, '菜品', 1, 'com.ruoyi.web.controller.dish.DishController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 22:31:03\",\"createUser\":1,\"image\":\"/profile/upload/2024/06/13/屏幕截图(2)_20240613223056A001.png\",\"name\":\"分类1\",\"params\":{},\"price\":12,\"status\":0}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 24', '2024-06-13 22:31:03', 4);
INSERT INTO `sys_oper_log` VALUES (161, '菜品', 1, 'com.ruoyi.web.controller.dish.DishController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"categoryId\":22,\"createTime\":\"2024-06-13 22:32:26\",\"createUser\":1,\"id\":70,\"image\":\"/profile/upload/2024/06/13/屏幕截图(2)_20240613223056A001.png\",\"name\":\"分类1\",\"params\":{},\"price\":12,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 22:32:26', 41);
INSERT INTO `sys_oper_log` VALUES (162, '菜品', 1, 'com.ruoyi.web.controller.dish.DishController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"categoryId\":22,\"createTime\":\"2024-06-13 22:59:43\",\"createUser\":1,\"description\":\"<p>000</p>\",\"id\":71,\"image\":\"/profile/upload/2024/06/13/屏幕截图(2)_20240613225925A001.png\",\"name\":\"io\",\"params\":{},\"price\":88,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 22:59:43', 15);
INSERT INTO `sys_oper_log` VALUES (163, '菜品', 2, 'com.ruoyi.web.controller.dish.DishController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"categoryId\":22,\"createTime\":\"2024-06-13 22:59:43\",\"createUser\":1,\"description\":\"<p>999</p>\",\"id\":71,\"image\":\"/profile/upload/2024/06/13/屏幕截图(2)_20240613225925A001.png\",\"name\":\"io\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-13 22:59:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 22:59:52', 10);
INSERT INTO `sys_oper_log` VALUES (164, '菜品', 2, 'com.ruoyi.web.controller.dish.DishController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"categoryId\":22,\"createTime\":\"2024-06-13 22:59:43\",\"createUser\":1,\"description\":\"<p>999</p>\",\"id\":71,\"image\":\"/profile/upload/2024/06/13/屏幕截图(2)_20240613225925A001.png\",\"name\":\"io\",\"params\":{},\"price\":999,\"status\":0,\"updateTime\":\"2024-06-13 23:00:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 23:00:37', 6);
INSERT INTO `sys_oper_log` VALUES (165, '菜品', 1, 'com.ruoyi.web.controller.dish.DishController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/dish', '127.0.0.1', '内网IP', '{\"categoryId\":22,\"createTime\":\"2024-06-13 23:44:13\",\"createUser\":1,\"id\":72,\"image\":\"/profile/upload/2024/06/13/屏幕截图(5)_20240613234409A002.png\",\"name\":\"99\",\"params\":{},\"price\":99,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 23:44:13', 11);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/dish/index\",\"createTime\":\"2024-06-09 20:52:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"菜品管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"dish\",\"perms\":\"merchant:dish:index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-13 23:58:30', 18);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"套餐管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"setmeal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 00:03:29', 10);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-14 00:03:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"套餐管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"setmeal\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 00:03:41', 9);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"merchant/setmeal/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"套餐列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"setmeal\",\"perms\":\"merchant:setmeal:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 00:04:21', 9);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_setmeal\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 00:05:44', 125);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"setmeal\",\"className\":\"Setmeal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 00:05:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"商家id\",\"columnId\":24,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 00:05:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"菜品分类id\",\"columnId\":25,\"columnName\":\"category_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 00:05:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"套餐名称\",\"columnId\":26,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-14 00:05:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 00:12:13', 48);
INSERT INTO `sys_oper_log` VALUES (172, '套餐', 1, 'com.ruoyi.web.controller.setmeal.SetmealController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-14 10:46:30\",\"createUser\":1,\"description\":\"<p>88</p>\",\"id\":2,\"image\":\"/profile/upload/2024/06/14/屏幕截图(2)_20240614104628A001.png\",\"name\":\"威士忌\",\"params\":{},\"price\":88,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 10:46:30', 47);
INSERT INTO `sys_oper_log` VALUES (173, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createTime\":\"2024-06-14 10:46:31\",\"createUser\":1,\"description\":\"<p>88</p>\",\"id\":2,\"image\":\"/profile/upload/2024/06/14/屏幕截图(2)_20240614104628A001.png\",\"name\":\"威士忌\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-14 10:46:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 10:46:56', 25);
INSERT INTO `sys_oper_log` VALUES (174, '套餐', 1, 'com.ruoyi.web.controller.setmeal.SetmealController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-14 11:23:56\",\"createUser\":1,\"description\":\"<p>9</p>\",\"id\":3,\"image\":\"/profile/upload/2024/06/14/屏幕截图(3)_20240614112352A001.png\",\"name\":\"99\",\"params\":{},\"price\":99,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 11:23:56', 41);
INSERT INTO `sys_oper_log` VALUES (175, '套餐', 3, 'com.ruoyi.web.controller.setmeal.SetmealController.remove()', 'DELETE', 1, 'admin', '研发部门', '/merchant/setmeal/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 11:29:08', 26);
INSERT INTO `sys_oper_log` VALUES (176, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-14 11:23:57\",\"createUser\":1,\"description\":\"<p>9</p>\",\"id\":3,\"image\":\"/profile/upload/2024/06/14/屏幕截图(3)_20240614112352A001.png\",\"name\":\"99\",\"params\":{},\"price\":99,\"status\":1,\"updateTime\":\"2024-06-14 11:29:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 11:29:12', 24);
INSERT INTO `sys_oper_log` VALUES (177, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-14 11:23:57\",\"createUser\":1,\"description\":\"<p>9</p>\",\"id\":3,\"image\":\"/profile/upload/2024/06/14/屏幕截图(3)_20240614112352A001.png\",\"name\":\"99\",\"params\":{},\"price\":99,\"status\":0,\"updateTime\":\"2024-06-14 14:13:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:13:44', 5);
INSERT INTO `sys_oper_log` VALUES (178, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-14 11:23:57\",\"createUser\":1,\"description\":\"<p>9</p>\",\"id\":3,\"image\":\"/profile/upload/2024/06/14/屏幕截图(3)_20240614112352A001.png\",\"name\":\"99\",\"params\":{},\"price\":99,\"status\":1,\"updateTime\":\"2024-06-14 14:13:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:13:48', 5);
INSERT INTO `sys_oper_log` VALUES (179, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"深圳总公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"若依科技\",\"phone\":\"15888888888\",\"status\":\"1\"}', '{\"msg\":\"该部门包含未停用的子部门！\",\"code\":500}', 0, NULL, '2024-06-14 14:16:40', 10);
INSERT INTO `sys_oper_log` VALUES (180, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"深圳总公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"若依科技\",\"phone\":\"15888888888\",\"status\":\"1\"}', '{\"msg\":\"该部门包含未停用的子部门！\",\"code\":500}', 0, NULL, '2024-06-14 14:16:42', 6);
INSERT INTO `sys_oper_log` VALUES (181, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"15888888888\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:16:50', 21);
INSERT INTO `sys_oper_log` VALUES (182, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:17:34', 19);
INSERT INTO `sys_oper_log` VALUES (183, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:17:38', 19);
INSERT INTO `sys_oper_log` VALUES (184, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"15888888888\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:17:40', 18);
INSERT INTO `sys_oper_log` VALUES (185, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'ry', '测试部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:18:26', 21);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"SysCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-10 16:42:34\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属商家\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-10 16:42:34\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类型   1 菜品分类 2 套餐分类\",\"columnId\":3,\"columnName\":\"type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"sys_normal_disable\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-10 16:42:34\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:21:40', 53);
INSERT INTO `sys_oper_log` VALUES (187, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"套餐分类\",\"dictType\":\"category_list\",\"params\":{},\"remark\":\"type:1 菜品分类\\ntyep:2 套餐分类\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:28:46', 210);
INSERT INTO `sys_oper_log` VALUES (188, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:28:54', 19);
INSERT INTO `sys_oper_log` VALUES (189, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"菜品分类\",\"dictSort\":1,\"dictType\":\"category_list\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:30:35', 8);
INSERT INTO `sys_oper_log` VALUES (190, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"套餐分类\",\"dictSort\":2,\"dictType\":\"category_list\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:30:48', 7);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"SysCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-14 14:21:40\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属商家\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-14 14:21:40\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类型   1 菜品分类 2 套餐分类\",\"columnId\":3,\"columnName\":\"type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"category_list\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-14 14:21:40\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:33:35', 30);
INSERT INTO `sys_oper_log` VALUES (192, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:34:02', 10);
INSERT INTO `sys_oper_log` VALUES (193, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:34:03', 9);
INSERT INTO `sys_oper_log` VALUES (194, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:28:46\",\"dictId\":11,\"dictName\":\"套餐分类\",\"dictType\":\"sys_category_list\",\"params\":{},\"remark\":\"type:1 菜品分类\\ntyep:2 套餐分类\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:37:32', 14);
INSERT INTO `sys_oper_log` VALUES (195, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:37:33', 11);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"Category\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-14 14:33:35\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"所属商家\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-14 14:33:35\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类型   1 菜品分类 2 套餐分类\",\"columnId\":3,\"columnName\":\"type\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"category_list\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-14 14:33:35\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 23:24:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 14:46:46', 62);
INSERT INTO `sys_oper_log` VALUES (197, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-14 15:04:25\",\"id\":37,\"name\":\"88\",\"params\":{},\"sort\":88,\"status\":0,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:04:25', 29);
INSERT INTO `sys_oper_log` VALUES (198, '菜品及套餐分类', 1, 'com.ruoyi.web.controller.category.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-14 15:05:50\",\"id\":38,\"name\":\"99\",\"params\":{},\"sort\":99,\"status\":0,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:05:50', 21);
INSERT INTO `sys_oper_log` VALUES (199, '菜品及套餐分类', 3, 'com.ruoyi.web.controller.category.CategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/merchant/category/38', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:06:18', 9);
INSERT INTO `sys_oper_log` VALUES (200, '菜品及套餐分类', 3, 'com.ruoyi.web.controller.category.CategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/merchant/category/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:06:20', 8);
INSERT INTO `sys_oper_log` VALUES (201, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-06-09 22:14:10\",\"createUser\":1,\"id\":15,\"name\":\"商务套餐\",\"params\":{},\"sort\":13,\"status\":1,\"type\":2,\"updateTime\":\"2024-06-14 15:14:50\",\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:14:50', 23);
INSERT INTO `sys_oper_log` VALUES (202, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-06-09 22:09:32\",\"createUser\":1,\"id\":12,\"name\":\"传统主食\",\"params\":{},\"sort\":9,\"status\":0,\"type\":1,\"updateTime\":\"2024-06-14 15:15:48\",\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:15:48', 5);
INSERT INTO `sys_oper_log` VALUES (203, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"payment_method\",\"dictType\":\"ok\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:19:35', 11);
INSERT INTO `sys_oper_log` VALUES (204, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-14 15:19:35\",\"dictId\":12,\"dictName\":\"订单支付方式\",\"dictType\":\"payment_method\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:19:52', 29);
INSERT INTO `sys_oper_log` VALUES (205, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"微信\",\"dictSort\":1,\"dictType\":\"payment_method\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:20:06', 11);
INSERT INTO `sys_oper_log` VALUES (206, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"支付宝\",\"dictSort\":2,\"dictType\":\"payment_method\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:20:17', 10);
INSERT INTO `sys_oper_log` VALUES (207, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单支付状态\",\"dictType\":\"order_payment_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:20:38', 9);
INSERT INTO `sys_oper_log` VALUES (208, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未支付\",\"dictSort\":1,\"dictType\":\"order_payment_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:20:56', 9);
INSERT INTO `sys_oper_log` VALUES (209, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已支付\",\"dictSort\":2,\"dictType\":\"order_payment_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:21:08', 11);
INSERT INTO `sys_oper_log` VALUES (210, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"退款\",\"dictSort\":3,\"dictType\":\"order_payment_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:21:22', 11);
INSERT INTO `sys_oper_log` VALUES (211, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"配送状态\",\"dictType\":\"sent_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:21:46', 8);
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"立即送出\",\"dictSort\":1,\"dictType\":\"sent_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:22:01', 9);
INSERT INTO `sys_oper_log` VALUES (213, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-14 15:22:01\",\"default\":false,\"dictCode\":37,\"dictLabel\":\"立即送出\",\"dictSort\":1,\"dictType\":\"sent_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:22:06', 10);
INSERT INTO `sys_oper_log` VALUES (214, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"选择具体时间\",\"dictSort\":0,\"dictType\":\"sent_status\",\"dictValue\":\"0\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:22:19', 10);
INSERT INTO `sys_oper_log` VALUES (215, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单状态\",\"dictType\":\"order_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:23:09', 8);
INSERT INTO `sys_oper_log` VALUES (216, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待付款\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"1\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:23:44', 10);
INSERT INTO `sys_oper_log` VALUES (217, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待接单\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"2\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:24:11', 9);
INSERT INTO `sys_oper_log` VALUES (218, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已接单\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:24:26', 9);
INSERT INTO `sys_oper_log` VALUES (219, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"派送中\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"4\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:24:43', 8);
INSERT INTO `sys_oper_log` VALUES (220, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"5\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:24:52', 12);
INSERT INTO `sys_oper_log` VALUES (221, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已取消\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"6\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:25:06', 9);
INSERT INTO `sys_oper_log` VALUES (222, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"退款\",\"dictSort\":0,\"dictType\":\"order_status\",\"dictValue\":\"7\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:25:13', 8);
INSERT INTO `sys_oper_log` VALUES (223, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:30:35\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"菜品分类\",\"dictSort\":1,\"dictType\":\"sys_category_list\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:27:06', 8);
INSERT INTO `sys_oper_log` VALUES (224, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-14 14:30:48\",\"default\":false,\"dictCode\":31,\"dictLabel\":\"套餐分类\",\"dictSort\":2,\"dictType\":\"sys_category_list\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-14 15:27:10', 9);
INSERT INTO `sys_oper_log` VALUES (225, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"description\":\"<p>999</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(3)_20240616163725A001.png\",\"name\":\"99\",\"price\":99,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:37:29', 366);
INSERT INTO `sys_oper_log` VALUES (226, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":15,\"description\":\"<p>1</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(1)_20240616164809A002.png\",\"name\":\"1\",\"price\":1,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:48:12', 7);
INSERT INTO `sys_oper_log` VALUES (227, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":15,\"description\":\"<p>1</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(1)_20240616164809A002.png\",\"name\":\"1\",\"price\":1,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:48:18', 3);
INSERT INTO `sys_oper_log` VALUES (228, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":15,\"description\":\"<p>1</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(1)_20240616164809A002.png\",\"name\":\"1\",\"price\":1,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:50:24', 4);
INSERT INTO `sys_oper_log` VALUES (229, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(2)_20240616165239A003.png\",\"name\":\"7\",\"price\":7,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,      category_id, status )  VALUES  ( ?, ?,  ?, ?,      ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:52:43', 5);
INSERT INTO `sys_oper_log` VALUES (230, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"description\":\"<p>88</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(5)_20240616165527A004.png\",\"name\":\"8\",\"price\":8,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:55:33', 14);
INSERT INTO `sys_oper_log` VALUES (231, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"description\":\"<p>88</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(5)_20240616165527A004.png\",\"name\":\"8\",\"price\":8,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:56:19', 7);
INSERT INTO `sys_oper_log` VALUES (232, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"description\":\"<p>8</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(2)_20240616165633A005.png\",\"name\":\"8\",\"price\":88,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:56:37', 5);
INSERT INTO `sys_oper_log` VALUES (233, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"description\":\"<p>8</p>\",\"flavors\":[],\"image\":\"/profile/upload/2024/06/16/屏幕截图(2)_20240616165633A005.png\",\"name\":\"8\",\"price\":88,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id, image,  price, name,  description,    category_id, status )  VALUES  ( ?, ?,  ?, ?,  ?,    ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:56:39', 5);
INSERT INTO `sys_oper_log` VALUES (234, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"flavors\":[]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\r\n### The error may exist in com/ruoyi/dish/mapper/DishDao.java (best guess)\r\n### The error may involve com.ruoyi.dish.mapper.DishDao.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dish_entity  ( id )  VALUES  ( ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.dish_entity\' doesn\'t exist', '2024-06-16 16:58:01', 5);
INSERT INTO `sys_oper_log` VALUES (235, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"flavors\":\"[\\\"标签一\\\",\\\"标签二\\\",\\\"标签三\\\"]\"}', '{\"code\":1}', 0, NULL, '2024-06-16 17:08:39', 22);
INSERT INTO `sys_oper_log` VALUES (236, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":\"[{\\\"id\\\":1,\\\"label\\\":\\\"一级 1\\\",\\\"children\\\":[{\\\"id\\\":4,\\\"label\\\":\\\"二级 1-1\\\",\\\"children\\\":[{\\\"id\\\":9,\\\"label\\\":\\\"三级 1-1-1\\\"},{\\\"id\\\":10,\\\"label\\\":\\\"三级 1-1-2\\\"}]}]}]\",\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 18:18:19', 15);
INSERT INTO `sys_oper_log` VALUES (237, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":\"[{\\\"id\\\":1,\\\"label\\\":\\\"一级 1\\\",\\\"children\\\":[{\\\"id\\\":1002,\\\"label\\\":\\\"testtest\\\",\\\"children\\\":[]},{\\\"id\\\":1003,\\\"label\\\":\\\"testtest\\\",\\\"children\\\":[]}]}]\",\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 18:19:33', 1);
INSERT INTO `sys_oper_log` VALUES (238, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":\"[{\\\"id\\\":1,\\\"label\\\":\\\"一级 1\\\",\\\"children\\\":[{\\\"id\\\":1002,\\\"label\\\":\\\"testtest\\\",\\\"children\\\":[]},{\\\"id\\\":1003,\\\"label\\\":\\\"testtest\\\",\\\"children\\\":[]}]}]\",\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 18:23:00', 24);
INSERT INTO `sys_oper_log` VALUES (239, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":\"[{\\\"id\\\":1,\\\"label\\\":\\\"辣度\\\",\\\"children\\\":[{\\\"id\\\":4,\\\"label\\\":\\\"不辣\\\"}]},{\\\"id\\\":2,\\\"label\\\":\\\"温度\\\",\\\"children\\\":[]},{\\\"id\\\":3,\\\"label\\\":\\\"忌口\\\",\\\"children\\\":[]},{\\\"id\\\":5,\\\"label\\\":\\\"甜味\\\",\\\"children\\\":[]}]\",\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 20:35:05', 1);
INSERT INTO `sys_oper_log` VALUES (240, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":\"[{\\\"id\\\":1,\\\"label\\\":\\\"辣度\\\",\\\"children\\\":[{\\\"id\\\":4,\\\"label\\\":\\\"不辣\\\"}]},{\\\"id\\\":2,\\\"label\\\":\\\"温度\\\",\\\"children\\\":[]},{\\\"id\\\":3,\\\"label\\\":\\\"忌口\\\",\\\"children\\\":[]},{\\\"id\\\":5,\\\"label\\\":\\\"甜味\\\",\\\"children\\\":[{\\\"id\\\":1000,\\\"label\\\":\\\"999\\\"}]}]\",\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 20:35:18', 2);
INSERT INTO `sys_oper_log` VALUES (241, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":\"[{\\\"id\\\":1,\\\"label\\\":\\\"辣度\\\",\\\"children\\\":[{\\\"id\\\":4,\\\"label\\\":\\\"不辣\\\"}]},{\\\"id\\\":2,\\\"label\\\":\\\"温度\\\",\\\"children\\\":[]},{\\\"id\\\":3,\\\"label\\\":\\\"忌口\\\",\\\"children\\\":[]},{\\\"id\\\":5,\\\"label\\\":\\\"甜味\\\",\\\"children\\\":[{\\\"id\\\":1000,\\\"label\\\":\\\"999\\\"}]}]\",\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 20:36:16', 2);
INSERT INTO `sys_oper_log` VALUES (242, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"userId\":1}', NULL, 1, 'argument \"content\" is null', '2024-06-16 20:38:00', 3);
INSERT INTO `sys_oper_log` VALUES (243, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 20:53:45', 10);
INSERT INTO `sys_oper_log` VALUES (244, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\",\"温度\":\"[\\\"不热\\\"]\"},\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 20:54:08', 3);
INSERT INTO `sys_oper_log` VALUES (245, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\",\"温度\":\"[\\\"不热\\\",\\\"bure\\\"]\"},\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 20:54:23', 1);
INSERT INTO `sys_oper_log` VALUES (246, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"image\":\"/profile/upload/2024/06/16/屏幕截图(5)_20240616210010A001.png\",\"name\":\"你好\",\"price\":99,\"userId\":1}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.dish.domin.dto.DishDTO\'', '2024-06-16 21:00:12', 16);
INSERT INTO `sys_oper_log` VALUES (247, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"image\":\"/profile/upload/2024/06/16/屏幕截图(5)_20240616210010A001.png\",\"name\":\"你好\",\"price\":99,\"userId\":1}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.dish.domin.dto.DishDTO\'', '2024-06-16 21:00:14', 2);
INSERT INTO `sys_oper_log` VALUES (248, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"image\":\"/profile/upload/2024/06/16/屏幕截图(5)_20240616210010A001.png\",\"name\":\"你好\",\"price\":99,\"userId\":1}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.dish.domin.dto.DishDTO\'', '2024-06-16 21:00:35', 2);
INSERT INTO `sys_oper_log` VALUES (249, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"image\":\"/profile/upload/2024/06/16/屏幕截图(5)_20240616210010A001.png\",\"name\":\"你好\",\"price\":99,\"userId\":1}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createTime\' in \'class com.ruoyi.dish.domin.dto.DishDTO\'', '2024-06-16 21:01:17', 1);
INSERT INTO `sys_oper_log` VALUES (250, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":73,\"image\":\"/profile/upload/2024/06/16/屏幕截图(5)_20240616210010A001.png\",\"name\":\"你好\",\"price\":99,\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 21:02:02', 42);
INSERT INTO `sys_oper_log` VALUES (251, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":74,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 21:03:33', 31);
INSERT INTO `sys_oper_log` VALUES (252, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'8\' for key \'idx_dish_name\'\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.insertDish-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish          ( user_id,             name,             category_id,             price,                          description,             status,             create_time,create_user )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             now(),? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'8\' for key \'idx_dish_name\'\n; Duplicate entry \'8\' for key \'idx_dish_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'8\' for key \'idx_dish_name\'', '2024-06-16 21:04:03', 108);
INSERT INTO `sys_oper_log` VALUES (253, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":76,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 21:04:26', 10);
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_dish_flavor\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 21:10:31', 72);
INSERT INTO `sys_oper_log` VALUES (255, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":77,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.dish.mapper.DishTMapper.insertDishFlavors', '2024-06-16 21:15:20', 45);
INSERT INTO `sys_oper_log` VALUES (256, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":78,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.insertDishFlavors-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish_flavor\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-16 21:16:12', 120);
INSERT INTO `sys_oper_log` VALUES (257, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":79,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.insertDishFlavors-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish_flavor\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-16 21:16:31', 8);
INSERT INTO `sys_oper_log` VALUES (258, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":80,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.insertDishFlavors-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish_flavor\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-16 21:16:51', 10);
INSERT INTO `sys_oper_log` VALUES (259, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":81,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 21:22:03', 52);
INSERT INTO `sys_oper_log` VALUES (260, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":82,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 21:22:28', 13);
INSERT INTO `sys_oper_log` VALUES (261, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":83,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 21:22:41', 14);
INSERT INTO `sys_oper_log` VALUES (262, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\",\\\"狠辣\\\"]\",\"温度\":\"[\\\"祛病\\\"]\"},\"id\":84,\"name\":\"8\",\"price\":88,\"status\":0,\"userId\":1}', '{\"code\":1}', 0, NULL, '2024-06-16 21:23:11', 27);
INSERT INTO `sys_oper_log` VALUES (263, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>ok</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":85,\"image\":\"/profile/upload/2024/06/16/屏幕截图(4)_20240616212519A001.png\",\"name\":\"好东西\",\"price\":99,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 21:25:22', 62);
INSERT INTO `sys_oper_log` VALUES (264, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.insertDish-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish          ( user_id,                          category_id,                                                                 create_time,create_user )           values ( ?,                          ?,                                                                 now(),? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '2024-06-16 21:29:59', 58);
INSERT INTO `sys_oper_log` VALUES (265, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.insertDish-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish          ( user_id,                          category_id,                                                                 create_time,create_user )           values ( ?,                          ?,                                                                 now(),? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '2024-06-16 21:30:19', 5);
INSERT INTO `sys_oper_log` VALUES (266, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"description\":\"<p>88</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":86,\"image\":\"/profile/upload/2024/06/16/屏幕截图(4)_20240616213047A002.png\",\"name\":\"99\",\"price\":99,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 21:30:50', 15);
INSERT INTO `sys_oper_log` VALUES (267, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"<p>哈东西</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":87,\"image\":\"/profile/upload/2024/06/16/屏幕截图(4)_20240616213201A001.png\",\"name\":\"好东西\",\"price\":99,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 21:32:06', 40);
INSERT INTO `sys_oper_log` VALUES (268, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/65', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.sys_dish_flavors\' doesn\'t exist\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.deleteDishFlavorsByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_dish_flavors where dish_id in          (               ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.sys_dish_flavors\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.sys_dish_flavors\' doesn\'t exist', '2024-06-16 21:49:41', 71);
INSERT INTO `sys_oper_log` VALUES (269, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/87', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ry.sys_dish_flavors\' doesn\'t exist\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.deleteDishFlavorsByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_dish_flavors where dish_id in          (               ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ry.sys_dish_flavors\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ry.sys_dish_flavors\' doesn\'t exist', '2024-06-16 21:51:26', 60);
INSERT INTO `sys_oper_log` VALUES (270, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createUser\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":88,\"name\":\"88\",\"price\":8,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 21:55:48', 35);
INSERT INTO `sys_oper_log` VALUES (271, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/88', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 21:56:00', 17);
INSERT INTO `sys_oper_log` VALUES (272, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":89,\"name\":\"9\",\"price\":99,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 23:35:51', 33);
INSERT INTO `sys_oper_log` VALUES (273, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":15,\"createUser\":1,\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":90,\"name\":\"9999\",\"price\":99,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-16 23:36:00', 19);
INSERT INTO `sys_oper_log` VALUES (274, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"createUser\":1,\"flavors\":{},\"params\":{},\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in file [E:\\uml_work\\schooltakeaway\\ruoyi-system\\target\\classes\\mapper\\dish\\DishTMapper.xml]\r\n### The error may involve com.ruoyi.dish.mapper.DishTMapper.insertDish-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dish          ( user_id,                                                                                           create_time,create_user )           values ( ?,                                                                                           now(),? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '2024-06-17 00:33:28', 113);
INSERT INTO `sys_oper_log` VALUES (275, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"<p>4</p>\",\"flavors\":{\"44\":\"\\\"[\\\\\\\"4444\\\\\\\"]\\\"\"},\"id\":91,\"name\":\"44\",\"params\":{},\"price\":44,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:34:00', 18);
INSERT INTO `sys_oper_log` VALUES (276, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createUser\":1,\"description\":\"<p>99</p>\",\"flavors\":{\"忌口\":\"\\\"[\\\\\\\"99\\\\\\\"]\\\"\",\"甜味\":\"\\\"[\\\\\\\"9\\\\\\\"]\\\"\"},\"id\":92,\"image\":\"/profile/upload/2024/06/17/屏幕截图(6)_20240617003458A001.png\",\"name\":\"99\",\"params\":{},\"price\":9,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:34:59', 18);
INSERT INTO `sys_oper_log` VALUES (277, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":16,\"createUser\":1,\"description\":\"<p>0</p>\",\"flavors\":{\"辣度\":\"[\\\"0\\\"]\",\"忌口\":\"[\\\"00\\\"]\"},\"id\":93,\"name\":\"0\",\"params\":{},\"price\":0,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:36:09', 23);
INSERT INTO `sys_oper_log` VALUES (278, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":17,\"createUser\":1,\"description\":\"<p><br></p>\",\"flavors\":{\"辣度\":\"[\\\"9\\\",\\\"9\\\"]\"},\"id\":94,\"name\":\"0\",\"params\":{},\"price\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:36:45', 11);
INSERT INTO `sys_oper_log` VALUES (279, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/92', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:37:02', 13);
INSERT INTO `sys_oper_log` VALUES (280, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/93', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:37:04', 10);
INSERT INTO `sys_oper_log` VALUES (281, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/89', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:37:07', 10);
INSERT INTO `sys_oper_log` VALUES (282, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/90', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:37:09', 10);
INSERT INTO `sys_oper_log` VALUES (283, '菜品', 3, 'com.ruoyi.web.controller.dish.DishController.remove()', 'DELETE', 1, 'admin', '研发部门', '/admin/dish/91', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:37:11', 10);
INSERT INTO `sys_oper_log` VALUES (284, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createUser\":1,\"flavors\":{\"辣度\":\"[\\\"00\\\"]\"},\"id\":95,\"name\":\"9\",\"params\":{},\"price\":9,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:45:25', 11);
INSERT INTO `sys_oper_log` VALUES (285, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":18,\"createUser\":1,\"flavors\":{\"辣度\":\"[\\\"333\\\"]\"},\"id\":96,\"name\":\"3\",\"params\":{},\"price\":3,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:51:07', 13);
INSERT INTO `sys_oper_log` VALUES (286, '修改菜品及口味', 0, 'com.ruoyi.web.controller.dish.DishController.updateDishWithFlavor()', 'PUT', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":18,\"createUser\":1,\"flavors\":{\"辣度\":\"[\\\"00\\\"]\"},\"id\":96,\"name\":\"3\",\"params\":{},\"price\":3,\"status\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 00:59:52', 25);
INSERT INTO `sys_oper_log` VALUES (287, '菜品及口味', 1, 'com.ruoyi.web.controller.dish.DishController.save()', 'POST', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createUser\":1,\"description\":\"<p>99</p>\",\"flavors\":{\"甜味\":\"[\\\"888\\\"]\"},\"id\":97,\"image\":\"/profile/upload/2024/06/17/屏幕截图(1)_20240617013103A001.png\",\"name\":\"88\",\"params\":{},\"price\":88,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 01:31:06', 45);
INSERT INTO `sys_oper_log` VALUES (288, '修改菜品及口味', 0, 'com.ruoyi.web.controller.dish.DishController.updateDishWithFlavor()', 'PUT', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":20,\"createUser\":1,\"description\":\"<p>原料：酸菜，江团，鮰鱼</p>\",\"flavors\":{\"忌口\":\"[\\\"不要葱\\\",\\\"不要蒜\\\",\\\"不要香菜\\\",\\\"不要辣\\\"]\",\"辣度\":\"[\\\"不辣\\\",\\\"微辣\\\",\\\"中辣\\\",\\\"重辣\\\"]\"},\"id\":52,\"image\":\"https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png\",\"name\":\"经典酸菜鮰鱼\",\"params\":{},\"price\":66,\"status\":1,\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 10:42:56', 61);
INSERT INTO `sys_oper_log` VALUES (289, '修改菜品及口味', 0, 'com.ruoyi.web.controller.dish.DishController.updateDishWithFlavor()', 'PUT', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createUser\":1,\"description\":\"<p>精选五常大米</p>\",\"flavors\":{\"辣度\":\"[\\\"不辣\\\"]\"},\"id\":49,\"image\":\"https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png\",\"name\":\"米饭\",\"params\":{},\"price\":2,\"status\":1,\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 10:43:19', 12);
INSERT INTO `sys_oper_log` VALUES (290, '修改菜品及口味', 0, 'com.ruoyi.web.controller.dish.DishController.updateDishWithFlavor()', 'PUT', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"\",\"flavors\":{\"凉快\":\"[\\\"很凉快\\\"]\"},\"id\":46,\"image\":\"https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png\",\"name\":\"王老吉\",\"params\":{},\"price\":6,\"status\":1,\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 10:45:15', 13);
INSERT INTO `sys_oper_log` VALUES (291, '修改菜品及口味', 0, 'com.ruoyi.web.controller.dish.DishController.updateDishWithFlavor()', 'PUT', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"\",\"flavors\":{\"凉快\":\"[\\\"很凉快\\\"]\"},\"id\":46,\"image\":\"https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png\",\"name\":\"王老吉\",\"params\":{},\"price\":6,\"status\":0,\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 10:45:39', 15);
INSERT INTO `sys_oper_log` VALUES (292, '套餐', 1, 'com.ruoyi.web.controller.setmeal.SetmealController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-17 11:08:20\",\"createUser\":1,\"description\":\"<p>777</p>\",\"id\":4,\"image\":\"/profile/upload/2024/06/17/屏幕截图(6)_20240617110818A001.png\",\"name\":\"777\",\"params\":{},\"price\":77,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 11:08:20', 49);
INSERT INTO `sys_oper_log` VALUES (293, '套餐', 1, 'com.ruoyi.web.controller.setmeal.SetmealController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":17,\"createTime\":\"2024-06-17 11:20:12\",\"createUser\":1,\"description\":\"<p><br></p>\",\"id\":5,\"image\":\"/profile/upload/2024/06/17/屏幕截图(4)_20240617112010A002.png\",\"name\":\"8\",\"params\":{},\"price\":88,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 11:20:12', 13);
INSERT INTO `sys_oper_log` VALUES (294, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_setmeal_dish\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 11:23:16', 72);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dish\",\"className\":\"SetmealDish\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":40,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-17 11:23:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SetmealId\",\"columnComment\":\"套餐id\",\"columnId\":41,\"columnName\":\"setmeal_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-17 11:23:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"setmealId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DishId\",\"columnComment\":\"菜品id\",\"columnId\":42,\"columnName\":\"dish_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-17 11:23:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"dishId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"菜品名称 （冗余字段）\",\"columnId\":43,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-17 11:23:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"nam', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 11:23:43', 41);
INSERT INTO `sys_oper_log` VALUES (296, '套餐', 1, 'com.ruoyi.web.controller.setmeal.SetmealController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"dishItems\":[46,97],\"id\":6,\"image\":\"/profile/upload/2024/06/17/屏幕截图(3)_20240617113936A001.png\",\"name\":\"09\",\"params\":{},\"price\":88,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 11:39:38', 39);
INSERT INTO `sys_oper_log` VALUES (297, '套餐', 1, 'com.ruoyi.web.controller.setmeal.SetmealController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"<p>8</p>\",\"dishItems\":[46,97],\"id\":7,\"image\":\"/profile/upload/2024/06/17/屏幕截图(4)_20240617130900A001.png\",\"name\":\"88\",\"params\":{},\"price\":88,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 13:09:01', 57);
INSERT INTO `sys_oper_log` VALUES (298, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"<p>8</p>\",\"id\":7,\"image\":\"/profile/upload/2024/06/17/屏幕截图(4)_20240617130900A001.png\",\"name\":\"88\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-17 13:17:44\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 13:17:44', 18);
INSERT INTO `sys_oper_log` VALUES (299, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"<p>8</p>\",\"id\":7,\"image\":\"/profile/upload/2024/06/17/屏幕截图(4)_20240617130900A001.png\",\"name\":\"88\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-17 13:20:08\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 13:20:08', 6);
INSERT INTO `sys_oper_log` VALUES (300, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createTime\":\"2024-06-14 10:46:31\",\"createUser\":1,\"description\":\"<p>88</p>\",\"dishItems\":[46],\"id\":2,\"image\":\"/profile/upload/2024/06/14/屏幕截图(2)_20240614104628A001.png\",\"name\":\"威士忌\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-14 10:46:56\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:22:29', 48);
INSERT INTO `sys_oper_log` VALUES (301, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createTime\":\"2024-06-14 10:46:31\",\"createUser\":1,\"description\":\"<p>88</p>\",\"dishItems\":[97],\"id\":2,\"image\":\"/profile/upload/2024/06/14/屏幕截图(2)_20240614104628A001.png\",\"name\":\"威士忌\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-14 10:46:56\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:22:35', 17);
INSERT INTO `sys_oper_log` VALUES (302, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createTime\":\"2024-06-14 10:46:31\",\"createUser\":1,\"description\":\"<p>88</p>\",\"dishItems\":[97,46],\"id\":2,\"image\":\"/profile/upload/2024/06/14/屏幕截图(2)_20240614104628A001.png\",\"name\":\"威士忌\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-14 10:46:56\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:22:40', 22);
INSERT INTO `sys_oper_log` VALUES (303, '套餐', 1, 'com.ruoyi.web.controller.setmeal.SetmealController.add()', 'POST', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"<p><br></p>\",\"dishItems\":[46,97],\"id\":8,\"image\":\"/profile/upload/2024/06/17/屏幕截图(6)_20240617142452A001.png\",\"name\":\"33\",\"params\":{},\"price\":33,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:24:53', 39);
INSERT INTO `sys_oper_log` VALUES (304, '修改菜品及口味', 0, 'com.ruoyi.web.controller.dish.DishController.updateDishWithFlavor()', 'PUT', 1, 'admin', '研发部门', '/admin/dish', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createUser\":1,\"description\":\"<p>还是小时候的味道</p>\",\"flavors\":{},\"id\":47,\"image\":\"https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png\",\"name\":\"北冰洋\",\"params\":{},\"price\":4,\"status\":0,\"updateUser\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:25:07', 14);
INSERT INTO `sys_oper_log` VALUES (305, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"createTime\":\"2024-06-14 10:46:31\",\"createUser\":1,\"description\":\"<p>88</p>\",\"dishItems\":[97,46,47],\"id\":2,\"image\":\"/profile/upload/2024/06/14/屏幕截图(2)_20240614104628A001.png\",\"name\":\"威士忌\",\"params\":{},\"price\":88,\"status\":0,\"updateTime\":\"2024-06-14 10:46:56\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:25:21', 23);
INSERT INTO `sys_oper_log` VALUES (306, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-17 14:24:53\",\"createUser\":1,\"description\":\"<p><br></p>\",\"dishItems\":[46,97],\"id\":8,\"image\":\"/profile/upload/2024/06/17/屏幕截图(6)_20240617142452A001.png\",\"name\":\"33\",\"params\":{},\"price\":33,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:26:05', 21);
INSERT INTO `sys_oper_log` VALUES (307, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-17 14:24:53\",\"createUser\":1,\"description\":\"<p><br></p>\",\"dishItems\":[46,97],\"id\":8,\"image\":\"/profile/upload/2024/06/17/屏幕截图(6)_20240617142452A001.png\",\"name\":\"33\",\"params\":{},\"price\":33,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:27:06', 48);
INSERT INTO `sys_oper_log` VALUES (308, '套餐', 2, 'com.ruoyi.web.controller.setmeal.SetmealController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/setmeal', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"createTime\":\"2024-06-17 14:24:53\",\"createUser\":1,\"description\":\"<p><br></p>\",\"dishItems\":[46,97],\"id\":8,\"image\":\"/profile/upload/2024/06/17/屏幕截图(6)_20240617142452A001.png\",\"name\":\"33\",\"params\":{},\"price\":33,\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:27:58', 46);
INSERT INTO `sys_oper_log` VALUES (309, '菜品及套餐分类', 2, 'com.ruoyi.web.controller.category.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/merchant/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-06-13 21:56:01\",\"createUser\":1,\"id\":36,\"name\":\"88\",\"params\":{},\"sort\":88,\"status\":0,\"type\":1,\"updateTime\":\"2024-06-17 14:31:21\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-17 14:31:21', 14);

-- ----------------------------
-- Table structure for sys_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_detail`;
CREATE TABLE `sys_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for sys_orders
-- ----------------------------
DROP TABLE IF EXISTS `sys_orders`;
CREATE TABLE `sys_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int(11) NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int(11) NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_orders
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-31 10:15:16', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-31 10:15:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-05-31 10:15:16', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_setmeal
-- ----------------------------
DROP TABLE IF EXISTS `sys_setmeal`;
CREATE TABLE `sys_setmeal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '商家id',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(11) NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_setmeal
-- ----------------------------
INSERT INTO `sys_setmeal` VALUES (2, 1, 12, '威士忌', 88.00, 0, '<p>88</p>', '/profile/upload/2024/06/14/屏幕截图(2)_20240614104628A001.png', '2024-06-14 10:46:31', '2024-06-14 10:46:56', 1, NULL);
INSERT INTO `sys_setmeal` VALUES (3, 1, 11, '99', 99.00, 1, '<p>9</p>', '/profile/upload/2024/06/14/屏幕截图(3)_20240614112352A001.png', '2024-06-14 11:23:57', '2024-06-14 14:13:49', 1, NULL);
INSERT INTO `sys_setmeal` VALUES (4, NULL, 11, '777', 77.00, 0, '<p>777</p>', '/profile/upload/2024/06/17/屏幕截图(6)_20240617110818A001.png', '2024-06-17 11:08:20', NULL, 1, NULL);
INSERT INTO `sys_setmeal` VALUES (5, NULL, 17, '8', 88.00, 0, '<p><br></p>', '/profile/upload/2024/06/17/屏幕截图(4)_20240617112010A002.png', '2024-06-17 11:20:12', NULL, 1, NULL);
INSERT INTO `sys_setmeal` VALUES (6, 1, 11, '09', 88.00, 0, NULL, '/profile/upload/2024/06/17/屏幕截图(3)_20240617113936A001.png', NULL, NULL, 1, NULL);
INSERT INTO `sys_setmeal` VALUES (7, 1, 11, '88', 88.00, 0, '<p>8</p>', '/profile/upload/2024/06/17/屏幕截图(4)_20240617130900A001.png', NULL, '2024-06-17 13:20:08', 1, NULL);
INSERT INTO `sys_setmeal` VALUES (8, 1, 11, '33', 33.00, 0, '<p><br></p>', '/profile/upload/2024/06/17/屏幕截图(6)_20240617142452A001.png', '2024-06-17 14:24:53', '2024-06-17 14:27:58', 1, 1);

-- ----------------------------
-- Table structure for sys_setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `sys_setmeal_dish`;
CREATE TABLE `sys_setmeal_dish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int(11) NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_setmeal_dish
-- ----------------------------
INSERT INTO `sys_setmeal_dish` VALUES (1, 7, 46, NULL, 6.00, 1);
INSERT INTO `sys_setmeal_dish` VALUES (2, 7, 97, NULL, 88.00, 1);
INSERT INTO `sys_setmeal_dish` VALUES (9, 2, 97, NULL, 88.00, 1);
INSERT INTO `sys_setmeal_dish` VALUES (10, 2, 46, NULL, 88.00, 1);
INSERT INTO `sys_setmeal_dish` VALUES (11, 2, 47, NULL, 88.00, 1);
INSERT INTO `sys_setmeal_dish` VALUES (16, 8, 46, NULL, 33.00, 1);
INSERT INTO `sys_setmeal_dish` VALUES (17, 8, 97, NULL, 33.00, 1);

-- ----------------------------
-- Table structure for sys_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `sys_shopping_cart`;
CREATE TABLE `sys_shopping_cart`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-17 15:32:13', 'admin', '2024-05-31 10:15:16', '', '2024-06-17 15:32:12', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-14 14:17:56', 'admin', '2024-05-31 10:15:16', '', '2024-06-14 14:17:55', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'oVUp366N3mSQy0HUzRF0e8CSIHlU', NULL, NULL, NULL, NULL, NULL, '2024-06-17 15:11:48');

SET FOREIGN_KEY_CHECKS = 1;
