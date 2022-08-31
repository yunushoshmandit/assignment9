CREATE DATABASE hospital_mis CHARACTER SET utf8 COLLATE utf8_general_ci;

USE hospital_mis;

CREATE TABLE department (
	department_id 	INT PRIMARY KEY AUTO_INCREMENT,
	name			VARCHAR (32) UNIQUE NOT NULL
);
CREATE TABLE staff (
	staff_id		INT PRIMARY KEY AUTO_INCREMENT,
	firstname		VARCHAR(32) NOT NULL,
	lastname		VARCHAR(32) NOT NULL,
	dob				DATE NOT NULL,
	position 		VARCHAR(32) NOT NULL,
	education 		VARCHAR(128) NOT NULL,
	gender 			BOOLEAN NOT NULL UNIQUE ,
	photo			VARCHAR(128)UNIQUE ,
	phone 			CHAR (10) NOT NULL ,
	email 			VARCHAR(128) NOT NULL,
	address			VARCHAR(128) NOT NULL,
	gross_salary 	INT NOT NULL,
	hire_date		DATE NOT NULL,
	staff_type		INT NOT NULL,
	department_id	INT,	
	CONSTRAINT department_staff_fk FOREIGN KEY (department_id) REFERENCES department (department_id) ON DELETE	NO ACTION ON UPDATE CASCADE 
);
CREATE TABLE staff_experience (
	experience_id		INT PRIMARY KEY AUTO_INCREMENT ,
	Staff_id			INT NOT NULL  ,
	organization 		VARCHAR (64) NOT NULL,
	position 			VARCHAR (64) NOT NULL,
	year_from 			INT NOT NULL,
	year_to				INT ,
	CONSTRAINT staff_staff_experience_fk FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON DELETE CASCADE ON UPDATE CASCADE 
); 
CREATE TABLE attendance ( 
	staff_id			INT ,
	absent_year			INT ,
	absent_month		INT ,
	absent_day			INT	,
	absent_hour 		INT NOT NULL ,
	CONSTRAINT attendance_pk PRIMARY KEY (staff_id, absent_year, absent_month, absent_day),
	CONSTRAINT staff_attendance_fk FOREIGN KEY (staff_id) REFERENCES staff (staff_id) on DELETE CASCADE ON UPDATE CASCADE
);	
CREATE TABLE salary (	
	staff_id			INT ,
	salary_year			INT ,
	salary_month		INT ,
	absent_amount		INT NOT NULL DEFAULT 0,
	bonus 				INT NOT NULL, 
	tax					INT NOT NULL,
	net_salary 			INT NOT NULL, 
	CONSTRAINT salary_pk PRIMARY KEY (staff_id, salary_year, Salary_month),
	CONSTRAINT salary_staff_fk FOREIGN KEY (staff_id) REFERENCES staff (staff_id) on DELETE NO ACTION ON UPDATE CASCADE 
);
CREATE TABLE test (
	test_id 			INT PRIMARY KEY AUTO_INCREMENT,	
	name				VARCHAR (64) NOT NULL,
	price 				INT NOT NULL
);
CREATE TABLE patient (	
	patient_id  		INT PRIMARY KEY AUTO_INCREMENT,
	name				VARCHAR (32) NOT NULL ,
	gender				BOOLEAN NOT NULL,
	phone				CHAR (10),
	address				VARCHAR (128),
	dob					DATE NOT NULL,
	nid					VARCHAR (32),
	job					VARCHAR (32),
	reg_date			DATE NOT NULL
);	
CREATE TABLE test_result (
	result_id 			INT PRIMARY KEY AUTO_INCREMENT ,
	patient_id  		INT NOT NULL ,
	test_id				INT NOT NULL ,		
	test_date			DATE NOT NULL,
	test_result			VARCHAR (64) NOT NULL,
	CONSTRAINT test_patient_fk FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT test_test_fk FOREIGN KEY (test_id) REFERENCES test (test_id) on DELETE CASCADE ON UPDATE CASCADE 
);
CREATE TABLE schedule (
	schedule_id 		INT PRIMARY KEY AUTO_INCREMENT,
	staff_id 			INT NOT NULL , 
	week_day			INT NOT NULL,
	time_from			VARCHAR (32) NOT NULL,
	time_to				VARCHAR (32) NOT NULL,
	CONSTRAINT schedule_staff_fk FOREIGN KEY (staff_id) REFERENCES staff (staff_id) on DELETE CASCADE ON UPDATE CASCADE
);	
CREATE TABLE blood ( 
	blood_id			INT PRIMARY KEY AUTO_INCREMENT,	
	blood_group			VARCHAR (16) NOT NULL UNIQUE ,     
	exp_date			DATE NOT NULL,
	price 				INT NOT NULL
);	
CREATE TABLE blood_source (
	source_id			INT PRIMARY KEY AUTO_INCREMENT,
	name				VARCHAR (32) NOT NULL ,
	quantity			INT NOT NULL,
	blood_id			INT NOT NULL ,
	CONSTRAINT blood_source_blood_fk FOREIGN KEY (blood_id) REFERENCES blood (blood_id) ON DELETE NO ACTION ON UPDATE CASCADE
);
	
CREATE TABLE appointment (
	appointment_id 		INT PRIMARY KEY AUTO_INCREMENT,
	patient_id			INT NOT NULL ,
	staff_id			INT NOT NULL ,
	appoint_time		VARCHAR (32) NOT NULL ,
	CONSTRAINT appointment_patient_fk FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT appointment_staff_fk FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON DELETE CASCADE ON UPDATE CASCADE
); 
CREATE TABLE diagnosis (
	diagnosis_id		INT PRIMARY KEY AUTO_INCREMENT,
	patient_id			INT NOT NULL ,
	Sickness_type		VARCHAR (32) NOT NULL,
	diagnosis_date		DATE NOT NULL,
	department_id 		INT NOT NULL ,  
	staff_id			INT NOT NULL ,
	diagnosis_result	VARCHAR (64) NOT NULL,
	CONSTRAINT diagnosis_patient_fk FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT diagnosis_department_fk FOREIGN KEY (department_id) REFERENCES department (department_id) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT diagnosis_staff_fk FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON DELETE NO ACTION ON UPDATE CASCADE
);
CREATE TABLE room (
	room_id				INT PRIMARY KEY AUTO_INCREMENT,
	room_no				INT NOT NULL,
	number_of_bed		INT NOT NULL,
	department_id		INT NOT NULL ,
	CONSTRAINT room_department_fk FOREIGN KEY (department_id) REFERENCES department (department_id) ON DELETE CASCADE ON UPDATE CASCADE
); 
CREATE TABLE admit (
	admit_id			INT PRIMARY KEY AUTO_INCREMENT,
	patient_id			INT NOT NULL ,
	room_id				INT NOT NULL ,	 		
	bed_no				INT NOT NULL,
	in_date				DATE NOT NULL,
	out_date			DATE,
	out_status			VARCHAR (32),
	CONSTRAINT admit_patient_fk FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT admit_room_fk FOREIGN KEY (room_id) REFERENCES room (room_id) ON DELETE NO ACTION ON UPDATE CASCADE
);
	
CREATE TABLE equipment (
	equipment_id  		INT PRIMARY KEY AUTO_INCREMENT,
	name				VARCHAR (64) NOT NULL,
	equipment_type		VARCHAR (64) NOT NULL,
	quantity			INT NOT NULL,
	department_id		INT , 
	price				INT NOT NULL,
	buy_date			DATE,
	status				VARCHAR (32) NULL,
	CONSTRAINT equipment_department_fk FOREIGN KEY (department_id) REFERENCES department (department_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE medicine (
	medicine_id			INT PRIMARY KEY AUTO_INCREMENT,
	name				VARCHAR (64) NOT NULL,
	form				VARCHAR (32)NOT NULL,
	madein				VARCHAR (32)NOT NULL,
	quantity			INT NOT NULL,
	unitprice			INT NOT NULL,
	exp_date			DATE NOT NULL
);
CREATE TABLE patient_medicine (
	patient_medicine_id INT PRIMARY KEY AUTO_INCREMENT,
	patient_id			INT NOT NULL ,		
	medicine_id			INT NOT NULL ,		
	medicine_usage		VARCHAR (64) NOT NULL,
	unitprice			INT NOT NULL,
	totalprice			INT NOT NULL,
	use_date			DATE NOT NULL,
	CONSTRAINT patient_medicine_patient_fk FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT patient_medicine_medicine_fk FOREIGN KEY (medicine_id) REFERENCES medicine (medicine_id) ON DELETE NO ACTION ON UPDATE CASCADE 
);

CREATE TABLE income (					
	income_id			INT PRIMARY KEY AUTO_INCREMENT,
	patient_id			INT NOT NULL ,
	income_type			VARCHAR (64) NOT NULL,
	amount				INT NOT NULL,
	income_date			DATE NOT NULL,
	CONSTRAINT income_patient_fk FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE NO ACTION ON UPDATE CASCADE
);
CREATE TABLE expense_date (
	expense_id			INT PRIMARY KEY AUTO_INCREMENT,
	amount				FLOAT NOT NULL,
	currency			CHAR (4) NOT NULL,
	expense_type		VARCHAR (64) NOT NULL,
	expense_date		DATE NOT NULL
);

CREATE TABLE users (
	user_id				INT PRIMARY KEY AUTO_INCREMENT,
	staff_id 			INT NOT NULL UNIQUE ,
	username			VARCHAR (64) NOT NULL UNIQUE,
	password 			VARCHAR (64) NOT NULL,
	admin_level			INT NOT NULL DEFAULT 0 ,
	hr_level			INT NOT NULL DEFAULT 0 ,
	finance_level		INT NOT NULL DEFAULT 0 ,
	pharmacy_level		INT NOT NULL DEFAULT 0 ,
	reception_level		INT NOT NULL DEFAULT 0 ,
	lab_level			INT NOT NULL DEFAULT 0 ,
	blood_level 		INT NOT NULL DEFAULT 0 ,
	CONSTRAINT users_staff_fk FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE login_log (
	log_id				INT PRIMARY KEY AUTO_INCREMENT ,
	user_id				INT NOT NULL ,
	login_date			DATE NOT NULL,
	login_time 			TIME NOT NULL,
	CONSTRAINT login_users FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE user_activity (
	activity_id 		INT PRIMARY KEY AUTO_INCREMENT 	,		
	user_id				INT NOT NULL , 	
	changes				INT NOT NULL,
	pk_value			INT NOT NULL,
	activity_date		DATE NOT NULL,
	activity_time		TIME NOT NULL,
	CONSTRAINT user_activity_users_fk FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE NO ACTION ON UPDATE CASCADE 
);