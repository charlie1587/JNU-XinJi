CREATE TABLE Food(
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    Company VARCHAR(30) NOT NULL,
    Price FLOAT NOT NULL,
    Product_time YEAR,
    Validity_time INT(4),
    address VARCHAR(50)
	);
DESC Food;
INSERT Food VALUES(DEFAULT,'QQ饼干','QQ饼干厂',2.5,'2017',3,'北京');
INSERT Food(id,Name,Company,Price,Product_time,Validity_time,address)
VALUES(DEFAULT,'MN牛奶','MN牛奶厂',3.5,'2019',1,'北京河北');
INSERT Food VALUES
(DEFAULT,'EF果冻','EF果冻厂',1.5,'2018',2,'北京'),
(DEFAULT,'FF咖啡','FF咖啡厂',20,'2017',5,'天津'),
(DEFAULT,'GG奶糖','GG奶糖厂',14,'2016',2,'广东');
UPDATE Food SET address='内蒙古' WHERE Company='MN牛奶厂';
UPDATE Food SET Validity_time=5 WHERE address='北京';
DELETE FROM Food WHERE address='北京';