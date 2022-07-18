<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>商城后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="assets/css/common.css">
</head>

<body>
	<div class="container">
		<!-- 侧边栏 -->
		<div class="sidebar">
			<div class="logo">电子商城</div>
			<hr>
			<div class="menu">
				<ul>
					<li id="admin">
						<a href="admin.php">
							<img src="assets/img/admin1.png">
							<label>控制台</label>
						</a>
					</li>
					<li id="user">
						<a href="user.php">
							<img src="assets/img/user1.png">
							<label>用户管理</label>
						</a>
					</li>
					<li id="product">
						<a href="product.php">
							<img src="assets/img/product1.png">
							<label>商品管理</label>
						</a>
					</li>
					<li id="cart">
						<a href="cart.php">
							<img src="assets/img/cart1.png">
							<label>购物车管理</label>
						</a>
					</li>
					<li id="order">
						<a href="order.php">
							<img src="assets/img/order1.png">
							<label>订单管理</label>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 主内容区 -->
		<div class="main">
			<!-- 导航条 -->
			<div class="nav">
				<div class="nav_brand">控制台</div>
				<div class="nav_bar">
					<ul>
						<li id="useritem">
							<img src="assets/img/user1.png">
							<ul id="drop_menu">
								<li><a href="admin_edit.php">编辑</a></li>
								<li><a href="action.php?action=logout">退出</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>