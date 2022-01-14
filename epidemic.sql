/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50017
 Source Host           : localhost:3306
 Source Schema         : epidemic

 Target Server Type    : MySQL
 Target Server Version : 50017
 File Encoding         : 65001

 Date: 07/10/2021 16:14:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminPwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`adminID`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('林哈哈', '0000', '1111');

-- ----------------------------
-- Table structure for leavesheet
-- ----------------------------
DROP TABLE IF EXISTS `leavesheet`;
CREATE TABLE `leavesheet`  (
  `userID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `outDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `returnDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `outThing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `situation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`userID`, `state`, `outDate`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leavesheet
-- ----------------------------
INSERT INTO `leavesheet` VALUES ('919106840212', '2020-09-22 08:00:00', '2020-09-22 18:00:00', '审核拒绝', '物资购置', '无', '好久没出校了要发霉了都', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2021-09-10 15:15:59', '2021-09-15 15:16:04', '审核拒绝', '其他原因', '离宁', '啦啦啦啦', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2020-09-21 08:30:00', '2020-09-21 22:30:00', '审核通过', '物资购置', '无', '没有额外备注', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2021-09-30 16:21:38', '2021-10-01 16:21:41', '审核通过', '外出就医', '其他', '无', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2021-09-30 17:30:21', '2021-10-02 17:30:26', '审核通过', '请假返家', '其他', '无', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2021-09-30 17:39:53', '2021-10-16 17:39:58', '审核通过', '物资购置', '其他', '无', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2021-10-01 10:28:05', '2021-10-01 16:28:11', '审核通过', '物资购置', '其他', '呜呜呜', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2021-10-30 19:51:53', '2021-11-19 19:52:02', '审核通过', '外出就医', '重疾', '无', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840212', '2021-10-06 23:39:10', '2021-10-07 23:39:14', '待审核', '请假返家', '外宿', '无', '周运莲');
INSERT INTO `leavesheet` VALUES ('919106840501', '2020-09-20 08:30:00', '2020-09-20 20:30:00', '审核通过', '外出就医', '无', '当天无法返校', '蔡瑾瑶');
INSERT INTO `leavesheet` VALUES ('919106840501', '2021-07-01 18:00:00', '2021-08-01 18:00:00', '审核通过', '请假返家', '离宁', '暑假回家', '蔡瑾瑶');
INSERT INTO `leavesheet` VALUES ('919106840501', '2021-09-03 15:21:04', '2021-09-28 18:21:08', '审核通过', '请假返家', '外宿', '希望尽快审核，非常感谢', '蔡瑾瑶');
INSERT INTO `leavesheet` VALUES ('919106840501', '2021-09-28 15:25:11', '2021-09-29 15:25:15', '审核通过', '物资购置', '离宁', '无', '蔡瑾瑶');
INSERT INTO `leavesheet` VALUES ('919106840501', '2021-09-29 22:59:11', '2021-10-03 10:59:16', '审核通过', '其他原因', '离宁', '参加重要比赛，为了赶飞机，需要辅导员尽快审核', '蔡瑾瑶');
INSERT INTO `leavesheet` VALUES ('919106840501', '2021-10-02 10:48:36', '2021-10-03 10:48:44', '审核通过', '物资购置', '无', '没有', '蔡瑾瑶');
INSERT INTO `leavesheet` VALUES ('919106840801', '2021-09-30 15:46:17', '2021-09-30 20:46:24', '审核拒绝', '请假返家', '其他', '无', '赵一一');
INSERT INTO `leavesheet` VALUES ('919106840801', '2021-09-29 15:21:55', '2021-09-29 19:22:00', '审核通过', '物资购置', '无', '没有', '赵一一');
INSERT INTO `leavesheet` VALUES ('919106840801', '2021-09-30 16:20:58', '2021-09-30 22:21:03', '审核通过', '物资购置', '其他', '好像出去吃好吃的啊啊啊啊啊，能不能放我出去', '赵一一');
INSERT INTO `leavesheet` VALUES ('919106840802', '2021-09-29 20:46:59', '2021-10-28 01:47:05', '审核通过', '请假返家', '无', '休学不读了', '钱二二');
INSERT INTO `leavesheet` VALUES ('919106840803', '2021-10-09 15:51:37', '2021-10-31 15:51:44', '待审核', '请假返家', '重疾', '生病请假', '孙三三');
INSERT INTO `leavesheet` VALUES ('919106840804', '2021-09-29 12:54:08', '2021-09-29 18:54:14', '审核拒绝', '外出就医', '其他', '希望尽快审核,非常感谢', '林秀香');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `noticeID` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `noticeContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `outTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`noticeID`)
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (2, '关于返校的重要提醒', '1、请同学们返校时，必须持登机/登车前48小时内的核酸检测报告，到校时会检查（可以是电子版，或者纸质版）。年级将在明天晚上23:00统计没有进行核酸检测的同学名单。</br>2、请同学们返校途中做好防护工作，一定注意安全！', '2020-09-20 09:22:21');
INSERT INTO `notice` VALUES (4, '国庆放假通知', '各位教学单位、江阴校区：\r\n\r\n根据学校《关于2021年国庆节及2022年寒假放假安排调整的通知》（南理工办〔2021〕228号）文件精神，现将2021年国庆节放假停课安排通知如下：\r\n\r\n10月1日至3日全校放假、停课, 10月4日至10日正常上第7周课程。\r\n\r\n停课的教师可自行与学生商定时间后通过在线教学进行补课，也可待恢复线下教学后通过“网上调课申请”确定补课时间与教室。\r\n&emsp;&emsp;\r\n', '2020-09-23 10:00:00');
INSERT INTO `notice` VALUES (7, '关于填写学年总结评议', '请全体同学在9月22日中午12:00前使用智慧理工平台上的“学生综合素质测评表”应用在线填写，完成2020-2021学年总结评议。请同学们认真对待，这个材料在同学们毕业时会打印存入同学们的档案袋，并跟随大家一生。', '2021-09-25 23:29:40');
INSERT INTO `notice` VALUES (44, '发布测试一', '内容tttttt', '2021-09-30 19:51:01');
INSERT INTO `notice` VALUES (45, '关于奖学金的评选', '关于国家奖学金、国家励志奖学金、国家助学金评选通知已经上传群文件，请同学们根据自身情况在10月10日前在在系统上完成申请工作，同时申请国家奖学金的同学认真填写通知中的表格，于10月10日前将表格发给学生会副主席', '2021-10-06 23:31:05');
INSERT INTO `notice` VALUES (46, '志愿者招募通知', '南京市2021级大学新生开学典礼将在我校举行，现招募志愿者，希望符合招募要求的同学积极参与，展现我们南理工学子积极的形象和热情！截止时间十月六日，将报名信息表发给我，命名格式学号+姓名', '2021-10-06 23:32:02');
INSERT INTO `notice` VALUES (47, '疫情提醒通知', '10月3日，新疆伊犁州霍尔果斯市在三天1次常规核酸检测中，发现2人核酸检测结果呈阳性，经专家诊断均为新冠肺炎无症状感染者。\r\n根据最新要求，现对9月19日以来有新疆伊犁州霍尔果斯市旅居史的人员，与确诊病例（含无症状感染者）有轨迹交叉的人员进行排查，请相关同学立刻私聊', '2021-10-06 23:32:27');

-- ----------------------------
-- Table structure for reportin
-- ----------------------------
DROP TABLE IF EXISTS `reportin`;
CREATE TABLE `reportin`  (
  `userID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `temperature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isSick` int(255) NULL DEFAULT NULL,
  `reportTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`userID`, `reportTime`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reportin
-- ----------------------------
INSERT INTO `reportin` VALUES ('919106840212', '36.1', 0, '2021-09-15 08:47:29');
INSERT INTO `reportin` VALUES ('919106840212', '36.8', 0, '2021-09-21 11:53:00');
INSERT INTO `reportin` VALUES ('919106840212', '36.0', 0, '2021-09-22 12:01:51');
INSERT INTO `reportin` VALUES ('919106840212', '36.2', 0, '2021-09-27 14:14:28');
INSERT INTO `reportin` VALUES ('919106840212', '36.2', 0, '2021-09-28 00:44:45');
INSERT INTO `reportin` VALUES ('919106840212', '36.3', 0, '2021-09-29 15:09:03');
INSERT INTO `reportin` VALUES ('919106840212', '36.2', 0, '2021-09-30 18:50:57');
INSERT INTO `reportin` VALUES ('919106840212', '36.0', 0, '2021-10-06 23:39:28');
INSERT INTO `reportin` VALUES ('919106840212', '36.1', 0, '2021-10-07 00:06:09');
INSERT INTO `reportin` VALUES ('919106840501', '36.2', 0, '2021-09-23 09:30:44');
INSERT INTO `reportin` VALUES ('919106840501', '36.2', 0, '2021-09-28 10:47:52');
INSERT INTO `reportin` VALUES ('919106840501', '36.6', 0, '2021-10-07 00:06:42');
INSERT INTO `reportin` VALUES ('919106840801', '36.3', 0, '2021-09-28 20:45:48');
INSERT INTO `reportin` VALUES ('919106840801', '36.3', 0, '2021-10-06 23:42:40');
INSERT INTO `reportin` VALUES ('919106840801', '36.8', 0, '2021-10-07 00:07:30');
INSERT INTO `reportin` VALUES ('919106840802', '36.0', 0, '2021-09-30 15:48:02');
INSERT INTO `reportin` VALUES ('919106840802', '36.0', 0, '2021-10-06 23:26:26');
INSERT INTO `reportin` VALUES ('919106840802', '36.7', 0, '2021-10-06 23:43:02');
INSERT INTO `reportin` VALUES ('919106840802', '36.2', 0, '2021-10-06 23:43:10');
INSERT INTO `reportin` VALUES ('919106840802', '36.3', 0, '2021-10-07 00:03:34');
INSERT INTO `reportin` VALUES ('919106840803', '36.4', 0, '2021-09-30 15:51:14');
INSERT INTO `reportin` VALUES ('919106840803', '36.0', 0, '2021-10-07 00:22:46');
INSERT INTO `reportin` VALUES ('919106840804', '36.5', 0, '2021-10-07 00:23:09');
INSERT INTO `reportin` VALUES ('919106840805', '36.3', 0, '2021-09-30 15:55:13');
INSERT INTO `reportin` VALUES ('919106840805', '36.4', 0, '2021-10-07 00:23:40');
INSERT INTO `reportin` VALUES ('919106840806', '36.0', 0, '2021-10-07 00:24:14');
INSERT INTO `reportin` VALUES ('919106840807', '36.2', 0, '2021-09-30 19:53:25');

-- ----------------------------
-- Table structure for reportout
-- ----------------------------
DROP TABLE IF EXISTS `reportout`;
CREATE TABLE `reportout`  (
  `userID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `temperature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isSick` int(255) NULL DEFAULT NULL,
  `reportTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `codeState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dosage` int(255) NULL DEFAULT NULL,
  `isIsolated` int(255) NULL DEFAULT NULL,
  `isDangerous` int(255) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extraInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`userID`, `reportTime`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reportout
-- ----------------------------
INSERT INTO `reportout` VALUES ('919106840212', '36.2', 0, '2021-09-16 09:22:20', '绿码', 1, 0, 0, '四川省达州市', '无');
INSERT INTO `reportout` VALUES ('919106840212', '36.0', 0, '2021-09-16 11:05:16', '绿码', 1, 0, 0, '四川省达州市大竹县', '没有');
INSERT INTO `reportout` VALUES ('919106840212', '36.2', 0, '2021-09-17 09:44:20', '绿码', 1, 0, 0, '四川省达州市', '无');
INSERT INTO `reportout` VALUES ('919106840212', '36.0', 0, '2021-09-24 23:53:03', '绿码', 2, 0, 0, '四川省达州市大竹县xx小区', '无');
INSERT INTO `reportout` VALUES ('919106840212', '36.0', 0, '2021-09-24 23:57:49', '绿码', 0, 0, 0, '四川省达州市大竹县xx小区', '无');
INSERT INTO `reportout` VALUES ('919106840212', '36.0', 0, '2021-09-24 23:59:13', '绿码', 0, 0, 0, '四川省达州市大竹县xx小区', '没有');
INSERT INTO `reportout` VALUES ('919106840212', '36.0', 0, '2021-09-25 00:01:04', '绿码', 0, 0, 0, '四川省达州市大竹县xx小区', '没有');
INSERT INTO `reportout` VALUES ('919106840212', '36.4', 0, '2021-09-25 15:16:03', '绿码', 1, 0, 0, '四川省达州市大竹县xx小区xx号', '无');
INSERT INTO `reportout` VALUES ('919106840212', '36.3', 0, '2021-09-25 23:49:30', '绿码', 1, 0, 0, '四川省达州市大竹县xx小区xx号', '想开学啊');
INSERT INTO `reportout` VALUES ('919106840212', '36.4', 0, '2021-09-26 17:38:41', '绿码', 2, 0, 0, '四川省达州市大竹县xx小区xx号', '课设代码好多哇哇哇呜呜呜');
INSERT INTO `reportout` VALUES ('919106840501', '36.2', 0, '2021-09-30 18:52:12', '绿码', 1, 0, 0, '江苏省南京市秦淮区', '无');
INSERT INTO `reportout` VALUES ('919106840801', '36.4', 0, '2021-09-29 15:09:39', '绿码', 1, 0, 0, '河北省石家庄市xxx区', '没有');
INSERT INTO `reportout` VALUES ('919106840801', '36.2', 0, '2021-09-30 15:45:39', '绿码', 2, 0, 0, '江苏省南京市', '无');
INSERT INTO `reportout` VALUES ('919106840802', '36.2', 0, '2021-09-29 20:45:32', '绿码', 1, 0, 0, '湖南省长沙市xx区xx街道', '没有，我很好，写完课设太开心啦');
INSERT INTO `reportout` VALUES ('919106840804', '36.0', 0, '2021-09-30 15:53:02', '绿码', 1, 0, 0, '江苏省南京市秦淮区', '没有，我很好，不用担心吼吼吼');
INSERT INTO `reportout` VALUES ('919106840806', '36.3', 0, '2021-09-30 15:58:28', '绿码', 2, 0, 0, '江苏省南京市秦淮区', '终于要写完代码了，开心');
INSERT INTO `reportout` VALUES ('919106840808', '36.2', 0, '2021-09-30 19:54:06', '绿码', 1, 0, 0, '江苏省南京市秦淮区', '无');
INSERT INTO `reportout` VALUES ('919106840811', '36.3', 0, '2021-10-07 00:08:20', '绿码', 2, 0, 0, '福建省福州市', '无');
INSERT INTO `reportout` VALUES ('919106840812', '36.2', 0, '2021-10-07 00:16:28', '绿码', 1, 0, 0, '四川省成都市', '课设报告要写好多呀');
INSERT INTO `reportout` VALUES ('919106840813', '36.4', 0, '2021-10-07 00:17:30', '绿码', 2, 0, 0, '江苏省盐城市', '我还是好喜欢他噢');
INSERT INTO `reportout` VALUES ('919106840814', '36.2', 0, '2021-10-07 00:19:29', '绿码', 2, 0, 0, '广东省广州市', '好好学习');
INSERT INTO `reportout` VALUES ('919106840815', '36.7', 0, '2021-10-07 00:20:30', '绿码', 2, 0, 0, '福建省福州市', '感觉学到很多');
INSERT INTO `reportout` VALUES ('919106840816', '36.5', 0, '2021-10-07 00:21:31', '绿码', 2, 0, 0, '四川省成都市锦江区', '没有呐');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `classNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `userPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`userID`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('周运莲', '0000', '919106840212', '软工一班', '18852004148');
INSERT INTO `user` VALUES ('蔡瑾瑶', '0000', '919106840501', '软工一班', '18852004145');
INSERT INTO `user` VALUES ('赵一一', '0000', '919106840801', '软工一班', '19999999999');
INSERT INTO `user` VALUES ('钱二二', '0000', '919106840802', '软工一班', '22222222222');
INSERT INTO `user` VALUES ('孙三三', '0000', '919106840803', '软工一班', '33333333333');
INSERT INTO `user` VALUES ('林秀香', '0000', '919106840804', '计科一班', '19485735677');
INSERT INTO `user` VALUES ('张婷婷', '0000', '919106840805', '计科一班', '18855667464');
INSERT INTO `user` VALUES ('刘晓宇', '0000', '919106840806', '网安一班', '10948573945');
INSERT INTO `user` VALUES ('李四四', '0000', '919106840807', '智能一班', '44444444444');
INSERT INTO `user` VALUES ('林零零', '0000', '919106840808', '智能一班', '13355882931');
INSERT INTO `user` VALUES ('张星星', '0000', '919106840809', '网安一班', '18374692630');
INSERT INTO `user` VALUES ('刘潇潇', '0000', '919106840810', '智能一班', '10495837593');
INSERT INTO `user` VALUES ('学生1', '0000', '919106840811', '软工一班', '18273666663');
INSERT INTO `user` VALUES ('学生2', '0000', '919106840812', '软工一班', '18273666664');
INSERT INTO `user` VALUES ('学生3', '0000', '919106840813', '软工一班', '18273666665');
INSERT INTO `user` VALUES ('学生4', '0000', '919106840814', '智能一班', '18273666666');
INSERT INTO `user` VALUES ('学生5', '0000', '919106840815', '网安一班', '10000000000');
INSERT INTO `user` VALUES ('学生6', '0000', '919106840816', '计科一班', '17272727272');
INSERT INTO `user` VALUES ('学生7', '0000', '919106840817', '计科一班', '17272727273');
INSERT INTO `user` VALUES ('学生8', '0000', '919106840818', '网安一班', '17272727274');
INSERT INTO `user` VALUES ('学生9', '0000', '919106840819', '网安一班', '17272727275');
INSERT INTO `user` VALUES ('学生10', '0000', '919106840820', '智能一班', '17272727276');
INSERT INTO `user` VALUES ('添加一', '0000', '919106840888', '软工一班', '17373737373');

SET FOREIGN_KEY_CHECKS = 1;
