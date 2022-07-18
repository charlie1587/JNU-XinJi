<?php
require '../tools.php';
require '../db.func.php';

$id=intval($_GET['id']);

$sql="SELECT id,name,code,price,stock,description,created_at FROM lxy_product WHERE id='$id'";
$current_product=queryOne($sql);

require 'header.php'  

?>
	<!-- Start Product Details -->
	<section class="htc__product__details pt--120 pb--100 bg__white">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
					<div class="product__details__container">
						<div class="product__big__images" style="width: 100%;max-width: 100%">
							<div class="portfolio-full-image tab-content">
								<div role="tabpanel" class="tab-pane fade in active">
									<img width="100%" src="assets/uploads/default.jpeg" alt="full-image">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8 col-lg-8 col-sm-12 col-xs-12 smt-30 xmt-30">
					<div class="htc__product__details__inner">
					
						<div class="pro__detl__title">
							<h2><?php echo $current_product['name'];?></h2>
						</div>
						<div class="pro__details">
							<p><?php echo mb_substr($current_product['description'],0,50,'utf-8').'...';?></p>
						</div>
						<ul class="pro__dtl__prize">
							<li class="old__prize"><?php echo $current_product['price'];?></li>
							<li><?php echo $current_product['price'];?></li>
						</ul>
						<div class="product-action-wrap">
							<div class="prodict-statas"><span>数量 :</span></div>
							<div class="product-quantity">
								<form id='myform' action="cart_add.php?id=<?php echo $current_product['id']?>" method='POST' >
									<div class="product-quantity">
										<div class="cart-plus-minus">
											<input class="cart-plus-minus-box" type="text" name="qtybutton" value="02">
										</div>
										<input class="button" type="submit" name="submit" value="添加至购物车">
									</div>
								</form>
							</div>
						</div>
						
							
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Product Details -->
	<!-- Start Product tab -->
	<section class="htc__product__details__tab bg__white pb--120">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
					<ul class="product__deatils__tab mb--60" role="tablist">
						<li role="presentation" class="active">
							<a href="#description" role="tab" data-toggle="tab">商品描述</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="product__details__tab__content">
						<!-- Start Single Content -->
						<div role="tabpanel" id="description" class="product__tab__content fade in active">
							<div class="product__description__wrap">
								<div class="product__desc">
									<h2 class="title__6">详情</h2>
									<p><?php echo $current_product['description'];?></p>
								</div>
							</div>
						</div>
						<!-- End Single Content -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Product tab -->
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
