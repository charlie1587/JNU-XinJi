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

---(10)从student表中统计每个院系有多少人、用户名详情---
SELECT Dept,
GROUP_CONCAT(Name) AS stu_Deatil, 
COUNT(*) AS sum_Dept
FROM student
GROUP BY Dept;

---(11)从score表中查询每个科目的最高分---
SELECT GROUP_CONCAT(DISTINCT Cname),
MAX(GRADE)
FROM score
GROUP BY Cname;

---(12)计算每个考试科目的平均成绩---
SELECT GROUP_CONCAT(DISTINCT Cname),
AVG(GRADE)
FROM score
GROUP BY Cname;

---(13)将计算机成绩按从高到低进行排序---
SELECT Grade
FROM score
WHERE Cname = '计算机'
ORDER BY Grade DESC;

---(14)查询student表中的第2条到第4条的记录---
SELECT *
FROM student
LIMIT 1,3;