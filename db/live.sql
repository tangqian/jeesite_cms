/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : 127.0.0.1:3306
 Source Schema         : live

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 13/03/2018 07:57:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) NULL DEFAULT 0 COMMENT '权重，越大越靠前',
  `weight_date` datetime(0) NULL DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) NULL DEFAULT 0 COMMENT '点击数',
  `posid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视图配置',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_article_create_by`(`create_by`) USING BTREE,
  INDEX `cms_article_title`(`title`) USING BTREE,
  INDEX `cms_article_keywords`(`keywords`) USING BTREE,
  INDEX `cms_article_del_flag`(`del_flag`) USING BTREE,
  INDEX `cms_article_weight`(`weight`) USING BTREE,
  INDEX `cms_article_update_date`(`update_date`) USING BTREE,
  INDEX `cms_article_category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_data`;
CREATE TABLE `cms_article_data`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `copyfrom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章详表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `sort` int(11) NULL DEFAULT 30 COMMENT '排序（升序）',
  `in_menu` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视图配置',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_category_parent_id`(`parent_id`) USING BTREE,
  INDEX `cms_category_module`(`module`) USING BTREE,
  INDEX `cms_category_name`(`name`) USING BTREE,
  INDEX `cms_category_sort`(`sort`) USING BTREE,
  INDEX `cms_category_del_flag`(`del_flag`) USING BTREE,
  INDEX `cms_category_office_id`(`office_id`) USING BTREE,
  INDEX `cms_category_site_id`(`site_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime(0) NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_comment_category_id`(`category_id`) USING BTREE,
  INDEX `cms_comment_content_id`(`content_id`) USING BTREE,
  INDEX `cms_comment_status`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言分类',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `workunit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `create_date` datetime(0) NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复人',
  `re_date` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_guestbook_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接名称',
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) NULL DEFAULT 0 COMMENT '权重，越大越靠前',
  `weight_date` datetime(0) NULL DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_link_category_id`(`category_id`) USING BTREE,
  INDEX `cms_link_title`(`title`) USING BTREE,
  INDEX `cms_link_del_flag`(`del_flag`) USING BTREE,
  INDEX `cms_link_weight`(`weight`) USING BTREE,
  INDEX `cms_link_create_by`(`create_by`) USING BTREE,
  INDEX `cms_link_update_date`(`update_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点标题',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default' COMMENT '主题',
  `copyright` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '版权信息',
  `custom_index_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cms_site_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_audience
-- ----------------------------
DROP TABLE IF EXISTS `live_audience`;
CREATE TABLE `live_audience`  (
  `id` int(9) NOT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家编码',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份编码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `logo_id` int(9) NULL DEFAULT NULL COMMENT '头像id',
  `sex` tinyint(3) NULL DEFAULT 0 COMMENT '性别，0:保密,1:男,2:女',
  `department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `mobile_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机',
  `fax` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `biz_type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '1自注册,2会员,3非会员,4推广',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '观众表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_audience_register
-- ----------------------------
DROP TABLE IF EXISTS `live_audience_register`;
CREATE TABLE `live_audience_register`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `audience_id` int(9) NOT NULL COMMENT '观众id',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家编码',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份编码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `logo_id` int(9) NULL DEFAULT NULL COMMENT '头像id',
  `sex` tinyint(3) NULL DEFAULT 0 COMMENT '性别，0:保密,1:男,2:女',
  `department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `mobile_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机',
  `fax` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `is_sent_email` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否已发送通知邮件,0:否',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_room_audience_id`(`room_id`, `audience_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '观众登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_home_banner
-- ----------------------------
DROP TABLE IF EXISTS `live_home_banner`;
CREATE TABLE `live_home_banner`  (
  `id` int(9) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `file_id` int(9) NOT NULL COMMENT '文件id',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页banner图表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_report_data_download
-- ----------------------------
DROP TABLE IF EXISTS `live_report_data_download`;
CREATE TABLE `live_report_data_download`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `type` tinyint(3) NOT NULL COMMENT '资料类型(1:资料,2:演讲稿)',
  `data_id` int(9) NOT NULL COMMENT '主播资料id',
  `user_id` int(9) NOT NULL COMMENT '用户id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_report_room_data_user_id`(`room_id`, `type`, `data_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间资料下载记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_report_user_present
-- ----------------------------
DROP TABLE IF EXISTS `live_report_user_present`;
CREATE TABLE `live_report_user_present`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `user_id` int(9) NOT NULL COMMENT '用户id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_report_room_user_id`(`room_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户访问记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_report_visitor_present
-- ----------------------------
DROP TABLE IF EXISTS `live_report_visitor_present`;
CREATE TABLE `live_report_visitor_present`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `visitor_id` int(9) NOT NULL COMMENT '游客id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_report_room_visitor_id`(`room_id`, `visitor_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游客访问记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room
-- ----------------------------
DROP TABLE IF EXISTS `live_room`;
CREATE TABLE `live_room`  (
  `id` int(9) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '直播主题名称',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `speaker_id` int(9) NOT NULL COMMENT '主播id(举办公司)',
  `publish_mode` tinyint(3) NOT NULL DEFAULT 0 COMMENT '直播模式,0:视频/ppt',
  `watch_mode` tinyint(3) NOT NULL DEFAULT 0 COMMENT '观看模式,0:游客',
  `is_show` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否显示,0:是',
  `is_contact_show` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否显示联络方式,0:是',
  `is_top` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否置顶：0否：1是',
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行业,用,id1,id2,格式保存',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `bg_end_time` datetime(0) NOT NULL COMMENT '直播实际结束时间',
  `review_id` int(9) NULL DEFAULT NULL COMMENT '回顾图id',
  `cover_id` int(9) NULL DEFAULT NULL COMMENT '封面图id',
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细介绍',
  `top_sort` int(9) NOT NULL DEFAULT 100 COMMENT '置顶房间排序',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '直播房间状态。0:新建,1:保留,2:进行中,3:保留,4:结束',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `pv` int(9) NOT NULL DEFAULT 0 COMMENT '人气值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '直播房间' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `live_room_blacklist`;
CREATE TABLE `live_room_blacklist`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `user_id` int(9) NOT NULL COMMENT '用户id',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_blacklist_room_user_id`(`room_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户黑名单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_chat
-- ----------------------------
DROP TABLE IF EXISTS `live_room_chat`;
CREATE TABLE `live_room_chat`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `send_by` int(9) NOT NULL COMMENT '发送者id',
  `send_to` int(9) NULL DEFAULT NULL COMMENT '群聊时被@的人',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '聊天内容',
  `type` tinyint(3) NOT NULL COMMENT '聊天类型(1:私聊,2:群聊)',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间聊天记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_chat_receiver
-- ----------------------------
DROP TABLE IF EXISTS `live_room_chat_receiver`;
CREATE TABLE `live_room_chat_receiver`  (
  `id` int(9) NOT NULL,
  `chat_id` int(9) NOT NULL COMMENT '聊天记录id',
  `receive_by` int(9) NOT NULL COMMENT '接收者id',
  `read_date` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聊天接收记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_data
-- ----------------------------
DROP TABLE IF EXISTS `live_room_data`;
CREATE TABLE `live_room_data`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `source_id` int(9) NOT NULL COMMENT '数据源id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间资料表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_data_public
-- ----------------------------
DROP TABLE IF EXISTS `live_room_data_public`;
CREATE TABLE `live_room_data_public`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `source_id` int(9) NOT NULL COMMENT '数据源id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `file_id` int(9) NOT NULL COMMENT '文件id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间资料表(审核通过)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_review_data
-- ----------------------------
DROP TABLE IF EXISTS `live_room_review_data`;
CREATE TABLE `live_room_review_data`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资料名称',
  `file_id` int(9) NOT NULL COMMENT '资料id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `mediaId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒资ID(百度云VOD查询用)',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态(0:禁用,1:启用)',
  `type` tinyint(3) NOT NULL COMMENT '资料类型(1:视频)',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间回顾资料表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_rich_text
-- ----------------------------
DROP TABLE IF EXISTS `live_room_rich_text`;
CREATE TABLE `live_room_rich_text`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图文内容',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:新建',
  `create_by` int(9) NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` int(9) NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '直播图文表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_speech
-- ----------------------------
DROP TABLE IF EXISTS `live_room_speech`;
CREATE TABLE `live_room_speech`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `source_id` int(9) NOT NULL COMMENT '数据源id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间演讲稿表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_speech_public
-- ----------------------------
DROP TABLE IF EXISTS `live_room_speech_public`;
CREATE TABLE `live_room_speech_public`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `source_id` int(9) NOT NULL COMMENT '数据源id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `file_id` int(9) NOT NULL COMMENT '文件id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间演讲稿表(审核通过)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_video
-- ----------------------------
DROP TABLE IF EXISTS `live_room_video`;
CREATE TABLE `live_room_video`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `source_id` int(9) NOT NULL COMMENT '数据源id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间视频表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_room_video_public
-- ----------------------------
DROP TABLE IF EXISTS `live_room_video_public`;
CREATE TABLE `live_room_video_public`  (
  `id` int(9) NOT NULL,
  `room_id` int(9) NOT NULL COMMENT '直播房间id',
  `source_id` int(9) NOT NULL COMMENT '数据源id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频名',
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细介绍',
  `file_id` int(9) NOT NULL COMMENT '视频文件id',
  `cover_id` int(9) NULL DEFAULT NULL COMMENT '视频封面图id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间视频表(审核通过)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker`;
CREATE TABLE `live_speaker`  (
  `id` int(9) NOT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司详细地址',
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行业,用,id1,id2,格式保存',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `logo_id` int(9) NULL DEFAULT NULL COMMENT '头像id',
  `sex` tinyint(3) NULL DEFAULT 0 COMMENT '性别，0:保密,1:男,2:女',
  `department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `mobile_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机',
  `fax` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_data
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_data`;
CREATE TABLE `live_speaker_data`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `file_id` int(9) NOT NULL COMMENT '文件id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:新建(即待审核),1、2:保留,3:审核通过,4:审核不通过',
  `audit_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播资料表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_data_recycle
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_data_recycle`;
CREATE TABLE `live_speaker_data_recycle`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `file_id` int(9) NOT NULL COMMENT '文件id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:新建(即待审核),1、2:保留,3:审核通过,4:审核不通过',
  `audit_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播资料回收表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_recycle_inventory
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_recycle_inventory`;
CREATE TABLE `live_speaker_recycle_inventory`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联名称',
  `subject_id` int(9) NOT NULL COMMENT '关联实体id',
  `subject_type` int(9) NOT NULL COMMENT '关联实体类型,如视频、演讲稿',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播回收站清单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_speech
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_speech`;
CREATE TABLE `live_speaker_speech`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `file_id` int(9) NOT NULL COMMENT '文件id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:新建(即待审核),1、2:保留,3:审核通过,4:审核不通过',
  `audit_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播演讲稿表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_speech_recycle
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_speech_recycle`;
CREATE TABLE `live_speaker_speech_recycle`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `file_id` int(9) NOT NULL COMMENT '文件id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:新建(即待审核),1、2:保留,3:审核通过,4:审核不通过',
  `audit_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播演讲稿回收表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_video
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_video`;
CREATE TABLE `live_speaker_video`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频名',
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细介绍',
  `file_id` int(9) NOT NULL COMMENT '视频文件id',
  `cover_id` int(9) NULL DEFAULT NULL COMMENT '视频封面图id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:新建(即待审核),1、2:保留,3:审核通过,4:审核不通过',
  `audit_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播视频表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_video_recycle
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_video_recycle`;
CREATE TABLE `live_speaker_video_recycle`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频名',
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细介绍',
  `file_id` int(9) NOT NULL COMMENT '视频文件id',
  `cover_id` int(9) NULL DEFAULT NULL COMMENT '视频封面图id',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:新建(即待审核),1、2:保留,3:审核通过,4:审核不通过',
  `audit_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核说明',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播视频回收表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_speaker_waiter
-- ----------------------------
DROP TABLE IF EXISTS `live_speaker_waiter`;
CREATE TABLE `live_speaker_waiter`  (
  `id` int(9) NOT NULL,
  `speaker_id` int(9) NOT NULL COMMENT '主播id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `logo_id` int(9) NULL DEFAULT NULL COMMENT '头像id',
  `sex` tinyint(3) NULL DEFAULT 0 COMMENT '性别，0:保密,1:男,2:女',
  `department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `mobile_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机',
  `fax` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主播客服表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live_user
-- ----------------------------
DROP TABLE IF EXISTS `live_user`;
CREATE TABLE `live_user`  (
  `id` int(9) NOT NULL,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `type` tinyint(3) NOT NULL COMMENT '用户类型(1:观众,2:管理员,3:主播,4:客服)',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '用户状态。0:正常,1禁用',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_account_type`(`account`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of live_user
-- ----------------------------
INSERT INTO `live_user` VALUES (1, 'admin', '123456@qq.com', '0f4f6729665fb527debcc93bdb78c097af8aa4714998d27ef496274e', 2, 0, '2016-08-09 17:28:44', '2016-08-09 17:28:47');

-- ----------------------------
-- Table structure for live_visitor
-- ----------------------------
DROP TABLE IF EXISTS `live_visitor`;
CREATE TABLE `live_visitor`  (
  `id` int(9) NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问ip',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游客表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_async_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_async_task`;
CREATE TABLE `sys_async_task`  (
  `id` int(9) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `type` tinyint(3) NOT NULL COMMENT '类型',
  `param` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务参数',
  `status` tinyint(3) NOT NULL COMMENT '状态,0待执行，1执行中，2执行成功，3执行失败',
  `execute_time` datetime(0) NULL DEFAULT NULL COMMENT '任务最后执行完成时间',
  `result_message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '异步任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`label`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('100', 'zh_CN', '中国', 'country_code', '国家', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('101', '-1', '中国以外地区', 'country_code', '国家', 15, '0', '1', '2016-02-26 10:41:00', '1', '2016-02-26 10:41:00', '', '0');
INSERT INTO `sys_dict` VALUES ('102', 'CNANH', '安徽', 'province_code', '省份', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('103', 'CNBEI', '北京 ', 'province_code', '省份', 11, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('104', 'CNFUJ', '福建', 'province_code', '省份', 12, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('105', 'CNGAN', '甘肃', 'province_code', '省份', 13, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('106', 'CNGUA', '广东', 'province_code', '省份', 14, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('107', 'CNGUN', '广西', 'province_code', '省份', 15, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('108', 'CNGUI', '贵州', 'province_code', '省份', 16, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('109', 'CNHAI', '海南', 'province_code', '省份', 17, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', 50, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('110', 'CNHEB', '河北', 'province_code', '省份', 18, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('111', 'CNHEN', '河南', 'province_code', '省份', 19, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('112', 'CNHEI', '黑龙江', 'province_code', '省份', 20, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('113', 'CNHUB', '湖北', 'province_code', '省份', 21, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('114', 'CNHUN', '湖南', 'province_code', '省份', 22, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('115', 'CNJIL', '吉林', 'province_code', '省份', 23, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('116', 'CNJIA', '江苏', 'province_code', '省份', 24, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('117', 'CNJIN', '江西', 'province_code', '省份', 25, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('118', 'CNLIA', '辽宁', 'province_code', '省份', 26, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('119', 'CNNEI', '内蒙', 'province_code', '省份', 27, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('120', 'CNNIN', '宁夏', 'province_code', '省份', 28, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('121', 'CNQIN', '青海', 'province_code', '省份', 29, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('122', 'CNSHN', '山东', 'province_code', '省份', 30, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('123', 'CNSHX', '山西', 'province_code', '省份', 31, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('124', 'CNSHA', '陕西', 'province_code', '省份', 32, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('125', 'CNSHG', '上海', 'province_code', '省份', 33, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('126', 'CNSIC', '四川', 'province_code', '省份', 34, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('127', 'CNTIA', '天津', 'province_code', '省份', 35, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('128', 'CNXIZ', '西藏', 'province_code', '省份', 36, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('129', 'CNXIN', '新疆', 'province_code', '省份', 37, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('130', 'CNYUN', '云南', 'province_code', '省份', 38, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('131', 'CNZHE', '浙江', 'province_code', '省份', 39, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('132', 'CNCHO', '重庆', 'province_code', '省份', 40, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('133', 'CNTAW', '台湾', 'province_code', '省份', 41, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('134', 'CNHNK', '香港', 'province_code', '省份', 42, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('135', 'CNMAC', '澳门', 'province_code', '省份', 43, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', 40, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', 60, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('21', '10', '10分钟', 'admission_option', '提前入场时间', 10, '0', '1', '2016-02-26 10:39:55', '1', '2016-02-26 10:39:55', '', '0');
INSERT INTO `sys_dict` VALUES ('22', '15', '15分钟', 'admission_option', '提前入场时间', 15, '0', '1', '2016-02-26 10:41:40', '1', '2016-02-26 10:41:40', '', '0');
INSERT INTO `sys_dict` VALUES ('23', '20', '20分钟', 'admission_option', '提前入场时间', 20, '0', '1', '2016-02-26 10:42:00', '1', '2016-02-26 10:42:00', '', '0');
INSERT INTO `sys_dict` VALUES ('24', '30', '30分钟', 'admission_option', '提前入场时间', 30, '0', '1', '2016-02-26 10:42:41', '1', '2016-02-26 10:42:41', '', '0');
INSERT INTO `sys_dict` VALUES ('25', '60', '60分钟', 'admission_option', '提前入场时间', 60, '0', '1', '2016-02-26 10:43:06', '1', '2016-02-26 10:43:06', '', '0');
INSERT INTO `sys_dict` VALUES ('26', '1', '直播', 'activity_type', '活动类型', 60, '0', '1', '2016-02-26 10:42:41', '1', '2016-02-26 10:42:41', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '2', '有奖活动', 'activity_type', '活动类型', 30, '0', '1', '2016-02-26 10:43:06', '1', '2016-02-26 10:43:06', '', '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', 10, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', 30, '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', 40, '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', 10, '0', '1', '2013-05-27 08:00:00', '1', '2016-02-23 09:54:32', '', '0');
INSERT INTO `sys_dict` VALUES ('71', '103100', '医疗', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('72', '11000', '物联网', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('73', '11500', '3D打印', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('74', '14000', '照明', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('75', '15000', '电力', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('76', '16000', '锂电', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('77', '2000', '光通讯', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('78', '3000', '光学', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('79', '4000', '激光', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', 20, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('80', '5000', '可穿戴设备', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('81', '51000', '安防', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('82', '6000', '太阳能光伏', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('83', '692007', '半导体照明', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('84', '692028', '显示', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('85', '71100', '汽车网', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('86', '77000', '新能源汽车', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('87', '879012', '电子工程', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('88', '879083', '智能电网', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('89', '879100', '工控', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', 30, '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('90', '88000', '传感器', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('91', '897251', '仪器仪表', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('92', '897512', '风电', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('93', '898000', '通信', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('94', '898500', '电源', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('95', '898800', '机器人', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', 10, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', 20, '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES ('98', '911000', '智能家居', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');
INSERT INTO `sys_dict` VALUES ('99', '987000', '节能环保', 'industry_option', '行业类型', 10, '0', '1', '2016-02-26 10:39:00', '1', '2016-02-26 10:39:00', '', '0');

-- ----------------------------
-- Table structure for sys_email
-- ----------------------------
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE `sys_email`  (
  `id` int(9) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bcc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态,0:待发送,1:发送成功,2:发送失败',
  `subject_id` int(9) NOT NULL COMMENT '关联实体id',
  `subject_type` int(9) NOT NULL COMMENT '关联实体类型',
  `create_date` datetime(0) NULL,
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL,
  `uri` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件物理相对路径',
  `original_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原始文件名称',
  `size` int(11) NOT NULL COMMENT '文件大小(字节数)',
  `ext` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件扩展名',
  `is_temp` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否临时文件,0:不是',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型,0:图片,1:文件',
  `subject_type` int(9) NOT NULL COMMENT '关联业务类型',
  `parent_id` int(9) NULL DEFAULT NULL COMMENT '父级编号',
  `sort` int(9) NULL DEFAULT NULL COMMENT '排序',
  `create_date` datetime(0) NULL,
  `create_by` int(9) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `exception` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('00a5f110533b4bd1b0d71f5c76018cc9', '1', '系统设置-系统设置-菜单管理', '1', '2017-07-23 17:22:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('00df37d8b6d74b6cbede8744aae86e23', '1', '直播系统-系统管理-重置主播密码', '1', '2017-07-23 17:23:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/speaker/resetPassForm', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('00f7acb911864ef687db949c32ce85e4', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 22:50:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('01a0c344f3874ad69cff9faab5cee9db', '1', '我的面板-个人信息-修改密码', '1', '2017-07-23 17:23:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0211bf73dd384c7b8dfc3a8c3ca3c6d3', '1', '系统设置-系统用户-用户管理', '1', '2018-03-07 21:34:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('04fbfde0532f4a27ab99be3319f36ee2', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:09:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('05929f3df926449ab15c561caa27fbc4', '1', '系统登录', '1', '2018-03-07 22:03:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/tree', 'GET', 'parentId=2', '');
INSERT INTO `sys_log` VALUES ('0b97d0f243cf43ce96903053129a41d5', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:25:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0cd2f6ea04504749b74fd02d73087341', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:09:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0d6c1810197046ae9554387d1a9c3aed', '1', '系统设置-日志查询-日志查询', '1', '2018-02-21 22:50:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0e695105645d4831b40dcc55d0f1e1c8', '1', '直播系统-观众管理-观众黑名单', '1', '2017-07-23 17:23:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/roomBlacklist/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('101be1df19ce46f0884be302d2576f62', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 23:45:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('10329a0825074c119b3d29fcf5f67fec', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:22:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('10bbefed02f741a3b0a8971b8c13a26b', '1', '直播系统-系统管理-异步任务管理', '1', '2017-07-23 17:23:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/asyncTask/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('10c14494bcbe4b71a66d51ebdbe5d989', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:50:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('122ef241e0ea4dbdbb44e25e6bed4149', '1', '系统设置-系统用户-用户管理', '1', '2017-07-23 17:22:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('12a8a9cc07474009898cfbb8d2c7ed8b', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:36:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('12b0db04f2be4b4b884424db8864335d', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:23:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('13966726c43149168995c8bb180b4d54', '1', '内容管理-内容管理', '1', '2018-03-07 22:31:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('15e5ce894258485cb71bb733a1ca661e', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:46:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('169b83ff67d1425ebfa9e9ef9cf6976f', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-03-07 22:26:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=14', '');
INSERT INTO `sys_log` VALUES ('16bc6c7093d240629132961405d42d16', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:53:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17c8731845244301a52e477a71186ca6', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:48:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('19500e465cbf4a3c99b94be10091cb32', '1', '系统设置-系统设置-角色管理', '1', '2017-07-23 17:30:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1985dc6a7c294aceba4114133e668c3d', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:45:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1a7bf34865dc4cf2acbadefecc6d04d6', '1', '系统设置-系统设置-菜单管理', '1', '2017-07-23 17:30:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1c6587a5d8be405fbb9c5137bede502e', '1', '直播系统-直播管理-直播房间', '1', '2018-03-07 21:34:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1d4099f5bebd467c98a0b25b6ec9cd8e', '1', '系统登录', '1', '2018-02-21 23:50:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1e4a507e21484b738eb4e9c2d1de95b1', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:18:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1e66fa41151f4894af14f6bc97bae728', '1', '系统登录', '1', '2018-02-21 23:37:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1e8b7f1ade594dbda930b990d06075c5', '1', '系统登录', '1', '2017-07-23 17:32:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1e8ce902f5524a7fbf9cce7ff0589018', '1', '系统登录', '1', '2018-02-21 22:46:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1f9d394e0ef0428ea0d1d9bf6dfc0d21', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:20:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('20c4d2c807cb4dfe86e10ad82c56fca4', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-02-21 22:49:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=c241d463d36741f5a52e5a84821c2262', '');
INSERT INTO `sys_log` VALUES ('20f1cb2262954314b9b16f4876b046fc', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:25:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('21a5342b572447d693b26f1507944680', '1', '系统设置-系统用户-用户管理', '1', '2018-03-07 22:11:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('21e95c0cb4d84b318d36e299a27756bb', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 22:50:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('24216658dbe647339caa1c0607142f92', '1', '系统登录', '1', '2018-03-07 22:22:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('292a7844e21f4883bd673e1c175105c0', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:22:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2983ac14ab444a9baa7f6ec02e4236bf', '1', '内容管理-内容管理', '1', '2018-03-07 22:23:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2c1e05f85da544628f6e33b101195797', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:23:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2c61b4b739b246dda8638a36691f6844', '1', '直播系统-直播管理-直播房间', '1', '2018-03-07 22:11:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2cd9fbb850bf4d38b420ab2d213b2068', '1', '系统设置-系统设置-菜单管理', '1', '2017-07-23 17:29:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2ce6417b440b418dbe7f87d1d7424311', '1', '系统登录', '1', '2018-03-07 22:11:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('30504830721a42c08c8d7a04b4aa344b', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:19:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('30c466dd5a1547c1b97bd22ecc04ada6', '1', '直播系统-系统管理-重置主播密码', '1', '2017-07-23 17:25:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/speaker/resetPassForm', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('316a7c7007c34e76933c6f865a2101fe', '1', '系统设置-日志查询-日志查询', '1', '2018-03-07 21:34:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('31dbaf4680a44c6a97b5c0ed342af654', '1', '内容管理-内容管理', '1', '2018-03-07 22:25:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('33a3ebda213e4f56aac1c9066feac6f0', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:49:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('33a7609dbc934db1a652c65cda7fe9c6', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:22:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=79', '');
INSERT INTO `sys_log` VALUES ('35ccf3a2d9c0419892f59e7b80f58582', '1', '直播系统-直播管理-资料审核', '1', '2017-07-23 17:23:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/data/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3841514c071a46f6b4e909b0217890cf', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:46:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('395889d90cd740dbb8b6f8d2591c7ffd', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:49:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3a7f701338be41f88ceab2e8a3f21f31', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-07-23 21:12:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a/sys/role/save', 'POST', 'id=df38acf552a0443793446c2bcbd47d9a&oldName=产品服务&name=产品服务&sysData=1&menuIds=1,27,28,29,30&remarks=', '');
INSERT INTO `sys_log` VALUES ('3bb18f6049e446ada82c2660ff775e53', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:44:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3c987a9b4aa1406c927450f53366435b', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:23:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3c9a76a1220d45508574baa1a62e94e7', '1', '内容管理-内容管理', '1', '2018-03-07 22:25:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3c9e76cda7e24f928f88d9a9e0a478f4', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:30:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3ddbf5467c794b0eb1a7c2fb534cac95', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:22:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3e555340951546ffa6e06189e272116e', '1', '系统设置-系统设置-字典管理', '1', '2018-03-07 21:34:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3e712d490b724c5496a9c6370c453c48', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:30:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3eb7cb48cd31452f8c71049e762eab73', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:22:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3f854b1e77d24cdaa42d410b81601650', '1', '直播系统-观众管理-观众登记', '1', '2017-07-23 17:23:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/audienceRegister/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('40897c55d7ea4d55833f742b5847dc38', '1', '内容管理-内容管理', '1', '2018-03-07 22:25:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('41b07272f3f54bde8181ed81d83be2d0', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 23:45:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('41f5e7098e9a455ba24eb0dd1c96ed4f', '1', '系统登录', '1', '2018-02-21 23:44:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('426de1148037464a9c5b508656aaa026', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:13:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('42ac7ff4491a4ea4909cdd3a5229bee9', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:20:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('43702025630545a586f7f3a68048817c', '1', '系统登录', '1', '2018-03-07 22:08:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('44e2d873aa094214bac8bec545d482f4', '1', '系统设置-系统设置-字典管理', '1', '2018-02-21 22:49:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('47e0e5b9ff234c9cb3105694fb9f681e', '1', '系统登录', '1', '2017-07-23 17:39:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('47ede00bd1d34e399a25488d2b88e269', '1', '内容管理-内容管理', '1', '2018-03-07 22:25:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('480757a5cc1440eabaf911502ea169fd', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:49:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('49cbb20d637e4450b0a85eb5f76c0f2f', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:07:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('49d35aac41c24baeba42b2b8a7908d6d', '1', '直播系统-直播管理-直播公司', '1', '2017-07-23 17:23:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/speaker/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4b2b9fa7ccab4a79a295906bc6bf353a', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:31:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4b2c73d5dfa741b6a40405220bcb2818', '1', '直播系统-直播管理-直播公司', '1', '2017-07-23 17:23:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/speaker/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4ce82b9525614749a5426fd5f83ffa9e', '1', '直播系统-直播管理-资料审核', '1', '2018-02-21 22:46:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/data/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4e0b31e5cdc84c8abf0f2e8a35fb931a', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 21:34:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4f2a1275f81241f795e46cfbc5ccf391', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:25:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('51f576517bff4247ba8613ce9cea579d', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-03-07 22:23:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=79', '');
INSERT INTO `sys_log` VALUES ('5425ef79281c4870aed60b5c3bf58b1f', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:38:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=28', '');
INSERT INTO `sys_log` VALUES ('54cbccb345ce44d6a93f5f12c2e87ea5', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 23:44:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('55186d6fe59345319f7c29ff47fee397', '1', '系统设置-日志查询-日志查询', '1', '2018-02-21 22:47:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('55d3ce0ad9654d31aca0060ad7d360e7', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:48:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('563b1e3f149e43c7908cf2854ea7c94d', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-03-07 22:22:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/assign', 'GET', 'id=df38acf552a0443793446c2bcbd47d9a', '');
INSERT INTO `sys_log` VALUES ('565cca5834ca448080f0a3fed753e6e3', '1', '系统设置-系统用户-用户管理', '1', '2018-03-07 22:08:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('571fd3e84b954a5793842dbe58bd6a6f', '1', '我的面板-个人信息-修改密码', '1', '2017-07-23 17:23:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('57411050b4294498abefe0b83e649706', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:11:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('579d93edcda84504a63ad4d7476ea48d', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:26:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('59a9826eb6ba407cafd7d1d98778dc5c', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-03-07 22:20:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/save', 'POST', 'id=20&parent.id=13&parent.name=机构用户&name=用户管理&href=/sys/user/index&target=&icon=user&sort=30&isShow=1&permission=sys:user:view&remarks=', '');
INSERT INTO `sys_log` VALUES ('5ae6bb3a9d74450bb98ea5f43e0a8324', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:48:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d80e284a0db4c7bbc246482e73e92af', '1', '系统登录', '1', '2018-03-07 22:34:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5dec51163bd14ebd8fea77ffa7acbace', '1', '系统设置-系统设置-字典管理', '1', '2018-03-07 22:21:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5e72150331ab4e6b9d0d458ea04d13b8', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:09:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('62a70997988a4df5b51dd0bea533d28a', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:37:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('62ddd35e70144e6a97dea5caa507e6a1', '1', '系统登录', '1', '2017-07-23 21:39:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('63104379317346c19d3bd7c8a2c3ab90', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:31:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('632b97303b8648cf94e2ab8d39036044', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:26:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('637f7d5e40614a5dbf7dbc3868cf3e49', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:03:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('63c9a60cb53f466d8d100f530d07d0a1', '1', '系统登录', '1', '2017-07-23 21:12:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a/sys/role/usertorole', 'GET', 'id=df38acf552a0443793446c2bcbd47d9a&___t0.47993284613577725=', '');
INSERT INTO `sys_log` VALUES ('6551c0f4f2604ac8a3c096c49658d281', '1', '系统登录', '1', '2018-02-21 23:10:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('657403f7d64944c1838ec24836018e30', '1', '内容管理-统计分析-信息量统计', '1', '2018-03-07 22:26:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/stats/article', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6862a511c5c54dee930cb0f7c4985cfd', '1', '直播系统-直播管理-资料下载统计', '1', '2017-07-23 17:23:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/dataDownload/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('688bc96817bc4f3aa56e89159cf0efd2', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:16:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=20', '');
INSERT INTO `sys_log` VALUES ('6913ebdc858a40c4803367d719b35a88', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-02-21 22:49:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=fb4f0610c30b45508e8e92a5443bdea0', '');
INSERT INTO `sys_log` VALUES ('696c28c0a8354e21a6ee52b519afabc6', '1', '系统设置-系统设置-角色管理', '1', '2017-07-23 17:30:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6a194a2fd94b43598eea2cb49ee7fbfe', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:20:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6a6cd194ad96494591ecbf282a9b988d', '1', '系统登录', '1', '2017-07-23 21:23:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6d78630bb6ed41bf97728baa31795c4f', '1', '内容管理-内容管理-公共留言-查看', '1', '2018-03-07 22:26:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/guestbook/', 'GET', 'status=2', '');
INSERT INTO `sys_log` VALUES ('6d9051251604412f9084d9cf58e0bed1', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 23:37:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6e9b292160da4e6f88cf952a5c8ee6f4', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:34:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6f4cb83065c94d17b1e8e142b0a4700e', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:31:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6fd85c36d249480ba74fd030917feb8e', '1', '系统设置-系统用户-用户管理', '1', '2017-07-23 17:29:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('70c81a732d544294a105f6362a33fa52', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:18:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('73ac8cfe8fad49d2a37ad66de3bf65d0', '1', '直播系统-观众管理-观众登记', '1', '2017-07-23 17:23:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/audienceRegister/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('73cea08c1c1741ed933d0b1e40b4c04c', '1', '直播系统-直播管理-资料审核', '1', '2017-07-23 17:29:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/data/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('73e936fc559c41efb7771db17973c1e6', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:21:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('75c10b1a96f74b849eb7ca0dc2f10745', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:14:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('76690b911c504d93bc4d2f504a59be9e', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:20:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('76d5e7ac207748fdbecb762b989a8547', '1', '直播系统-直播管理-直播公司', '1', '2018-03-07 21:34:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/speaker/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('777b80ee08694280a57f6859a8da64f0', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:22:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('77e540f845f94591a55a2de928f17791', '1', '系统设置-系统设置-字典管理', '1', '2018-02-21 22:50:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7800c126e3ed4b5cb1b88706dacff38a', '1', '直播系统-直播管理-直播公司', '1', '2018-02-21 22:46:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/speaker/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('781975a3edec49a8b899642e077fafd0', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 23:45:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('78c5f3d96226400b8b99c021ec788140', '1', '我的面板-个人信息-个人信息', '1', '2018-02-21 22:48:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7a6ba85447be45129bf0f38d674700ce', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 22:47:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7ba8e35c130746af9d56a3315f6f8c39', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 22:49:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7ca71b4f4082407187ef2a1764c0cf37', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:44:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7f2ccac13b2a4dadb7d2eba54db054f0', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:21:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7fd8e3158f6745f9b1aa871133186f98', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:20:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8097f4a6ddc545ee80ea8d52fec9d9fa', '1', '直播系统-观众管理-观众登记', '1', '2018-02-21 22:46:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/audienceRegister/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('820ce504dedb49a494beeaa5887dac15', '1', '系统设置-日志查询-日志查询', '1', '2018-03-07 22:26:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('827a581542404d0caa57a3bb8b5bb58e', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 23:44:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8306eeccd9f44c949db176889974d590', '1', '系统设置-日志查询-日志查询', '1', '2017-07-23 17:22:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8348ad7f782f4e9496f653768c7a9e03', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 21:34:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8499ed0cb3b2470f8938889a7abaab75', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:21:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('85b7aecde3af4c179a0cdd82af43fdff', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:22:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('882c11ab3af540b999d8566e3abf2926', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:21:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8969303c9f5b4671a1bcd518ea5b1298', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:30:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('89be3b393b824d6b9b5eca92b7d29c8c', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:47:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('89ea0652abee4461af606fdae70aaebc', '1', '系统登录', '1', '2017-07-23 20:41:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8ab49f20298743478cdda60672c55fe9', '1', '直播系统-直播管理-Banner管理', '1', '2017-07-23 17:23:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/homeBanner/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e125887581a42d7813c5ea1c60a657c', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:25:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e2af26d3daa48779ae1fa6dac40594f', '1', '内容管理-内容管理-内容发布', '1', '2018-03-07 22:23:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8ecd7d3daa4142de96e5c5522a4c6472', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:37:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8f5f14bbf06143418164beed48d21589', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:46:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8f73dc1355d84649ab1fc2490f361058', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:50:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('91a3f80f87684527b7a46c0f2c80b99e', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:23:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('91a472f5f38842668d79fa3ebe0aa5a1', '1', '内容管理-内容管理-内容发布', '1', '2018-03-07 22:31:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('93309cb44e4843709b0193fb0dc59bc6', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:23:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('95704977490c4055961301116f45b1fa', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 22:46:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('965e1184605e4f37a2d0a211e35db230', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 21:34:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('986d334301804f41ba56e010a877d3a3', '1', '我的面板-个人信息-修改密码', '1', '2018-03-07 22:23:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9872d67935ab4fcf803c9b7295b26a60', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:23:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('98eab1243b63435b8d93b9ec2eaf4dec', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:22:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9a547e0223b3420d8b5eb84f0f93e391', '1', '系统设置-系统设置-字典管理', '1', '2018-02-21 22:46:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9b644e617cdf4f9d834aa1752774d59f', '1', '直播系统-直播管理-直播回顾', '1', '2017-07-23 17:29:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/review/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9b82e9815e5449e5843180d6cecec10b', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-03-07 22:22:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/form', 'GET', 'id=df38acf552a0443793446c2bcbd47d9a', '');
INSERT INTO `sys_log` VALUES ('9c68be2bb56140c3bcf71b0088e3ba63', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:49:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9d9c4001fa4a4d439cb906339bddff96', '1', '我的面板-个人信息-修改密码', '1', '2017-07-23 17:22:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9ddd3567c5c24ceaa594f0ffd6fee400', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:23:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9de1ca03fdea41c5b95816fa84c6e078', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 23:10:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9f3718862a3246c1a4cf962e1ed237fa', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:22:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9f536b9dd0b647c682b13f7eefd20f00', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 21:34:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a00e82114c394ced96658dece68bf692', '1', '我的面板-个人信息-个人信息', '1', '2018-02-21 22:46:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a1543202c1694399b964bdccc8af8286', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 23:37:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a17fea6277054fa59cfbf8ed2bdce08b', '1', '代码生成-代码生成-业务表配置', '1', '2018-03-07 22:23:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a217870bdcd54b2f840f0f50b9981ae1', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-03-07 22:26:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=17', '');
INSERT INTO `sys_log` VALUES ('a229744764754f5dbd9c31e31c06aee7', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:29:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a5e7a6a461704268801ee815dba17c20', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:21:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a659b92fdad0461e9a8ab278c2861b51', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:07:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a7864720635347fca0b7b65c4e3052ea', '1', '内容管理-内容管理-内容发布', '1', '2018-03-07 22:25:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a7ad60b3ca60409ca08c99f6fdd06466', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:37:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a7ef626b158d4e2fa1d3ca8387ba59b6', '1', '内容管理-栏目设置-栏目管理', '1', '2018-03-07 22:26:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a7f7839897ec431b8d6fed5e18c1f089', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:50:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a7fe7e0ae9724d60ad0f0eac2f9f5561', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 22:49:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a805d59b19f3424d8338968e9bb93e08', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:26:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aaa38ee434ab48299310102903dccc1f', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:34:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ab6f77a20e064471bc271015541dbf29', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:23:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('acf021dd52e04d018d576e7097d95646', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:35:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=68', '');
INSERT INTO `sys_log` VALUES ('b015c67827314d39baecbc92e92b6ab5', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:50:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b027f50b3cb047c3bba295b80b0be5bb', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:44:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b06344b57a3b4965a7abdf710209abcd', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 23:50:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b0893451ef7e439ea1d3b2dd77809236', '1', '系统设置-系统设置-角色管理-修改', '1', '2017-07-23 21:06:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a/sys/role/assign', 'GET', 'id=df38acf552a0443793446c2bcbd47d9a', '');
INSERT INTO `sys_log` VALUES ('b29f5ffac75f4a38b132146e817e5968', '1', '系统设置-日志查询-日志查询', '1', '2017-07-23 17:22:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b3839e272b12404a99dd43e19331c537', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:25:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b3b87b0207054f9fb015c53e62be6d7d', '1', '系统登录', '1', '2017-07-23 21:29:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b3f3d7c4a5b94c14af1df7f2035648e5', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-02-21 22:49:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=d0e72fe52a3045babd4a8e23f0be87bb', '');
INSERT INTO `sys_log` VALUES ('b44a2a7c33104b028ad3c7e922d89f86', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:14:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b55b21fd180d4eeca4f2e7c0bfe833be', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:48:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b63904c360554ed28b3d2c25d12d8e34', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:21:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b6d6ec4b8ef942b8a82c739db038ad8f', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-02-21 22:48:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=43a47ad0d3c4499ba637499caca6320b', '');
INSERT INTO `sys_log` VALUES ('b8f234955a8f42fc8e5535f7c80b6080', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:50:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ba75582e6c2a4b7cbbc4fb01cc2b4d65', '1', '系统设置-系统用户-用户管理', '1', '2017-07-23 17:30:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bb22c814dc424d208e0be22450494302', '1', '直播系统-直播管理-直播公司', '1', '2017-07-23 17:29:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/speaker/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bc5c55655c524d27a29fa287a612509a', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:21:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c003f26147b84d5282dd25e83d0a4b3e', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:46:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c0ca43f9ac4745929fc1f418b852b55b', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:46:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c0e5a8743ac94d8c9230534f431b3ab2', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:20:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c11fb86950bc4d3e986c9cfc6331c451', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:22:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c15c7a64f6f643a3801c07f7dd3119ee', '1', '直播系统-直播管理-直播房间', '1', '2018-03-07 21:34:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c1697e400b984ae2a440d2286018d20e', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:23:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c2ab4e0ddbd642fd9b73cda28dd1ef17', '1', '直播系统-直播管理-直播回顾', '1', '2017-07-23 17:23:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/review/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c2ded9818a584f92be37ed6b71b0729d', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:49:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c565506393474353a32b625923924361', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:37:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c592051d020740a59e50c4ff471e6a18', '1', '系统设置-系统用户-用户管理', '1', '2018-03-07 21:34:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c641cf0e80a94c5b9ec2bf60f404ffe6', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:49:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c6ee239f9ba74eb8bb73c5c32d12d194', '1', '系统设置-系统设置-角色管理', '1', '2018-02-21 22:49:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c71c86d1ff6c478bb7943837111c4832', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:38:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c8d6b4e246004389899c548f84b372a5', '1', '系统设置-系统用户-用户管理', '1', '2018-03-07 22:03:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c8f31a5aa7a24cd983861e218fdb3be9', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:21:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c8f4dfd78733497ba7beb1eaa06bb04f', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:08:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c90ca28b43cb43509fd0e0e2c4693c58', '1', '直播系统-直播管理-直播房间', '1', '2017-07-23 17:30:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cb74fb0b52d34860beb8861462d3bb06', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:21:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cc0669d08828470d87d7aa5de4512cb1', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-02-21 22:48:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=9e72a8769d174d648e8aa675cee35b7e', '');
INSERT INTO `sys_log` VALUES ('ccb873d927474faab1bf86a6904faa9c', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:09:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ccf975c7fc004f9a83cd6cff2948b6c5', '1', '系统登录', '1', '2017-07-23 17:22:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cd067ea5167d4ba48e91683727488e4f', '1', '直播系统-系统管理-异步任务管理', '1', '2018-02-21 22:48:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/asyncTask/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cdb5ad19815d4814904cce830772706d', '1', '系统设置-系统设置-字典管理', '1', '2017-07-23 17:22:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cfd20d656df8445898d61eb74e4baa2f', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:22:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d04e9c902bef4387b678697ad00c11a4', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:26:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d206e3c0b4364dcbb34b2835dae34681', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-03-07 21:34:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/assign', 'GET', 'id=df38acf552a0443793446c2bcbd47d9a', '');
INSERT INTO `sys_log` VALUES ('d2c6b0e4616b4914a193715b1ec53cc4', '1', '内容管理-内容管理', '1', '2018-03-07 22:31:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d351cfd05e1f4e30b7cfc1e9ec59007b', '1', '内容管理-栏目设置-站点设置', '1', '2018-03-07 22:26:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d54e623f7164466e8c115b9bf05742ce', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:29:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d63a925e4ae942e49ed7387d5d26603d', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:38:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d80f1ed7fcea4be1ba55fa1718fea7b6', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-03-07 22:13:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=62', '');
INSERT INTO `sys_log` VALUES ('d93585ef62bd45999937f13dfe3427ce', '1', '我的面板-个人信息-个人信息', '1', '2017-07-23 17:30:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d972439423e748bebf4fd15d626221ca', '1', '我的面板-个人信息-修改密码', '1', '2018-02-21 22:46:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d9f933e993914e61932b4736545d02e2', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:23:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dc655e3ea82f40ffafba7f7949570106', '1', '系统设置-日志查询-日志查询', '1', '2018-02-21 22:47:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dd360a827d924e4d89fa4b6918924d24', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:23:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dd9c63b655b848e59e9bf94e8caaf96f', '1', '直播系统-直播管理-直播房间', '1', '2018-03-07 21:34:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('de5dba2d287f4be089a3d7e585888fa9', '1', '直播系统-直播管理-直播房间', '1', '2018-03-07 22:08:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('df1df60391aa42da8983ea86cfad5b06', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:20:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e032a5967876481c9ca6f1e9100cfa22', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:49:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e17b4c097aa54690b484103ff342a8e6', '1', '系统设置-系统设置-角色管理', '1', '2017-07-23 17:29:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e38917b52a6f49869172936df9d28e5a', '1', '系统设置-系统设置-菜单管理', '1', '2017-07-23 17:30:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e3c79aa043284dd3976e0f46d2eef9cd', '1', '我的面板-个人信息-个人信息', '1', '2018-02-21 22:46:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e484adcd27d04140bde5e8e512969da1', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:48:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e4947777506f47ac9087325ddd37f685', '1', '系统设置-系统设置-角色管理', '1', '2017-07-23 17:22:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e4ea61f58e184acdbb8d65f592d02a15', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 21:34:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e4f2c0f9bfe341f082eed94332f8017a', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-03-07 22:21:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/save', 'POST', 'id=20&parent.id=13&parent.name=机构用户&name=用户管理&href=/sys/user/list&target=&icon=user&sort=30&isShow=1&permission=sys:user:view&remarks=', '');
INSERT INTO `sys_log` VALUES ('e57a9c14ba364dc29debedafa06178da', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:34:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e587f75220d848ac898d64aeda1bf306', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:12:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e6ba8f748a074985b9f97cc6a483d854', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:36:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=27', '');
INSERT INTO `sys_log` VALUES ('e8a8e48289bc4e7bbe36434f08aff96d', '1', '内容管理-内容管理', '1', '2018-03-07 22:23:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e8ecf06280ca4003b553e269ff705a40', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:13:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e9611406ecff40febffa911815e25ac7', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:26:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ea39845338a64546bb0065998290a407', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:25:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('eabf9cbb0f594bf29bd6a724dd6cd26b', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:21:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('eb49b6c0dbb9428189eb81095575cf26', '1', '系统设置-系统设置-菜单管理', '1', '2018-03-07 22:03:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ebadcf286c5744d9a299560716446ea5', '1', '系统设置-系统设置-字典管理', '1', '2018-03-07 22:26:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ec2e828705054cf286fda8a24b4a52da', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:49:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ec6cd1c3d7774eca81fa52811d2bf08d', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:23:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f074b0bfd8754ab0a01ba959ad593ca8', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-02-21 22:49:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=27', '');
INSERT INTO `sys_log` VALUES ('f1f421561139436f9dd71df5a923b4b1', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:35:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=84', '');
INSERT INTO `sys_log` VALUES ('f28fdf28cb8b40e1925f3743a588abeb', '1', '系统登录', '1', '2018-03-07 21:33:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f2e9c1b7c96e4d5bb884ef05a1c0d752', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 22:48:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f30fb424585e46e48fe99a21b7e68e98', '1', '我的面板-个人信息-个人信息', '1', '2018-03-07 22:13:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f38f3870a4dd4880b1e799290fde4ea1', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:38:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f3b29cf0cfcd49f59e0d7276da5fd6ce', '1', '直播系统-观众管理-观众黑名单', '1', '2017-07-23 17:23:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/roomBlacklist/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f488c4a7b76e4f70baf7f2018dbfac06', '1', '直播系统-直播管理-资料下载统计', '1', '2017-07-23 17:29:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/dataDownload/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f574ddbf495641de957bce321a14e759', '1', '系统登录', '1', '2017-07-23 21:00:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/admin/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f71a0c599ad54de9a3fe7cad70554987', '1', '系统设置-机构用户-用户管理', '1', '2018-03-07 22:20:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f7f7809fba1c4144bfedcb11c0e0a7dd', '2', '内容管理-栏目设置-切换站点', '1', '2018-03-07 22:26:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/site/select', 'GET', '', 'org.apache.jasper.JasperException: /WEB-INF/views/modules/cms/siteSelect.jsp (line: 23, column: 2) The attribute prefix [fnc] does not correspond to any imported tag library\r\n	at org.apache.jasper.compiler.DefaultErrorHandler.jspError(DefaultErrorHandler.java:41)\r\n	at org.apache.jasper.compiler.ErrorDispatcher.dispatch(ErrorDispatcher.java:275)\r\n	at org.apache.jasper.compiler.ErrorDispatcher.jspError(ErrorDispatcher.java:107)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor$1FVVisitor.visit(Validator.java:1590)\r\n	at org.apache.jasper.compiler.ELNode$Function.accept(ELNode.java:139)\r\n	at org.apache.jasper.compiler.ELNode$Nodes.visit(ELNode.java:214)\r\n	at org.apache.jasper.compiler.ELNode$Visitor.visit(ELNode.java:256)\r\n	at org.apache.jasper.compiler.ELNode$Root.accept(ELNode.java:61)\r\n	at org.apache.jasper.compiler.ELNode$Nodes.visit(ELNode.java:214)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor.validateFunctions(Validator.java:1609)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor.getJspAttribute(Validator.java:1378)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor.checkXmlAttributes(Validator.java:1231)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor.visit(Validator.java:879)\r\n	at org.apache.jasper.compiler.Node$CustomTag.accept(Node.java:1536)\r\n	at org.apache.jasper.compiler.Node$Nodes.visit(Node.java:2376)\r\n	at org.apache.jasper.compiler.Node$Visitor.visitBody(Node.java:2428)\r\n	at org.apache.jasper.compiler.Node$Visitor.visit(Node.java:2434)\r\n	at org.apache.jasper.compiler.Node$Root.accept(Node.java:464)\r\n	at org.apache.jasper.compiler.Node$Nodes.visit(Node.java:2376)\r\n	at org.apache.jasper.compiler.Validator.validateExDirectives(Validator.java:1853)\r\n	at org.apache.jasper.compiler.Compiler.generateJava(Compiler.java:217)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:356)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:336)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:323)\r\n	at org.apache.jasper.JspCompilationContext.compile(JspCompilationContext.java:585)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:363)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:396)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:340)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:291)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:239)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:720)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:466)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:391)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:318)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:622)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:291)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:239)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:239)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:239)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.thinkgem.jeesite.common.filter.AccessFilter.doFilter(AccessFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:239)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:239)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:217)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:106)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:502)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:142)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:79)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:616)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:88)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:518)\r\n	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1091)\r\n	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:673)\r\n	at org.apache.tomcat.util.net.AprEndpoint$SocketProcessor.doRun(AprEndpoint.java:2503)\r\n	at org.apache.tomcat.util.net.AprEndpoint$SocketProcessor.run(AprEndpoint.java:2492)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_log` VALUES ('f8516ede063a4ee8aee086c7be03ac75', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:21:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=20', '');
INSERT INTO `sys_log` VALUES ('f8c24af82b044d37a564a3def27ec064', '1', '系统设置-系统用户-用户管理', '1', '2018-02-21 23:50:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f96f568e40d342cfab7bf797bf9ada27', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:48:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f9a19da68a5f42d88fae5461c7681554', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-03-07 22:20:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/form', 'GET', 'id=20', '');
INSERT INTO `sys_log` VALUES ('f9d610237b03447e87722711957c3bcb', '1', '我的面板-个人信息-个人信息', '1', '2018-02-21 22:46:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f9f40f92ea354e6498dbedc0d130d132', '1', '系统设置-系统设置-菜单管理', '1', '2018-02-21 22:48:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fa122aaa27a84397b630c4d631294b50', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-03-07 22:20:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=21', '');
INSERT INTO `sys_log` VALUES ('faf584499dad4bfaa247400018a218dc', '1', '系统设置-系统设置-角色管理', '1', '2018-03-07 22:09:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fbdf23fe42104891a6eea08f1e8d5081', '1', '系统设置-系统用户-用户管理', '1', '2018-03-07 21:34:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fd0745e9d44247d4b2c32835ced6940a', '1', '直播系统-直播管理-直播房间', '1', '2018-02-21 22:53:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/live/room/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fea72e62d2f7404ca35893a5369a1963', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-02-21 22:49:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/sys/menu/delete', 'GET', 'id=22fcb71f7b0548e489e54e30cf2d0ddb', '');
INSERT INTO `sys_log` VALUES ('feb260358ecc413684285e2554510df0', '1', '内容管理-内容管理-内容发布', '1', '2018-03-07 22:25:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ffb06ff45f6c4796aaeeef910c930f9d', '1', '内容管理-内容管理-评论管理-查看', '1', '2018-03-07 22:26:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36', '/a/cms/comment/', 'GET', 'status=2', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `is_show` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_menu_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_menu_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', 0, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', 60, '/sys/dict/', NULL, 'th-list', '1', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', 40, NULL, NULL, NULL, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', 970, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', 900, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', 30, '/sys/user/list', '', 'user', '1', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2018-03-07 22:21:22', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', 40, NULL, NULL, NULL, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', 990, NULL, NULL, NULL, '0', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', 30, 'http://jeesite.com', '_blank', NULL, '0', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', 100, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', 30, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', 30, '/sys/user/info', NULL, 'user', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', 980, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', 40, '/sys/user/modifyPwd', NULL, 'lock', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', 500, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', 990, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', 30, '/cms/category/', NULL, 'align-justify', '1', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', 40, NULL, NULL, NULL, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', 40, '/cms/site/', NULL, 'certificate', '1', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', 40, NULL, NULL, NULL, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', 50, '/cms/site/select', NULL, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', 30, '/sys/menu/', NULL, 'list-alt', '1', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', 500, NULL, NULL, NULL, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', 30, '/cms/', NULL, 'briefcase', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', 40, '/cms/article/', NULL, 'file', '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', 40, NULL, NULL, NULL, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', 50, NULL, NULL, NULL, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', 60, '/cms/link/', NULL, 'random', '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', 40, NULL, NULL, NULL, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', 50, NULL, NULL, NULL, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', 40, '/cms/comment/?status=2', NULL, 'comment', '1', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', 40, NULL, NULL, NULL, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', 80, '/cms/guestbook/?status=2', NULL, 'glass', '1', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', 40, NULL, NULL, NULL, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', 90, '/../static/ckfinder/ckfinder.html', NULL, 'folder-open', '1', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', 40, NULL, NULL, NULL, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', 50, NULL, NULL, NULL, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', 40, NULL, NULL, NULL, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', 600, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', 30, '/cms/stats/article', NULL, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', 985, NULL, NULL, NULL, '1', NULL, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', 30, '/sys/log', NULL, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', 50, '/sys/role/', NULL, 'lock', '1', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', 90, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', 40, '/../druid', NULL, NULL, '1', NULL, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', 80, '/../static/map/map-city.html', NULL, NULL, '1', NULL, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', 40, NULL, NULL, NULL, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `enname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_role_del_flag`(`del_flag`) USING BTREE,
  INDEX `sys_role_enname`(`enname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('04c61e3615224a5ba9585ea303973aa1', '测试管理员', NULL, NULL, '8', '1', '1', '1', '2016-04-16 13:37:08', '1', '2016-10-19 10:37:45', '测试人员专用，请勿修改、删除，谢谢！', '0');
INSERT INTO `sys_role` VALUES ('1', '系统管理员', NULL, NULL, '8', '1', '1', '1', '2016-02-22 16:47:16', '1', '2016-08-09 16:05:31', '', '0');
INSERT INTO `sys_role` VALUES ('2', '运营人员', NULL, NULL, '1', '1', '1', '1', '2016-02-22 16:37:23', '1', '2016-07-28 10:43:07', '', '0');
INSERT INTO `sys_role` VALUES ('35b3c732fce74a69b6d24f83385f2c57', '市场主任', NULL, NULL, '8', '1', '1', '1', '2016-05-07 11:30:08', '1', '2016-05-20 09:41:11', '', '0');
INSERT INTO `sys_role` VALUES ('425a012a1aae44be9e2566015ca10204', '市场经理', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:21:11', '1', '2016-05-20 09:50:53', '', '0');
INSERT INTO `sys_role` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '产品经理', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:11:53', '1', '2016-04-29 17:27:14', '', '0');
INSERT INTO `sys_role` VALUES ('7745fab47242415491f305bf5002b92c', '销售经理', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:24:28', '1', '2016-04-19 17:47:26', '', '0');
INSERT INTO `sys_role` VALUES ('8bc4495ea9704f56a3c18bb06549d565', '市场资料', NULL, NULL, '8', '1', '1', '1', '2016-05-13 14:16:58', '1', '2016-05-13 14:36:40', '', '1');
INSERT INTO `sys_role` VALUES ('c9b4386d3ab34b93a2ab0c25184c2adb', '运营经理', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:23:20', '1', '2016-05-20 09:51:06', '', '0');
INSERT INTO `sys_role` VALUES ('d75e85db5e074fc485ca04ebf865a586', '技术', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:28:27', '1', '2016-04-16 15:28:27', '', '0');
INSERT INTO `sys_role` VALUES ('df38acf552a0443793446c2bcbd47d9a', '产品服务', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:18:06', '1', '2017-07-23 21:12:56', '', '0');
INSERT INTO `sys_role` VALUES ('ec3c9981df8a4e4d9d52663e0421ad19', '客服经理', NULL, NULL, '8', '1', '1', '1', '2016-05-20 09:46:39', '1', '2016-05-20 09:46:39', '', '0');
INSERT INTO `sys_role` VALUES ('f266ce77531b4a40a08548bbee9ed976', '推广部门', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:21:28', '1', '2016-04-27 11:32:47', '', '0');
INSERT INTO `sys_role` VALUES ('f34a591c206c4995951a9116fa050f35', '客服', NULL, NULL, '8', '1', '1', '1', '2016-04-16 15:20:06', '1', '2016-05-20 10:15:49', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色-菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '0a8f5ed704604503a13974d823e5150b');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '1');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '10');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '12');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '13');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '2');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '20');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '22');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '22fcb71f7b0548e489e54e30cf2d0ddb');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '26abc8b1ec764d93a2219bc791c10ae4');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '27');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '28');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '28b8ae99d0e248dfb0e186b6f09c39fb');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '29');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '29d429cc87a040288b7f9b0bdcb749e5');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '2ec897110add46949309f9ec45917338');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '2feb629ee13a4c4598b5c4c9578bb0e8');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '3');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '30');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '4');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '43a47ad0d3c4499ba637499caca6320b');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '451bf4b6c341447b89d78ee19edbfd5f');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '4d9730668e634e00b81c7ca00db5097c');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '56');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '57');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '58');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '59');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '6');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '67');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '68');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '6bfedca09fa0416ea70a756cd0b05de8');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '7');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '71');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '80c13a82a15b490f9efed00b097d5e73');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '836be71abdaf4f56b014a19601def3e6');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '84');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '84f9be930e1b45c0933f6e015ab76e5e');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '8befb28b8681428f8ae33e060a3f194f');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '9');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '939d2289195e42c5a701d70ca8e6ae9d');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', '9e72a8769d174d648e8aa675cee35b7e');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'a4975a92e7404f659f858cd5471c7b19');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'b0b63b5da531433d957c3520e51dc773');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'b83a3e8de12145dcae00fa0e2c8f0488');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'c241d463d36741f5a52e5a84821c2262');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'c835ca2eb0c04eaabecd94602e795eb8');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'cd146fed256d4282a118f36c5d6bf6bf');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'ce5b54b08d2f4c3c9b2789665d2409c4');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'd0e72fe52a3045babd4a8e23f0be87bb');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'd45cc10209bb4a89bec0d19e03132b38');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'df514c755492440dacb6802a6277a2b1');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'f1f06c12e3ca42ce94b90c8f273b65b6');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'f24ff408828049e0acea869e81794f9c');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'f3ad92d258ef462a8ff6da4c6c1610dc');
INSERT INTO `sys_role_menu` VALUES ('04c61e3615224a5ba9585ea303973aa1', 'fb4f0610c30b45508e8e92a5443bdea0');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '22fcb71f7b0548e489e54e30cf2d0ddb');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '4d9730668e634e00b81c7ca00db5097c');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '8befb28b8681428f8ae33e060a3f194f');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', 'b83a3e8de12145dcae00fa0e2c8f0488');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('35b3c732fce74a69b6d24f83385f2c57', '1');
INSERT INTO `sys_role_menu` VALUES ('35b3c732fce74a69b6d24f83385f2c57', '27');
INSERT INTO `sys_role_menu` VALUES ('35b3c732fce74a69b6d24f83385f2c57', '28');
INSERT INTO `sys_role_menu` VALUES ('35b3c732fce74a69b6d24f83385f2c57', '30');
INSERT INTO `sys_role_menu` VALUES ('425a012a1aae44be9e2566015ca10204', '1');
INSERT INTO `sys_role_menu` VALUES ('425a012a1aae44be9e2566015ca10204', '27');
INSERT INTO `sys_role_menu` VALUES ('425a012a1aae44be9e2566015ca10204', '28');
INSERT INTO `sys_role_menu` VALUES ('425a012a1aae44be9e2566015ca10204', '29');
INSERT INTO `sys_role_menu` VALUES ('425a012a1aae44be9e2566015ca10204', '30');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '1');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '13');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '1fc6890dc1b848a68ce7080958902381');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '2');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '20');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '22');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '27');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '28');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '29');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '30');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '56');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '57');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '58');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '59');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '67');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '68');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '71');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '7c14cb1761384ee19fe680c9a1b7d404');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', '84');
INSERT INTO `sys_role_menu` VALUES ('67ed35bbeb814fa8a9f130155d813bd1', 'd1aa8a2e358a4aaa9e3dc92ae0062fa7');
INSERT INTO `sys_role_menu` VALUES ('7745fab47242415491f305bf5002b92c', '1');
INSERT INTO `sys_role_menu` VALUES ('7745fab47242415491f305bf5002b92c', '27');
INSERT INTO `sys_role_menu` VALUES ('7745fab47242415491f305bf5002b92c', '28');
INSERT INTO `sys_role_menu` VALUES ('7745fab47242415491f305bf5002b92c', '29');
INSERT INTO `sys_role_menu` VALUES ('7745fab47242415491f305bf5002b92c', '30');
INSERT INTO `sys_role_menu` VALUES ('7745fab47242415491f305bf5002b92c', 'd1aa8a2e358a4aaa9e3dc92ae0062fa7');
INSERT INTO `sys_role_menu` VALUES ('8bc4495ea9704f56a3c18bb06549d565', '1');
INSERT INTO `sys_role_menu` VALUES ('8bc4495ea9704f56a3c18bb06549d565', '27');
INSERT INTO `sys_role_menu` VALUES ('8bc4495ea9704f56a3c18bb06549d565', '28');
INSERT INTO `sys_role_menu` VALUES ('8bc4495ea9704f56a3c18bb06549d565', '30');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '0a8f5ed704604503a13974d823e5150b');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '1');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '22fcb71f7b0548e489e54e30cf2d0ddb');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '28b8ae99d0e248dfb0e186b6f09c39fb');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '29d429cc87a040288b7f9b0bdcb749e5');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '2ec897110add46949309f9ec45917338');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '4d9730668e634e00b81c7ca00db5097c');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '6bfedca09fa0416ea70a756cd0b05de8');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '836be71abdaf4f56b014a19601def3e6');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '8befb28b8681428f8ae33e060a3f194f');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', '939d2289195e42c5a701d70ca8e6ae9d');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'a4975a92e7404f659f858cd5471c7b19');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'b0b63b5da531433d957c3520e51dc773');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'b83a3e8de12145dcae00fa0e2c8f0488');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'c241d463d36741f5a52e5a84821c2262');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'c835ca2eb0c04eaabecd94602e795eb8');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'cd146fed256d4282a118f36c5d6bf6bf');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'd0e72fe52a3045babd4a8e23f0be87bb');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'df514c755492440dacb6802a6277a2b1');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'f1f06c12e3ca42ce94b90c8f273b65b6');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'f3ad92d258ef462a8ff6da4c6c1610dc');
INSERT INTO `sys_role_menu` VALUES ('a860ae882ca3416b9516226e335cd11c', 'fb4f0610c30b45508e8e92a5443bdea0');
INSERT INTO `sys_role_menu` VALUES ('c9b4386d3ab34b93a2ab0c25184c2adb', '1');
INSERT INTO `sys_role_menu` VALUES ('c9b4386d3ab34b93a2ab0c25184c2adb', '27');
INSERT INTO `sys_role_menu` VALUES ('c9b4386d3ab34b93a2ab0c25184c2adb', '28');
INSERT INTO `sys_role_menu` VALUES ('c9b4386d3ab34b93a2ab0c25184c2adb', '29');
INSERT INTO `sys_role_menu` VALUES ('c9b4386d3ab34b93a2ab0c25184c2adb', '30');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '1');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '2');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '27');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '28');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '29');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '30');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '67');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '68');
INSERT INTO `sys_role_menu` VALUES ('d75e85db5e074fc485ca04ebf865a586', '84');
INSERT INTO `sys_role_menu` VALUES ('df38acf552a0443793446c2bcbd47d9a', '1');
INSERT INTO `sys_role_menu` VALUES ('df38acf552a0443793446c2bcbd47d9a', '27');
INSERT INTO `sys_role_menu` VALUES ('df38acf552a0443793446c2bcbd47d9a', '28');
INSERT INTO `sys_role_menu` VALUES ('df38acf552a0443793446c2bcbd47d9a', '29');
INSERT INTO `sys_role_menu` VALUES ('df38acf552a0443793446c2bcbd47d9a', '30');
INSERT INTO `sys_role_menu` VALUES ('ec3c9981df8a4e4d9d52663e0421ad19', '1');
INSERT INTO `sys_role_menu` VALUES ('ec3c9981df8a4e4d9d52663e0421ad19', '27');
INSERT INTO `sys_role_menu` VALUES ('ec3c9981df8a4e4d9d52663e0421ad19', '28');
INSERT INTO `sys_role_menu` VALUES ('ec3c9981df8a4e4d9d52663e0421ad19', '29');
INSERT INTO `sys_role_menu` VALUES ('ec3c9981df8a4e4d9d52663e0421ad19', '30');
INSERT INTO `sys_role_menu` VALUES ('f266ce77531b4a40a08548bbee9ed976', '1');
INSERT INTO `sys_role_menu` VALUES ('f266ce77531b4a40a08548bbee9ed976', '27');
INSERT INTO `sys_role_menu` VALUES ('f266ce77531b4a40a08548bbee9ed976', '28');
INSERT INTO `sys_role_menu` VALUES ('f266ce77531b4a40a08548bbee9ed976', '29');
INSERT INTO `sys_role_menu` VALUES ('f266ce77531b4a40a08548bbee9ed976', '30');
INSERT INTO `sys_role_menu` VALUES ('f266ce77531b4a40a08548bbee9ed976', 'd1aa8a2e358a4aaa9e3dc92ae0062fa7');
INSERT INTO `sys_role_menu` VALUES ('f34a591c206c4995951a9116fa050f35', '1');
INSERT INTO `sys_role_menu` VALUES ('f34a591c206c4995951a9116fa050f35', '27');
INSERT INTO `sys_role_menu` VALUES ('f34a591c206c4995951a9116fa050f35', '28');
INSERT INTO `sys_role_menu` VALUES ('f34a591c206c4995951a9116fa050f35', '29');
INSERT INTO `sys_role_menu` VALUES ('f34a591c206c4995951a9116fa050f35', '30');

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence`  (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列key',
  `next_id` int(9) NOT NULL DEFAULT 1 COMMENT '下一个可用值',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '序列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
INSERT INTO `sys_sequence` VALUES ('LiveUser', 2, '2016-10-14 16:22:37');
INSERT INTO `sys_sequence` VALUES ('sysUser', 138, '2016-10-15 16:29:11');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `login_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `user_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_user_login_name`(`login_name`) USING BTREE,
  INDEX `sys_user_update_date`(`update_date`) USING BTREE,
  INDEX `sys_user_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '0f4f6729665fb527debcc93bdb78c097af8aa4714998d27ef496274e', NULL, '超级管理员', '', '8675', '8675', '', '/userfiles/1/images/2016/08/s02.jpg', '127.0.0.1', '2018-03-07 22:34:54', '1', '1', '2013-05-27 08:00:00', '1', '2016-08-18 16:05:10', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('2', 'test', '102766ce4488f771184bf2e2f880f8feab8e7768b47d52e8edc6bf20', NULL, '系统管理员', NULL, '', '', '', '', '0:0:0:0:0:0:0:1', '2016-02-23 15:26:33', '1', '1', '2016-02-23 15:15:31', '1', '2016-02-23 15:19:43', '', '0');
INSERT INTO `sys_user` VALUES ('3', 'test1', '7a6775ad95bb868579e9b1b2e67667fbb2e9f0901a545e33fec056a9', NULL, '运营人员', NULL, '', '', '', '', '192.168.2.68', '2016-07-28 15:06:59', '1', '1', '2016-02-23 15:20:46', '1', '2016-03-09 17:40:10', '', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('100', '04c61e3615224a5ba9585ea303973aa1');
INSERT INTO `sys_user_role` VALUES ('101', 'df38acf552a0443793446c2bcbd47d9a');
INSERT INTO `sys_user_role` VALUES ('102', 'df38acf552a0443793446c2bcbd47d9a');
INSERT INTO `sys_user_role` VALUES ('103', 'ec3c9981df8a4e4d9d52663e0421ad19');
INSERT INTO `sys_user_role` VALUES ('104', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('105', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('106', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('107', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('108', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('109', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('110', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('111', '67ed35bbeb814fa8a9f130155d813bd1');
INSERT INTO `sys_user_role` VALUES ('112', '67ed35bbeb814fa8a9f130155d813bd1');
INSERT INTO `sys_user_role` VALUES ('113', 'c9b4386d3ab34b93a2ab0c25184c2adb');
INSERT INTO `sys_user_role` VALUES ('114', '7745fab47242415491f305bf5002b92c');
INSERT INTO `sys_user_role` VALUES ('115', '7745fab47242415491f305bf5002b92c');
INSERT INTO `sys_user_role` VALUES ('116', '7745fab47242415491f305bf5002b92c');
INSERT INTO `sys_user_role` VALUES ('117', '7745fab47242415491f305bf5002b92c');
INSERT INTO `sys_user_role` VALUES ('118', '7745fab47242415491f305bf5002b92c');
INSERT INTO `sys_user_role` VALUES ('119', '425a012a1aae44be9e2566015ca10204');
INSERT INTO `sys_user_role` VALUES ('120', 'f266ce77531b4a40a08548bbee9ed976');
INSERT INTO `sys_user_role` VALUES ('121', 'f266ce77531b4a40a08548bbee9ed976');
INSERT INTO `sys_user_role` VALUES ('123', 'df38acf552a0443793446c2bcbd47d9a');
INSERT INTO `sys_user_role` VALUES ('124', '35b3c732fce74a69b6d24f83385f2c57');
INSERT INTO `sys_user_role` VALUES ('125', '35b3c732fce74a69b6d24f83385f2c57');
INSERT INTO `sys_user_role` VALUES ('126', '35b3c732fce74a69b6d24f83385f2c57');
INSERT INTO `sys_user_role` VALUES ('127', '425a012a1aae44be9e2566015ca10204');
INSERT INTO `sys_user_role` VALUES ('128', '35b3c732fce74a69b6d24f83385f2c57');
INSERT INTO `sys_user_role` VALUES ('129', '35b3c732fce74a69b6d24f83385f2c57');
INSERT INTO `sys_user_role` VALUES ('130', 'f34a591c206c4995951a9116fa050f35');
INSERT INTO `sys_user_role` VALUES ('131', '35b3c732fce74a69b6d24f83385f2c57');
INSERT INTO `sys_user_role` VALUES ('132', '04c61e3615224a5ba9585ea303973aa1');
INSERT INTO `sys_user_role` VALUES ('136', '1');
INSERT INTO `sys_user_role` VALUES ('137', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');

SET FOREIGN_KEY_CHECKS = 1;
