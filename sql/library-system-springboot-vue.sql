-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3308
-- 生成日期： 2023-06-27 02:57:11
-- 服务器版本： 8.0.18
-- PHP 版本： 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `library-system-springboot-vue`
--

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图书编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `genre` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图书类型',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出版社',
  `create_time` date DEFAULT NULL COMMENT '出版时间',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0：未归还 1：已归还',
  `borrownum` int(11) NOT NULL COMMENT '此书被借阅次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `book`
--

INSERT INTO `book` (`id`, `isbn`, `name`, `genre`, `price`, `author`, `publisher`, `create_time`, `status`, `borrownum`) VALUES
(22, '9787513385453', '红楼梦', '文学', '39.80', '曹雪芹', '人民文学出版社', '2019-10-01', '1', 14),
(23, '9787544270873', '平凡的世界', '文学', '49.00', '路遥', '人民文学出版社', '2015-06-01', '1', 29),
(24, '9787530216777', '1984', '科幻', '35.00', '乔治·奥威尔', '上海译文出版社', '2018-03-01', '1', 29),
(25, '9787544258604', '三体', '科幻', '49.00', '刘慈欣', '重庆出版社', '2014-01-01', '1', 28),
(26, '9787544276363', '活着', '文学', '24.00', '余华', '作家出版社', '1998-05-01', '1', 27),
(27, '9787544253999', '哈利·波特与魔法石', '奇幻', '28.80', 'J.K.罗琳', '人民文学出版社', '2001-09-01', '1', 14),
(28, '9787559432608', '百年孤独', '文学', '36.00', '加西亚·马尔克斯', '南海出版公司', '2010-09-01', '1', 19),
(29, '9787550013247', '明朝那些事儿', '历史', '45.00', '当年明月', '湖南人民出版社', '2012-07-01', '1', 10),
(30, '9787513390655', '西游记', '文学', '29.80', '吴承恩', '人民文学出版社', '2019-12-01', '1', 15),
(31, '9787544769476', '围城', '文学', '29.80', '钱钟书', '人民文学出版社', '2018-07-01', '1', 11),
(32, '9787544291168', '追风筝的人', '小说', '39.50', '卡勒德·胡赛尼', '上海人民出版社', '2016-02-01', '1', 9),
(33, '9787536692930', '三国演义', '文学', '39.80', '罗贯中', '作家出版社', '2015-08-01', '1', 18),
(34, '9787559620183', '人类简史', '历史', '59.00', '尤瓦尔·赫拉利', '中信出版社', '2017-03-01', '1', 23),
(35, '9787536693968', '水浒传', '文学', '36.00', '施耐庵', '作家出版社', '2016-04-01', '1', 15),
(36, '9787544276325', '白夜行', '小说', '39.50', '东野圭吾', '南海出版公司', '2017-11-01', '1', 20),
(37, '9787544254170', '看见', '文学', '29.80', '柴静', '作家出版社', '2013-09-01', '1', 10),
(38, '9787544766499', '解忧杂货店', '小说', '39.50', '东野圭吾', '南海出版公司', '2014-06-01', '1', 13),
(39, '9787544273911', '天才在左，疯子在右', '心理学', '32.00', '高铭', '南海出版公司', '2015-12-01', '1', 16),
(40, '9787532739378', '雪国', '小说', '18.80', '川端康成', '上海译文出版社', '2011-10-01', '1', 8),
(43, '9787550033528', '简爱', '小说', '25.00', '夏洛蒂·勃朗特', '人民文学出版社', '2018-09-01', '1', 11),
(44, '9787532742187', '朝花夕拾', '文学', '16.80', '鲁迅', '上海译文出版社', '2008-06-01', '1', 14),
(45, '9787559620190', '未来简史', '科普', '59.00', '尤瓦尔·赫拉利', '中信出版社', '2019-07-01', '1', 17),
(47, '9787532739379', '秘密', '小说', '19.80', '卡夫卡', '上海译文出版社', '2009-02-01', '1', 13),
(49, '9787559432609', '霍乱时期的爱情', '小说', '39.80', '加西亚·马尔克斯', '南海出版公司', '2014-08-01', '1', 15),
(50, '9787513392857', '白鹿原', '文学', '42.80', '陈忠实', '人民文学出版社', '2019-11-01', '1', 12),
(51, '9787544280384', '挪威的森林', '小说', '36.80', '村上春树', '上海译文出版社', '2018-05-01', '1', 9),
(52, '9787530215671', '时间简史', '科普', '39.00', '斯蒂芬·霍金', '湖南科学技术出版社', '2017-03-01', '1', 18),
(53, '9787544267615', '傲慢与偏见', '小说', '26.00', '简·奥斯汀', '人民文学出版社', '2016-08-01', '1', 21),
(54, '9787559432622', '世界因你而不同', '励志', '38.00', '周迅', '南海出版公司', '2015-06-01', '1', 8),
(56, '9787530215672', '黑客与画家', '计算机类', '49.00', 'Paul Graham', '人民邮电出版社', '2013-04-01', '1', 13),
(57, '9787544270941', '红与黑', '小说', '28.00', '司汤达', '南海出版公司', '2012-01-01', '1', 25),
(58, '9787544260012', '高效能人士的七个习惯', '励志', '38.80', '史蒂芬·柯维', '中国青年出版社', '2011-09-01', '1', 10),
(59, '9787544260029', '论语', '哲学', '24.00', '孔子', '中国人民大学出版社', '2010-02-01', '1', 13),
(71, '9787544278917', '人类群星闪耀时', '心理学', '39.80', '塔莉·沃尔夫', '中信出版社', '2022-09-01', '1', 10),
(72, '9787544265000', '影响力', '心理学', '42.00', '罗伯特·西奥迪尼', '中国人民大学出版社', '2021-06-01', '1', 8),
(73, '9787532774599', '心理学与生活', '心理学', '56.80', '理查德·格里格', '中国人民大学出版社', '2020-04-01', '1', 15),
(74, '9787559432615', '斯坦福监狱实验', '心理学', '32.00', '菲利普·波尔特', '南海出版公司', '2019-01-01', '1', 12),
(75, '9787544265031', '孤独六讲', '心理学', '36.00', '赫尔曼·胡贝尔', '中国人民大学出版社', '2018-07-01', '1', 11),
(76, '9787532772915', '乌合之众', '心理学', '26.80', '古斯塔夫·勒庞', '中国人民大学出版社', '2017-03-01', '1', 14),
(77, '9787544282708', '失控', '心理学', '45.00', '凯文·凯利', '中信出版社', '2016-09-01', '1', 9),
(78, '9787544289493', '流感', '心理学', '38.00', '罗杰·多布森', '中信出版社', '2015-04-01', '1', 13),
(79, '9787532748331', '那些无法用言语表达的事物', '心理学', '29.80', '佚名', '上海译文出版社', '2014-01-01', '1', 16),
(80, '9787544270836', '小团队', '心理学', '32.00', '斯蒂芬·D.格拉泽', '南海出版公司', '2013-06-01', '1', 10);

-- --------------------------------------------------------

--
-- 表的结构 `bookwithuser`
--

DROP TABLE IF EXISTS `bookwithuser`;
CREATE TABLE IF NOT EXISTS `bookwithuser` (
  `id` bigint(20) NOT NULL COMMENT '读者id',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书编号',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图书名',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '读者姓名',
  `lendtime` datetime DEFAULT NULL COMMENT '借阅时间',
  `deadtime` datetime DEFAULT NULL COMMENT '应归还时间',
  `prolong` int(11) DEFAULT NULL COMMENT '续借次数',
  `debt` double NOT NULL DEFAULT '0' COMMENT '罚款金额',
  PRIMARY KEY (`book_name`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `lend_record`
--

DROP TABLE IF EXISTS `lend_record`;
CREATE TABLE IF NOT EXISTS `lend_record` (
  `reader_id` bigint(20) NOT NULL COMMENT '读者id',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图书编号',
  `bookname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书名',
  `lend_time` datetime DEFAULT NULL COMMENT '借书日期',
  `return_time` datetime DEFAULT NULL COMMENT '还书日期',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '0：未归还 1：已归还',
  `borrownum` int(11) NOT NULL COMMENT '此书被借阅次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `lend_record`
--

INSERT INTO `lend_record` (`reader_id`, `isbn`, `bookname`, `lend_time`, `return_time`, `status`, `borrownum`) VALUES
(26, '9787544270873', '平凡的世界', '2023-06-27 10:37:01', '2023-06-27 10:38:02', '1', 10),
(26, '9787530216777', '1984', '2023-06-27 10:37:44', '2023-06-27 10:38:01', '1', 17),
(26, '9787544258604', '三体', '2023-06-27 10:37:45', '2023-06-27 10:37:59', '1', 22),
(26, '9787544276363', '活着', '2023-06-27 10:37:46', '2023-06-27 10:37:57', '1', 26),
(29, '9787544270873', '平凡的世界', '2023-06-27 10:40:34', '2023-06-27 10:42:17', '1', 27),
(29, '9787530216777', '1984', '2023-06-27 10:40:35', '2023-06-27 10:42:19', '1', 27),
(29, '9787544258604', '三体', '2023-06-27 10:40:35', '2023-06-27 10:42:21', '1', 27),
(29, '9787544276363', '活着', '2023-06-27 10:40:36', '2023-06-27 10:42:23', '1', 27),
(29, '9787544253999', '哈利·波特与魔法石', '2023-06-27 10:40:37', '2023-06-27 10:42:25', '1', 14),
(29, '9787559432608', '百年孤独', '2023-06-27 10:40:40', '2023-06-27 10:42:26', '1', 18),
(29, '9787550013247', '明朝那些事儿', '2023-06-27 10:40:42', '2023-06-27 10:40:49', '1', 9),
(29, '9787513385453', '红楼梦', '2023-06-27 10:43:53', '2023-06-27 10:44:56', '1', 13),
(29, '9787544270873', '平凡的世界', '2023-06-27 10:43:54', '2023-06-27 10:44:54', '1', 28),
(29, '9787530216777', '1984', '2023-06-27 10:43:54', '2023-06-27 10:44:53', '1', 28),
(26, '9787513385453', '红楼梦', '2023-06-27 10:45:01', '2023-06-27 10:46:50', '1', 14),
(26, '9787544270873', '平凡的世界', '2023-06-27 10:45:02', '2023-06-27 10:47:49', '1', 29),
(26, '9787530216777', '1984', '2023-06-27 10:45:03', '2023-06-27 10:47:52', '1', 29),
(26, '9787544258604', '三体', '2023-06-27 10:45:04', '2023-06-27 10:47:56', '1', 28),
(29, '9787559432608', '百年孤独', '2023-06-27 10:45:11', '2023-06-27 10:48:03', '1', 19),
(29, '9787550013247', '明朝那些事儿', '2023-06-27 10:45:12', '2023-06-27 10:48:07', '1', 10),
(29, '9787513390655', '西游记', '2023-06-27 10:45:12', '2023-06-27 10:48:12', '1', 15);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `role` int(11) NOT NULL COMMENT '角色、1：图书管理员 2：学生 3: 教师 4: 系统管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nick_name`, `phone`, `sex`, `address`, `role`) VALUES
(26, '教师', 'e10adc3949ba59abbe56e057f20f883e', '教师', '1457475655', '男', '杭州师范大学', 3),
(27, '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', '4254536363', '男', '杭州师范大学', 4),
(28, '图书管理员', 'e10adc3949ba59abbe56e057f20f883e', '图书管理员', '653535345', '男', '杭州师范大学', 1),
(29, '薛雨晴', 'e10adc3949ba59abbe56e057f20f883e', '薛雨晴', '12343552', '女', '杭州师范大学', 2),
(30, '图书管理员2', 'e10adc3949ba59abbe56e057f20f883e', '图书管理员2', '195548455', '男', '杭州师范大学', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
