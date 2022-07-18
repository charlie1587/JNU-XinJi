<?php
require 'configer.php';

function connect(){
	$mysqli=mysqli_connect(HOST,USER,PASSWORD);
	// 连接失败
	if (mysqli_connect_error()) {
		die('Connect_error:'.mysqli_connect_errno().mysqli_connect_error());
	}
	mysqli_select_db($mysqli, DB);      // 选择数据库
	mysqli_set_charset($mysqli,'utf8'); // 选择编码
	return $mysqli;
}

function queryOne($sql){
	$mysqli=connect();
	$result=mysqli_query($mysqli,$sql);
	$data=[];
	if($result&&mysqli_num_rows($result)>0){
		$data=mysqli_fetch_assoc($result);
	}
	return $data;
}

function query($sql){
	$mysqli=connect();
	$result=mysqli_query($mysqli,$sql);
	$data=[];
	if($result&&mysqli_num_rows($result)>0){
		while($res=mysqli_fetch_assoc($result)){
			$data[]=$res;
		}
	}
	return $data;
}

function execute($sql){
	$mysqli=connect();
	$result=mysqli_query($mysqli,$sql);
	return mysqli_affected_rows($mysqli)>0;
}
?>