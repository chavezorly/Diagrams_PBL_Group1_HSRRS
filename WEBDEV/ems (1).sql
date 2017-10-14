-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2017 at 06:43 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dept_name`) VALUES
(1, 'Engineering'),
(2, 'House Keeping');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_lname` varchar(20) NOT NULL,
  `emp_fname` varchar(20) NOT NULL,
  `emp_mname` varchar(20) NOT NULL,
  `emp_contact_no` varchar(15) NOT NULL,
  `position_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_lname`, `emp_fname`, `emp_mname`, `emp_contact_no`, `position_id`, `department_id`) VALUES
(1, 'Furuya', 'John Rafael', 'Pangilin', '09264386316', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `escalated_ticket`
--

CREATE TABLE `escalated_ticket` (
  `id` int(11) NOT NULL,
  `esc_date_received` date NOT NULL,
  `esc_time_received` time NOT NULL,
  `esc_reason` varchar(50) NOT NULL,
  `esc_owner` varchar(45) NOT NULL,
  `esc_status` varchar(10) NOT NULL,
  `esc_priority` varchar(10) NOT NULL,
  `esc_time_closed` time NOT NULL,
  `esc_date_closed` date NOT NULL,
  `hierarchy_level_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `timelimit` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `escalation_ticket_history`
--

CREATE TABLE `escalation_ticket_history` (
  `id` int(11) NOT NULL,
  `heirarchy_level` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `escalated_ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hierarchy_level`
--

CREATE TABLE `hierarchy_level` (
  `id` int(11) NOT NULL,
  `level_num` varchar(1) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `pos_name` varchar(25) NOT NULL,
  `pos_des` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `pos_name`, `pos_des`) VALUES
(1, 'Manager', 'Manage things');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_no` int(11) NOT NULL,
  `room_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_no`, `room_location`) VALUES
(1, '101'),
(101, 'Mountain Wing'),
(103, 'Drivers Quarter'),
(104, 'Lake Wing');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `tick_closed_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `tick_status` varchar(45) DEFAULT NULL,
  `tick_priority` varchar(45) DEFAULT NULL,
  `tick_startDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `tick_description` varchar(45) NOT NULL,
  `tick_timelimit` time NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `room_room_no` int(11) NOT NULL,
  `user_idCreated` int(11) NOT NULL,
  `user_id1Assigned` int(11) DEFAULT NULL,
  `user_id2closed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `tick_closed_date`, `tick_status`, `tick_priority`, `tick_startDate`, `tick_description`, `tick_timelimit`, `ticket_type_id`, `department_id`, `room_room_no`, `user_idCreated`, `user_id1Assigned`, `user_id2closed`) VALUES
(14, NULL, 'Open', 'High', '2017-10-12 01:03:07', 'Need an assitance to clean the puke', '01:00:00', 4, 2, 104, 7, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

CREATE TABLE `ticket_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`id`, `type_name`) VALUES
(1, 'Electrical'),
(2, 'Non-Electrical'),
(3, 'Item Request'),
(4, 'Assistance');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `employee_id`) VALUES
(1, 'jpfuruya', 'Z1Rg7LHwN8uT5OD3XimH_uu2VVs3jMHu', '$2y$13$ToFpenSftGiS9DEcyq4uMOhimF1FcmYIy9aRdQDbqX2F7FjkD8tmy', '', 'jpfuruya@gmail.com', 10, 1507710437, 1507710437, NULL),
(2, 'oachavez', 'x4ZY9fU4xB30mYLOTskFsUXiDZimwt30', '$2y$13$GXCES5hI6goHgx5CB9oQqO94OR6nR4enS8FNjwTKerghChZN51HR6', '', 'oahavez@gmail.com', 10, 1507713632, 1507713632, NULL),
(3, 'jcborlongan', '_XzABb4ax2KkdfJqKvzR79MxAULNMQib', '$2y$13$arT73yd0l7Wx7R6zRW1EDuKXvkKl2soXHXe.KyiraKxoaJlJAD4cW', '', 'jcboralongan@gmail.com', 10, 1507714766, 1507714766, NULL),
(4, 'rpmeer', 'uVpjSkSYBgGMccLgAswednLP87JspPg6', '$2y$13$cpXdY0orMcds4w7auS7fWuyC/jxNdQH01yQ6BXOYgmY6slbqrN1a.', '', 'reinan@gmail.com', 10, 1507714795, 1507714795, NULL),
(5, 'faperalta', '7gD_fU_m3-HZSlXhcKjA4E5f8DDt09M5', '$2y$13$becNT72T31u7m45txjq98ukuS8pyvvOWYWlkDBmYfJNAS9/uOc5oW', '', 'faperlata@gmail.com', 10, 1507714861, 1507714861, NULL),
(6, 'robonifacio', 'GRt5zL1MPyzf3XOPawv1voXtPR5gDk50', '$2y$13$aGBNSLA2B.vLKBK5WFTwqeEyO1r3gYtEnDnH9azx/9GDpQJr73Fh6', '', 'robonifacio@gmail.com', 10, 1507714887, 1507714887, NULL),
(7, 'kmbarrion', 'mq5woiPodAQW56KFRI6ZAK-BSl5XUEh2', '$2y$13$u7gwKpjvfCk.La9NGat5su8EsVGkvVcuEmIJ68UCw17NYVaGGWMP6', '', 'kmbariion@gmai.com', 10, 1507714945, 1507714945, NULL),
(8, 'csaldivar', 'amyWn0dMJStwqymGjJYm9hwj3i9E3SOC', '$2y$13$YNYZr0CtAn.GY/wxLLYsn.2OzrxvvfAmD3D0lZfBqRrOBRoVTZ.F6', '', 'csaldivar@gmail.com', 10, 1507714993, 1507714993, NULL),
(9, 'kgbregias', 'E3hty69vJnfwEAdGQatvFPCCLOwS1D-z', '$2y$13$hDy7nkwvdbi5FQ5OC.fqne5pKDfKMBy.oghM7aV8HB0wITPW0eDaO', '', 'kgbregias@mail.com', 10, 1507715026, 1507715026, NULL),
(10, 'dokmanny', '3b5lUQPB9jHzLxw_8K8BR8oEKSoIqtX-', '$2y$13$W7PYhyZpMdzWQpS4FC3tA.ZvwINxSId1IWtAKLS/bdOfR1WgmFYr6', '', 'dokmanny@gmail.com', 10, 1507715048, 1507715048, NULL),
(11, 'vmagaling', '4Im2j260paftRzjv43Kt91dEUlC-QYWU', '$2y$13$sXcRnDn2sp9g1ESi63efc.3fY1NGLrfVXsENspZ3Se4imhJU5ED0.', '', 'vmagaling@gmail.com', 10, 1507715183, 1507715183, NULL),
(12, 'acalimbo', 'u1z8-gob1WfYWqVU5YmJGCb4T59Yt5FV', '$2y$13$4n1ygJqN6Cg1GubQJLun3.TPyw6FNPaXydqKm9PCxFIkucAKPQIqe', '', 'acalimbo@gmail.com', 10, 1507715206, 1507715206, NULL),
(13, 'Balao', 'uxwXGoWZUpIFv6Luwi8jI6PMkU64VZsL', '$2y$13$I5nsekcgugd12f.qu.cjcuGoccaFarx1amZDFDgvOMs9TCI8chWmC', '', 'Balao@gmail.com', 10, 1507769022, 1507769022, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee_position1_idx` (`position_id`),
  ADD KEY `fk_employee_department1_idx` (`department_id`);

--
-- Indexes for table `escalated_ticket`
--
ALTER TABLE `escalated_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_escalated_ticket_hierarchy_level1_idx` (`hierarchy_level_id`),
  ADD KEY `fk_escalated_ticket_ticket1_idx` (`ticket_id`);

--
-- Indexes for table `escalation_ticket_history`
--
ALTER TABLE `escalation_ticket_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_escalation_ticket_history_escalated_ticket1_idx` (`escalated_ticket_id`);

--
-- Indexes for table `hierarchy_level`
--
ALTER TABLE `hierarchy_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hierarchy_level_department1_idx` (`department_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_ticket_type1_idx` (`ticket_type_id`),
  ADD KEY `fk_ticket_department1_idx` (`department_id`),
  ADD KEY `fk_ticket_room1_idx` (`room_room_no`),
  ADD KEY `fk_ticket_user1_idx` (`user_idCreated`),
  ADD KEY `fk_ticket_user2_idx` (`user_id1Assigned`),
  ADD KEY `fk_ticket_user3_idx` (`user_id2closed`);

--
-- Indexes for table `ticket_type`
--
ALTER TABLE `ticket_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `escalated_ticket`
--
ALTER TABLE `escalated_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hierarchy_level`
--
ALTER TABLE `hierarchy_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ticket_type`
--
ALTER TABLE `ticket_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_position1` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `escalated_ticket`
--
ALTER TABLE `escalated_ticket`
  ADD CONSTRAINT `fk_escalated_ticket_hierarchy_level1` FOREIGN KEY (`hierarchy_level_id`) REFERENCES `hierarchy_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_escalated_ticket_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `escalation_ticket_history`
--
ALTER TABLE `escalation_ticket_history`
  ADD CONSTRAINT `fk_escalation_ticket_history_escalated_ticket1` FOREIGN KEY (`escalated_ticket_id`) REFERENCES `escalated_ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hierarchy_level`
--
ALTER TABLE `hierarchy_level`
  ADD CONSTRAINT `fk_hierarchy_level_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_room1` FOREIGN KEY (`room_room_no`) REFERENCES `room` (`room_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_ticket_type1` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_user1` FOREIGN KEY (`user_idCreated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_user2` FOREIGN KEY (`user_id1Assigned`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_user3` FOREIGN KEY (`user_id2closed`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
