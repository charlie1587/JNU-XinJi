
<?php
	// 建立连接
	$link = mysqli_connect('127.0.0.1', 'root', 'root');

	// 判断连接是否成功
	if (mysqli_connect_error() != null) {
		die(mysqli_connect_error());
	}
	// 选择数据库
	mysqli_select_db($link, 'employees');

	// 设置字符集
	mysqli_set_charset($link, 'utf8');

	// 书写 SQL 语句
	$sql = "SELECT * FROM departments";

	// 执行 SQL 语句
	$result = mysqli_query($link, $sql);

	// 解析结果集
	echo "<pre>";
    $data=[];
	while ($row = mysqli_fetch_assoc($result)) {
	 	//print_r($row);
		$data[]=$row;

	}
	print_r($data);	
	$num = mysqli_num_rows($result);
    echo "共查询到 " . $num . " 条数据！";
	$num = mysqli_num_fields($result);
	echo "共查询到 " . $num . " 列数据！";

	// 关闭连接
	mysqli_close($link);