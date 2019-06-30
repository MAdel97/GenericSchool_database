
create table dept
(
Dnumber int              NOT NULL,   
Dname varchar(20)            NOT NULL,
Mgr_start_date       	VARCHAR(20),
Mgr_ssn 		          INT     NOT NULL,
Mgr_Bdate             VARCHAR(20),
establishment_year  int,


constraint Dept_PK
primary key(Dnumber),

constraint unique_name
unique (Dname),

constraint unique_ssn
unique (Mgr_ssn),
);



create table class
(
Dnum  int           NOT NULL ,     -- This department number foreign key indicates the location of the class
Class_Rank int         NOT NULL,     -- The term of Rank here stands for the level of the class (In the range of 1:12)
Class_capicity int,                   -- The term of capicity here stands for the number of students that each unit can handle

constraint class_PK
primary key(Class_Rank),

constraint class_FK
FOREIGN KEY (Dnum) REFERENCES dept (Dnumber),

);    



create table bus
(
Bus_Num int               NOT NULL,
Bus_destination               varchar(20)    NOT NULL,
Bus_Capicity      int,
Driver_ssn       int,
constraint          Bus_PK
primary key               (Bus_Num),

);




create table student
(
Fname 			VARCHAR(15) 	NOT NULL,
Lname 		VARCHAR(15) 	NOT NULL,
Bdate 			VARCHAR(15),
Ssn 			INT 			,    -- the ssn is null here because the ssn could not be applicable to some students as they may didn't reach the legal age yet
stud_address 		VARCHAR(35),
Gender 			CHAR,
Snumber                  INT,
Class_rank			int 	NOT NULL,
Phone           int,
Attempt_no       VARCHAR(15),   -- number of  the student attempts in his rank
Stud_id        int      Not NUll,


CONSTRAINT stud_pk 
PRIMARY KEY (stud_id),

CONSTRAINT student_FK
FOREIGN KEY (Class_Rank) REFERENCES class (Class_Rank),

);


create table rides 
(
Bus_num int      NOT NULL,
Stud_id  int     NOT NULL,

constraint rides_pk
PRIMARY KEY (stud_id,Bus_Num),

constraint rides_fk_1
foreign key  (Bus_num) references bus (bus_num),

constraint rides_fk_2
foreign key (stud_id) references student (stud_id),
);




create table teacher
(
Fname 			VARCHAR(15) 	NOT NULL,
Lname 		VARCHAR(15) 	NOT NULL,
Ssn 			INT 			NOT NULL,	
Gender 			CHAR,
Phone           int,


CONSTRAINT teacher_PK
PRIMARY KEY (Ssn),

);

create table course  -- course here is an alternartive for subject as subject seems to be a reserved word
(


Sub_code   varchar (20)      Not Null,
Sub_name  char(18)             Not null,
sub_weight  int,
Essn       int   ,
class_rank int, 

constraint  Subject_PK
primary key (Sub_code),

constraint subject_FK
foreign key (ESSn) REFERENCES teacher(ssn),

constraint course_fk
foreign key (class_rank) references class(class_rank),

);


create table  exam
(

ex_type         varchar(20),    -- Type here stands for period in which the exam takes place (final, midterm)
ex_weight         varchar (15)   ,
Duration_in_hour          int,
ex_date            varchar (15),
Sub_code   varchar (20)      Not Null,

constraint exam_PK
primary key(sub_code,ex_date),

constraint exam_FK
foreign key (sub_code)  REFERENCES  course (sub_code),
);


create table participate_in 
(
Academic_status    bit,   -- 1= passed  and 0 = failed
Sub_code         varchar (20)    not null,
Stud_id        int      Not NUll,
ex_date            varchar (15),        


Constraint part_pk
primary key (sub_code,ex_date,stud_id),

constraint student_id
foreign key (stud_id)   REFERENCES student (stud_id),

constraint subject_code
foreign key (sub_code)   REFERENCES course (sub_code),
);





create table student_score 
(  
Sub_code   varchar (20)      Not Null,
Stud_id        int      Not NUll,
grade     int        Not null,

Constraint score_pk
primary key (sub_code,stud_id),

constraint score_id
foreign key (stud_id)   REFERENCES student (stud_id),

constraint score_code
foreign key (sub_code)   REFERENCES course (sub_code),
);





-- Inserting into department table 

INSERT INTO dept  (Dname,Dnumber ,Mgr_start_date,Mgr_ssn,Mgr_Bdate,establishment_year )      
values ('Library',1,'01/01/2012',111222,'01/02/1977','2008');

INSERT INTO dept  (Dname,Dnumber ,Mgr_start_date,Mgr_ssn,Mgr_Bdate,establishment_year)      
values ('Cafeteria',2,'05/06/2011',111333,'01/02/1970','2006');

INSERT INTO dept  (Dname,Dnumber ,Mgr_start_date,Mgr_ssn,Mgr_Bdate,establishment_year )      
values ('administration',3,'29/12/2010',111444,'01/02/1960','2006');

INSERT INTO dept  (Dname,Dnumber ,Mgr_start_date,Mgr_ssn,Mgr_Bdate,establishment_year)      
values ('primary_building',4,'01/09/2014',111555,'08/09/1982','2006');

INSERT INTO dept  (Dname,Dnumber ,Mgr_start_date,Mgr_ssn,Mgr_Bdate,establishment_year )      
values ('secondary_building',5,'01/10/2013',111666,'08/09/1980','2012');

INSERT INTO dept  (Dname,Dnumber ,Mgr_start_date,Mgr_ssn,Mgr_Bdate,establishment_year )      
values ('preparatory_building',6,'08/09/2012',111777,'08/09/1982','2009');


-- Insering into Class table


INSERT INTO class (Dnum,Class_Rank,Class_capicity)
values (4,1,30);


INSERT INTO class (Dnum,Class_Rank,Class_capicity)
values (4,2,20);


INSERT INTO class (Dnum,Class_Rank,Class_capicity)
values (6,7,28);



INSERT INTO class (Dnum,Class_Rank,Class_capicity)
values (6,9,35);


INSERT INTO class (Dnum,Class_Rank,Class_capicity)
values (5,10,24);


INSERT INTO class (Dnum,Class_Rank,Class_capicity)
values (5,12,30);


--Inserting into student table

Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('Bill','gate','24/9/2011',null,'suez','M',1,1,Null,1,146876);

Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('luis','franco','24/2/2011',null,'cairo','M',2,1,Null,1,146899);

Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('Rose','cezar','24/3/2010',null,'suez','F',1,2,Null,2,146444);

Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('izabella','romario','24/3/2010',null,'rehab','F',2,2,Null,1,146333);

Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('Mario','frued','24/9/2004',null,'suez','M',1,7,01204663057,1,146555);


Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('Mellinia','thorin','24/8/2004',null,'cairo','F',2,7,01204663089,2,146666);

Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('lorinzo','rossi','24/8/2002',null,'cairo','M',1,9,01204663019,1,146999);


Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('sandra','balin','22/9/2002',null,'shorouk','F',2,9,01204663089,2,146222);


Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('Bilbo','bagins','02/8/2003',100003,'rehab','M',1,10,0120885089,1,14889);


Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('jonathan','nolan','09/5/2003',100005,'shorouk','M',2,10,01208883089,2,146686);



Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('romio','alfonso','11/9/2001',100009,'cairo','M',1,12,01104663089,1,146606);


Insert INTO student (Fname,Lname,Bdate,Ssn,stud_address,Gender,Snumber,Class_rank,Phone,Attempt_no,stud_id)
values ('bollock','gordon','04/2/2001',100001,'rehab','M',2,12,01004663089,1,146009);


-- Inserting into teacher table


  Insert into teacher (Fname,Lname,Ssn,gender,phone)
 values ('christin','rokford',555222,'F',01127006009);

  Insert into teacher (Fname,Lname,Ssn,gender,phone)
 values ('jack','slazar',5553333,'M',01527006992);

  Insert into teacher (Fname,Lname,Ssn,gender,phone)
 values ('will','graham',555444,'M',01827006992);

 
  Insert into teacher (Fname,Lname,Ssn,gender,phone)
 values ('leonardo','klark',555555,'M',01427006992);

 
  Insert into teacher (Fname,Lname,Ssn,gender,phone)
 values ('brus','wayne',555666,'M',01127002222);



  
 -- Inserting into course table

 Insert into course 
 values ('math_class1','math',50,555222,1);

 
 Insert into course 
 values ('science_class1','science',40,555666,1);

  
 Insert into course
 values ('Arabic_class1','arabic',30,555555,1);

  Insert into course
 values ('relegion_class1','relegion',30,555555,1);

  Insert into course 
 values ('Arabic_class2','arabic',40,5553333,2);

  Insert into course 
 values ('science_class2','science',50,555666,2);

  Insert into course 
 values ('math_class2','math',50,555444,2);

   Insert into course 
 values ('relegion_class2','relegion',10,5553333,2);

 
 Insert into course 
 values ('math_class7','math',50,555222,7);

   Insert into course 
 values ('arabic_class7','arabic',50,555555,7);

   Insert into course 
 values ('science_class7','science',50,555666,7);

  Insert into course 
 values ('math_class9','math',80,555222,9);

   Insert into course 
 values ('arabic_class9','arabic',20,5553333,9);

   Insert into course 
 values ('science_class9','science',50,555666,9);

  Insert into course
 values ('math_class10','math',80,555444,9);

   Insert into course 
 values ('relegion_class10','relegion',20,555555,10);

   Insert into course 
 values ('science_class10','science',50,555666,10);

    Insert into course 
 values ('science_class12','science',70,555666,12);

  Insert into course 
 values ('math_class12','math',80,555222,12);


 -- Inserting into student score table

 INSERT INTO student_score 
values ( 'math_class12',146606,50);

INSERT INTO student_score 
values ( 'science_class12',146606,30);


 INSERT INTO student_score 
values ( 'math_class12',146009,60);

INSERT INTO student_score 
values ( 'science_class12',146009,67);

INSERT INTO student_score 
values ( 'science_class10',14889,20);

INSERT INTO student_score 
values ( 'math_class10',14889,50);

INSERT INTO student_score 
values ( 'relegion_class10',14889,17);

INSERT INTO student_score 
values ( 'science_class10',146686,40);

INSERT INTO student_score 
values ( 'math_class10',146686,60);

INSERT INTO student_score 
values ( 'relegion_class10',146686,8);


-- Inserting into bus

insert into bus 
values('1','shorouk',30,9001);

insert into bus
values('2','Rehab',20,9002);

insert into bus
values('3','suez',30,9003);

insert into bus
values('4','cairo',14,9004);


-- Inserting into rides relationship entity

insert into rides
values (1,146222);

insert into rides
values (1,146686);

insert into rides
values (2,14889);

insert into rides
values (2,146333);    

insert into rides
values (3,146555);

insert into rides
values (3,146876);

insert into rides
values (4,146666 );

insert into rides
values (4,146999);


-- Inserting into  exam table

insert into exam   (ex_type,ex_weight,Duration_in_hour,ex_date,sub_code)
values ('final',50,2,'01/05/2019','math_class10');

insert into exam
values ('final',80,3,'03/05/2019','science_class10');

insert into exam 
values ('final',60,1,'05/05/2019','relegion_class10');

insert into exam
values ('midterm',50,1,'01/03/2019','math_class10');

insert into exam
values ('midterm',20,2,'03/03/2019','science_class10');

insert into exam 
values ('midterm',40,1,'05/03/2019','relegion_class10');


-- inserting into participate relationship entity

insert into participate_in (academic_status,sub_code,stud_id,ex_date)
values (1,'math_class10',146686,'01/05/2019');


insert into participate_in
values (1,'math_class10',14889,'01/05/2019');

insert into participate_in
values (1,'math_class10',14889,'01/03/2019');

insert into participate_in
values (0,'math_class10',146686,'01/03/2019');




 ---------------------------------------------------
 SELECT Dname, Dnumber FROM Dept;

 SELECT Fname,Lname  FROM teacher WHERE Gender = 'M';


 SELECT AVG (grade) AS 'AVG Grade',Stud_id FROM student_score   --  average of grades for some students
GROUP BY stud_id;

SELECT count (ex_date) AS 'No Of exams' ,Stud_id FROM participate_in  --  This query purpose is to count the number of exam obligated to some students
GROUP BY stud_id;


SELECT count (Sub_code) AS 'No Of subjects' ,class_rank FROM course   --  This query purpose is to count the number of subjects assigned to each classs
GROUP BY class_rank;


SELECT count (Sub_code) AS 'teaches' ,Essn FROM course   -- This query purpose is to count the number of subjects teached by each teacher
GROUP BY Essn;             --grouped by each teacher ssn

SELECT count (stud_id) AS 'No Of students' ,Bus_num FROM rides
GROUP BY Bus_num;


SELECT count (Class_Rank) AS 'No Of classes' ,Dnum FROM class
GROUP BY Dnum;



SELECT max (establishment_year) AS 'establishment_year'  FROM Dept  -- This query purpose is to find the modest department
 
 
 -- retrieving all  sudents  names whose address is rehab or suez

 SELECT Fname,Lname,Stud_id
 from  student        
 where  stud_address IN('rehab','suez');


-- This query returns the subject codes  whose duration are greater than all exam durations which their types are classified as final

select Sub_code
from  exam
where  Duration_in_hour > 1      (select  Duration_in_hour
                                  from exam
								  where  ex_type ='final');


-- retrieving teachers distinct  essn who teaches the same classes that the teacher of the specified essn teaches

select distinct Essn
from  course
where  (class_rank) IN 
                                  (select class_rank
								  from course
								  where Essn =555444);

-- listing all students whose address is the same as their assigned bus destination

SELECT Fname + ' ' +  Lname AS 'Full Name' 
FROM student
WHERE stud_id IN( SELECT s.Stud_id
		  FROM student as s,rides as r,bus as b
		  WHERE b.Bus_destination=S.stud_address AND r.Stud_id= s.Stud_id
		  );


-- listing all students names who do have ssn with their  ranks

select Fname,Lname,Class_rank
from student	
where ssn is not null;	


-- listing students who did not pass their exams

select Stud_id,Sub_code,ex_date
from participate_in		
where Academic_status = 1;			


-- listing 	all  subject codes which have a final exams

select Sub_code
from exam
where ex_type ='final';
 
 -- Retrieve the teacher who teaches the maximum number of subjects


SELECT t.Fname,t.Lname,t.Ssn
FROM teacher as t, course as c
WHERE ssn =essn
AND Sub_code IN (SELECT MAX(sub_code)  
		   );



-- Listing all students whose phones values are null 

SELECT Fname,Lname,Stud_id
FROM student 
WHERE phone is null;




----------------------- ---------------------------------   The End ----------------------------------------------------------------------------