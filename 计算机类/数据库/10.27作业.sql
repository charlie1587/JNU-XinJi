---一---
---(1)查询所有的分类信息，并且得到其父分类---
SELECT s.id,s.cateName AS sCateName,p.cateName  AS pCateName
FROM cate AS s
LEFT JOIN cate AS p
ON s.pId=p.id;
---(2)查询所有的分类及其子分类---
SELECT p.id,p.cateName AS pCateName,s.cateName  AS sCateName
FROM cate AS p
LEFT JOIN cate AS s
ON s.pId=p.id;
---(3)查询所有的分类并且得到子分类的数目---
SELECT p.cateName  AS pCateName,count(*)
FROM cate AS s
LEFT JOIN cate AS p
ON s.pId=p.id
WHERE p.cateName IS NOT NULL
GROUP BY pCateName;
---二---
---(1)创建视图user_view,显示user表的name，age，salary并将字段名显示为user_name、user_age,user_salary.---
CREATE VIEW user_view AS
SELECT u.username AS user_name,u.age AS user_age,u.salary AS user_salary
FROM user AS u;
DESC user_view;
---(2)查看视图的详细结构---

SHOW CREATE VIEW user_view;
SELECT * FROM user_view;
---(3)更新视图，插入三条记录---
INSERT INTO user_view(user_name,user_age,user_salary) VALUES
('李四',28,23000),
('王武',30,85000),
('严淼',34,5600);
---(4)修改视图，使视图中的显示年龄大于30岁的用户信息---
ALTER VIEW user_view AS
SELECT u.username AS user_name,u.age AS user_age,u.salary AS user_salary
FROM user AS u
WHERE u.age>30;
---(5)删除视图---
DROP VIEW user_view;