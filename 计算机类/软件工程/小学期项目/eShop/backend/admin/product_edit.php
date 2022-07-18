<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';

$id = intval($_GET['id']);

$sql = "SELECT id,name,code,description,stock,price,created_at
FROM lxy_product WHERE id='$id'";
$current_user = queryOne($sql);

// 是否有POST
if(!empty($_POST['productname'])){
	$name=htmlentities($_POST['productname']);
	$code=htmlentities($_POST['code']);
	$description=htmlentities($_POST['desc']);
	$stock=htmlentities($_POST['stock']);
	$price=htmlentities($_POST['price']);

	$sql="UPDATE lxy_product SET name='$name',code='$code',
	description='$description',stock='$stock',price='$price' WHERE id='$id'";
	
	if(execute($sql)){
		$current_user=array_merge($current_user,$_POST);
		setInfo("更新成功");
	}
	else{
		setInfo("更新失败");
	}
}

require 'header.php';

?>
<!-- 内容区 -->
<div class="content">
	<div class="table_card">
		<div class="table_desc">
			<div class="desc1">修改商品</div>
			<div class="desc2">修改一个商品</div>
		</div>
		<div class="form">
		<form action="product_edit.php?id=<?php echo $current_user['id']; ?>" method="post">
		<div style="color:red";><?php if(hasInfo())echo getInfo(); ?></div>		
				<div class="edit2">
					<p>商品名称</p>
					<input class="edit" type="text" name="productname" 
					value="<?php echo $current_user['name']; ?>">
				</div>

				<div class="edit2">
					<p>商品编号</p>
					<input class="edit" type="text" 
					name="code" value="<?php echo $current_user['code']; ?>">
				</div>
				<div class="edit2">
					<p>商品库存</p>
					<input class="edit" type="number" min="0" max="100000000" 
					name="stock" value="<?php echo $current_user['stock']; ?>">
				</div>
				<div class="edit2">
					<p>商品价格</p>
					<input class="edit" type="text" 
					name="price" value="<?php echo $current_user['price']; ?>">
				</div>
				<div class="clear"></div>
				<div class="edit1">
					<p>商品描述</p>
					<input class="edit" type="text" 
					name="desc" value="<?php echo $current_user['description']; ?>">
				</div>
				<input class="button" type="submit" name="submit" value="更新信息">
			</form>

		</div>
	</div>
</div>
</div>
</div>

</body>
<script type="text/javascript" src="assets/JS/common.js"></script>

</html>