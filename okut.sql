
CREATE TABLE IF NOT EXISTS `week_free` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(60) NOT NULL,
  `next_collect` int(15) NOT NULL,
  `times_collected` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

INSERT INTO `week_free` (`id`, `steam`, `next_collect`, `times_collected`) VALUES
	(177, 'steam:1100001413ce07e', 1666822301, 1),
	(178, 'steam:11000010e555d25', 1666920778, 1);