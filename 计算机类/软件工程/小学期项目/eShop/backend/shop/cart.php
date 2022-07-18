<?php
	require '../db.func.php';
	require '../tools.php';
	require 'auth.php';
	// 获取id
	$uid=getSession('shop','id');
	// 连接数据库查询购物车
	$sql="SELECT a.id,b.username,a.price,a.quantity,a.created_at,a.products
	FROM lxy_cart AS a JOIN lxy_user AS b ON a.uid=b.id AND a.uid='$uid'";
	$current_cart=queryOne($sql);
	$current_cart['products']=json_decode($current_cart['products'],true);

	require 'header.php';
?>

	<div class="cart-main-area bg__white">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<form action="#">
						<div class="table-content table-responsive">
							<table>
								<thead>
								<tr>
									<th class="product-thumbnail"></th>
									<th class="product-name">商品名称</th>
									<th class="product-price">单价</th>
									<th class="product-quantity">数量</th>
									<th class="product-subtotal">总计</th>
									<th class="product-remove">编辑</th>
								</tr>
								</thead>
								<tbody>
								<?php if(!empty($current_cart)):?>
								<?php foreach($current_cart['products'] as $pid=>$current_product):?>
								<tr>
									<td class="product-thumbnail"><a href="#"><img src="assets/uploads/default.jpeg" alt="product img" /></a></td>
									<td class="product-name"><a href="#">
										<?php 
										echo $current_product['product']['name']; ?>
									</a></td>
									<td class="product-price"><span class="amount">
										<?php echo $current_product['product']['price']; ?>
										<span class="amount"></td>
									<td class="product-quantity">
										<?php echo $current_product['quantity']; ?>
									</td>
									<td class="product-subtotal">
										<?php echo $current_product['quantity']*$current_product['product']['price'];?>
									</td>
									<td class="product-remove"><a href="cart_del.php?id=<?php echo $current_product['product']['id'];?>" method="post">
										X
									</a></td>
								</tr>
								<?php endforeach; ?>
								<?php endif; ?>
								</tbody>
							</table>
							
						</div>
						<div class="row">
							<div class="col-md-8 col-sm-7 col-xs-12">
								<div class="buttons-cart">
									<a href="index.php">继续购物</a>
								</div>

							</div>
							<div class="col-md-4 col-sm-5 col-xs-12">
								<div class="cart_totals">
									<table>
										<tbody>
										<tr class="cart-subtotal">
											<th>小计</th>
											<td><span class="amount">
												<?php echo $current_cart['price'];
												?>
											</span></td>
										</tr>
										<tr class="shipping">
											<th>快递</th>
											<td>
												<ul id="shipping_method">
													<li>
														<input type="radio" checked />
														<label>
															包邮
														</label>
													</li>
													<li></li>
												</ul>
											</td>
										</tr>
										<tr class="order-total">
											<th>总价</th>
											<td>
												<strong><span class="amount"><?php echo"￥";echo $current_cart['price'];
												?></span></strong>
											</td>
										</tr>
										</tbody>
									</table>

									<div class="wc-proceed-to-checkout" style="clear: both;">
										<a href="checkout.php">去付款</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="only-banner ptb--10 bg__white">
	</div>
<?php

require 'footer.php';
?>