
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xxxtest_record
-- ----------------------------
DROP TABLE IF EXISTS `xxxtest_record`;
CREATE TABLE `xxxtest_record` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `app_id` varchar(255) DEFAULT NULL COMMENT '小程序AppId',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `has_finish` int(11) DEFAULT '0' COMMENT '是否测试完成（0  未完成   1  已完成）',
  `total_score` int(11) DEFAULT NULL COMMENT '总分',
  `type_sort` int(11) DEFAULT NULL COMMENT '类型排序',
  `main_title` varchar(255) DEFAULT NULL COMMENT '主标题',
  `main_lable_one` varchar(255) DEFAULT NULL COMMENT '主标签1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试记录表';
