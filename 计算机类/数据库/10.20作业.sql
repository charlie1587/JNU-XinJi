CREATE TABLE student(
    Num INT(10) PRIMARY KEY COMMENT'学号',
    Name VARCHAR(20) NOT NULL COMMENT'姓名',
    Sex VARCHAR(4) NOT NULL COMMENT'性别',
    Birthday YEAR COMMENT'出生年份',
    Dept VARCHAR(20) NOT NULL COMMENT'院系',
    Address VARCHAR(50) COMMENT'家庭住址'
	);
DESC student;
CREATE TABLE score(
    Id INT(10) PRIMARY KEY AUTO_INCREMENT COMMENT'编号',
    Cname VARCHAR(20) COMMENT'课程号',
    Num INT(10) NOT NULL COMMENT'学号',
    Grade INT(10) COMMENT'成绩',
    FOREIGN KEY(Num) REFERENCES student(Num)
);
DESC score;
INSERT student VALUES
(901,'张军','男',1985,'计算机系','北京市海淀区'),
(902,'张超群','男',1986,'中文系','北京市昌平区'),
(903,'张美丽','女',1990,'中文系','云南省西双版纳'),
(904,'李五一','男',1990,'英语系','辽宁省阜新市'),
(905,'王芳','女',1991,'英语系','福建省厦门市'),
(906,'王桂','男',1988,'计算机系','湖南省衡阳市');
INSERT score (Cname,Num,Grade)VALUES 
('计算机',901,98),
('英语',901,80),
('计算机',902,65),
('中文',902,88),
('中文',903,95),
('计算机',904,70),
('英语',904,92),
('英语',905,94),
('计算机',906,90),
('英语',906,85);
------------------------------
---------------1--------------
------------------------------
---(1)查询李五一的考试成绩---
SELECT S.Cname, S.Grade
FROM student AS St
INNER JOIN score AS S
ON St.Num=S.Num
WHERE St.Name='李五一';
---(2)查询所有学生的信息和考试信息---
SELECT *
FROM student AS St
INNER JOIN score AS S
ON St.Num=S.Num;
---(3)计算每个学生的总成绩---
SELECT St.Name,
SUM(GRADE)
FROM student AS St
INNER JOIN score AS S
ON St.Num=S.Num
GROUP BY St.Name;
---(4)计算机成绩低于95分的学生的信息---
SELECT *
FROM student AS St
INNER JOIN score AS S
ON St.Num=S.Num
WHERE S.Cname='计算机' and S.Grade <= 95;
---(5)同时参加计算机和英语考试的学生的信息---
SELECT *
FROM student AS St
JOIN score AS S1
ON St.Num=S1.Num
JOIN score AS S2
ON St.Num=S2.Num
WHERE S1.Cname='计算机' AND S2.Cname='英语';
---(6)student表和score表中查询学生的学号---
SELECT Num FROM student
UNION
SELECT Num FROM score;
---(7)查询姓张或姓王同学的姓名、院系、考试科目和成绩---
SELECT St.Name,
St.Dept,
S.Cname, 
S.Grade
FROM student AS St
INNER JOIN score AS S
ON St.Num=S.Num
WHERE St.Name LIKE '张%' OR St.Name LIKE '王%';
---(8)查询都是湖南的同学---
SELECT St.Name,
DATE_FORMAT(NOW(), '%Y')-St.birthday,
St.Dept,
S.Cname, 
S.Grade
FROM student AS St
INNER JOIN score AS S
ON St.Num=S.Num
WHERE St.Address LIKE '湖南%';
------------------------------
----------2子表查询------------
------------------------------
---(4)计算机成绩低于95分的学生的信息---
SELECT *
FROM student AS St
WHERE St.Num IN (
    SELECT Num
    FROM score AS S
    WHERE S.Cname='计算机' AND S.Grade<=95 
);
---(5)同时参加计算机和英语考试的学生的信息---
SELECT *
FROM student AS St
WHERE St.Num IN (
    SELECT S1.Num
    FROM score AS S1
    WHERE S1.Num IN(
        SELECT S2.Num
        FROM score AS S2
        WHERE S2.Cname='计算机'
    ) 
    AND S1.Cname='英语'
);
---(7)查询姓张或姓王同学的姓名、院系、考试科目和成绩---
SELECT St.Name,St.Dept,S.Cname, S.Grade
FROM (
    SELECT St.Name,St.Dept,St.num
    FROM Student AS St
    WHERE St.Name LIKE '张%' OR St.Name LIKE '王%'
) AS St
INNER JOIN score AS S
ON St.Num=S.Num;
---(8)查询都是湖南的同学---
SELECT St.Name,DATE_FORMAT(NOW(), '%Y')-St.birthday,St.Dept,S.Cname, S.Grade
FROM (
    SELECT St.Name,St.Dept,St.num,St.birthday
    FROM Student AS St
    WHERE St.Address LIKE '湖南%'
) AS St
INNER JOIN score AS S
ON St.Num=S.Num;
------------------------------
------------3-----------------
------------------------------
CREATE TABLE C(
	CNO VARCHAR(4) PRIMARY KEY,
    CN VARCHAR(20),
    CPNO VARCHAR(4)
	);
CREATE TABLE S(
	SNO VARCHAR(4) PRIMARY KEY,
    SN VARCHAR(20),
    AGE INT(10),
    DEPT VARCHAR(4)
	);
CREATE TABLE SC(
    SNO VARCHAR(4) ,
    CNO VARCHAR(4),
    SCORE INT(10)
);
INSERT C VALUES
('C1','数据库','C2'),
('C2','离散数学',NULL),
('C3','操作系统','C4'),
('C4','数据结构','C2');
INSERT S VALUES
('S1','李立勇',20,'CS'),
('S2','刘蓝',23,'IS'),
('S3','周小花',18,'MA'),
('S4','张立伟',19,'IS'),
('S5','王世明',19,'IS'),
('S6','陈思思',19,'MS');
INSERT SC VALUES
('S1','C1',85),
('S1','C2',90),
('S1','C3',89),
('S1','C4',88),
('S2','C2',78),
('S2','C3',85),
('S3','C2',68),
('S3','C3',78),
('S3','C4',75),
('S4','C1',69),
('S4','C2',82),
('S4','C4',73),
('S5','C1',92),
('S5','C4',86);
---(1)检索不选修任何课程的学生的学号---
SELECT S.SNO
FROM S 
WHERE S.SNO <> ALL(
    SELECT SC.SNO
    FROM SC
);
---(2)查询选课两门课的学生的姓名---
SELECT S.SN
FROM S
WHERE S.SNO IN(
    SELECT SC.SNO
    FROM SC 
    GROUP BY SNO
    HAVING COUNT(*)=2
);
---(3)查询学习课程号为'C2',成绩为第一名的学生的姓名---
SELECT S.SN
FROM S
WHERE S.SNO IN(
    SELECT SC.SNO
    FROM SC 
    WHERE SC.CNO='C2' AND SC.SCORE>=(
        SELECT MAX(SC.SCORE)
        FROM SC
        WHERE SC.CNO='C2'
    )
);
---(4)查询选修C2课程成绩大于该课平均成绩的学生的姓名学号成绩---
SELECT S.SN,S.SNO,SC.SCORE
FROM S
JOIN SC
ON S.SNO=SC.SNO
WHERE SC.CNO='C2'
AND SC.SCORE>=(
    SELECT AVG(SCORE)
    FROM SC
    GROUP BY CNO
    HAVING SC.CNO='C2'
);