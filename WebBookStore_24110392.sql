CREATE DATABASE  IF NOT EXISTS `webbookstore_24110392` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webbookstore_24110392`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: webbookstore_24110392
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--
CREATE TABLE cart_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_amount FLOAT NOT NULL,
    payment_method NVARCHAR(50),
    status NVARCHAR(50) NOT NULL,
    receiver_name NVARCHAR(150),
    phone VARCHAR(20),
    address NVARCHAR(255)
);

CREATE TABLE order_details (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price FLOAT NOT NULL
);

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `bookid` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`bookid`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`) ON DELETE CASCADE,
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `isbn` int DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `publisher` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `publish_date` date DEFAULT NULL,
  `cover_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1111,'Lập trình Java Cơ Bản','NXB Trẻ',150000.00,'Sách học Java cho người mới','2023-01-01','https://m.media-amazon.com/images/I/61mIq2iJ2yL._AC_UF1000,1000_QL80_.jpg',50),(2,2222,'Cấu trúc dữ liệu và giải thuật','NXB Giáo Dục',200000.00,'Tài liệu chuẩn CTDL','2023-05-15','https://m.media-amazon.com/images/I/71Xy0e1CjML._AC_UF1000,1000_QL80_.jpg',30),(3,3333,'Lập trình Web Servlet JSP','NXB ĐHQG',180000.00,'Học làm web bằng Java','2024-02-20','https://m.media-amazon.com/images/I/61d15Qv8-SL._AC_UF1000,1000_QL80_.jpg',20),(4,4444,'Spring Boot Thực Chiến','NXB Thanh Niên',250000.00,'Sách nâng cao về Spring','2024-08-10','https://m.media-amazon.com/images/I/81GZ1L9gHqL._AC_UF1000,1000_QL80_.jpg',10),(5,1001,'Clean Code','NXB Công Nghệ',250000.00,'Nghệ thuật viết code sạch và tối ưu','2023-01-10','https://placehold.co/300x450/2c3e50/FFF?text=Clean+Code',50),(6,1002,'The Pragmatic Programmer','NXB IT',280000.00,'Tư duy lập trình viên thực hành','2022-11-20','https://placehold.co/300x450/34495e/FFF?text=Pragmatic\nProgrammer',35),(7,1003,'Design Patterns','NXB Khoa Học',300000.00,'Mẫu thiết kế phần mềm kinh điển','2021-05-15','https://placehold.co/300x450/8e44ad/FFF?text=Design\nPatterns',20),(8,1004,'Head First Java','O Reilly',350000.00,'Học Java qua hình ảnh cực dễ hiểu','2023-08-01','https://placehold.co/300x450/2980b9/FFF?text=Head+First\nJava',40),(9,1005,'Cracking the Coding Interview','NXB Trẻ',320000.00,'189 câu hỏi phỏng vấn lập trình','2022-09-12','https://placehold.co/300x450/27ae60/FFF?text=Cracking\nInterview',60),(10,1006,'Spring Boot in Action','Manning',290000.00,'Thực chiến Spring Boot Framework','2023-10-05','https://placehold.co/300x450/16a085/FFF?text=Spring+Boot',25),(11,1007,'JavaScript: The Good Parts','O Reilly',150000.00,'Những phần tinh túy nhất của JS','2020-03-22','https://placehold.co/300x450/f39c12/FFF?text=JavaScript',80),(12,1008,'React Hướng Đối Tượng','NXB Bách Khoa',210000.00,'Lập trình Frontend với ReactJS','2024-01-10','https://placehold.co/300x450/2980b9/FFF?text=React+JS',45),(13,1009,'Cấu Trúc Dữ Liệu Nâng Cao','NXB Giáo Dục',180000.00,'Dành cho sinh viên IT','2023-04-14','https://placehold.co/300x450/d35400/FFF?text=DSA',100),(14,1010,'Làm Chủ MySQL','NXB Trẻ',170000.00,'Tối ưu hóa cơ sở dữ liệu','2023-07-07','https://placehold.co/300x450/34495e/FFF?text=MySQL',30),(15,2001,'Nhà Đầu Tư Thông Minh','NXB Trẻ',200000.00,'Kinh thánh về đầu tư giá trị','2022-02-15','https://placehold.co/300x450/c0392b/FFF?text=Nha+Dau+Tu\nThong+Minh',75),(16,2002,'Tư Duy Nhanh Và Chậm','NXB Tổng Hợp',190000.00,'Tâm lý học hành vi trong kinh tế','2021-11-11','https://placehold.co/300x450/1abc9c/FFF?text=Tu+Duy\nNhanh+Cham',50),(17,2003,'Zero to One','NXB Lao Động',150000.00,'Cách xây dựng công ty tương lai','2023-05-20','https://placehold.co/300x450/2c3e50/FFF?text=Zero+to+One',65),(18,2004,'The Lean Startup','NXB Trẻ',180000.00,'Khởi nghiệp tinh gọn','2020-08-08','https://placehold.co/300x450/f1c40f/333?text=Lean+Startup',40),(19,2005,'Cha Giàu Cha Nghèo','NXB Thanh Niên',160000.00,'Thay đổi tư duy tài chính','2022-01-05','https://placehold.co/300x450/8e44ad/FFF?text=Cha+Giau\nCha+Nghio',120),(20,2006,'Từ Tốt Đến Vĩ Đại','NXB Trẻ',185000.00,'Vì sao một số công ty vươn lên vượt bậc','2021-06-30','https://placehold.co/300x450/e67e22/FFF?text=Tot+Den+Vi+Dai',55),(21,2007,'Nghệ Thuật Bán Hàng Bậc Cao','NXB Phụ Nữ',140000.00,'Chiến lược sale đỉnh cao','2023-09-09','https://placehold.co/300x450/d35400/FFF?text=Ban+Hang',30),(22,2008,'Tâm Lý Học Tội Phạm','NXB Tổng Hợp',210000.00,'Đọc vị người khác trong kinh doanh','2024-02-14','https://placehold.co/300x450/2c3e50/FFF?text=Tam+Ly+Hoc',85),(23,2009,'Đắc Nhân Tâm','NXB Tổng Hợp',120000.00,'Nghệ thuật thu phục lòng người','2020-01-01','https://placehold.co/300x450/27ae60/FFF?text=Dac+Nhan+Tam',200),(24,2010,'Dạy Con Làm Giàu 2','NXB Trẻ',130000.00,'Kim tứ đồ và tự do tài chính','2021-04-18','https://placehold.co/300x450/9b59b6/FFF?text=Kim+Tu+Do',70),(25,3001,'Nhà Giả Kim','NXB Hội Nhà Văn',99000.00,'Cuốn sách thay đổi cuộc đời','2019-12-12','https://placehold.co/300x450/e74c3c/FFF?text=Nha+Gia+Kim',150),(26,3002,'Tuổi Trẻ Đáng Giá Bao Nhiêu','NXB Hội Nhà Văn',110000.00,'Trải nghiệm và dấn thân','2022-07-20','https://placehold.co/300x450/16a085/FFF?text=Tuoi+Tre',90),(27,3003,'Muôn Kiếp Nhân Sinh','NXB Tổng Hợp',198000.00,'Khám phá bí ẩn của nhân loại','2021-09-09','https://placehold.co/300x450/34495e/FFF?text=Muon+Kiep',60),(28,3004,'Cây Cam Ngọt Của Tôi','NXB Văn Học',105000.00,'Câu chuyện cảm động về Zeze','2020-10-15','https://placehold.co/300x450/f39c12/FFF?text=Cay+Cam+Ngot',80),(29,3005,'Harry Potter và Hòn Đá Phù Thủy','NXB Trẻ',250000.00,'Hành trình phép thuật bắt đầu','2023-11-01','https://placehold.co/300x450/2c3e50/FFF?text=Harry+Potter+1',110),(30,3006,'Harry Potter và Phòng Chứa Bí Mật','NXB Trẻ',255000.00,'Chuyến phiêu lưu năm hai','2023-11-15','https://placehold.co/300x450/8e44ad/FFF?text=Harry+Potter+2',105),(31,3007,'Sapiens: Lược Sử Loài Người','NXB Tri Thức',220000.00,'Từ vượn người đến thống trị thế giới','2021-03-03','https://placehold.co/300x450/d35400/FFF?text=Sapiens',45),(32,3008,'Điều Kì Diệu Của Tiệm Tạp Hóa','NXB Trẻ',145000.00,'Chữa lành tâm hồn','2022-08-08','https://placehold.co/300x450/2980b9/FFF?text=Tiem+Tap+Hoa',65),(33,3009,'Hai Số Phận','NXB Văn Học',175000.00,'Khát vọng và sinh tồn','2020-05-05','https://placehold.co/300x450/c0392b/FFF?text=Hai+So+Phan',40),(34,3010,'Không Diệt Không Sinh Đừng Sợ Hãi','NXB Tổng Hợp',135000.00,'Thiền sư Thích Nhất Hạnh','2021-12-01','https://placehold.co/300x450/27ae60/FFF?text=Thich+Nhat+Hanh',55);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `userid` int NOT NULL,
  `bookid` int NOT NULL,
  `rating` tinyint DEFAULT NULL,
  `review_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`userid`,`bookid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,33,5,'hay 10đ');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `passwd` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_admin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kevin7a1lxag@gmail.com','Phan Nhật Vy',979902346,'123456','2026-09-23 08:28:14',NULL,_binary '\0'),(2,'admin@gmail.com','Phan Nhật Vy (Admin)',987654321,'123456','2026-09-23 09:27:02',NULL,_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 10:27:38
