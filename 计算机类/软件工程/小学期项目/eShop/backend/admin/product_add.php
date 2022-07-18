<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';

if (!empty($_POST)) {
	$name=htmlentities($_POST['productname']);
	$code=htmlentities($_POST['code']);
	$description=htmlentities($_POST['desc']);
	$stock=htmlentities($_POST['stock']);
	$price=htmlentities($_POST['price']);
	$created_at = date('Y-m-d H:i:s');

	$sql = "INSERT INTO lxy_product(id,name,code,description,stock,price,created_at) 
			VALUES(NULL,'$name','$code','$description',$stock,$price,'$created_at')";
	$res = execute($sql);
	if ($res) {
		echo "<script>
				alert('添加成功！');
				location.href='admin.php'
				</script>";
	} else {
		setInfo('添加失败!');
	}
}

require 'header.php';
?>

<!-- 内容区 -->
<div class="content">
	<div class="table_card">
		<div class="table_desc">
			<div class="desc1">添加商品</div>
			<div class="desc2">添加一个商品</div>
		</div>
		<div class="form">
			<form action="product_add.php" method="post">
				<div style="color:red" ;><?php if (hasInfo()) echo getInfo(); ?></div>
				<form>
					<div class="edit2">
						<p>商品名称</p>
						<input class="edit" type="text" name="productname" value="">
					</div>
					<div class="edit2">
						<p>商品编码</p>
						<input class="edit" type="password" name="code" value="">
					</div>
					<div class="edit2">
						<p>商品库存</p>
						<input class="edit" type="password" name="stock" value="">
					</div>
					<div class="edit2">
						<p>商品价格</p>
						<input class="edit" type="text" name="price" value="">
					</div>
					<div class="clear"></div>
					<div class="edit1">
						<p>商品描述</p>
						<input class="edit" type="text" name="desc" value="">
					</div>

					<input class="button" type="submit" name="submit" value="添加商品">
				</form>

		</div>
	</div>
</div>
</div>
</div>

</body>
<script type="text/javascript" src="assets/JS/common.js"></script>

</html>