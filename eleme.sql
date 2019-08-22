/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : eleme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-08-22 13:57:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cardinfo`
-- ----------------------------
DROP TABLE IF EXISTS `cardinfo`;
CREATE TABLE `cardinfo` (
  `icon` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL DEFAULT '',
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cardinfo
-- ----------------------------
INSERT INTO `cardinfo` VALUES ('/static/images/1.jpg', 'card1', '午餐');
INSERT INTO `cardinfo` VALUES ('/static/images/6.jpg', 'card10', '签到领红包');
INSERT INTO `cardinfo` VALUES ('/static/images/2.jpg', 'card2', '卖场便利');
INSERT INTO `cardinfo` VALUES ('/static/images/3.jpg', 'card3', '水果');
INSERT INTO `cardinfo` VALUES ('/static/images/4.jpg', 'card4', '跑腿代购');
INSERT INTO `cardinfo` VALUES ('/static/images/5.jpg', 'card5', '甜品饮品');
INSERT INTO `cardinfo` VALUES ('/static/images/6.jpg', 'card6', '星选好店');
INSERT INTO `cardinfo` VALUES ('/static/images/3.jpg', 'card7', '送药上门');
INSERT INTO `cardinfo` VALUES ('/static/images/4.jpg', 'card8', '大牌惠吃');
INSERT INTO `cardinfo` VALUES ('/static/images/5.jpg', 'card9', '取送件');

-- ----------------------------
-- Table structure for `chatmsg`
-- ----------------------------
DROP TABLE IF EXISTS `chatmsg`;
CREATE TABLE `chatmsg` (
  `sender_id` varchar(10) DEFAULT NULL,
  `receiver_id` varchar(10) DEFAULT NULL,
  `chat_msg` varchar(255) DEFAULT NULL,
  `id` varchar(20) NOT NULL,
  `sgin_flag` set('撤回','已读','待读') DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chatmsg
-- ----------------------------
INSERT INTO `chatmsg` VALUES ('0', '1', 'fddsbvbv', '1908110PBDSMF1S8', '已读', '2019-08-11 01:01:17');
INSERT INTO `chatmsg` VALUES ('1', '0', 'dfab', '1908110PDZTFZHH0', '已读', '2019-08-11 01:01:33');
INSERT INTO `chatmsg` VALUES ('1', '0', 's', '1908117Z1C4P1CDP', '已读', '2019-08-11 11:09:43');
INSERT INTO `chatmsg` VALUES ('1', '0', 's', '1908117Z1HN5K6Y8', '已读', '2019-08-11 11:09:44');
INSERT INTO `chatmsg` VALUES ('1', '0', 's', '1908117Z1PFXPWSW', '已读', '2019-08-11 11:09:45');
INSERT INTO `chatmsg` VALUES ('1', '0', 's', '1908117Z1W3NB354', '已读', '2019-08-11 11:09:45');
INSERT INTO `chatmsg` VALUES ('0', '1', 'fdafgf', '1908117Z7APC446W', '已读', '2019-08-11 11:10:21');
INSERT INTO `chatmsg` VALUES ('0', '1', 'fvxcbcv', '190811832WDC4H00', '已读', '2019-08-11 11:21:53');
INSERT INTO `chatmsg` VALUES ('0', '1', 'fvxcbcv', '190811833PTNCS5P', '已读', '2019-08-11 11:21:58');
INSERT INTO `chatmsg` VALUES ('0', '1', '的功夫', '190811844AG453MW', '已读', '2019-08-11 11:25:02');
INSERT INTO `chatmsg` VALUES ('1', '0', '官方', '190811849B28CWDP', '已读', '2019-08-11 11:25:35');
INSERT INTO `chatmsg` VALUES ('1', '0', '覆盖', '19081184W3NWW8DP', '已读', '2019-08-11 11:27:09');
INSERT INTO `chatmsg` VALUES ('1', '0', '', '19081184W82TDKP0', '已读', '2019-08-11 11:27:10');
INSERT INTO `chatmsg` VALUES ('1', '0', '盎格', '19081184WTP1BY14', '已读', '2019-08-11 11:27:14');
INSERT INTO `chatmsg` VALUES ('1', '0', '', '19081184X1FP958H', '已读', '2019-08-11 11:27:15');
INSERT INTO `chatmsg` VALUES ('1', '0', '士大夫', '19081184XMGXADGC', '已读', '2019-08-11 11:27:19');
INSERT INTO `chatmsg` VALUES ('1', '0', '地方', '19081184Z5TAHSW0', '已读', '2019-08-11 11:27:29');
INSERT INTO `chatmsg` VALUES ('1', '0', '地方', '190811850068WSW0', '已读', '2019-08-11 11:27:34');
INSERT INTO `chatmsg` VALUES ('1', '0', '地方', '190811855Z1YR5KP', '已读', '2019-08-11 11:28:13');
INSERT INTO `chatmsg` VALUES ('1', '0', '地方', '190811856WS9ZBMW', '已读', '2019-08-11 11:28:19');
INSERT INTO `chatmsg` VALUES ('1', '0', '大师傅', '19081185FKBR884H', '已读', '2019-08-11 11:29:08');
INSERT INTO `chatmsg` VALUES ('1', '0', '大师傅', '19081185GX63N2FW', '已读', '2019-08-11 11:29:17');
INSERT INTO `chatmsg` VALUES ('0', '1', '的高发士大夫', '19081185P71593MW', '已读', '2019-08-11 11:29:45');
INSERT INTO `chatmsg` VALUES ('0', '1', '通风和', '19081185PZ1D884H', '已读', '2019-08-11 11:29:49');
INSERT INTO `chatmsg` VALUES ('0', '1', '地方官大使馆地方', '19081187FYY3FK40', '已读', '2019-08-11 11:35:11');
INSERT INTO `chatmsg` VALUES ('0', '1', '懂算法', '19081187GGHT40M8', '已读', '2019-08-11 11:35:15');
INSERT INTO `chatmsg` VALUES ('0', '1', '地方', '19081187GWY92Z7C', '已读', '2019-08-11 11:35:17');
INSERT INTO `chatmsg` VALUES ('0', '1', '的方式', '1908118A0XWF4F14', '已读', '2019-08-11 11:42:41');
INSERT INTO `chatmsg` VALUES ('0', '1', '发的', '1908118A4M4AAWZC', '已读', '2019-08-11 11:43:05');
INSERT INTO `chatmsg` VALUES ('0', '1', '地方', '1908118AAKNKH4X4', '已读', '2019-08-11 11:43:44');
INSERT INTO `chatmsg` VALUES ('0', '1', '人', '190811BK34G666A8', '已读', '2019-08-11 16:16:09');
INSERT INTO `chatmsg` VALUES ('0', '1', '通用', '190811BK4D5HR3MW', '已读', '2019-08-11 16:16:18');
INSERT INTO `chatmsg` VALUES ('0', '1', '是', '190811BK97GTFSA8', '已读', '2019-08-11 16:16:48');
INSERT INTO `chatmsg` VALUES ('0', '1', '二', '190811BKK531P2K4', '已读', '2019-08-11 16:17:39');
INSERT INTO `chatmsg` VALUES ('0', '1', '嗯嗯', '190811BM9G64Z828', '已读', '2019-08-11 16:19:50');
INSERT INTO `chatmsg` VALUES ('0', '1', '嗯嗯', '190811BMAFW5C754', '已读', '2019-08-11 16:19:57');
INSERT INTO `chatmsg` VALUES ('0', '1', '嗯嗯', '190811BMB0R0TPSW', '已读', '2019-08-11 16:20:00');
INSERT INTO `chatmsg` VALUES ('0', '1', '士大夫', '190811BNZ889BTC0', '已读', '2019-08-11 16:24:45');
INSERT INTO `chatmsg` VALUES ('0', '1', '是', '190811BZB7MF037C', '已读', '2019-08-11 16:47:03');
INSERT INTO `chatmsg` VALUES ('0', '1', '方法', '190811BZCX37BSRP', '已读', '2019-08-11 16:47:13');
INSERT INTO `chatmsg` VALUES ('0', '1', '的', '190811BZF4PKXPM8', '已读', '2019-08-11 16:47:21');
INSERT INTO `chatmsg` VALUES ('0', '1', '', '190811BZF7ZG5PZC', '已读', '2019-08-11 16:47:22');
INSERT INTO `chatmsg` VALUES ('0', '1', '的v', '190811BZZFABHR68', '已读', '2019-08-11 16:48:47');
INSERT INTO `chatmsg` VALUES ('0', '1', '问我', '190811C19TDG0K8H', '已读', '2019-08-11 16:52:54');
INSERT INTO `chatmsg` VALUES ('0', '1', '是谁', '190811C26XXF158H', '已读', '2019-08-11 16:55:35');
INSERT INTO `chatmsg` VALUES ('0', '1', '是谁', '190811C3NMN2CSFW', '已读', '2019-08-11 16:59:57');
INSERT INTO `chatmsg` VALUES ('0', '1', '订单', '190811C3PBW7M0DP', '已读', '2019-08-11 17:00:02');
INSERT INTO `chatmsg` VALUES ('0', '1', '我', '190811C3TM1NFAK4', '已读', '2019-08-11 17:00:23');
INSERT INTO `chatmsg` VALUES ('0', '1', '谷歌', '190811C3X47XWMK4', '已读', '2019-08-11 17:00:33');
INSERT INTO `chatmsg` VALUES ('0', '1', '阿瑟东', '190811C4W0Z8DDD4', '已读', '2019-08-11 17:03:26');
INSERT INTO `chatmsg` VALUES ('0', '1', '啊是的撒从十大vv', '190811C4WFGPD494', '已读', '2019-08-11 17:03:29');
INSERT INTO `chatmsg` VALUES ('0', '1', '大锅饭', '190811C4Y38AXSY8', '已读', '2019-08-11 17:03:39');
INSERT INTO `chatmsg` VALUES ('0', '1', '1', '190811C52R3RX2A8', '已读', '2019-08-11 17:04:09');
INSERT INTO `chatmsg` VALUES ('0', '1', '2', '190811C52YH2RZTC', '已读', '2019-08-11 17:04:10');
INSERT INTO `chatmsg` VALUES ('0', '1', '3', '190811C534YZD5YW', '已读', '2019-08-11 17:04:12');
INSERT INTO `chatmsg` VALUES ('0', '1', '如果发红包', '190811C72FGBCWSW', '已读', '2019-08-11 17:10:08');
INSERT INTO `chatmsg` VALUES ('1', '0', 'hi', '190811C7KTKHX1AW', '已读', '2019-08-11 17:11:46');
INSERT INTO `chatmsg` VALUES ('5', '0', 'heihei', '190811C7MZZNWA3C', '已读', '2019-08-11 17:11:54');
INSERT INTO `chatmsg` VALUES ('0', '1', '对对，就是', '190811C840DNYF5P', '已读', '2019-08-11 17:13:17');
INSERT INTO `chatmsg` VALUES ('6', '0', 'fds', '190811CBYYG55DS8', '已读', '2019-08-11 17:24:45');
INSERT INTO `chatmsg` VALUES ('6', '0', '数数索', '190811CZ5NZ582Y8', '已读', '2019-08-11 18:10:31');
INSERT INTO `chatmsg` VALUES ('6', '0', '是谁', '190811CZ9F7TD39P', '已读', '2019-08-11 18:10:56');
INSERT INTO `chatmsg` VALUES ('6', '0', '对对', '190811CZRSHN2RAW', '已读', '2019-08-11 18:12:15');
INSERT INTO `chatmsg` VALUES ('6', '0', '是谁', '190811CZWF140000', '已读', '2019-08-11 18:12:32');
INSERT INTO `chatmsg` VALUES ('6', '0', 'sdf', '190811D1MFK4P46W', '已读', '2019-08-11 18:17:54');
INSERT INTO `chatmsg` VALUES ('6', '0', 'dsgdfb', '190811D1N6Y9R77C', '已读', '2019-08-11 18:17:59');
INSERT INTO `chatmsg` VALUES ('6', '0', 'df', '190811D22XRCXMA8', '已读', '2019-08-11 18:19:14');
INSERT INTO `chatmsg` VALUES ('6', '0', 'dfg', '190811D23MNH5XWH', '已读', '2019-08-11 18:19:19');
INSERT INTO `chatmsg` VALUES ('6', '0', 'rfrg', '190811D2D2BN6KS8', '已读', '2019-08-11 18:20:19');
INSERT INTO `chatmsg` VALUES ('1', '0', 'dfd', '190811D2Y72S4F14', '已读', '2019-08-11 18:21:44');
INSERT INTO `chatmsg` VALUES ('1', '0', 'er', '190811D3SYA5KH28', '已读', '2019-08-11 18:24:23');
INSERT INTO `chatmsg` VALUES ('1', '0', 'sda', '190811D43Z1RNB0H', '已读', '2019-08-11 18:25:21');
INSERT INTO `chatmsg` VALUES ('1', '0', 'sda', '190811D4965BHX40', '已读', '2019-08-11 18:25:55');
INSERT INTO `chatmsg` VALUES ('1', '0', 'erfd', '190811D4ZDBA1968', '已读', '2019-08-11 18:27:52');
INSERT INTO `chatmsg` VALUES ('1', '0', 'daf', '190811D57TC508SW', '已读', '2019-08-11 18:28:46');
INSERT INTO `chatmsg` VALUES ('6', '0', 'sdf', '190811D5DA5550PH', '已读', '2019-08-11 18:29:21');
INSERT INTO `chatmsg` VALUES ('1', '0', 'qetvefacdjsavdgiw, trgjadmcxwuhafnv rdfv', '190811D5ZC34HWSW', '已读', '2019-08-11 18:30:52');
INSERT INTO `chatmsg` VALUES ('1', '0', 'werg dfcxvb jthbtrsgsveadscscda', '190811D60M6KB7R4', '已读', '2019-08-11 18:31:00');
INSERT INTO `chatmsg` VALUES ('1', '0', 'erg etrsdfycenflmivtlw;efvdcasxmdnchb dunfmbkyyrjfhgsv', '190811D61ZKHG9P0', '已读', '2019-08-11 18:31:08');
INSERT INTO `chatmsg` VALUES ('1', '0', 'rgds hjergvsfcfcv xvjc ,zdasf,gtbu leygrfasd mxcnbcish mrybm mgnjfzdchv nmyrbstvrcdnbv fgn,jerhs', '190811D6HAAY47F8', '已读', '2019-08-11 18:32:41');
INSERT INTO `chatmsg` VALUES ('1', '0', 'dvrbdstarvsd, vgfnyjtund6mbry,sfvm itnohtm9rjsdoc', '190811D6K9DTG25P', '已读', '2019-08-11 18:32:47');
INSERT INTO `chatmsg` VALUES ('6', '0', 'dfdf', '190811D70CTFFP28', '已读', '2019-08-11 18:33:59');
INSERT INTO `chatmsg` VALUES ('1', '0', '国防生不是太好你不是的出行方便给vv大哥', '190811DA8W447HX4', '已读', '2019-08-11 18:43:53');
INSERT INTO `chatmsg` VALUES ('0', '6', 'a\'s\'d\'f\'s\'b\'f\'d\'t\'h\'r\'se\'v\'c\'sa\'d\'xNCHZHL xcbrvec', '190811DBM1X21968', '已读', '2019-08-11 18:47:53');
INSERT INTO `chatmsg` VALUES ('0', '6', 'safds', '190811DC6NTDS04H', '已读', '2019-08-11 18:49:40');
INSERT INTO `chatmsg` VALUES ('0', '7', 'df', '190811DCP0TP45GC', '已读', '2019-08-11 18:51:05');
INSERT INTO `chatmsg` VALUES ('0', '7', 'dgvdszacxdnavkkshmdjxicWDSNK NZM 反对TV人', '190811DCWHNS36RP', '已读', '2019-08-11 18:51:35');
INSERT INTO `chatmsg` VALUES ('6', '0', 'rg ebrrhbbdhsdvacXzcxJVDSFEBHM LRG,SFACB G', '190811F4K5A9N5S8', '已读', '2019-08-11 19:50:50');
INSERT INTO `chatmsg` VALUES ('6', '0', 'VGBRTEYTF HBRGFB TRBRTWHBGTRGV', '190811F4MZC7PCBC', '已读', '2019-08-11 19:51:02');
INSERT INTO `chatmsg` VALUES ('6', '0', 'EWQVTGQI ERBADSO;GDEROVNDVFDKNAL;BNWRHNW TFVRB', '190811F4NYT68D1P', '已读', '2019-08-11 19:51:08');
INSERT INTO `chatmsg` VALUES ('6', '0', '阿德的成本v覅u地方出现空白宣布支持', '190811G0YH88HNHH', '已读', '2019-08-11 21:03:54');
INSERT INTO `chatmsg` VALUES ('1', '0', '的方式v', '190811G1NTPDRDS8', '已读', '2019-08-11 21:06:11');
INSERT INTO `chatmsg` VALUES ('1', '0', '的萨芬购房补贴本人不是发的VS v从事发到', '190811G1PYS14PX4', '已读', '2019-08-11 21:06:18');
INSERT INTO `chatmsg` VALUES ('1', '0', '二哥v突然换汤不换药特别', '190811G22M1CCHM8', '已读', '2019-08-11 21:07:20');
INSERT INTO `chatmsg` VALUES ('1', '0', '发布价格保护也特别乳房v阿迪斯v特意吧', '190811G23N298R68', '已读', '2019-08-11 21:07:27');
INSERT INTO `chatmsg` VALUES ('1', '0', '和白云零秒门口i努米特也让部分的v阿三', '190811G25330MK40', '已读', '2019-08-11 21:07:36');
INSERT INTO `chatmsg` VALUES ('1', '0', 'tehbvfsfssgbn umyntbgrfvedcsadsbfgn', '1908126DP73Y2KS8', '已读', '2019-08-12 09:05:37');
INSERT INTO `chatmsg` VALUES ('1', '0', 'gmhngbfdsertyujikolokjhgfredswasxdc vbn,l7iu6ty5rtrewrqesxdcv hmjky', '1908126DSMHS3TR4', '已读', '2019-08-12 09:05:53');
INSERT INTO `chatmsg` VALUES ('1', '0', 'thgjhkjl,ymtnrbescacsvdbdgnj,k.l/ukiyutrtherw', '1908126GG4MBWZ2W', '已读', '2019-08-12 09:11:05');
INSERT INTO `chatmsg` VALUES ('1', '0', 'fm,jfygthgredsaxxbc hndkuifyhgtfbdvsx', '1908126H83PBA8ZC', '已读', '2019-08-12 09:13:20');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ykuiluykjrthewfdcsxvbvnhmj,.;o9i8u6yt5r4eqwsdxcvbnjmkiu6k75yt4herw', '1908126H9DC44SFW', '已读', '2019-08-12 09:13:29');
INSERT INTO `chatmsg` VALUES ('1', '0', 'fgfjyukdthsrygthdvscx k,ulit7r67yj5r4gewfdf4tg5yhu6jikw5yjrh', '1908126HRCPF8ZC0', '已读', '2019-08-12 09:14:46');
INSERT INTO `chatmsg` VALUES ('1', '0', '大噶反对', '1908127039RSW18H', '已读', '2019-08-12 09:48:51');
INSERT INTO `chatmsg` VALUES ('1', '0', '然后挺讨厌的河南省个人部分都是的内容和', '1908127777HRNP4H', '已读', '2019-08-12 10:10:17');
INSERT INTO `chatmsg` VALUES ('1', '0', 'jgfgrdfdsvcethryutilyy.k,jmthnfgdbvfjgfgrdfdsvcethryutilyy.k,jmthnfgdbvf', '190812778MS8S5P0', '已读', '2019-08-12 10:10:26');
INSERT INTO `chatmsg` VALUES ('1', '0', '乐坛华国锋你必须模具费用科目和同事如果', '19081277G3ST7828', '已读', '2019-08-12 10:11:08');
INSERT INTO `chatmsg` VALUES ('1', '0', '65怀特如果是的v飞啊飞山地车努哈十分u\'a\'b\'vs\'dvdmrgf i', '19081277K02BPDP0', '已读', '2019-08-12 10:11:20');
INSERT INTO `chatmsg` VALUES ('1', '0', 'juymgtrfewsfetsrhyjukstyjgfbfvdscdvsbjyugdfhfgdvt', '1908127854P2C2Y8', '已读', '2019-08-12 10:13:04');
INSERT INTO `chatmsg` VALUES ('1', '0', 'fdfsb', '190812788R5Y8940', '已读', '2019-08-12 10:13:27');
INSERT INTO `chatmsg` VALUES ('1', '0', 'afhgdh', '1908127965SXRSY8', '已读', '2019-08-12 10:16:11');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ssss', '19081279FBDB5400', '已读', '2019-08-12 10:17:03');
INSERT INTO `chatmsg` VALUES ('1', '0', 'fadgfgng', '19081279M4SR2M3C', '已读', '2019-08-12 10:17:28');
INSERT INTO `chatmsg` VALUES ('1', '0', 'rweg', '1908127A1X1NYF5P', '已读', '2019-08-12 10:18:43');
INSERT INTO `chatmsg` VALUES ('1', '0', 'rtyjyyrb', '1908127A96207Y14', '已读', '2019-08-12 10:19:30');
INSERT INTO `chatmsg` VALUES ('1', '0', 'tyyyyyj', '1908127AACPNH094', '已读', '2019-08-12 10:19:38');
INSERT INTO `chatmsg` VALUES ('1', '0', 'rewg', '1908127AH6RCCRWH', '已读', '2019-08-12 10:20:15');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ewrfvcvgrf', '1908127AHNHXHN7C', '已读', '2019-08-12 10:20:18');
INSERT INTO `chatmsg` VALUES ('1', '0', 'fcdfvchvdv', '1908127AK697F428', '已读', '2019-08-12 10:20:22');
INSERT INTO `chatmsg` VALUES ('1', '0', 'utk', '1908127BGXXHFHSW', '已读', '2019-08-12 10:23:14');
INSERT INTO `chatmsg` VALUES ('1', '0', 'nihao', '1908127BM5845A5P', '已读', '2019-08-12 10:23:28');
INSERT INTO `chatmsg` VALUES ('1', '0', 'nihao', '1908127BNYSP9AFW', '已读', '2019-08-12 10:23:39');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ss', '1908127C3K1F87TC', '已读', '2019-08-12 10:24:54');
INSERT INTO `chatmsg` VALUES ('1', '0', 's\'sss', '1908127CRTNZBYNC', '已读', '2019-08-12 10:26:52');
INSERT INTO `chatmsg` VALUES ('1', '0', '更丰富的是', '1908127DGT6B4CBC', '已读', '2019-08-12 10:29:13');
INSERT INTO `chatmsg` VALUES ('1', '0', '热情', '1908127KH1371A5P', '已读', '2019-08-12 10:41:15');
INSERT INTO `chatmsg` VALUES ('1', '0', '发生后v v让对方v反倒是', '1908127R3XNP61S8', '已读', '2019-08-12 10:51:58');
INSERT INTO `chatmsg` VALUES ('1', '0', '更是让feds发布功能和推荐一款已经退化让他', '1908127R5A4HR7HH', '已读', '2019-08-12 10:52:07');
INSERT INTO `chatmsg` VALUES ('0', '3', '放热峰', '190812APGWCX7A14', '已读', '2019-08-12 15:02:27');
INSERT INTO `chatmsg` VALUES ('3', '0', '而该公司的', '190812BXFK79K5KP', '已读', '2019-08-12 16:41:24');
INSERT INTO `chatmsg` VALUES ('3', '0', '而我让他', '190812BXK22HBD8H', '已读', '2019-08-12 16:41:40');
INSERT INTO `chatmsg` VALUES ('3', '0', '和广泛的', '190812BXKMC7GB9P', '已读', '2019-08-12 16:41:44');
INSERT INTO `chatmsg` VALUES ('5', '0', 'sdf', '190812C12592TP4H', '已读', '2019-08-12 16:52:05');
INSERT INTO `chatmsg` VALUES ('3', '0', 'sadfdds', '190812C12M82Y2RP', '已读', '2019-08-12 16:52:08');
INSERT INTO `chatmsg` VALUES ('5', '0', 'dfsa', '190812C2BXSW511P', '已读', '2019-08-12 16:56:07');
INSERT INTO `chatmsg` VALUES ('5', '0', 'r\'r\'rrrr', '190812C706F5RDS8', '已读', '2019-08-12 17:09:53');
INSERT INTO `chatmsg` VALUES ('5', '0', '嘎嘎嘎', '190812C76AACZGXP', '已读', '2019-08-12 17:10:32');
INSERT INTO `chatmsg` VALUES ('5', '0', 'd\'fdf', '190812C7G22M7P4H', '已读', '2019-08-12 17:11:28');
INSERT INTO `chatmsg` VALUES ('5', '0', '一体化v人', '190812C7GG3Z56K4', '已读', '2019-08-12 17:11:31');
INSERT INTO `chatmsg` VALUES ('3', '0', 'b\'h\'fbhf', '190812C7KMN8ADWH', '已读', '2019-08-12 17:11:45');
INSERT INTO `chatmsg` VALUES ('1', '0', '111', '1908136FM3B37ANC', '已读', '2019-08-13 09:08:24');
INSERT INTO `chatmsg` VALUES ('1', '0', '444', '1908136KTCF1W46W', '已读', '2019-08-13 09:17:59');
INSERT INTO `chatmsg` VALUES ('1', '0', '222', '1908136KYR70FNC0', '已读', '2019-08-13 09:18:20');
INSERT INTO `chatmsg` VALUES ('1', '0', '222', '1908136KZWNMBDYW', '已读', '2019-08-13 09:18:27');
INSERT INTO `chatmsg` VALUES ('1', '0', '呃呃呃', '1908136M9X6Z8A3C', '已读', '2019-08-13 09:19:32');
INSERT INTO `chatmsg` VALUES ('1', '0', '55', '1908136MBRBKWR68', '已读', '2019-08-13 09:19:44');
INSERT INTO `chatmsg` VALUES ('1', '0', '嗡嗡嗡', '1908136MXRRWC280', '已读', '2019-08-13 09:21:14');
INSERT INTO `chatmsg` VALUES ('1', '0', '呃呃呃', '1908136NWFGYG91P', '已读', '2019-08-13 09:24:06');
INSERT INTO `chatmsg` VALUES ('1', '0', '日日日', '1908136P354XXCSW', '已读', '2019-08-13 09:24:49');
INSERT INTO `chatmsg` VALUES ('1', '0', '去去去', '1908136RA6ADR5YW', '已读', '2019-08-13 09:28:34');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908136RT2A07GHH', '已读', '2019-08-13 09:29:57');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908136XYYTNAXYW', '已读', '2019-08-13 09:42:22');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908136Y0FMB2YK4', '已读', '2019-08-13 09:42:32');
INSERT INTO `chatmsg` VALUES ('0', '6', '11', '1908136Y1X1KSSA8', '待读', '2019-08-13 09:42:41');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908136Y2TKGFZHH', '已读', '2019-08-13 09:42:47');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908136YB6W05680', '已读', '2019-08-13 09:43:41');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908136YKTN42428', '已读', '2019-08-13 09:44:24');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908136YXS17NPSW', '已读', '2019-08-13 09:45:15');
INSERT INTO `chatmsg` VALUES ('1', '0', 'sdf', '1908136YZ1NPXD40', '已读', '2019-08-13 09:45:23');
INSERT INTO `chatmsg` VALUES ('1', '0', 'heihei', '1908136ZB8P0Z1GC', '已读', '2019-08-13 09:46:42');
INSERT INTO `chatmsg` VALUES ('1', '0', '的', '19081370XPTWKHBC', '已读', '2019-08-13 09:51:15');
INSERT INTO `chatmsg` VALUES ('1', '0', '大噶反对vhi v各位日常符合名山大川v吧是', '19081370YHMXC37C', '已读', '2019-08-13 09:51:21');
INSERT INTO `chatmsg` VALUES ('1', '0', '搞个', '190813715RGY2T0H', '已读', '2019-08-13 09:52:07');
INSERT INTO `chatmsg` VALUES ('1', '0', '大的', '190813716SP6DXWH', '已读', '2019-08-13 09:52:13');
INSERT INTO `chatmsg` VALUES ('1', '0', '大的', '1908137179G0M1D4', '已读', '2019-08-13 09:52:17');
INSERT INTO `chatmsg` VALUES ('1', '0', '的萨芬', '190813717RMKKZTC', '已读', '2019-08-13 09:52:20');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908137584HYR9GC', '已读', '2019-08-13 10:04:23');
INSERT INTO `chatmsg` VALUES ('1', '0', '嗯嗯', '19081375B1C45GC0', '已读', '2019-08-13 10:04:41');
INSERT INTO `chatmsg` VALUES ('1', '0', '硕士', '19081375SX11KR8H', '已读', '2019-08-13 10:05:57');
INSERT INTO `chatmsg` VALUES ('1', '0', '硕士', '19081375T9WFRMNC', '已读', '2019-08-13 10:06:00');
INSERT INTO `chatmsg` VALUES ('1', '0', '方法', '1908137B2X9WMZHH', '已读', '2019-08-13 10:21:50');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908137BM5PYCARP', '已读', '2019-08-13 10:23:28');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '1908137SHNZD47TC', '已读', '2019-08-13 10:56:20');
INSERT INTO `chatmsg` VALUES ('1', '0', '1', '1908137X4BC4AB7C', '已读', '2019-08-13 11:04:02');
INSERT INTO `chatmsg` VALUES ('1', '0', '22', '190813A4GPH7G63C', '已读', '2019-08-13 14:14:24');
INSERT INTO `chatmsg` VALUES ('1', '0', '如若', '190813ACYPZ1H4X4', '已读', '2019-08-13 14:39:36');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '190813ADRTFRWTTC', '已读', '2019-08-13 14:42:04');
INSERT INTO `chatmsg` VALUES ('1', '0', '请求', '190813AF4D34BD8H', '已读', '2019-08-13 14:43:13');
INSERT INTO `chatmsg` VALUES ('1', '0', '硕士', '190813AF89S9DS80', '已读', '2019-08-13 14:43:38');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '190813AKS09MCFNC', '已读', '2019-08-13 14:54:06');
INSERT INTO `chatmsg` VALUES ('1', '0', '嗯嗯', '190813AM13BANK68', '已读', '2019-08-13 14:54:52');
INSERT INTO `chatmsg` VALUES ('1', '0', '问我', '190813AMP4698094', '已读', '2019-08-13 14:56:54');
INSERT INTO `chatmsg` VALUES ('1', '0', '1', '190813AN7NPZR968', '已读', '2019-08-13 14:58:34');
INSERT INTO `chatmsg` VALUES ('1', '0', '请求', '190813ANHBYNRNMW', '已读', '2019-08-13 14:59:31');
INSERT INTO `chatmsg` VALUES ('1', '0', '问我', '190813ANP4NDMM3C', '已读', '2019-08-13 14:59:55');
INSERT INTO `chatmsg` VALUES ('1', '0', '到底', '190813ANW91ZHNXP', '已读', '2019-08-13 15:00:21');
INSERT INTO `chatmsg` VALUES ('1', '0', '是', '190813AP7DTR2WM8', '已读', '2019-08-13 15:01:33');
INSERT INTO `chatmsg` VALUES ('1', '0', '刚刚', '190813APKGA3C568', '已读', '2019-08-13 15:02:38');
INSERT INTO `chatmsg` VALUES ('1', '0', '方法', '190813APS6Z9WMK4', '已读', '2019-08-13 15:03:08');
INSERT INTO `chatmsg` VALUES ('1', '0', '到底', '190813APWS7N6CH0', '已读', '2019-08-13 15:03:25');
INSERT INTO `chatmsg` VALUES ('1', '0', '天天', '190813APYACKG828', '已读', '2019-08-13 15:03:35');
INSERT INTO `chatmsg` VALUES ('1', '0', '仍然被', '190813APYWYM1028', '已读', '2019-08-13 15:03:38');
INSERT INTO `chatmsg` VALUES ('1', '0', '如果', '190813AR65889S80', '已读', '2019-08-13 15:04:25');
INSERT INTO `chatmsg` VALUES ('1', '0', '对方', '190813AR77Z3F2RP', '已读', '2019-08-13 15:04:32');
INSERT INTO `chatmsg` VALUES ('1', '0', '对方', '190813ARC1MDC1YW', '已读', '2019-08-13 15:05:03');
INSERT INTO `chatmsg` VALUES ('1', '0', '当时', '190813ARCT2PF6A8', '已读', '2019-08-13 15:05:08');
INSERT INTO `chatmsg` VALUES ('1', '0', '的', '190813ARHWXNM32W', '已读', '2019-08-13 15:05:34');
INSERT INTO `chatmsg` VALUES ('1', '0', '发', '190813AW53N1Z540', '已读', '2019-08-13 15:13:19');
INSERT INTO `chatmsg` VALUES ('1', '0', '的', '190813AW5XKT1T7C', '已读', '2019-08-13 15:13:24');
INSERT INTO `chatmsg` VALUES ('1', '0', '给', '190813AW8M314ZC0', '已读', '2019-08-13 15:13:41');
INSERT INTO `chatmsg` VALUES ('1', '0', '从', '190813AWA3069214', '已读', '2019-08-13 15:13:51');
INSERT INTO `chatmsg` VALUES ('1', '0', '123', '190815BPKGWFD2A8', '已读', '2019-08-15 16:26:42');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ew', '190815BPPASYG7R4', '已读', '2019-08-15 16:27:00');
INSERT INTO `chatmsg` VALUES ('1', '0', 'gg', '190815BPWZ50WMY8', '已读', '2019-08-15 16:27:30');
INSERT INTO `chatmsg` VALUES ('1', '0', 'dfg', '190815BRWCG32X8H', '已读', '2019-08-15 16:30:27');
INSERT INTO `chatmsg` VALUES ('1', '0', 'efef', '190815BRXDAR73F8', '已读', '2019-08-15 16:30:33');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ereeqg', '190815BRY0KDRG2W', '已读', '2019-08-15 16:30:37');
INSERT INTO `chatmsg` VALUES ('1', '0', '11', '190815BSAXYRZ7R4', '已读', '2019-08-15 16:32:00');
INSERT INTO `chatmsg` VALUES ('1', '0', 'aa', '190815BSF3X0G4DP', '已读', '2019-08-15 16:32:20');
INSERT INTO `chatmsg` VALUES ('1', '0', '111', '190815HYSZ92DM14', '已读', '2019-08-15 23:45:39');
INSERT INTO `chatmsg` VALUES ('1', '0', 'wew', '190815HYWGSSCX40', '已读', '2019-08-15 23:45:49');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ee', '190815HZ0DRCBD8H', '已读', '2019-08-15 23:46:14');
INSERT INTO `chatmsg` VALUES ('0', '1', 'ganma ya\'', '1908168Y8ZNSS2CH', '已读', '2019-08-16 12:31:35');
INSERT INTO `chatmsg` VALUES ('1', '0', 'xixi', '1908168YG7DW3WBC', '已读', '2019-08-16 12:32:16');
INSERT INTO `chatmsg` VALUES ('1', '0', 'y', '1908168ZGMADSNR4', '已读', '2019-08-16 12:35:18');
INSERT INTO `chatmsg` VALUES ('1', '0', 'hh', '1908168ZK6Z076CH', '已读', '2019-08-16 12:35:29');
INSERT INTO `chatmsg` VALUES ('1', '0', 'jj', '1908169006KD9Z54', '已读', '2019-08-16 12:36:39');
INSERT INTO `chatmsg` VALUES ('1', '0', 'jjjj', '190816902R6GKCSW', '已读', '2019-08-16 12:36:56');
INSERT INTO `chatmsg` VALUES ('1', '0', 'ff', '190816905GXXSNR4', '已读', '2019-08-16 12:37:14');
INSERT INTO `chatmsg` VALUES ('1', '0', 'jj', '19081690BNDX0F14', '已读', '2019-08-16 12:37:53');
INSERT INTO `chatmsg` VALUES ('1', '0', 'www', '19081690YD9THARP', '已读', '2019-08-16 12:39:28');
INSERT INTO `chatmsg` VALUES ('1', '0', 'qq', '190816953ZB2HP6W', '已读', '2019-08-16 12:52:04');
INSERT INTO `chatmsg` VALUES ('0', '1', 'ss', '190816954SD13YNC', '已读', '2019-08-16 12:52:09');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `my_friend_id` varchar(255) DEFAULT NULL,
  `my_user_id` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('1', '0', '1');
INSERT INTO `friends` VALUES ('0', '5', '10');
INSERT INTO `friends` VALUES ('0', '6', '11');
INSERT INTO `friends` VALUES ('6', '0', '12');
INSERT INTO `friends` VALUES ('0', '7', '13');
INSERT INTO `friends` VALUES ('7', '0', '14');
INSERT INTO `friends` VALUES ('2', '0', '2');
INSERT INTO `friends` VALUES ('3', '0', '3');
INSERT INTO `friends` VALUES ('4', '0', '4');
INSERT INTO `friends` VALUES ('5', '0', '5');
INSERT INTO `friends` VALUES ('0', '2', '6');
INSERT INTO `friends` VALUES ('0', '1', '7');
INSERT INTO `friends` VALUES ('0', '3', '8');
INSERT INTO `friends` VALUES ('0', '4', '9');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `storeid` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(10) DEFAULT NULL,
  `price` float(4,0) DEFAULT NULL,
  `icon` varchar(1024) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellcount` int(11) DEFAULT '0',
  `type` enum('特色粥品','小吃主食','果拼果汁','精选套餐','爽口凉菜','精选热菜','冰爽饮品限时特惠','单人精彩套餐','热销榜') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('shop1', '皮蛋瘦肉粥', '10', 'http://fuss10.elemecdn.com/c/cd/c12745ed8a5171e13b427dbc39401jpeg.jpeg?imageView2/1/w/114/h/114', '咸粥', '1', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop4', '扁豆焖面', '14', 'http://fuss10.elemecdn.com/c/6b/29e3d29b0db63d36f7c500bca31d8jpeg.jpeg?imageView2/1/w/114/h/114', null, '2', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop1', '葱花饼', '10', 'http://fuss10.elemecdn.com/f/28/a51e7b18751bcdf871648a23fd3b4jpeg.jpeg?imageView2/1/w/114/h/114', null, '3', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop1', '牛肉馅饼', '14', 'http://fuss10.elemecdn.com/d/b9/bcab0e8ad97758e65ae5a62b2664ejpeg.jpeg?imageView2/1/w/114/h/114', null, '4', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop2', '招牌猪肉白菜锅贴/1', '17', 'http://fuss10.elemecdn.com/7/72/9a580c1462ca1e4d3c07e112bc035jpeg.jpeg?imageView2/1/w/114/h/114', null, '5', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop1', '南瓜粥', '9', 'http://fuss10.elemecdn.com/8/a6/453f65f16b1391942af11511b7a90jpeg.jpeg?imageView2/1/w/114/h/114', '甜粥', '6', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop3', '红豆薏米美肤粥', '12', 'http://fuss10.elemecdn.com/d/22/260bd78ee6ac6051136c5447fe307jpeg.jpeg?imageView2/1/w/114/h/114', '甜粥', '7', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop1', '八宝酱菜', '4', 'http://fuss10.elemecdn.com/9/b5/469d8854f9a3a03797933fd01398bjpeg.jpeg?imageView2/1/w/114/h/114', null, '8', '0', '爽口凉菜');
INSERT INTO `goods` VALUES ('shop2', '红枣山药糙米粥', '10', 'http://fuss10.elemecdn.com/9/b5/469d8854f9a3a03797933fd01398bjpeg.jpeg?imageView2/1/w/114/h/114', null, '9', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop1', '糊塌子', '10', 'http://fuss10.elemecdn.com/0/05/097a2a59fd2a2292d08067e16380cjpeg.jpeg?imageView2/1/w/114/h/114', null, '10', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop1', '红枣山药粥套餐', '29', 'http://fuss10.elemecdn.com/6/72/cb844f0bb60c502c6d5c05e0bddf5jpeg.jpeg?imageView2/1/w/114/h/114', '红枣山药糙米粥,素材包,爽口莴笋丝,四川泡菜或八宝酱菜,配菜可备注', '11', '0', '单人精彩套餐');
INSERT INTO `goods` VALUES ('shop3', 'VC无限橙果汁', '8', 'http://fuss10.elemecdn.com/e/c6/f348e811772016ae24e968238bcbfjpeg.jpeg?imageView2/1/w/114/h/114', null, '12', '0', '冰爽饮品限时特惠');
INSERT INTO `goods` VALUES ('shop2', '娃娃菜炖豆腐', '17', 'http://fuss10.elemecdn.com/d/2d/b1eb45b305635d9dd04ddf157165fjpeg.jpeg?imageView2/1/w/114/h/114', null, '13', '0', '精选热菜');
INSERT INTO `goods` VALUES ('shop1', '手撕包菜', '16', 'http://fuss10.elemecdn.com/9/c6/f3bc84468820121112e79583c24efjpeg.jpeg?imageView2/1/w/114/h/114', null, '14', '0', '精选热菜');
INSERT INTO `goods` VALUES ('shop1', '香酥黄金鱼/3条', '11', 'http://fuss10.elemecdn.com/4/e7/8277a6a2ea0a2e97710290499fc41jpeg.jpeg?imageView2/1/w/114/h/114', null, '15', '0', '精选热菜');
INSERT INTO `goods` VALUES ('shop2', '拍黄瓜', '9', 'http://fuss10.elemecdn.com/6/54/f654985b4e185f06eb07f8fa2b2e8jpeg.jpeg?imageView2/1/w/114/h/114', null, '16', '0', '爽口凉菜');
INSERT INTO `goods` VALUES ('shop1', '红豆薏米粥套餐', '37', 'http://fuss10.elemecdn.com/f/49/27f26ed00c025b2200a9ccbb7e67ejpeg.jpeg?imageView2/1/w/114/h/114', '红豆薏米粥,三鲜干蒸烧卖,拍黄瓜', '17', '0', '精选套餐');
INSERT INTO `goods` VALUES ('shop1', '皮蛋瘦肉粥套餐', '31', 'http://fuss10.elemecdn.com/8/96/f444a8087f0e940ef264617f9d98ajpeg.jpeg?imageView2/1/w/114/h/114', null, '18', '0', '精选套餐');
INSERT INTO `goods` VALUES ('shop1', '蜜瓜圣女萝莉杯', '6', 'http://fuss10.elemecdn.com/b/5f/b3b04c259d5ec9fa52e1856ee50dajpeg.jpeg?imageView2/1/w/114/h/114', null, '19', '0', '果拼果汁');
INSERT INTO `goods` VALUES ('shop3', '加多宝', '6', 'http://fuss10.elemecdn.com/b/9f/5e6c99c593cf65229225c5661bcdejpeg.jpeg?imageView2/1/w/114/h/114', '', '20', '0', '果拼果汁');
INSERT INTO `goods` VALUES ('shop4', '皮蛋瘦肉粥', '10', 'http://fuss10.elemecdn.com/c/cd/c12745ed8a5171e13b427dbc39401jpeg.jpeg?imageView2/1/w/114/h/114', null, '22', '0', '热销榜');
INSERT INTO `goods` VALUES ('shop4', '扁豆焖面', '13', 'http://fuss10.elemecdn.com/c/6b/29e3d29b0db63d36f7c500bca31d8jpeg.jpeg?imageView2/1/w/114/h/114', null, '23', '0', '小吃主食');

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `createTime` datetime DEFAULT NULL,
  `key` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `state` set('待发货','待收货','已确认') DEFAULT NULL,
  `price` float DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `storeId` varchar(255) DEFAULT NULL,
  `sumPrice` float DEFAULT NULL,
  `order_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('2019-08-01 12:24:34', '12', '0', '1', '待发货', '10', '1', 'shop1', '10', '37553488631');
INSERT INTO `order_info` VALUES ('2019-08-01 12:24:34', '13', '0', '3', '待发货', '10', '1', 'shop1', '10', '37553488631');
INSERT INTO `order_info` VALUES ('2019-08-01 12:26:25', '14', '0', '9', '待发货', '10', '1', 'shop2', '10', '14470064775');
INSERT INTO `order_info` VALUES ('2019-08-01 12:26:25', '15', '0', '5', '待发货', '17', '2', 'shop2', '34', '14470064775');
INSERT INTO `order_info` VALUES ('2019-08-01 13:47:54', '16', '0', '4', '待发货', '14', '1', 'shop1', '14', '87311509575');
INSERT INTO `order_info` VALUES ('2019-08-01 13:47:54', '17', '0', '3', '待发货', '10', '2', 'shop1', '20', '87311509575');
INSERT INTO `order_info` VALUES ('2019-08-02 09:21:10', '18', '1', '1', '待收货', '10', '1', 'shop1', '10', '04679530272');
INSERT INTO `order_info` VALUES ('2019-08-07 06:25:12', '19', '0', '3', '待发货', '10', '1', 'shop1', '10', '38682958683');
INSERT INTO `order_info` VALUES ('2019-08-07 06:25:12', '20', '0', '4', '待发货', '14', '2', 'shop1', '28', '38682958683');
INSERT INTO `order_info` VALUES ('2019-08-07 06:25:12', '21', '0', '6', '待发货', '9', '1', 'shop1', '9', '38682958683');
INSERT INTO `order_info` VALUES ('2019-08-07 14:36:25', '22', '0', '16', '待发货', '9', '2', 'shop2', '18', '62929968174');
INSERT INTO `order_info` VALUES ('2019-08-07 14:57:35', '23', '0', '7', '待发货', '12', '2', 'shop3', '24', '31622297241');
INSERT INTO `order_info` VALUES ('2019-08-07 14:57:35', '24', '0', '12', '待发货', '8', '1', 'shop3', '8', '31622297241');
INSERT INTO `order_info` VALUES ('2019-08-07 17:05:35', '25', '0', '1', '待收货', '10', '5', 'shop1', '50', '93199227975');
INSERT INTO `order_info` VALUES ('2019-08-10 13:22:33', '26', '0', '1', '待发货', '10', '1', 'shop1', '10', '03210364697');
INSERT INTO `order_info` VALUES ('2019-08-10 13:22:33', '27', '0', '3', '待收货', '10', '2', 'shop1', '20', '03210364697');
INSERT INTO `order_info` VALUES ('2019-08-12 13:44:23', '28', '0', '1', '已确认', '10', '4', 'shop1', '40', '78089529270');
INSERT INTO `order_info` VALUES ('2019-08-12 13:54:05', '29', '3', '1', '待发货', '10', '1', 'shop1', '10', '89953986028');
INSERT INTO `order_info` VALUES ('2019-08-12 13:54:05', '30', '3', '3', '待发货', '10', '1', 'shop1', '10', '89953986028');
INSERT INTO `order_info` VALUES ('2019-08-12 13:54:05', '31', '3', '4', '待发货', '14', '1', 'shop1', '14', '89953986028');
INSERT INTO `order_info` VALUES ('2019-08-12 13:55:02', '32', '3', '1', '已确认', '10', '1', 'shop1', '10', '81747518743');
INSERT INTO `order_info` VALUES ('2019-08-12 13:55:02', '33', '3', '3', '已确认', '10', '1', 'shop1', '10', '81747518743');
INSERT INTO `order_info` VALUES ('2019-08-12 13:55:02', '34', '3', '4', '已确认', '14', '1', 'shop1', '14', '81747518743');
INSERT INTO `order_info` VALUES ('2019-08-22 11:05:37', '35', '0', '1', '待发货', '10', '1', 'shop1', '10', '11614385031');
INSERT INTO `order_info` VALUES ('2019-08-22 11:05:37', '36', '0', '3', '待发货', '10', '1', 'shop1', '10', '11614385031');

-- ----------------------------
-- Table structure for `store_info`
-- ----------------------------
DROP TABLE IF EXISTS `store_info`;
CREATE TABLE `store_info` (
  `shopid` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(10) DEFAULT NULL,
  `description` varchar(10) DEFAULT NULL,
  `deliveryTime` int(4) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `sellCount` int(11) DEFAULT NULL,
  `bulletin` varchar(200) DEFAULT NULL,
  `ratingCount` int(11) DEFAULT NULL,
  `serviceScore` float DEFAULT NULL,
  `rankRate` float DEFAULT NULL,
  `minPrice` float DEFAULT NULL,
  `deliveryPrice` float DEFAULT NULL,
  `foodScore` float DEFAULT NULL,
  `avatar` varchar(300) DEFAULT NULL,
  `infos` varchar(1024) DEFAULT NULL,
  `pics` varchar(1024) DEFAULT NULL,
  `support` set(' 已加入外卖保计划食品安全保障','该商家支持发票请下单写好发票抬头','单人精彩套餐','VC无限橙果汁全场8折','在线支付满28减5') DEFAULT NULL,
  `cardid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store_info
-- ----------------------------
INSERT INTO `store_info` VALUES ('shop1', '粥店', '蜂鸟专送', '38', '4.2', '90', '粥品香坊其烹饪粥料的秘方源于中国千年古法，在融和现代制作工艺，由世界烹饪大师屈浩先生领衔研发。坚守纯天然、0添加的良心品质深得消费者青睐，发展至今成为粥类的引领品牌。是2008年奥运会和2013年园博会指定餐饮服务商。', '24', '4.1', '69.2', '20', '4', '4.3', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '[\"该商家支持发票,请下单写好发票抬头\",\"品类:其他菜系,包子粥店\",\"北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340\",\"营业时间:10:00-20:30\"]', '[\"http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg?imageView2/1/w/180/h/180\",\"http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg?imageView2/1/w/180/h/180\",\"http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg?imageView2/1/w/180/h/180\",\"http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg?imageView2/1/w/180/h/180\"]', '单人精彩套餐,VC无限橙果汁全场8折,在线支付满28减5', 'card1');
INSERT INTO `store_info` VALUES ('shop10', '兰州拉面', '蜂鸟专送', '40', '3.5', '12', null, '45', '4.1', '73.2', '20', '6', '4.4', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '[\"该商家支持发票,请下单写好发票抬头\",\"品类:快餐\",\"北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340\",\"营业时间:10:00-24：00\"]', null, ' 已加入外卖保计划食品安全保障,该商家支持发票请下单写好发票抬头', 'card1');
INSERT INTO `store_info` VALUES ('shop11', '小笼包', '蜂鸟专送', '36', '2.3', '12312', '好吃', '34', '4.1', '73.2', '40', '8', '3.9', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '[\"该商家支持发票,请下单写好发票抬头\",\"品类:快餐\",\"北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340\",\"营业时间:10:00-24：00\"]', null, '该商家支持发票请下单写好发票抬头,单人精彩套餐,VC无限橙果汁全场8折', 'card1');
INSERT INTO `store_info` VALUES ('shop12', '串串', null, '13', '5', '23', '好吃', '32', '4.1', '73.2', '40', '2', '4.2', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, ' 已加入外卖保计划食品安全保障,该商家支持发票请下单写好发票抬头,单人精彩套餐', 'card1');
INSERT INTO `store_info` VALUES ('shop13', '自助', null, '34', '2.5', '45', null, '24', '4.1', '73.2', '60', '8', '3.7', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, '单人精彩套餐,在线支付满28减5', 'card1');
INSERT INTO `store_info` VALUES ('shop14', '茶社', null, '22', '3.5', '4512', null, '34', '4.1', '73.2', '40', '6', '4.4', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, ' 已加入外卖保计划食品安全保障,单人精彩套餐,VC无限橙果汁全场8折,在线支付满28减5', 'card1');
INSERT INTO `store_info` VALUES ('shop15', '奶茶', null, '2', '3.2', '43123', '好吃', '55', '4.1', '73.2', '20', '8', '3.9', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '[\"该商家支持发票,请下单写好发票抬头\",\"品类:快餐\",\"北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340\",\"营业时间:10:00-24：00\"]', null, ' 已加入外卖保计划食品安全保障,单人精彩套餐', 'card1');
INSERT INTO `store_info` VALUES ('shop16', '海鲜', null, '45', '3.4', '32', null, '43', '4.1', '73.2', '40', '2', '4.2', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, ' 已加入外卖保计划食品安全保障,该商家支持发票请下单写好发票抬头,单人精彩套餐', 'card1');
INSERT INTO `store_info` VALUES ('shop17', '牛排', '蜂鸟专送', '23', '4.3', '121', '好吃', '45', '4.1', '73.2', '20', '6', '3.7', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, '该商家支持发票请下单写好发票抬头,单人精彩套餐,在线支付满28减5', 'card1');
INSERT INTO `store_info` VALUES ('shop18', '甜点', '蜂鸟专送', '45', '3.7', '33', null, '12', '4.1', '73.2', '60', '2', '4.2', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, '该商家支持发票请下单写好发票抬头,单人精彩套餐,VC无限橙果汁全场8折', 'card1');
INSERT INTO `store_info` VALUES ('shop19', '烧烤', null, '23', '2.3', '22', '好吃', '45', '4.1', '73.2', '20', '6', '3.9', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '[\"该商家支持发票,请下单写好发票抬头\",\"品类:快餐\",\"北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340\",\"营业时间:10:00-24：00\"]', null, '该商家支持发票请下单写好发票抬头,单人精彩套餐', 'card1');
INSERT INTO `store_info` VALUES ('shop2', '麦当劳', '蜂鸟专送', '30', '4.3', '200', '好吃', '25', '4.2', '70.5', '60', '8', '4.2', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '[\"该商家支持发票,请下单写好发票抬头\",\"品类:快餐\",\"北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340\",\"营业时间:10:00-24：00\"]', '', ' 已加入外卖保计划食品安全保障,该商家支持发票请下单写好发票抬头', 'card1');
INSERT INTO `store_info` VALUES ('shop20', '火锅', '蜂鸟专送', '22', '2.1', '11', null, '34', '4.1', '73.2', '20', '6', '4.4', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, ' 已加入外卖保计划食品安全保障,该商家支持发票请下单写好发票抬头', 'card1');
INSERT INTO `store_info` VALUES ('shop3', '冒菜', null, '22', '4.5', '777', '好吃', '26', '4.1', '73.2', '20', '2', '4.2', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, '该商家支持发票请下单写好发票抬头,单人精彩套餐', 'card1');
INSERT INTO `store_info` VALUES ('shop4', '日料', null, '34', '3.9', '4536', null, '22', '4.1', '73.2', '20', '6', '3.7', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, ' 已加入外卖保计划食品安全保障,VC无限橙果汁全场8折', 'card1');
INSERT INTO `store_info` VALUES ('shop5', '麻辣烫', null, '23', '4.3', '3244', null, '45', '4.1', '73.2', '26', '8', '4.4', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, ' 已加入外卖保计划食品安全保障', 'card1');
INSERT INTO `store_info` VALUES ('shop6', '南京大排档', null, '54', '4.5', '3454', '好吃', '23', '4.1', '73.2', '40', '2', '3.7', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '[\"该商家支持发票,请下单写好发票抬头\",\"品类:快餐\",\"北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340\",\"营业时间:10:00-24：00\"]', null, '该商家支持发票请下单写好发票抬头,单人精彩套餐', 'card1');
INSERT INTO `store_info` VALUES ('shop7', '海底捞', '蜂鸟专送', '23', '4.6', '43534', null, '12', '4.1', '73.2', '26', '2', '3.7', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, '单人精彩套餐,VC无限橙果汁全场8折,在线支付满28减5', 'card1');
INSERT INTO `store_info` VALUES ('shop8', '肯德基', null, '35', '3.9', '34', '好吃', '23', '4.1', '73.2', '60', '8', '4.2', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, '单人精彩套餐', 'card1');
INSERT INTO `store_info` VALUES ('shop9', '冰淇淋', null, '42', '3.6', '213', null, '43', '4.1', '73.2', '40', '2', '3.9', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', null, null, ' 已加入外卖保计划食品安全保障,该商家支持发票请下单写好发票抬头,单人精彩套餐,VC无限橙果汁全场8折,在线支付满28减5', 'card1');

-- ----------------------------
-- Table structure for `testmysql`
-- ----------------------------
DROP TABLE IF EXISTS `testmysql`;
CREATE TABLE `testmysql` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testmysql
-- ----------------------------
INSERT INTO `testmysql` VALUES ('1', 'zqy');
INSERT INTO `testmysql` VALUES ('2', 'zzz');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(10) DEFAULT NULL,
  `age` int(6) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(20) DEFAULT NULL,
  `qrcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('小朱', '23', '/static/UserImg/1.png', '0', '123456', null);
INSERT INTO `user` VALUES ('小卢', '23', '/static/UserImg/2.jpg', '1', '123', null);
INSERT INTO `user` VALUES ('小吴', '22', '/static/UserImg/4.jpg', '2', '123', null);
INSERT INTO `user` VALUES ('小王', '22', '/static/UserImg/3.png', '3', '123', null);
INSERT INTO `user` VALUES ('大王', '32', '/static/UserImg/5.jpg', '4', '123', null);
INSERT INTO `user` VALUES ('小高', '22', '/static/UserImg/6.jpg', '5', '123', null);
INSERT INTO `user` VALUES ('小唐', '23', '/static/UserImg/7.jpg', '6', '123', null);
INSERT INTO `user` VALUES ('小田', '22', '/static/UserImg/8.jpg', '7', '123', null);
