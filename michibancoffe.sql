-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 03:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `michibancoffe`
--

-- --------------------------------------------------------

--
-- Table structure for table `caffecustomer`
--

CREATE TABLE `caffecustomer` (
  `ID` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `menu` varchar(1500) NOT NULL,
  `qty` int(3) NOT NULL,
  `totalPrice` int(6) NOT NULL,
  `user` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `caffecustomer`
--

INSERT INTO `caffecustomer` (`ID`, `username`, `menu`, `qty`, `totalPrice`, `user`) VALUES
(1, 'alexandra', 'Flaming Salmon(2), Green Tea Latte(2),', 4, 120000, 2),
(4, 'Jeane', 'Flaming Salmon Roll (1), Ebi Tempura Crispy Roll (1),', 4, 135000, 2),
(7, 'argya', '     Green Tea Latte (1), Mint Citrus (1), Caramel Macchiato (2),', 4, 150000, 2),
(8, 'danur', 'Flaming Salmon Roll (1), Ebi Tempura Crispy Roll (2),      ', 3, 85000, 2),
(10, 'Citra', 'Flaming Salmon Roll (1),       Caramel Macchiato (1),', 2, 85000, 2),
(11, 'Michiee', 'Flaming Salmon Roll (1), Ebi Tempura Crispy Roll (1), Chicken Katsu Rolln (1), Deep Fried Tuna Roll (1), Original Matcha Tea (1), Green Tea Latte (1), Mint Citrus (1), Caramel Macchiato (1),', 8, 235000, 2),
(13, 'BuIlmi', 'Flaming Salmon Roll (1),     Green Tea Latte (1),  ', 2, 60000, 2),
(14, 'nopal', ' Ebi Tempura Crispy Roll (1), Chicken Katsu Rolln (1),     Caramel Macchiato (1),', 3, 100000, 2),
(15, 'nopal', ' Ebi Tempura Crispy Roll (1), Chicken Katsu Rolln (1),     Caramel Macchiato (1),', 3, 100000, 2),
(16, 'nopal', ' Ebi Tempura Crispy Roll (1), Chicken Katsu Rolln (1),     Caramel Macchiato (1),', 3, 100000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `caffeuser`
--

CREATE TABLE `caffeuser` (
  `ID` int(11) NOT NULL,
  `name` varchar(28) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(16) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `caffeuser`
--

INSERT INTO `caffeuser` (`ID`, `name`, `username`, `password`, `role`) VALUES
(1, 'Netanel Danur Wendra', 'netaneldnrw', 'nerr123', 'manager'),
(2, 'Nevansyah A', 'nevboy', 'nevboy123', 'barista'),
(3, 'Novanda A', 'novand', 'novan123', 'casir');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID` int(4) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `price` int(7) NOT NULL,
  `stock` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID`, `menu`, `price`, `stock`) VALUES
(1, 'Flaming Salmon Roll', 35000, 1000),
(2, 'Ebi Tempura Crispy Roll', 25000, 1000),
(3, 'Chicken Katsu Roll', 25000, 1000),
(4, 'Deep Fried Tuna Roll', 25000, 1000),
(5, 'Original Matcha Tea', 25000, 1000),
(6, 'Green Tea Latte', 25000, 1000),
(7, 'Mint Citrus', 25000, 1000),
(8, 'Caramel Macchiato', 50000, 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caffecustomer`
--
ALTER TABLE `caffecustomer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user` (`user`),
  ADD KEY `menu` (`menu`(768));

--
-- Indexes for table `caffeuser`
--
ALTER TABLE `caffeuser`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caffecustomer`
--
ALTER TABLE `caffecustomer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `caffeuser`
--
ALTER TABLE `caffeuser`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caffecustomer`
--
ALTER TABLE `caffecustomer`
  ADD CONSTRAINT `caffecustomer_ibfk_1` FOREIGN KEY (`user`) REFERENCES `caffeuser` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
