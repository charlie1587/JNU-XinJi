CREATE TABLE student(
	num int(10) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    sex ENUM('男','女') NOT NULL,
    birthday DATE,
    address VARCHAR(50)
	);
DESC student;
CREATE TABLE grade(
    id int(10) PRIMARY KEY AUTO_INCREMENT,
    Course VARCHAR(10) NOT NULL,
    Num int(10) NOT NULL,
    Grade VARCHAR(4),
    FOREIGN KEY(Num) REFERENCES student(num)
);
DESC grade;