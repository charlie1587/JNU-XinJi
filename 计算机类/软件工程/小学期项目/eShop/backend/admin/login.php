<?php
	require '../tools.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>登录</title>
	<link rel="stylesheet" type="text/css" href="assets/css/login.css">
</head>


<body>
	<div class="main">
		<div class="card">
			<div class="card_desc">
				<div class="desc1">登录</div>
				<div class="desc2">以管理员身份登录后台</div>
			</div>
			<div class="card_form">	
				<div style="color:red";><?php if(hasInfo())echo getInfo(); ?></div>
				<! -- action 判断是登录/登出 -->
				<form action="action.php?action=login" method="post">
					<div class="edit1">
						<p>用户名</p>
						<! -- require 要求不能为空 -->
						<input type="text" name="adminuser" required>
					</div>
					<div class="edit1">
						<p>密码</p>
						<input type="password" name="adminpass" required>
					</div>
					<input class="button" type="submit" name="submit" value="登录">
				</form>
			</div>
		</div>
	</div>
</body>

</html>