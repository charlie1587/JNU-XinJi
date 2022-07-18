<?php 
	require '../db.func.php';
	require '../tools.php';
	require 'auth.php';
	require 'header.php';
?>
	<div class="body__overlay"></div>
	<!-- Start Offset Wrapper -->
	<div class="offset__wrapper">
		<!-- Start Search Popap -->
		<div class="search__area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="search__inner">
							<form action="#" method="get">
								<input placeholder="Search here... " type="text">
								<button type="submit"></button>
							</form>
							<div class="search__close__btn">
								<span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Search Popap -->
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
					<div class="shp__single__product">
						<div class="shp__pro__thumb">
							<a href="#">
								<img src="assets/images/product/sm-img/1.jpg" alt="product images">
							</a>
						</div>
						<div class="shp__pro__details">
							<h2><a href="">Macbook Pro</a></h2>
							<span class="quantity">数量: 1</span>
							<span class="shp__price">￥13005.00</span>
						</div>
						<div class="remove__btn">
							<a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
						</div>
					</div>
					<div class="shp__single__product">
						<div class="shp__pro__thumb">
							<a href="#">
								<img src="assets/images/product/sm-img/2.jpg" alt="product images">
							</a>
						</div>
						<div class="shp__pro__details">
							<h2><a href="">华为手机</a></h2>
							<span class="quantity">数量: 1</span>
							<span class="shp__price">￥6500.00</span>
						</div>
						<div class="remove__btn">
							<a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
						</div>
					</div>
				</div>
				<ul class="shoping__total">
					<li class="subtotal">总计:</li>
					<li class="total__price">￥13000.00</li>
				</ul>
				<ul class="shopping__btn">
					<li><a href="cart.html">查看购物车</a></li>
					<li class="shp__checkout"><a href="checkout.html">去结账</a></li>
				</ul>
			</div>
		</div>
		<!-- End Cart Panel -->
	</div>
	<!-- End Offset Wrapper -->

	<div class="cart-main-area bg__white">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;padding: 50px;">
					<h1 style="color: green;">支付成功！</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="only-banner ptb--10 bg__white">
	</div>

	<!-- Start Footer Area -->
	<footer class="htc__foooter__area gray-bg">
		<div class="container">

			<!-- Start Copyright Area -->
			<div class="htc__copyright__area">
				<div class="row">
					<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
						<div class="copyright__inner">
							<ul class="footer__menu">
								<li><a href="index.html">首页</a></li>
								<li><a href="products.html">所有商品</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- End Copyright Area -->
		</div>
	</footer>
	<!-- End Footer Area -->
</div>
<!-- Body main wrapper end -->
<!-- Placed js at the end of the document so the pages load faster -->

<!-- jquery latest version -->
<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
<!-- Bootstrap framework js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- All js plugins included in this file. -->
<script src="assets/js/plugins.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<!-- Waypoints.min.js. -->
<script src="assets/js/waypoints.min.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="assets/js/main.js"></script>

</body>

</html>
