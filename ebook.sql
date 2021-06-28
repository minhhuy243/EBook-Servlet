-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 20, 2021 at 05:50 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Category_Id` varchar(10) NOT NULL,
  `Category_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Category_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_Id`, `Category_Name`) VALUES
('HNN', 'Học Ngoại Ngữ'),
('KT', 'Kinh tế'),
('NDC', 'Nuôi Dạy Con'),
('TL-KNS', 'Tâm Lý - Kỹ Năng Sống'),
('TN', 'Thiếu Nhi'),
('VH', 'Văn Học');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Category_Id` varchar(10) DEFAULT NULL,
  `SKU` varchar(15) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Publishing_Company_Id` int(11) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Description` varchar(1500) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Avatar` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Product_Id`),
  KEY `Category_Id` (`Category_Id`),
  KEY `Publishing_Company_Id` (`Publishing_Company_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_Id`, `Category_Id`, `SKU`, `Name`, `Publishing_Company_Id`, `Author`, `Price`, `Quantity`, `Description`, `Date`, `Avatar`) VALUES
(1, 'VH', 'VH01', 'Con Chim Xanh Biếc Bay Về', 5, 'Nguyễn Nhật Ánh', 112000, 29, 'Không giống như những tác phẩm trước đây lấy bối cảnh vùng quê miền Trung đầy ắp những hoài niệm tuổi thơ dung dị, trong trẻo với các nhân vật ở độ tuổi dậy thì, trong quyển sách mới lần này nhà văn Nguyễn Nhật Ánh lấy bối cảnh chính là Sài Gòn – Thành phố Hồ Chí Minh nơi tác giả sinh sống (như là một sự đền đáp ân tình với mảnh đất miền Nam). Các nhân vật chính trong truyện cũng “lớn” hơn, với những câu chuyện mưu sinh lập nghiệp lắm gian nan thử thách của các sinh viên trẻ đầy hoài bão. Tất nhiên không thể thiếu những câu chuyện tình cảm động, kịch tính và bất ngờ khiến bạn đọc ngẩn ngơ, cười ra nước mắt. Và như trong mọi tác phẩm Nguyễn Nhật Ánh, sự tử tế và tinh thần hướng thượng vẫn là điểm nhấn quan trọng trong quyển sách mới này.', '2020-12-27', '.\\images\\vh01.jpg'),
(2, 'VH', 'VH02', 'Cà Phê Cùng Tony (Tái Bản 2017)', 3, 'Tony Buổi Sáng', 63000, 15, 'Chúng tôi tin rằng những người trẻ tuổi luôn mang trong mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động viên họ biến điều đó thành hành động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp, như tách cà phê thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng.', '2020-12-27', '.\\images\\vh02.jpg'),
(3, 'VH', 'VH03', '5 Centimet Trên Giây', 3, 'Shinkai Makoto', 50000, 25, 'Bằng giọng văn tinh tế, truyền cảm, Năm centimet trên giây mang đến những khắc họa mới về tâm hồn và khả năng tồn tại của cảm xúc, bắt đầu từ tình yêu trong sáng, ngọt ngào của một cô bé và cậu bé. Ba giai đoạn, ba mảnh ghép, ba ngôi kể chuyện khác nhau nhưng đều xoay quanh nhân vật nam chính, người luôn bị ám ảnh bởi kí ức và những điều đã qua…', '2020-12-27', '.\\images\\vh03.jpg'),
(4, 'VH', 'VH04', 'Mắt Biếc', 5, 'Nguyễn Nhật Ánh', 91000, 29, 'Mắt biếc là một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn Nguyễn Nhật Ánh. Tác phẩm này cũng đã được dịch giả Kato Sakae dịch sang tiếng Nhật để giới thiệu với độc giả Nhật Bản.', '2020-12-27', '.\\images\\vh04.jpg'),
(5, 'VH', 'VH05', 'Chiến Binh Cầu Vồng', 4, 'Andrea Hirata', 109000, 41, 'Chiến binh Cầu vồng có cả tình yêu trong sáng tuổi học trò lẫn những trò đùa tinh quái, cả nước mắt lẫn tiếng cười – một bức tranh chân thực về hố sâu ngăn cách giàu nghèo, một tác phẩm văn học cảm động truyền tải sâu sắc nhất ý nghĩa đích thực của việc làm thầy, việc làm trò và việc học.\n', '2020-12-27', '.\\images\\vh05.jpg'),
(6, 'VH', 'VH06', 'Hai Số Phận ', 3, 'Jeffrey Archer', 175000, 0, '(“Hai số phận” (Kane & Abel) là câu chuyện về hai người đàn ông đi tìm vinh quang. William Kane là con một triệu phú nổi tiếng trên đất Mỹ, lớn lên trong nhung lụa của thế giới thượng lưu. Wladek Koskiewicz là đứa trẻ không rõ xuất thân, được gia đình người bẫy thú nhặt về nuôi. Một người được ấn định để trở thành chủ ngân hàng khi lớn lên, người kia nhập cư vào Mỹ cùng đoàn người nghèo khổ. \r\nTrải qua hơn sáu mươi năm với biết bao biến động, hai con người giàu hoài bão miệt mài xây dựng vận mệnh của mình . “Hai số phận” nói về nỗi khát khao cháy bỏng, những nghĩa cử, những mối thâm thù, từng bước đường phiêu lưu, hiện thực thế giới và những góc khuất... mê hoặc người đọc bằng ngôn từ cô đọng, hai mạch truyện song song được xây dựng tinh tế từ những chi tiết nhỏ nhất.) ', '2020-12-27', '.\\images\\vh06.jpg'),
(7, 'VH', 'VH07', 'Không Gia Đình', 4, 'Hector Malot', 119000, 24, 'Không Gia Đình kể về chuyện đời Rémi, một cậu bé không cha mẹ, họ hàng thân thích. Sau khi phải rời khỏi vòng tay của người má nuôi, em đã đi theo đoàn xiếc thú của cụ già Vitalis tốt bụng. Kể từ đó, em lưu lạc khắp nơi, ban đầu dưới sự che chở của cụ Vitalis, sau đó thì tự lập và còn lo cả công việc biểu diễn và sinh sống cho cả một gánh hát rong. Đã có lúc em và cả đoàn lang thang cả mấy ngày đói khát rồi còn suýt chết rét. Có bận em bị lụt ngầm chôn trong giếng mỏ hàng tuần. Rồi có lần em còn mắc oan  bị giải ra tòa và phải ở tù. Nhưng cũng có khi em được nuôi nấng đàng hoàng, no ấm. Song dù trong hoàn cảnh nào, Rémi vẫn giữ được sự gan dạ, ngay thẳng, lòng tự trọng, tính thương người, ham lao động chứ không hạ mình hay gian dối. Cuối cùng, sau bao gian nan khổ cực, em đã đoàn tụ được với gia đình của mình.', '2020-12-27', '.\\images\\vh07.jpg'),
(8, 'VH', 'VH08', 'Bố Già', 10, 'Mario Puzo', 150000, 31, 'Bố già là cuốn tiểu thuyết văn học hiện đại Mỹ được đông đảo bạn đọc trên thế giới nói chung và tại Việt Nam nói riêng đón nhận một cách \"nồng hậu\", và cũng không ngạc nhiên khi bộ phim ra đời ăn theo kịch bản cũng được chào đón nồng nhiệt không kém.  Không hẳn là vì cuốn tiểu thuyết viết về cuộc đời của một \"trùm mafia\" khét tiếng trôi dạt từ hòn đảo Xixili sang đất Mỹ và làm mưa làm gió trên mảnh đất \"tự do\" này, mà đằng sau đó là những thân phận, những cuộc đời mà lẽ ra vô cùng bình dị và yên ấm như bao gia đình khác. Cái \"đế chế vương quyền\" bất thành văn ấy, ai đã vào trong, ai đã \"cưỡi lên lưng hổ\" thì chỉ có con đường tiến, không có đường lui. Là nổ súng, tư thù, đâm thuê chém mướn, tranh giành lãnh địa, tranh hùng tranh bá thiên hạ, vậy mà vẫn ẩn chứa những đằm thắm, mặn mà, nhân hậu và \"có thuỷ có chung\". Ai đã xây dựng nên, ai là người đại diện xứng đáng, ai danh tiếng lưu truyền? chính là \"Bố già - Ông trùm Don Vitô Côrleône\".', '2020-12-27', '.\\images\\vh08.jpg'),
(9, 'VH', 'VH09', 'Những Cuộc Phiêu Lưu Của Tom Sawyer', 11, 'Mark Twain', 62000, 40, 'Ra đời năm 1876, hơn 100 năm nay, Những cuộc phiêu lưu của Tom Sawyer đã được người đọc ở nhiều lứa tuổi, nhiều dân tộc khác nhau yêu mến. Tác giả không chỉ thuật lại câu chuyện có hậu về chú Tom tinh nghịch, mà còn dựng nên một bức tranh hiện thực về cuộc sống của các nhân vật bé nhỏ trong truyện, đặc biệt đi sâu vào thế giới bên trong con người, miêu tả giản di và chính xác tâm lí trẻ em. Tác phẩm chứa đựng trong nó một chất thơ trong trẻo, được coi là một “khúc ca về tuổi thơ”', '2020-12-27', '.\\images\\vh09.jpg'),
(10, 'VH', 'VH10', 'Đất Rừng Phương Nam', 11, 'Đoàn Giỏi', 60000, 50, 'Đất rừng phương Nam của Đoàn Giỏi như một xã hội của miền sông nước Tây Nam bộ thu nhỏ. Bởi ở nơi đó, người đọc đã tìm thấy hình ảnh người dân của vùng đất phương Nam từ sông Tiền, sông Hậu trải dài đến Kiên Giang - Rạch Giá, rồi xuống tận rừng U Minh, sau đó dừng lại ở Năm Căn Cà Mau. Bối cảnh trong Đất rừng phương Nam là cả một đất trời thiên nhiên ưu đãi, cánh đồng bát ngát mênh mông, sóng nước rì rầm, rừng rậm bạt ngàn trù phú, thú rừng hoang dã muôn loài...\n', '2020-12-27', '.\\images\\vh10.jpg'),
(11, 'VH', 'VH11', 'Thép Đã Tôi Thế Đấy ', 10, 'Nikolai A Ostrovsky', 110000, 15, 'Thép đã tôi thế đấy ! Được đăng lần dầu trên tạp chi Molodaya Gvardiya vào năm 1932 và được xuất bản thành sách vào năm 1936 . Không phải một tiểu thuyết bình thường , Thép đã tôi thế đấy ! Chính là cuộc đời của tác giả Nikolai A.Ostrovsky . Bằng sự ca trường của người chiến sĩ cách mạng , dù cơ thể bị tàn phá , đâu đớn , Nikolai A.Ostrovsky vẫn sống trọn vẹn , cống hiến cho xã hội cuốn tiểu thuyết bất hủ Thép đã tôi thế đấy ! và thành công trong xây dựng hình tượng nhân vật chính - người chiến sĩ hồng quân Pavel Korchagin . Nhiệt tình cách mạng nồng cháy của Pavel đã khiến nhiều độc giả yêu quý anh và phương châm sống của anh cũng đã trở thành phương châm sống của nhiều thanh niên thế hệ Pavel tại khối các nước xã hội chủ nghĩa trong đó có Việt Nam . ', '2020-12-27', '.\\images\\vh11.jpg'),
(12, 'VH', 'VH12', 'Tiếng Gọi Của Hoang Dã', 3, 'Jack London', 42000, 38, 'Câu chuyện kể về một chú chó tên là Bấc đã được thuần hóa. Nhưng một loạt các sự kiện xảy ra khi Bấc bị bắt khỏi trang trại để trở thành chú chó kéo xe ở khu vực Alaska lạnh giá, trong giai đoạn mọi người đổ xô đi tìm vàng ở thế kỷ 19, thiên nhiên nguyên thủy đã đánh thức bản năng của Bấc. Bấc trở lại cuộc sống hoang dã, và sống chung với lũ sói.\nXuất bản lần đầu vào năm 1903, Tiếng gọi của hoang dã đã trở thành tiểu thuyết được nhiều người đọc nhất và được xem là tác phẩm hay nhất của Jack London.\n', '2020-12-27', '.\\images\\vh12.jpg'),
(13, 'VH', 'VH13', 'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 5, 'Nguyễn Nhật Ánh', 64000, 0, 'Trong Cho tôi xin một vé đi tuổi thơ, nhà văn Nguyễn Nhật Ánh mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.\n', '2020-12-27', '.\\images\\vh13.jpg'),
(14, 'VH', 'VH14', 'Tiếng Chim Hót Trong Bụi Mận Gai', 11, 'Colleen Mccullough', 110000, 32, 'Tiểu thuyết Tiếng chim hót trong bụi mận gai xuất bản vào mùa xuân 1977 cùng một lúc ở New York, San Francisco, London, Sydney - Ít lâu sau đã được dịch ra bảy thứ tiếng, được bạn đọc nhiệt liệt hoan nghênh và giới phê bình đánh giá cao. Suốt mấy năm là tác phẩm ăn khách nhất ở phương Tây. Đây là tác phẩm đặc sắc, có giá trị trong văn học thế giới hiện đại.', '2020-12-27', '.\\images\\vh14.jpg'),
(15, 'VH', 'VH15', 'Kẻ Trộm Sách', 10, 'Markus Zusak', 160000, 28, 'Nội dung chính của câu chuyện không lột tả những cảnh chiến trường đẫm máu của thế chiến II, những cảnh giết chóc man rợ… mà đây là câu chuyện về Liesel, cô bé gái mồ côi được làm con nuôi tại phố Thiên Đàng thuộc thành phố Munich. Trong câu chuyện về Liesel, điều ấn tượng nhất với thần chết chính là niềm say mê sách của cô bé. Liesel ăn cắp những cuốn sách bất cứ khi nào có thể. ', '2020-12-27', '.\\images\\vh15.jpg'),
(16, 'KT', 'KT01', 'Từ Tốt Đến Vĩ Đại', 7, 'Jim Collins', 115000, 12, 'Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề. Đây là cuốn sách nên đọc đối với bất kỳ lãnh đạo hay quản lý nào!', '2020-12-27', '.\\images\\kt01.jpg'),
(17, 'KT', 'KT02', 'Tài Chính Cá Nhân', 5, 'Lâm Minh Chánh', 200000, 17, 'Cuốn sách “Tài chính cá nhân dành cho người Việt Nam” và bộ bài giảng trực tuyến tặng kèm, gồm tất cả những nội dung về tài chính cá nhân.\nKiếm tiền: Khi còn thể làm việc, chúng ta cần kiếm tiền, tạo ra thu nhập với \"công suất\" lớn nhất. \nTiết kiệm tiền, sử dụng tiền: Chúng ta phải quản lý tiền hiệu quá, sử dụng tiền khôn ngoan.  Đặc biệt, chúng ta phải tiết kiệm trước khi sử dụng.\nBảo vệ tiền: Chúng ta phải biết bảo vệ tiền sự mất mát của tiền trước những rủi ro. \nĐầu tư tiền: Tiền phải sinh ra tiền. Chúng ta phải đầu tư để tiền tăng trưởng và đạt được mục tiêu tài chính cá nhân. \nMục tiêu tài chính cá nhân: An toàn, Đảm bảo, Độc lập, và Tự do tài chính', '2020-12-27', '.\\images\\kt02.jpg'),
(18, 'KT', 'KT03', 'Chiến Tranh Tiền Tệ ', 8, 'Song Hongbing', 155000, 13, 'Song Hongbing là một học giả rất tài năng trong lĩnh vực kinh tế thế giới. Ông đã dành nhiều thời gian để khám phá lịch sử, nghiên cứu thực tế và cố gắng diễn giải tương lai. Để viết lên cuốn sách thứ hai của mình mang tên Chiến tranh tiền tệ: sự thống trị của quyền lực tài chính, Song Hongbing đã đọc hơn 100 cuốn sách và truy nguyên đến hơn 300 năm trước để khám phá nguồn gốc của hệ thống tài chính hiện tại. Khi đọc cuốn sách này với sự thích thú, bạn sẽ cảm nhận được những đổi thay của thời gian và những thăm trầm của lịch sử.', '2020-12-27', '.\\images\\kt03.jpg'),
(19, 'KT', 'KT04', 'Kỷ Nguyên Mới Của Quản Trị', 5, 'Richard L Dafl', 380000, 20, 'Các nhà quản trị và tổ chức ngày nay đang đối mặt với những sự thay đổi lớn và sâu rộng về xã hội, công nghệ , và kinh tế. Bất cứ một nhà quản trị nào còn tin tưởng hoang đường vào sự ổn định đều phải từ bỏ sự tự mãn của mình khi nhìn thấy các thất bại lần lượt xảy ra trong những tổ chức tài chính lớn của Hòa Kỳ, sự phá sản của một số nhà sản xuất xe hơi hàng đầu, sự sụp đổ của thị trường địa ốc, các nền kinh tế của Châu Âu phải đối mặt với những khó khăn tài chính, và sự suy thoái kinh tế toàn cầu chưa biết khi nào chấm dứt. Quyển sách \"Kỷ nguyên mới của quản trị\" trong lần xuất bản này tập trung vào giải quyết các vấn đề liên quan trong môi trường kinh doanh đang thay đổi nhanh chóng. ', '2020-12-27', '.\\images\\kt04.jpg'),
(20, 'KT', 'KT05', 'Dạy Con Làm Giàu - Tập 1', 4, 'Robert T Kiyosaki', 65000, 31, 'Người giàu không làm việc vì tiền. Họ bắt tiền làm việc cho họ. Chấp nhận thất bại là bước đầu của thành công? Quyền lực của sự lựa chọn! Những bài học không có trong nhà trường. Hãy bắt đầu từ hôm nay “để không có tiền vẫn tạo ra tiền”….', '2020-12-27', '.\\images\\kt05.jpg'),
(21, 'KT', 'KT06', 'Khởi Nghiệp 4.0', 8, 'Dorie Clark', 95000, 41, 'Internet và nền kinh tế toàn cầu đang thay đổi căn bản mọi mặt đời sống thường nhật cũng như thế giới công việc. Trước đây, trong một xã hội mà internet chưa có sự phủ sóng sâu rộng, sẽ rất khó để một start-up nhỏ cạnh tranh được với các doanh nghiệp lớn, và đến một giai đoạn nhất định, doanh nghiệp non nớt sẽ bị chững lại. Tuy thế, thị trường giờ đã thay đổi. Nền kinh tế đang chuyển dịch sang một môi trường tự kinh doanh, tự chủ và chúng ta có thể làm việc ở bất kì nơi nào. Với sự trợ giúp của công nghệ hiện đại và mạng internet, một mình bạn có thể thách thức cả thế giới - đó chính là thông điệp chính được truyền tải trong \"Khởi nghiệp 4.0\".', '2020-12-27', '.\\images\\kt06.jpg'),
(22, 'KT', 'KT07', 'Cách Kiếm Tiền Từ Youtube', 4, 'Benji Travis, Sean Canell', 110000, 28, ' Với cuốn sách Youtube Secrets – Hướng dẫn cách căn bản về kiếm tiền từ Youtube hai chuyên gia về video trực tuyến Sean Cannel và Benji Travis sẽ mang tới cho các bạn những bí quyết đạt được thành công trên Youtube, đúc kết từ hàng trăm cuộc phỏng vấn với những Youtuber nổi tiếng, cũng như từ chính kinh nghiệm hơn 10 năm hoạt động trên Youtube của họ. Cho dù bạn là người mới hay là những Youtuber kỳ cựu, cuốn sách này sẽ giúp bạn xây dựng được một lực lượng người theo dõi lớn mạnh kiếm được những thu nhập triệu đô và tạo nen những tác động to lớn đến cuộc sống của mọi người.', '2020-12-27', '.\\images\\kt07.jpg'),
(23, 'KT', 'KT08', '13 Nguyên Tắc Nghĩ Giàu Làm Giàu', 5, 'Jack Canfield & DD.Watkins', 89000, 35, 'TOP 100 BEST SELLER - 13 Nguyên Tắc Nghĩ Giàu Làm Giàu là cuốn sách “chỉ dẫn” duy nhất chỉ ra những nguồn lực bạn phải có để thành công. Cuốn sách sẽ giúp bạn trở nên giàu có, làm giàu thêm cho cuộc sống của bạn trên tất cả các phương diện của cuộc sống chứ không chỉ về tài chính và vật chất. Những ý tưởng trong cuốn sách Think and Grow rich – 13 nguyên tắc nghĩ giàu, làm giàu bắt nguồn từ những động lực tốt đẹp: “Thành công cá nhân” và “Quan điểm suy nghĩ tích cực”.\n\nCuốn sách chứa đựng nhiều hơn những gì mà cuốn sách giải thích về sức mạnh của những nguyên tắc. Phần hấp dẫn nhất của cuốn sách chính là những điều phi thường, những thông điệp trong cuốn sách được viết ra từ rất lâu nhưng vẫn mang tính “thời đại”. Ông đã bàn về những quan niệm như quản lý nhóm, dịch vụ chăm sóc khách hàng hoàn hảo, những công cụ hữu hình, trí tuệ tập thể và mục tiêu cần được viết ra trước khi hành động.', '2020-12-27', '.\\images\\kt08.jpg'),
(24, 'KT', 'KT09', 'Khởi Nghiệp Tinh Gọn ', 11, 'Eric Ries', 145000, 45, '“Khởi nghiệp” - hai tiếng đơn giản đó có sức hút mạnh mẽ với bất kỳ ai, không chỉ đối với những người đang ấp ủ một dự án kinh doanh, mà ngay cả những ông chủ đang muốn tìm kiếm một sản phẩm hay một ý tưởng mới để “tái khởi nghiệp”, nói cách khác là tái tạo lại mô hình kinh doanh của mình. Tuy nhiên, từ ý tưởng đến thành công là điều không dễ!', '2020-12-27', '.\\images\\kt09.jpg'),
(25, 'KT', 'KT10', 'FOREX 100% ', 11, 'Angel Darazhanov, Miroslav Kozarov, Vasil Banov', 169000, 23, 'Trong cuốn sách này chúng tôi đã cố gắng truyền đạt những hiểu biết và kỹ năng then chốt nhất giúp bạn có thể đưa ra các quyết định giao dịch hiệu quả và thực sự tham gia vào các thị trường Ngoại hối, chứng khoán, kim loại quý và hợp đồng tương lai. Cuốn sách này vừa dành cho các nhà kinh doanh chuyên nghiệp – những người mong muốn nâng cao kỹ năng giao dịch của mình vừa dành cho đông đảo bạn đọc – những người đang cố gắng đi những bước đi đầu tiên trên con đường học hỏi về ngành kinh doanh tài chính hấp dẫn này. Mục tiêu của nó là dạy cho bạn cách làm thế nào để giao dịch thành công.', '2020-12-27', '.\\images\\kt10.jpg'),
(26, 'TL-KNS', 'TL-KNS01', 'Thay Đổi Cuộc Sống Với Nhân Số Học', 1, 'Lê Đỗ Quỳnh Hương', 24800, 7, 'Cuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị Lê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc “The Complete Book of Numerology” của tiến sỹ David A. Phillips, khiến bộ môn Nhân số học khởi nguồn từ nhà toán học Pythagoras trở nên gần gũi, dễ hiểu hơn với độc giả Việt Nam.', '2020-12-28', '.\\images\\tl01.jpg'),
(27, 'TL-KNS', 'TL-KNS02', 'Tôi Tài Giỏi, Bạn Cũng Thế! ', 2, 'Adam Khoo', 118000, 15, 'Cho dù bạn là ai, đang ở đâu, đang học trường nào, đang hướng tới bất kỳ mục tiêu gì trong học tập và cuộc sống, tôi xin chắc chắn với bạn một điều rằng, bạn sẽ tìm được câu trả lời trong quyển sách Tôi Tài Giỏi, Bạn Cũng Thế! – quyển sách chứa đựng những bí quyết đã giúp tác giả Adam Khoo lập nên kỳ tích. Bạn sẽ hiểu tại sao đó là kỳ tích khi biết rằng cậu bé Adam đã từ thứ hạng 156 / 160 học sinh ở một trường tệ nhất Singapore, vươn lên trở thành học sinh giỏi nhất lớp, giỏi nhất trường, rồai tiếp tục thi đậu vào các trường tuyển và cuối cùng trở thành một diễn giả tài năng, một doanh nhân thành đạt và một triệu phú thành công vào năm 26 tuổi. Việc gì cũng có bí quyết riêng của nó!', '2020-12-27', '.\\images\\tl02.jpg'),
(28, 'TL-KNS', 'TL-KNS03', 'Đắc Nhân Tâm', 13, 'Dale Carnegie', 76000, 35, 'Đắc nhân tâm của Dale Carnegie là quyển sách của mọi thời đại và một hiện tượng đáng kinh ngạc trong ngành xuất bản Hoa Kỳ. Trong suốt nhiều thập kỷ tiếp theo và cho đến tận bây giờ, tác phẩm này vẫn chiếm vị trí số một trong danh mục sách bán chạy nhất và trở thành một sự kiện có một không hai trong lịch sử ngành xuất bản thế giới và được đánh giá là một quyển sách có tầm ảnh hưởng nhất mọi thời đại.', '2020-12-27', '.\\images\\tl03.jpg'),
(29, 'TL-KNS', 'TL-KNS04', 'Talmud - Tinh Hoa Trí Tuệ Do Thái', 2, 'Từ Quang Á', 86000, 12, 'Sách là tác phẩm được lưu truyền rộng rãi và được đánh giá rất cao vì nó kết tinh trí tuệ của một dân tộc mà định mệnh ngặt nghèo cũng như năng lực sáng tạo đã trở thành huyền thoại.\nTrong lịch sử nhân loại, có thể nói không một dân tộc nào nhiều khổ nạn phải lìa bỏ quê hương xứ sở phiêu bạt khắp nơi… mà vẫn viết nên những trang sử văn minh rực rỡ như dân tộc Do Thái.\nSách đề cập đến những khía cạnh tinh hoa của Talmud, qua những câu chuyện sinh động ở mọi lĩnh vực: văn hóa, khoa học, nghệ thuật, kinh doanh, giáo dục, đối nhân xử thế…\nTalmud không chỉ là một tác phẩm kinh điển mà còn là một cuốn bách khoa thư, đã đồng hành cùng dân tộc Do Thái qua hàng ngàn năm thăng trầm như một minh chứng cho trí tuệ sáng láng và ý chí sống còn mãnh liệt của con người.', '2020-12-29', '.\\images\\tl04.jpg'),
(30, 'TL-KNS', 'TL-KNS05', 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', 4, 'Trác Nhã', 110000, 25, 'Trong cuộc sống thường ngày, chúng ta thấy rằng: Biết cách nói chuyện không nhất định là phải nói nhiều, quan trọng là phải nói đúng trọng tâm, đúng nội dung. Và điều quan trọng là phải nắm được vấn đề mình đang nói đến. Chắc chắn rất nhiều người đã gặp phải tình huống như thế này: Có những nhân viên tiếp thị khi gặp khách hàng thì giống như một cái máy, nói không ngừng nghỉ, không để ý tới phản ứng và cảm nhận của khách hàng, không cần biết vị khách đó có đang nghe lời giới thiệu về sản phẩm hay không. Nếu làm việc như vậy thì người đó nắm chắc phần thất bại. Trong cuộc sống và trong công việc, chúng ta cũng rất hay gặp phải hiện tượng như sau: Nhiều người khi nói chuyện với người quen thì nói rất hay, không bị mất bình tĩnh hay ấp úng.', '2020-12-27', '.\\images\\tl05.jpg'),
(31, 'TL-KNS', 'TL-KNS06', 'Trên Đường Băng', 5, 'Tony Buổi Sáng', 80000, 30, 'Xuất phát từ cái tâm trong sáng của người đi trước dày dặn kinh nghiệm, kiến thức, Tony Buổi Sáng mang đến đọc giả những bài viết hài ước, tinh tế, sinh động và đầy thiết thực. Cuốn Trên Đường Băng với những bài viết về thái độ với sự học và kiến thức nói chung, cách ứng phó với những trắc trở thử thách khi đi làm, cách sống hào sảng nghĩa tình văn minh… truyền cảm hứng cho các bạn trẻ sống hết mình, trọn vẹn từng phút giây và sẵn sàng cho hành trang cuộc sống.', '2020-12-26', '.\\images\\tl06.jpg'),
(32, 'TL-KNS', 'TL-KNS07', 'Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản', 4, 'William B Irvine', 110000, 15, 'Bạn mong muốn điều gì từ cuộc sống này? Có thể câu trả lời của bạn là muốn có một người bạn đời biết quan tâm, một công việc tốt và một ngôi nhà đẹp, nhưng chúng thực ra chỉ là một số thứ bạn muốn có trong cuộc sống. Khi hỏi bạn mong muốn điều gì từ cuộc sống này, tôi đang hỏi theo nghĩa rộng nhất. Tôi không hỏi về những mục tiêu mà bạn đề ra khi thực hiện các hoạt động hằng ngày, mà tôi đang hỏi về mục tiêu lớn lao trong cuộc sống của bạn. Nói cách khác, trong số những thứ bạn có thể theo đuổi trong cuộc sống, thứ nào bạn tin là có giá trị nhất?', '2020-12-27', '.\\images\\tl07.jpg'),
(33, 'TL-KNS', 'TL-KNS08', 'Tuổi Trẻ Đáng Giá Bao Nhiêu?', 5, 'Rosie Nguyễn', 80000, 13, 'Tuổi trẻ đáng giá bao nhiêu? được tác giả chia làm 3 phần: HỌC, LÀM, ĐI.\nNhưng tôi thấy cuốn sách còn thể hiện một phần thứ tư nữa, đó là ĐỌC.\nHãy đọc sách, nếu bạn đọc sách một cách bền bỉ, sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình.\nNếu tôi còn ở tuổi đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần.”\n- Đặng Nguyễn Đông Vy, tác giả, nhà báo\n', '2020-12-27', '.\\images\\tl08.jpg'),
(34, 'TL-KNS', 'TL-KNS09', 'Đọc Vị Bất Kỳ Ai', 11, 'TS David J Lieberman', 70000, 25, 'Cuốn sách được chia làm hai phần và 15 chương:\nPhần 1: Bảy câu hỏi cơ bản: Học cách phát hiện ra điều người khác nghĩ hay cảm nhận một cách dễ dàng và nhanh chóng trong bất kỳ hoàn cảnh nào.\nPhần 2: Những kế hoạch chi tiết cho hoạt động trí óc - hiểu được quá trình ra quyết định. Vượt ra ngoài việc đọc các suy nghĩ và cảm giác đơn thuần: Hãy học cách người khác suy nghĩ để có thể nắm bắt bất kỳ ai, phán đoán hành xử và hiểu được họ còn hơn chính bản thân họ.\n', '2020-12-27', '.\\images\\tl09.jpg'),
(35, 'TL-KNS', 'TL-KNS10', 'Sức Mạnh Tiềm Thức', 11, 'Joseph Murphyc', 108000, 0, 'Sức Mạnh Tiềm Thức không những có khả năng truyền cảm hứng cho người đọc, mà nó còn rất thực tế vì được minh hoạ bằng những ví dụ sinh động trong cuộc sống hằng ngày. Từ đó, Sức Mạnh Tiềm Thức giúp độc giả vận dụng năng lực trí tuệ phi thường tiềm ẩn troing mỗi người để tạo dựng sự tự tin, xây dựng các mối quan hệ hoà hợp, đạt được thành công trong sự nghiệp, vượt qua những nỗi sợ hãi và ám ảnh, xua đi những thói quen tiêu cực, và thậm chí còn hướng dẫn cách ta chữa lành những vết thương về thể chất cũng như tâm hồn để có sự bình an, hạnh phúc trọn vẹn trong cuộc sống.', '2020-12-30', '.\\images\\tl10.jpg'),
(36, 'TL-KNS', 'TL-KNS11', 'Ba Người Thầy Vĩ Đại', 13, 'Robin Sharma', 95000, 35, '“Cuốn sách này là một tác phẩm hư cấu. Đây là câu chuyện về một người đàn ông có tên Jack Valentine mà đường đời có nhiều điểm giống với tôi. Có cảm nhận rất không đầy đủ với tư cách một con người, anh ấy lên kế hoạch tìm kiếm tri thức để sống một cuộc sống hạnh phúc hơn, khoẻ khoắn hơn và đẹp hơn.”', '2020-12-31', '.\\images\\tl11.jpg'),
(37, 'TL-KNS', 'TL-KNS12', 'Quẳng Gánh Lo Đi & Vui Sống', 13, 'Dale Carnegie', 98000, 16, 'Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn những cách để giảm thiểu lo lắng rất đơn giản như chia sẻ nó với người khác, tìm cách giải quyết vấn đề, quên tất cả những điều lo lắng nằm ngoài tầm tay,... Cố gắng thực tập điều này hàng ngày và trong cuộc sống chắc hẳn bạn sẽ thành công, có thể, không được như bạn muốn, nhưng chỉ cần bớt đi một chút phiền muộn thì cuộc sống của bạn đã có thêm một niềm vui.', '2020-12-27', '.\\images\\tl12.jpg'),
(38, 'TL-KNS', 'TL-KNS13', 'Đời Ngắn Đừng Ngủ Dài', 2, 'Robin Sharma', 75000, 19, 'Bằng những lời chia sẻ thật ngắn gọn, dễ hiểu về những trải nghiệm và suy ngẫm trong đời, Robin Sharma tiếp tục phong cách viết của ông từ cuốn sách Điều vĩ đại đời thường để mang đến cho độc giả những bài viết như lời tâm sự, vừa chân thành vừa sâu sắc.', '2020-12-28', '.\\images\\tl13.jpg'),
(39, 'TL-KNS', 'TL-KNS14', 'Ai Lấy Miếng Pho Mát Của Tôi', 2, 'Spencer Johnson, M D', 48000, 19, 'Câu chuyện kể về hai chú chuột và hai con người tí hon cùng chung sống trong một mê cung rộng lớn luôn tất bật đi tìm những miếng phó mát để nuôi sống mình và để cảm thấy hạnh phúc. Hai chú chuột Đánh Hơi và Nhanh Nhẹn chỉ có bộ não đơn giản của loài gặm nhắm, vốn không có óc phân tích và phán đoán, nhưng chúng lại có bản năng rất nhanh nhạy và sắc sảo. Như các con chuột khác, chúng đặc biệt rất thích pho mát và sẵn sàng làm bất cứ điều gì để có pho mát.', '2020-12-29', '.\\images\\tl14.jpg'),
(40, 'TL-KNS', 'TL-KNS15', 'Người Giàu Có Nhất Thành Babylon', 13, 'George S Clason', 98000, 24, 'Ngày nay, tiền bạc vẫn có những ảnh hưởng lớn đối với cuộc sống con người, cũng giống như cách đây năm ngàn năm nó đã chi phối mạnh mẽ cuộc sống của cư dân vương quốc Babylon, thúc đẩy họ tìm hiểu và nắm bắt các quy luật tạo ra tiền, nhằm có được một cuộc sống sung túc và sang trọng bậc nhất.\nNhững trang sách này sẽ đưa chúng ta trở lại vương quốc Babylon cổ đại, cái nôi nuôi dưỡng những nguyên lý cơ bản về tài chính mà giờ đây con người hiện đại đã kế thừa và vận dụng trên toàn thế giới.', '2020-12-30', '.\\images\\tl15.jpg'),
(41, 'TN', 'TN01', 'Con Sẽ Tự Giác', 9, 'Yunan', 50000, 12, 'Mỗi  nhân  vật  trong  cuốn sách  này  đều  kể  những  câu chuyện rất riêng về quá trình học tập  của mình.  Trên  con đường trưởng thành, nếu biết tự nhận thức bản thân, hiểu rõ  mục  tiêu  phát  triển  của mình,  bồi  đắp  lòng  tự  tin, dám  đối  mặt  với  thử  thách và  kiên  trì  phát  huy  năng lực  bản  thân,  chúng  ta  đều có  thể  thực  hiện  được  ước mơ  và  trở  nên  tốt  đẹp  hơn, thành công hơn.', '2020-12-28', '.\\images\\tn01.jpg'),
(42, 'TN', 'TN02', 'Chuyến Đi Bão Táp', 9, 'Jeff Kinney', 55000, 18, 'Gref Heffley cùng gia đình cậu đang rời khỏi thị trấn.\nThời tiết lạnh buốt lại còn phải chuẩn bị mọi thứ cho lễ Giáng sinh khiến gia đình Heffley cực kỳ mệt mỏi. Họ quyết định trốn tới khu nghỉ dưỡng ở một hòn đảo nhiệt đới xinh đẹp để nghỉ ngơi và thư giãn.\nNhững ngày ở thiên đường đã xảy ra chuyện gì với Greg và gia đình đáng thương của cậu?\nHọ đã sớm phát hiện ra thiên đường chỉ là lời quảng cáo. Ánh mặt trời thiêu đốt, bị tào tháo đuổi và kinh dị nhất là lũ quái vật xuất hiện ở khắp mọi nơi có khiến kỳ nghỉ ấy kết thúc trong thảm họa?', '2020-12-27', '.\\images\\tn02.jpg'),
(43, 'TN', 'TN03', 'Siêu Nhí Hỏi Nhà Khoa Học Trả Lời', 4, 'DK', 250000, 16, 'Cuốn sách khoa học đáng yêu cho các bạn nhỏ này tập hợp 100 câu hỏi về cuộc sống hàng ngày từ các bạn học sinh trên khắp thế giới gửi đến nhà khoa học Robert Winston. Cuốn sách cho chúng ta thấy sự tò mò chung của trẻ em đối với thế giới xung quanh qua những câu hỏi những thu thập từ trẻ em ở Vương quốc Anh, các nước Châu Âu khác, Canada, Mỹ, Ấn Độ, Trung Quốc và Nhật Bản. Các câu hỏi xoay quanh những khía cạnh khác nhau của khoa học, bao trùm ở các chủ đề chính gồm cơ thể con người, vật lý, hóa học, không gian, khoa học tự nhiên và Trái Đất.', '2020-12-27', '.\\images\\tn03.jpg'),
(44, 'TN', 'TN04', 'Con Sẽ Đạt Điểm Tối Đa', 9, 'Yunan', 58000, 20, '“Con sẽ đạt điểm tối đa” kể những câu chuyện về tinh thần học tập miệt mài.\n\nMỗi  nhân  vật  trong  cuốn sách  này  đều  kể  những  câu chuyện rất riêng về quá trình học  tập  của  mình.  Trên  con đường trưởng thành, nếu biết tự nhận thức bản thân, hiểu rõ  mục  tiêu  phát  triển  của mình,  bồi  đắp  lòng  tự  tin, dám  đối  mặt  với  thử  thách và  kiên  trì  phát  huy  năng lực  bản  thân,  chúng  ta  đều có  thể  thực  hiện  được  ước mơ  và  trở  nên  tốt  đẹp  hơn, thành công hơn.', '2020-12-29', '.\\images\\tn04.jpg'),
(45, 'TN', 'TN05', 'Hoàng Tử Bé', 5, 'Antoine de Saint, Exupéry', 25000, 19, '“Hoàng Tử Bé” (tên tiếng Pháp: Le Petit Prince) xuất bản năm 1943 và là tác phẩm nối tiếng nhất trong sự nghiệp của nhà văn phi công Pháp Antoine de Saint-Exupéry. Tác phẩm đã được dịch sang hơn 250 ngôn ngữ và cho đến nay đã bán được hơn 200 triệu bản khắp thế giới.\n\nCuốn sách đẹp như một bài thơ thanh sáng, một câu chuyện cổ tích về tình yêu thương, lòng nhân ái, ý nghĩa của sự tồn tại, về sự cảm thông giữa người với người...\n\nSự giản dị trong sáng tỏa khắp tác phẩm đã khiến nó trở thành một bài thơ bất hủ mà mãi mãi người ta muốn đem làm quà tặng của tình yêu.', '2020-12-27', '.\\images\\tn05.jpg'),
(46, 'TN', 'TN06', 'Trong Cái Không Có Gì Không?', 12, 'Thích Nhất Hạnh', 160000, 38, 'Thiền sư Thích Nhất Hạnh đã giải đáp được những câu hỏi khó, ngộ nghĩnh và chân thành của các em nhỏ trong mọi lứa tuổi.\n\nVui tươi mà sâu sắc, “Trong cái KHÔng có cái gì không?” là lời giải đáp hoàn toàn thích hợp cho những câu hỏi của các bạn nhỏ, cho những người lớn đang đi tìm những câu trả lời cho con em họ, hay cho những ai đang có những câu hỏi của riêng mình.', '2020-12-26', '.\\images\\tn06.jpg'),
(47, 'TN', 'TN07', 'Dế Mèn Phiêu Lưu Ký ', 9, 'Tô Hoài', 50000, 28, '“Một con dế đã từ tay ông thả ra chu du thế giới tìm những điều tốt đẹp cho loài người. Và con dế ấy đã mang tên tuổi ông đi cùng trên những chặng đường phiêu lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thiên nhiên và văn hóa của các quốc gia khác. Dế Mèn Tô Hoài đã lại sinh ra Tô Hoài Dế Mèn, một nhà văn trẻ mãi không già trong văn chương...” - Nhà phê bình Phạm Xuân Nguyên', '2020-12-27', '.\\images\\tn07.jpg'),
(48, 'TN', 'TN08', 'Danh Nhân Thế Giới: Anh Em Nhà Wright ', 5, 'Team kids, Han, Nana', 55000, 17, 'Anh em nhà Wright từng là những cậu bé có đôi bàn tay khéo léo và vô cùng hiếu kì. Suốt cuộc đời họ chỉ có duy nhất một giấc mơ lớn, đó là chế tạo ra chiếc máy bay và chinh phục khoảng không bao la. Nhưng để có được thành công ấy, anh em Wright đã trải qua rất nhiều khó khăn, thử thách, luôn bền gan, vững chí đi theo con đường mình đã lựa chọn. Nào, các em hãy thưởng thức tác phẩm tuyệt vời về những phi công đầu tiên trên thế giới bay lên trời bằng máy bay có động cơ nhé!!!', '2020-12-27', '.\\images\\tn08.jpg'),
(49, 'TN', 'TN09', 'Chuyện Con Mèo Dạy Hải Âu Bay', 9, 'Luis Sepúlveda', 49000, 20, 'Chuyện con mèo dạy hải âu bay là kiệt tác dành cho thiếu nhi của nhà văn Chi Lê nổi tiếng Luis Sepúlveda – tác giả của cuốn Lão già mê đọc truyện tình đã bán được 18 triệu bản khắp thế giới. Tác phẩm không chỉ là một câu chuyện ấm áp, trong sáng, dễ thương về loài vật mà còn chuyển tải thông điệp về trách nhiệm với môi trường, về sự sẻ chia và yêu thương cũng như ý nghĩa của những nỗ lực – “Chỉ những kẻ dám mới có thể bay”.', '2020-12-27', '.\\images\\tn09.jpg'),
(50, 'TN', 'TN10', 'Bubu Tập 17: Mừng Giáng Sinh', 9, 'NXB Trẻ', 11000, 15, 'Những câu chuyện lễ giáo trong bộ sách này là những bài giáo dục đạo đức nho nhỏ giúp các em học hỏi những điều hay và tránh những thói quen, tật xấu để trở thành người con ngoan, trò giỏi.', '2020-12-30', '.\\images\\tn10.jpg'),
(51, 'NDC', 'NDC01', 'Để Con Được Ốm', 6, 'Uyên Bùi, BS Trí Đoàn', 95000, 12, 'Để con được ốm có thể coi là một cuốn nhật ký học làm mẹ thông qua những câu chuyện từ trải nghiệm thực tế mà chị Uyên Bùi đã trải qua từ khi mang thai đến khi em bé chào đời và trở thành một cô bé khỏe mạnh, vui vẻ. Cùng với những câu chuyện nhỏ thú vị của người mẹ là lời khuyên mang tính chuyên môn, giải đáp cụ thể từ bác sỹ Nguyễn Trí Đoàn, giúp hóa giải những hiểu lầm từ kinh nghiệm dân gian được truyền lại, cũng như lý giải một cách khoa học những thông tin chưa đúng đắn đang được lưu truyền hiện nay, mang đến góc nhìn đúng đắn nhất cho mỗi hiện tượng, sự việc với những kiến thức y khoa hiện đại được cập nhật liên tục. Cuốn sách sẽ giúp các bậc phụ huynh trang bị một số kiến thức cơ bản trong việc chăm sóc trẻ một cách khoa học và góp phần giúp các mẹ và những-người-sẽ-là-mẹ trở nên tự tin hơn trong việc chăm con, xua tan đi những lo lắng, để mỗi em bé ra đời đều được hưởng sự chăm sóc tốt nhất.', '2020-12-28', '.\\images\\ndc01.jpg'),
(52, 'NDC', 'NDC02', 'Giáo Dục Con Của Người Do Thái', 2, 'Trần Hân, Thanh Nhã', 62000, 8, '\"Người Do Thái là dân tộc thông minh nhất thế giới, họ dường như được sinh ra là để làm chủ thế giới này\". Dù không phải là một chủng tộc lớn, đất nước Do Thái chỉ có hơn 7 triệu dân nhưng không một nhóm chủng tộc nào có thể sánh được với người Do Thái về khả năng và thành tích vượt trội. Góp phần làm biến động lịch sử nhân loại thế kỉ XX, phải kể đến nhà khoa học vĩ đại Albert Einstein, bộ óc của thế kỉ Sigmund Freud, họa sĩ theo trường phái lập thể Picasso, người sáng tạo ra chủ nghĩa Cộng sản Karl Marx hay những người giàu nhất thế giới như Bill Gates, Warren Bufett, Micheal Dell... Nói về người Do Thái thì ai trong chúng ta cũng đều trầm trồ ngưỡng mộ và khâm phục. Có bao giờ bạn tự hỏi tại sao họ lại có trí tuệ phi thường như vậy? Tại sao họ lại được sinh ra với quá nhiều ưu việt như thế? Có phải tất cả đều là tự nhiên? Liệu Việt Nam chúng ta có thể tạo ra những thế hệ ưu việt như thế không? Tất cả câu hỏi trên đều có thể được giải đáp bởi chính các bạn và cuốn sách bạn đang cầm trên tay. Hi vọng các bậc cha mẹ có thể lĩnh ngộ được quan niệm giáo dục con cái người Do Thái. Học tập và vận dụng kinh nghiệm giáo dục của họ là món quà tuyệt vời giúp con bạn thành công trong tương lai.', '2020-12-27', '.\\images\\ndc02.jpg'),
(53, 'NDC', 'NDC03', 'Ăn Dặm Kiểu Nhật', 6, 'Tsutsumi Chiharu', 149000, 18, 'Đúng như tiêu đề của cuốn sách, tôi giới thiệu những công thức nấu ăn đơn giản mà ai cũng có thể làm được trong thời gian ngắn bởi nó “đơn giản”, “dễ làm” và những công thức nấu ăn phong phú sáng tạo ví dụ như chia từ thức ăn của người lớn, thực đơn sử dụng baby food … Ngoài ra còn nói rất cẩn thận về những thực phẩm cần phải cân nhắc khi trẻ bị ốm, dị ứng thực phẩm. Hơn nữa, cuốn sách cũng có cả những công thức nấu ăn khi bị dị ứng để bữa ăn dặm không trở nên nhàm chán.\n', '2020-12-27', '.\\images\\ndc03.jpg'),
(54, 'NDC', 'NDC04', 'Đọc Vị Mọi Vấn Đề Của Trẻ', 2, 'Tracy Hogg, Melinda Blau', 155000, 10, 'Trong cuốn sách này, tôi muốn giúp bạn, xoa dịu nỗi sợ của bạn và chỉ cho bạn cách tự tạo cho mình sức mạnh của một người làm cha mẹ. Tôi muốn dạy cho bạn những gì tôi đã học được từ công việc cả đời thì thầm với trẻ cũng như trả lời những câu hỏi mà bạn đặt ra cho tôi. Tôi muốn dạy bạn cách nghĩ giống như tôi. Tất nhiên, dù tôi có cố gắng liệt kê tất cả những vấn đề mà bạn có thể gặp phải thì mỗi một em bé và mỗi một gia đình lại có một chút khác biệt. Vì thế, khi các ông bố bà mẹ tìm đến tôi với một vấn đề cụ thể nào đó, để đánh giá xem chuyện gì đang xảy ra trong ngôi nhà và với đứa con sơ sinh hoặc đứa con mới chập chững biết đi của họ, tôi luôn hỏi ít nhất một, nếu không thì phải một loạt những câu hỏi về cả đứa trẻ và việc mà cha mẹ đã làm để ứng phó với tình huống đó. Sau đó, tôi mới có thể nghĩ ra kế hoạch hành động phù hợp. Mục tiêu của tôi là giúp bạn hiểu được quá trình tư duy và hình thành thói quen tự đặt câu hỏi. Như vậy, bạn sẽ không chỉ là người thì thầm với trẻ, mà còn trở thành một người giải quyết vấn đề xuất sắc – một Quý bà hoặc Quý ông vạn năng. Khi đọc tiếp, tôi muốn bạn nhớ điều quan trọng này:', '2020-12-29', '.\\images\\ndc04.jpg'),
(55, 'NDC', 'NDC05', 'Vô Cùng Tàn Nhẫn, Vô Cùng Yêu Thương ', 4, 'Sara Imas', 169000, 18, 'Giáo dục con cái là một môn học, một nghệ thuật, mà tất cả mọi người đều phải học tập. Đáng thương cho tấm lòng cha mẹ trong thiên hạ, nếu không học cách nuôi dạy con đúng đắn thì chắc chắn sẽ chuốc lấy hậu quả đáng sợ và đáng hận. “Con muốn học mà cha mẹ không dạy” cũng bi thương như “con muốn nuôi, mà cha mẹ chẳng còn”. Vậy cha mẹ cần dạy dỗ con một cách khoa học như thế nào? Đó là một câu hỏi và cũng là một vấn đề lớn có liên quan mật thiết đến sự thành công hay thất bại của một người và cũng như sự hưng thịnh hay suy thoái của cả một dân tộc.', '2020-12-27', '.\\images\\ndc05.jpg'),
(56, 'HNN', 'HNN01', 'Giải Thích Ngữ Pháp Tiếng Anh', 6, 'Mai Lan Hương, Hà Thanh UYên', 186000, 6, 'Sách Giải Thích Ngữ Pháp Tiếng Anh Với Bài Tập Và Đáp Án được biên soạn thành 9 chương, đề cập đến những vấn đề ngữ pháp từ cơ bản đến nâng cao.\n\nNội dung các chương được biên soạn dựa trên ngữ pháp tiiếng Anh hiện đại, giải thích cặn kẽ, rõ ràng các cách dùng và quy luật mà người học cần nắm vững: đồng thời chỉ ra những quy luật khác nhau giữa tiếng anh của người Anh (British English) và tiếng Anh của người Mỹ (American English).\n\nCuối mỗi phần ngữ pháp đều có bài tập đa dạng để giúp người học nắm vững phần lý thuyết. Hơn nữa, hiện nay hình thức thi trắc nghiệm đang được áp dụng trong các kỳ thi, nên trong sách này chúng tôi biên soạn một số phần bài tập trắc nghiệm để đáp ứng nhu cầu của người học trong tình hình mới.\n\nHy vọng Giải Thích Ngữ Pháp Tiếng Anh sẽ là một quyển sách thiết thực, đáp ứng yêu cầu học, ôn tập và nâng cao trình độ ngữ pháp cho người học và là quyển sách tham khảo bổ ích dành cho giáo viên.', '2020-12-26', '.\\images\\hnn01.jpg'),
(57, 'HNN', 'HNN02', 'Hackers Ielts: Writing', 6, 'Ngô Thu Hằng', 239000, 8, 'IELTS là cánh cửa giúp các bạn thí sinh hiện thực hóa ước mơ vươn ra thế giới. Chính vì vậy, ngay từ bây giờ, hãy nỗ lực luyện tập và chuẩn bị cho bài thi quan trọng này. Viện Ngôn ngữ Hackers đã biên soạn bộ sách HACKERS IELTS gồm 4 cuốn tương đương với 4 kỹ năng nhằm giới thiệu tới các bạn phương pháp luyện thi phù hợp nhất để có thể đạt điểm cao trong bài thi này.', '2020-12-26', '.\\images\\hnn02.jpg'),
(58, 'HNN', 'HNN03', 'Tự Học Tiếng Thái Cho Người Mới Bắt Đầu', 6, 'Trịnh Thế Thắng', 95000, 0, 'Sách chủ yếu cung cấp đến các bạn mới bắt đầu học các từ vựng và ngữ pháp cơ bản để giao tiếp với người Thái trong tình huống cụ thể, thông dụng. Một điều quan trọng nữa là cuốn sách này giảng dạy kỹ lưỡng hệ thống chữ viết của tiếng Thái giúp các bạn học có cơ sở học thêm kiến thức sau này.\n\nHy vọng cuốn sách sẽ giúp ích được nhiều cho các bạn trong quá trình tự học tiếng Thái.', '2020-12-26', '.\\images\\hnn03.jpg'),
(59, 'HNN', 'HNN04', '25 Chuyên Đề Ngữ Pháp Tiếng Anh', 2, 'Trang Anh', 110000, 11, 'Các chuyên đề ngữ pháp trọng tâm được trình bày đơn giản, dễ hiểu cùng với hệ thống bài tập và từ vựng phong phú. Có tất cả 25 chuyên đề trong 2 tập sách, là tài liệu hữu ích cho học sinh, sinh viên, người đi làm, luyện thi cho các kỳ thi quốc gia, ôn luyện các chứng chỉ quốc tế và là tài liệu tham khảo cho giáo viên.', '2020-12-26', '.\\images\\hnn04.jpg'),
(60, 'HNN', 'HNN05', 'Tự Học 2000 Từ Vựng Tiếng Anh', 4, 'The Windy', 65000, 15, 'Nhà ngôn ngữ học nổi tiếng D.A.Wilkins đã nói rằng “Without grammar, very little can be conveyed; without vocabulary, nothing can be conveyed.” (Không có ngữ pháp, rất ít thông tin có thể được truyền đạt; Không có từ vựng, không một thông tin nào có thể được truyền đạt cả). Vì thế, trong việc học một ngoại ngữ, thì từ vựng có thể xem như các tế bào nhỏ hình thành nên khả năng sử dụng ngoại ngữ của người học.\n', '2020-12-26', '.\\images\\hnn05.jpg'),
(61, 'HNN', 'HNN06', 'English Grammar In Use', 6, 'Raymond Murphy', 150000, 11, 'Cuốn sách “English Grammar in use - 130 bài ngữ pháp tiếng Anh ”– tác giả Raymond Murphy đã và đang được nhiều thế hệ người học tiếng Anh trên toàn thế giới sử dụng như là một cuốn sổ tay tổng hợp Ngữ pháp đầy đủ và toàn diện. Cuốn sách được nhiều trường Đại học, Cao đẳng, các Trung tâm ngoại ngữ đưa vào chương trình giảng dạy và luôn nằm trong top bán chạy nhất tại các hiệu sách và trên các trang bán sách online hiện nay.\r\nCuốn sách gồm 130 chủ đề ngữ pháp thông dụng nhất hiện nay từ cơ bản đến trung cấp được trình bày ngắn gọn dễ hiểu và kèm theo 5 phụ lục giải thích các trường hợp ngữ pháp đặc biệt.\r\nNội dung các chủ đề bao gồm lý thuyết ngữ pháp và bài tập thực hành với lời giải thích rõ ràng, ví dụ mình hoạ thực tế.\r\nCác dạng bài luyện tập đa dạng, hữu ích và mang tính thử thách.', '2020-12-26', '.\\images\\hnn06.jpg'),
(62, 'HNN', 'HNN07', 'Động Từ Bất Quy Tắc & Ngữ Pháp Tiếng Anh', 4, 'Mai Lan Hương', 155000, 13, 'Động Từ Bất Quy Tắc & Ngữ Pháp Tiếng Anh Căn Bản\n\nViệc học một thứ ngôn ngữ khác không phải tiếng mẹ đẻ, bao giờ cũng đem lại cho bạn nhiều khó khăn, vì thế  để học tốt tiếng Anh hay bất kì thứ tiếng nào khác đòi hỏi bạn phải có sự kiên trì và tài liệu học tập tốt.', '2020-12-26', '.\\images\\hnn07.jpg'),
(63, 'HNN', 'HNN08', 'Cambridge IELTS 12 Academic With Answers', 14, 'Cambridge University', 140000, 0, 'Cambridge IELTS 12 bao gồm 4 bài kiểm tra thi IELTS đích thực với đầy đủ các kỹ năng Nghe – Nói – Đọc – Viết từ kỳ thi Cambridge English Language Assessment. Bên cạnh đó, Cambridge IELTS 12 sẽ giới thiệu những thay đổi Mo-đun đề thi IELTS năm 2017 so với những năm trước.\n\nSau khi làm bài test bạn sẽ kiểm tra được trình độ IELTS của bản thân ở thời điểm hiện tại và xác định được mục tiêu cụ thể trong tương lai cũng như nắm bắt được các thay đổi mới trong đề thi IELTS.\n\nPhiên bản Academic dành cho những ai muốn học ở bậc đại học hoặc các học viện, các hình thức đào tạo sau đại học, các bạn chuẩn bị làm du học sinh..', '2020-12-26', '.\\images\\hnn08.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `publishing_company`
--

DROP TABLE IF EXISTS `publishing_company`;
CREATE TABLE IF NOT EXISTS `publishing_company` (
  `Publishing_Company_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Publishing_Company_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Publishing_Company_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publishing_company`
--

INSERT INTO `publishing_company` (`Publishing_Company_Id`, `Publishing_Company_Name`) VALUES
(1, 'Thái Hà Books'),
(2, 'Phương Nam Book'),
(3, 'NXB Văn Học'),
(4, 'NXB Tổng Hợp TPHCM'),
(5, 'NXB Trẻ'),
(6, 'NXB Thế Giới'),
(7, 'NXB Lao Động'),
(8, 'NXB Kinh Tế'),
(9, 'NXB Kim Đồng'),
(10, 'NXB Hội Nhà Văn'),
(11, 'NXB Dân Trí'),
(12, 'Nhã Nam'),
(13, 'First News'),
(14, 'Cambridge University');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `Purchase_Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `DeliveryAddress` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `PhoneNumber` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  PRIMARY KEY (`Purchase_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`Purchase_Id`, `User_Id`, `Name`, `DeliveryAddress`, `PhoneNumber`, `Email`, `CreatedAt`, `UpdatedAt`, `Total`, `State`) VALUES
(8, 3, 'Lưu Minh Huy', '96/2, Quận TB', '0373829264', 'minhhuy243@gmail.com', '2021-01-19', NULL, 200000, 1),
(2, 3, 'Huy', '227 Nguyễn Văn Cừ', '1900 0000', 'lmh@ebook.com', '2021-01-19', NULL, NULL, 1),
(9, 2, 'Nguyễn Ngọc Đức', '500/48D Đoàn Văn Bơ, phường 14, quận 4', '0399116798', 'nnd@ebook.com', '2021-01-20', NULL, 826000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetail`
--

DROP TABLE IF EXISTS `purchasedetail`;
CREATE TABLE IF NOT EXISTS `purchasedetail` (
  `Purchase_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Purchase_Id`,`Product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchasedetail`
--

INSERT INTO `purchasedetail` (`Purchase_Id`, `Product_Id`, `Quantity`, `TotalAmount`) VALUES
(2, 2, 15, NULL),
(2, 20, 12, NULL),
(2, 33, 24, NULL),
(2, 48, 9, NULL),
(2, 53, 18, NULL),
(2, 60, 10, NULL),
(8, 17, 1, 200000),
(9, 1, 1, 112000),
(9, 4, 1, 91000),
(9, 7, 1, 119000);

-- --------------------------------------------------------

--
-- Table structure for table `purchasestate`
--

DROP TABLE IF EXISTS `purchasestate`;
CREATE TABLE IF NOT EXISTS `purchasestate` (
  `PurchaseState_Key` int(11) NOT NULL,
  `Value` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Description` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DisplayText` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`PurchaseState_Key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchasestate`
--

INSERT INTO `purchasestate` (`PurchaseState_Key`, `Value`, `Description`, `DisplayText`) VALUES
(-1, 'All', 'Tất cả trạng thái', 'Tất cả'),
(1, 'Confirm', 'Đơn hàng đang được xác nhận', 'Đang xác nhận'),
(2, 'Shipping', 'Đơn hàng đang được giao', 'Đang giao'),
(3, 'Cancelled', 'Đơn hàng đã bị huỷ', 'Đã hủy'),
(4, 'Delivered', 'Đơn hàng đã giao thành công', 'Giao thành công');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(10000) CHARACTER SET utf8 DEFAULT NULL,
  `Last_Name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `First_Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phonenumber` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `Verification_Code` varchar(264) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Verified` int(11) DEFAULT NULL,
  PRIMARY KEY (`User_Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_Id`, `Email`, `Password`, `Last_Name`, `First_Name`, `Address`, `Phonenumber`, `Verification_Code`, `Verified`) VALUES
(1, 'admin@ebook.com', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', '', NULL, '', NULL, 1),
(2, 'nnd@ebook.com', 'e3df5aea6b2ef20ba65e35811c38a43b', 'NND', NULL, NULL, '', NULL, 1),
(3, 'lmh@ebook.com', '78bc33b76c96dd9b74f85db936aacc7f', 'LMH', NULL, NULL, '', NULL, 1);

-- --------------------------------------------------------
