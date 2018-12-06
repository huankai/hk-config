/*
 Navicat Premium Data Transfer

 Source Server         : 47.107.245.220
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 47.107.245.220:3807
 Source Schema         : hk_emi

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 06/12/2018 16:02:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_base_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_code`;
CREATE TABLE `sys_base_code`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `base_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编号',
  `code_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人id',
  `created_date` datetime(0) NOT NULL COMMENT '创建时间',
  `last_modified_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后更新人id',
  `last_modified_date` datetime(0) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `base_code`(`base_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_base_code
-- ----------------------------
INSERT INTO `sys_base_code` VALUES ('4028c081655a3a5a01655a3acd160000', 'CSLB', '城市类型', '城市类型', '4028c08162bda8ce0162bda8df6a0000', '2018-08-21 10:05:28', '4028c08162bda8ce0162bda8df6a0000', '2018-08-21 10:06:31');
INSERT INTO `sys_base_code` VALUES ('4028c081655a3a5a01655a3acd160001', 'SFYX', '是否有效', '是否有效', '4028c08162bda8ce0162bda8df6a0000', '2018-08-31 14:57:34', '4028c08162bda8ce0162bda8df6a0000', '2018-08-31 14:57:37');
INSERT INTO `sys_base_code` VALUES ('4028c081658f05b301658f0740970000', 'RDXB', '人的性别', '人的性别', '4028c08162bda8ce0162bda8df6a0000', '2018-08-31 16:09:02', '4028c08162bda8ce0162bda8df6a0000', '0018-08-31 16:09:02');
INSERT INTO `sys_base_code` VALUES ('4028c081658f05b301658f0bf9b70005', 'YHZT', '用户状态', '用户状态', '4028c08162bda8ce0162bda8df6a0000', '2018-08-31 16:14:11', '4028c08162bda8ce0162bda8df6a0000', '2018-08-31 16:14:11');

-- ----------------------------
-- Table structure for sys_child_codes
-- ----------------------------
DROP TABLE IF EXISTS `sys_child_codes`;
CREATE TABLE `sys_child_codes`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `base_code_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `child_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code_value` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL COMMENT '状态(0,不可用，1：可用)',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `last_modified_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_modified_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `base_code_id`(`base_code_id`, `child_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_city`;
CREATE TABLE `sys_city`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '上级id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city_type` tinyint(1) NOT NULL COMMENT '城市类型，1:国家,2:省或直辖市,3:市,4:区或县,5:镇,6:村',
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '全名',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '简称',
  `post_office` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime(0) NOT NULL,
  `last_modified_by` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_modified_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_city
-- ----------------------------
INSERT INTO `sys_city` VALUES ('3a55787d4b69425d8c5600eef35764f4', '0', '24895', 1, '小明', '小明', NULL, NULL, '0', '2018-11-17 13:43:16', '0', '2018-11-17 13:43:16');
INSERT INTO `sys_city` VALUES ('ec25e407285e4016bf7be969622ebf77', '0', '50901', 1, '小明', '小明', NULL, NULL, '0', '2018-11-17 13:43:06', '0', '2018-11-17 13:43:06');

SET FOREIGN_KEY_CHECKS = 1;
