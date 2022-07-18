<?php
// 判断是否登录
$username=getSession('shop','username');
$cart_header=[];
if(!empty($username)){
	// 如果登录
	$uid=getSession('shop','id');
	// 从数据库中查询购物车数据
	$sql="SELECT id,price,quantity,products FROM lxy_cart WHERE uid='$uid'";
	$cart_header=queryOne($sql);
	@$cart_header['products']=json_decode($cart_header['products'],true);
}else{
	// 没有登录
	$cart_header=getSession('shop','cart');
}
?>

<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>慕课商城</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Place favicon.ico in the root directory -->
	<link rel="apple-touch-icon" href="apple-touch-icon.png">


	<!-- All css files are included here. -->
	<!-- Bootstrap fremwork main css -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<!-- Owl Carousel main css -->
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
	<!-- This core.css file contents all plugings css file. -->
	<link rel="stylesheet" href="assets/css/core.css">
	<!-- Theme shortcodes/elements style -->
	<link rel="stylesheet" href="assets/css/shortcode/shortcodes.css">
	<!-- Theme main style -->
	<link rel="stylesheet" href="assets/css/style.css">
	<!-- Responsive css -->
	<link rel="stylesheet" href="assets/css/responsive.css">
	<!-- User style -->
	<link rel="stylesheet" href="assets/css/custom.css">


	<!-- Modernizr JS -->
	<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<!-- Body main wrapper start -->
<div class="wrapper fixed__footer">
	<!-- Start Header Style -->
	<header id="header" class="htc-header header--3 bg__white">
		<!-- Start Mainmenu Area -->
		<div id="sticky-header-with-topbar" class="mainmenu__area sticky__header">
			<div class="container">
				<div class="row">
					<div class="col-md-2 col-lg-2 col-sm-3 col-xs-3">
						<div class="logo">
							<a href="index.html">
								<img src="assets/images/logo/logo.png" alt="logo">
							</a>
						</div>
					</div>
					<!-- Start MAinmenu Ares -->
					<div class="col-md-8 col-lg-8 col-sm-6 col-xs-6">
						<nav class="mainmenu__nav hidden-xs hidden-sm">
							<ul class="main__menu">
								<li><a href="index.php">首页</a></li>
								<li><a href="index.php">所有商品</a></li>
							</ul>
						</nav>

					</div>
					<!-- End MAinmenu Ares -->
					<div class="col-md-2 col-sm-4 col-xs-3">
						<ul class="menu-extra">
							<li><a href="login.php"><span class="ti-user"></span></a>
							<?php if(!empty($username)):?>
								欢迎回来，<?php echo $username;?><a href="action.php?action=logout">退出</a>
							<?php endif;?>
							</li>
							<li class="cart__menu"><span class="ti-shopping-cart"></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Mainmenu Area -->
	</header>
	<!-- End Header Style -->

	<div class="body__overlay"></div>
	<!-- Start Offset Wrapper -->
	<div class="offset__wrapper">
		<!-- Start Offset MEnu -->
		<div class="offsetmenu">
			<div class="offsetmenu__inner">
				<div class="offsetmenu__close__btn">
					<a href="#"><i class="zmdi zmdi-close"></i></a>
				</div>
				<div class="off__contact">
					<div class="logo">
						<a href="index.html">
							<img src="assets/images/logo/logo.png" alt="logo">
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- End Offset MEnu -->
		<!-- Start Cart Panel -->
		<div class="shopping__cart">
			<div class="shopping__cart__inner">
				<div class="offsetmenu__close__btn">
					<a href="#"><i class="zmdi zmdi-close"></i></a>
				</div>
				<div class="shp__cart__wrap">
					<?php if(!empty($cart_header['products'])):?>
					<?php foreach($cart_header['products'] as $product):?>
					<div class="shp__single__product">
						<div class="shp__pro__thumb">
							<a href="#">
								<img src="assets/uploads/default.jpeg" alt="product images">
							</a>
						</div>
						<div class="shp__pro__details">
							<h2><a href="">
								<?php echo $product['product']['name']?>
							</a></h2>
							<span class="quantity">数量: 
								<?php echo $product['quantity']?>
							</span>
							<span class="shp__price">￥
								<?php echo $product['product']['price']?>
							</span>
						</div>
						<div class="remove__btn">
							<a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
						</div>
					</div>
					<?php endforeach; ?>
				</div>
				<ul class="shoping__total">
					<li class="subtotal">总计:</li>
					<li class="total__price">￥
						<?php echo $cart_header['price']?>
					</li>
				</ul>
				<?php endif;?>
				<ul class="shopping__btn">
					<li><a href="cart.php">查看购物车</a></li>
				</ul>
			</div>
		</div>
		<!-- End Cart Panel -->
	</div>
	<!-- End Offset Wrapper -->
