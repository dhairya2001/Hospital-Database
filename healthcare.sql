SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `healthcare`
--


CREATE TABLE `admit` (
  `id` int(11) NOT NULL,
  `admit_date` date NOT NULL,
  `discharge_date` date NOT NULL,
  `problem` varchar(255) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `admit` (`id`, `admit_date`, `discharge_date`, `problem`, `patient_id`, `department_id`, `room_number`, `doctor_id`, `status`) VALUES
(25, '2018-10-17', '2018-10-17', 'Tonsils', 12, 3, 202, 8, 0),
(26, '2018-10-17', '2018-10-17', 'Heart Attack', 13, 6, 301, 9, 0);


CREATE TABLE `billing` (
  `advance` int(11) DEFAULT NULL,
  `status` int(10) DEFAULT '0',
  `room_charges` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `admit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `billing` (`advance`, `status`, `room_charges`, `total`, `appointment_id`, `admit_id`) VALUES
(NULL, 1, 0, 250, 8, NULL),
(NULL, 0, 0, 500, 9, NULL),
(5000, 1, 1000, 9000, NULL, 25),
(4500, 0, 700, 13200, NULL, 26);


CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `department` (`id`, `name`) VALUES
(3, 'ENT'),
(4, 'Gynaecologist'),
(5, 'Dentist'),
(6, 'Cardiologist'),
(7, 'General Physician'),
(8, 'Neurologist');


CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `work_time` varchar(255) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `doctor` (`id`, `name`, `work_time`, `phone_number`, `department_id`) VALUES
(7, 'Rajkumar Agarwal', '10AM - 2PM', '9696969565', 7),
(8, 'Nikhil Saksena', '5PM - 9PM', '7149066355', 3),
(9, 'Anil Mutha', '7AM - 11AM', '9826294565', 6),
(10, 'Jay Shrivastav', '10AM - 2PM', '7999727585', 5),
(11, 'Sunil Grover', '10AM - 6PM', '7156589332', 7),
(12, 'Kapil Sharma', '5PM - 9PM', '9920654787', 6);


CREATE TABLE `doc_appointment` (
  `id` int(11) NOT NULL,
  `symptom` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `doc_appointment` (`id`, `symptom`, `date`, `time`, `patient_id`, `department_id`, `doctor_id`) VALUES
(8, 'Flu', '2018-10-17', '10AM - 2PM', 14, 7, 7),
(9, 'Migraine ', '2018-10-17', '10AM - 6PM', 13, 7, 11);



CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(10) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `patient` (`id`, `name`, `sex`, `dob`, `phone`, `blood_group`, `staff_id`) VALUES
(11, 'Raghu Raj', 'Male', '1952-02-15', '9856457878', 'AB+', 1),
(12, 'Aadarsh Bhandari', 'Male', '1985-08-25', '7478784547', 'A-', 1),
(13, 'Anukrita Bharaktiya', 'Female', '1998-10-25', '7999727605', 'O-', 1),
(14, 'Devang Joshi', 'Male', '1991-11-17', '8521479633', 'B+', 1);




CREATE TABLE `room` (
  `number` int(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

.

INSERT INTO `room` (`number`, `type`, `rent`, `status`) VALUES
(101, '1', 500, 1),
(102, '1', 500, 1),
(103, '1', 500, 1),
(104, '1', 500, 1),
(105, '1', 500, 1),
(106, '1', 450, 1),
(201, '2', 1000, 1),
(202, '2', 1000, 1),
(203, '2', 1000, 1),
(301, '3', 700, 1),
(302, '3', 700, 1),
(303, '3', 700, 1);



CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `staff` (`id`, `staff_name`, `username`, `password`, `mobile_number`, `dob`, `address`, `type`) VALUES
(1, 'Test Staff', 'test', 'test', '9826285858', '1985-10-20', '12/24 Karol Bagh', 'admin'),
(11, 'The Viewer', 'viewer', 'viewer', '8585457545', '1999-12-01', '17, BCE Colony', 'viewer');


ALTER TABLE `admit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `room_number` (`room_number`),
  ADD KEY `doctor_id` (`doctor_id`);

ALTER TABLE `billing`
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `admit_id` (`admit_id`);


ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);


ALTER TABLE `doc_appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `doctor_id` (`doctor_id`);


ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

ALTER TABLE `room`
  ADD PRIMARY KEY (`number`);

ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);


ALTER TABLE `admit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `doc_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;



ALTER TABLE `admit`
  ADD CONSTRAINT `admit_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `admit_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `admit_ibfk_3` FOREIGN KEY (`room_number`) REFERENCES `room` (`number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `admit_ibfk_4` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `doc_appointment` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`admit_id`) REFERENCES `admit` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;


ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `doc_appointment`
  ADD CONSTRAINT `doc_appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `doc_appointment_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `doc_appointment_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;