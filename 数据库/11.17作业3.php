<?php
// 连接数据库
$link = mysqli_connect('127.0.0.1', 'root', 'root');

// 判断数据库连接是否成功
if (!is_null(mysqli_connect_error())) {
	die(mysqli_connect_error());
}

// 选择数据库
mysqli_select_db($link, 'employees');

// 设置连接字符集
mysqli_set_charset($link, 'utf8');

// 书写 SQL 语句
$sql = "INSERT INTO departments(dept_no,dept_name) VALUES('d010', 'Computer Science')";
//$sql = "UPDATE users SET age=age+1 WHERE id > 7";
//$sql = "DELETE FROM users WHERE id = 4";

// 执行 SQL 语句
$result = mysqli_query($link, $sql);

// 解析 SQL 语句执行结果
if ($result) {
	echo "执行成功！". " 插入数据的 ID 是 " . mysqli_insert_id($link) . "。";
	//echo " 成功跟新了 " . mysqli_affected_rows($link) . " 条数据！";
	//echo " 成功删除了 " . mysqli_affected_rows($link) . " 条数据！";
} else {
	echo "执行失败！";
}

// 关闭连接，释放资源
mysqli_close($link);