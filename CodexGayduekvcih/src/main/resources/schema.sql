DROP TABLE IF EXISTS CURRENCY;
CREATE TABLE CURRENCY (
  country_name VARCHAR(250) UNIQUE NOT NULL,
  currency VARCHAR(3) NOT NULL,
  CONSTRAINT CURRENCY_PRIMARY_KEY PRIMARY KEY (country_name)
);

DROP TABLE IF EXISTS COMPANY;
CREATE TABLE COMPANY (
  name VARCHAR(250) UNIQUE NOT NULL,
  staff_number INT NOT NULL,
  CONSTRAINT COMPANY_PRIMARY_KEY PRIMARY KEY (name)
);

DROP TABLE IF EXISTS CODEX;
CREATE TABLE CODEX (
  job_position VARCHAR(250) UNIQUE NOT NULL,
  link VARCHAR(250) NOT NULL,
  CONSTRAINT CODEX_PRIMARY_KEY PRIMARY KEY (job_position)
);

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
  id INT AUTO_INCREMENT UNIQUE NOT NULL,
  company_name VARCHAR(250) NOT NULL,
  name VARCHAR(250) NOT NULL,
  job_position VARCHAR(250) NOT NULL,
  CONSTRAINT EMPLOYEE_PRIMARY_KEY PRIMARY KEY (id),
  CONSTRAINT EMPLOYEE_FOREIGN_KEY FOREIGN KEY (company_name) REFERENCES COMPANY (name),
  CONSTRAINT EMPLOYEE_FOREIGN_KEY2 FOREIGN KEY (job_position) REFERENCES CODEX (job_position)
);

DROP TABLE IF EXISTS PAYMENT;
CREATE TABLE PAYMENT (
  id INT AUTO_INCREMENT UNIQUE NOT NULL,
  employee_id INT UNIQUE NOT NULL,
  country_name VARCHAR(250) NOT NULL,
  payment DECIMAL(30, 2) NOT NULL,
  CONSTRAINT PAYMENT_FOREIGN_KEY FOREIGN KEY (employee_id) REFERENCES EMPLOYEE (id),
  CONSTRAINT PAYMENT_FOREIGN_KEY2 FOREIGN KEY (country_name) REFERENCES CURRENCY (country_name)
);

DROP TABLE IF EXISTS USER_DATA;
CREATE TABLE USER_DATA (
  id INT AUTO_INCREMENT UNIQUE NOT NULL,
  username VARCHAR(250) UNIQUE NOT NULL,
  password VARCHAR(50) NOT NULL,
  active INT NOT NULL,
  CONSTRAINT USER_DATA_PRIMARY_KEY PRIMARY KEY (id)
);

DROP TABLE IF EXISTS USER_ROLE;
CREATE TABLE USER_ROLE (
  user_id INT NOT NULL,
  roles VARCHAR(250) NOT NULL,
  CONSTRAINT USER_ROLE_FOREIGN_KEY FOREIGN KEY (user_id) REFERENCES USER_DATA (id)
);