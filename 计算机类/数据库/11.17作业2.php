<?php
	// 建立连接
	$connection = mysqli_connect('127.0.0.1', 'root', 'root');
    //var_dump($connection);exit;

	// 判断连接是否成功
	if (mysqli_connect_error() != null) {
		die(mysqli_connect_error());
		echo "连接失败";
	} else {
		echo "连接成功！". "</br>";

	}
    //exit;
	// 选择数据库
	mysqli_select_db($connection, 'employees');

	// 设置字符集
	mysqli_set_charset($connection, 'utf8');

	// 书写 SQL 语句
	$sql = "SELECT * FROM departments LIMIT 1";

	// 执行 SQL 语句
	$result = mysqli_query($connection, $sql);
	//var_dump($result);exit;

	//1.生成关联数组键名为字段名
	$array = mysqli_fetch_assoc($result);
	//2.生成索引数组，键名为数字
    //$array = mysqli_fetch_row($result);
    //3.生成关联和索引数组
	//$array=mysqli_fetch_array($result);
	print_r($array);

	// 关闭连接
	mysqli_close($connection);
