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
);INSERT C VALUES
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
---(1)检索学生的所有情况。---
SELECT * 
FROM S
JOIN SC
ON SC.SNO=S.SNO
JOIN C
ON C.CNO=SC.CNO;
---(2)检索学生年龄大于等于20岁的学生姓名。---
SELECT S.SN
FROM S
WHERE S.AGE>=20;
---(3)检索先修课号为C2的课程号---
SELECT C.CNO
FROM C
WHERE C.CPNO='C2';
---(4)检索选修了课程号C1成绩为A的所有学生姓名---
SELECT S.SN
FROM S
WHERE S.SNO IN(
    SELECT SC.SNO
    FROM SC
    WHERE SC.CNO='C1' AND SC.SCORE='A'
);
---(5)检索学号为S1的学生修读的所有课程名及先修课号。---
SELECT C.CN,C.CPNO
FROM C
WHERE C.CNO IN(
    SELECT SC.CNO
    FROM SC
    WHERE SC.SNO='S1'
);
---(6)检索年龄为23岁的学生所修读的课程名---
SELECT CN
FROM C
JOIN SC
ON SC.CNO=C.CNO
WHERE SC.SNO IN(
    SELECT S.SNO
    FROM S
    WHERE S.AGE=23
);
---(7)检索至少修读了学号为S5的学生修读的一门课的学生的姓名---
SELECT S.SN
FROM S 
WHERE EXISTS(
    SELECT *
    FROM SC
    WHERE SC.CNO IN(
        SELECT SC.CNO
        FROM SC
        WHERE SC.SNO='S5'
    ) AND S.SNO=SC.SNO
);
---(8)检索修读了学号为S4的学生所修读的所有课程的学生的姓名---
SELECT S.SNO
FROM S 
WHERE NOT EXISTS(
    SELECT *
    FROM SC AS SC2
    WHERE NOT EXISTS(
        SELECT *
        FROM SC
        WHERE SC.CNO=SC2.CNO
        AND S.SNO=SC.SNO
    ) AND SC2.SNO='S4'
);
---(9)检索选修所有课程的学生的学号---
SELECT S.SNO
FROM S 
WHERE NOT EXISTS(
    SELECT *
    FROM C  
    WHERE NOT EXISTS(
        SELECT *
        FROM SC
        WHERE C.CNO=SC.CNO
        AND S.SNO=SC.SNO
    )
);
SELECT SNO
FROM S
WHERE S.SNO IN(
    SELECT SNO
    FROM SC
    GROUP BY SNO
    HAVING COUNT(*)=(
        SELECT COUNT(*)
        FROM C
    )
);
---(10)检索不选修任何课程的学生的学号---
SELECT S.SNO
FROM S
WHERE NOT EXISTS(
    SELECT *
    FROM SC
    WHERE SC.SNO=S.SNO
);
