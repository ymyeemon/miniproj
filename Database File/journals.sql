-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 06:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `journals`
--

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `journalId` int(10) NOT NULL,
  `location` varchar(20) NOT NULL,
  `period` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`journalId`, `location`, `period`, `title`, `text`, `date`, `image`) VALUES
(2, 'Bali', '1 week', 'A Journey to Bali', 'A few weeks ago, I had the pleasure of visiting Bali, a tropical paradise that exceeded all my expectations. From the moment I arrived, I was enchanted by the island\'s lush landscapes, vibrant culture, and warm hospitality. I spent my days exploring terraced rice paddies, ancient temples, and stunning beaches, each location offering a new facet of Bali\'s beauty. The evenings were filled with the mesmerizing rhythms of traditional dances and the flavors of Balinese cuisine. This trip was a perfect blend of adventure and relaxation, leaving me with unforgettable memories and a longing to return.', '2024-03-14', 'pic8.jpeg'),
(6, 'Korea', '2 weeks', 'My soulful trip to Seoul, Korea!', 'Discovering Seoul Last week, I spent a few days exploring the vibrant city of Seoul. From the bustling streets of Myeongdong filled with shops and street food vendors to the tranquil beauty of Gyeongbokgung Palace, Seoul offered a perfect blend of modernity and tradition. I enjoyed delicious Korean BBQ and experienced the unique charm of a traditional hanok village. One evening, I visited Namsan Tower and was mesmerized by the panoramic views of the city lights. It was a trip filled with cultural discoveries and unforgettable moments. And, I can\'t wait any longer to visit Seoul once again!', '2023-09-03', 'pic4.jpeg'),
(7, 'Thailand', '1 week', 'Exploring the wonders of Thailand', 'My journey through Thailand has been nothing short of incredible. Starting in the bustling city of Bangkok, I was immediately captivated by the vibrant energy, colorful street markets, and the aroma of delicious Thai cuisine. The Grand Palace, with its stunning architecture and intricate details, left me in awe. Each evening, I found myself lost in the maze of night markets, sampling exotic fruits and savoring spicy street food. One highlight was a serene boat ride along the Chao Phraya River, where I witnessed the harmonious blend of ancient temples and modern skyscrapers. Thailand’s rich culture and welcoming spirit have truly made this trip unforgettable.', '2023-05-19', 'pic5.jpeg'),
(9, 'Japan', '2 weeks', 'Japan, A Journey through Tradition and Innovation', 'Exploring Japan was a mesmerizing blend of ancient tradition and cutting-edge modernity. From the serene temples nestled amidst cherry blossom gardens to the bustling streets of Tokyo adorned with neon lights, every corner offered a glimpse into a culture rich in history and innovation. Indulging in sushi delicacies at Tsukiji Fish Market, marveling at the majestic Mount Fuji, and experiencing the tranquility of Kyoto\'s bamboo forests were just a few highlights of my unforgettable journey. Japan\'s hospitality and meticulous attention to detail left a lasting impression, making it a destination that truly captures the essence of both past and future.', '2023-08-23', 'pic2.jpeg'),
(10, 'Vietnam', '1 week', 'Quick Getaway to Vietnam', 'From the bustling streets of Hanoi to the tranquil waters of Ha Long Bay, my week-long journey through Vietnam was nothing short of magical. Each day brought new adventures and breathtaking sights, from exploring ancient temples and vibrant markets to savoring delicious street food and immersing myself in the local culture. The warmth and hospitality of the Vietnamese people made my experience even more unforgettable. Whether it was cruising through the Mekong Delta or hiking the terraced rice fields of Sapa, every moment was filled with wonder and excitement, leaving me with memories to cherish for a lifetime.', '2023-08-08', 'pic6.jpeg'),
(15, 'Cambodia', '1 week', 'Adventure in Cambodia', 'My week-long adventure in Cambodia was a mesmerizing journey through time and tradition. Starting in the historic city of Siem Reap, I marveled at the majestic temples of Angkor Wat, where ancient stone carvings told stories of a rich cultural heritage. The bustling markets and vibrant nightlife added a modern contrast to the ancient wonders. Venturing to Phnom Penh, I was moved by the poignant history at the Killing Fields and Tuol Sleng Genocide Museum, which offered deep insights into Cambodia\'s past. Throughout the trip, the warmth and resilience of the Cambodian people shone brightly, making every interaction special. From exploring lush landscapes to savoring delicious Khmer cuisine, my journey through Cambodia was an unforgettable blend of history, culture, and natural beauty.', '2023-12-11', 'pic7.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`journalId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `journalId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
