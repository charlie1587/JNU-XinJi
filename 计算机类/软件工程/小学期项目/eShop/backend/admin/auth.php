<?php
	// 判断session有没有管理员信息
	if(empty(getSession('admin','adminuser'))){
		header('Location:login.php');
		die();
	}
?>