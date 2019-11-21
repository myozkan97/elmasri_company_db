CREATE TABLE EMPLOYEE (
    Fname       VARCHAR(20)   NOT NULL,
    Minit       CHAR(1),
    Lname       VARCHAR(20)   NOT NULL,
    Bdate       DATE          NOT NULL,
    Ssn         CHAR(9), 
    Address     VARCHAR(100),
    Sex         CHAR(1),
    Salary      INT, 
    Super_ssn   CHAR(9), 
    Dno         INT,  
    PRIMARY KEY (Ssn)                       
);






CREATE TABLE DEPARTMENT (
    Dname VARCHAR(50) NOT NULL,
    Dnumber INT,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE NOT NULL,
    PRIMARY KEY (Dnumber),
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);


CREATE TABLE DEPT_LOCATIONS (
    Dnumber INT,
    Dlocation VARCHAR(30) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) 
);

CREATE TABLE WORKS_ON (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(5,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) 
);



CREATE TABLE PROJECT (
    Pname VARCHAR(50) NOT NULL,
    Pnumber INT,
    Plocation VARCHAR(30) NOT NULL,
    Dnum INT NOT NULL, 
    PRIMARY KEY (Pnumber),
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) 
);


CREATE TABLE DEPENDENT (
    Essn CHAR(9),
    Dependent_name VARCHAR(20) NOT NULL,
    Sex CHAR(1),
    Bdate DATE NOT NULL,
    Relationship VARCHAR(20) NOT NULL,
    PRIMARY KEY (Essn, Dependent_name)
);


INSERT INTO EMPLOYEE
VALUES      ('John','B','Smith', '1965-01-09', 123456789,'731 Fondren, Houston TX','M',30000,333445555,5),
            ('Franklin','T','Wong', '1965-12-08', 333445555,'638 Voss, Houston TX','M',40000,888665555,5),
            ('Ramesh','K','Narayan', '1962-09-15', 666884444,'975 Fire Oak, Humble TX','M',38000,333445555,5),
            ('Alicia','J','Zelaya', '1968-01-19', 999887777,'3321 Castle, Spring TX','F',25000,987654321,4),
            ('Ahmad','V','Jabbar', '1969-03-29', 987987987,'980 Dallas, Houston TX','M',25000,987654321,4),
            ('Joyce','A','English', '1972-07-31', 453453453,'5631 Rice, Houston TX','F',25000,333445555,5),
            ('Jennifer','S','Wallace', '1941-06-20', 987654321,'291 Berry, Bellaire TX','F',43000,888665555,4),
            ('James','E','Borg', '1937-11-10', 888665555,'450 Stone, Houston TX','M',55000,null,1);

INSERT INTO DEPARTMENT
VALUES      ('Research',5,333445555,'1988-05-22'),
            ('Administration',4,987654321,'1995-01-01'),
            ('Headquarters',1,888665555,'1981-06-19');

INSERT INTO PROJECT
VALUES      ('ProductX',1,'Bellaire',5),
            ('ProductY',2,'Sugarland',5),
            ('ProductZ',3,'Houston',5),
            ('Computerization',10,'Stafford',4),
            ('Reorganization',20,'Houston',1),
            ('Newbenefits',30,'Stafford',4);

INSERT INTO WORKS_ON
VALUES     (123456789,1,32.5),
           (123456789,2,7.5),
           (666884444,3,40.0),
           (453453453,1,20.0),
           (453453453,2,20.0),
           (333445555,2,10.0),
           (333445555,3,10.0),
           (333445555,10,10.0),
           (333445555,20,10.0),
           (999887777,30,30.0),
           (999887777,10,10.0),
           (987987987,10,35.0),
           (987987987,30,5.0),
           (987654321,30,20.0),
           (987654321,20,15.0),
           (888665555,20,16.0);

INSERT INTO DEPENDENT
VALUES      (333445555,'Alice','F','1986-04-04','Daughter'),
            (333445555,'Theodore','M','1983-10-25','Son'),
            (333445555,'Joy','F','1958-05-03','Spouse'),
            (987654321,'Abner','M','1942-02-28','Spouse'),
            (123456789,'Michael','M','1988-01-04','Son'),
            (123456789,'Alice','F','1988-12-30','Daughter'),
            (123456789,'Elizabeth','F','1967-05-05','Spouse');

INSERT INTO DEPT_LOCATIONS
VALUES      (1,'Houston'),
            (4,'Stafford'),
            (5,'Bellaire'),
            (5,'Sugarland'),
            (5,'Houston');



ALTER TABLE EMPLOYEE 
ADD CONSTRAINT super_ssn
FOREIGN KEY (Super_ssn) 
REFERENCES EMPLOYEE(Ssn);

ALTER TABLE EMPLOYEE 
ADD CONSTRAINT dno_ref
FOREIGN KEY (Dno) 
REFERENCES DEPARTMENT(Dnumber);