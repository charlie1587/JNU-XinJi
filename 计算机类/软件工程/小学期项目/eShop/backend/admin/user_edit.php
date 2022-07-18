<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';
$id = intval($_GET['id']);

$sql = "SELECT id,username,name,age,phone,email,created_at
FROM lxy_user WHERE id='$id'";
$current_user = queryOne($sql);

// 是否有POST
if(!empty($_POST['name'])){

	$name=htmlentities($_POST['name']);
	$age=htmlentities($_POST['age']);
	$phone=htmlentities($_POST['phone']);
	$email=htmlentities($_POST['email']);

	$sql="UPDATE lxy_user SET name='$name', age='$age', 
	phone='$phone', email='$email' WHERE id='$id'";

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
			<div class="desc1">修改用户</div>
			<div class="desc2">修改一个用户</div>
		</div>
		<div class="form">
			<form action="user_edit.php?id=<?php echo $current_user['id']; ?>" method="post">
			<div style="color:red";><?php if(hasInfo())echo getInfo(); ?></div>
				<div class="edit1">
					<p>用户名</p>
					<input disabled class="edit" type="text" 
					name="username" value="<?php echo $current_user['username']; ?>">
				</div>

				<div class="edit2">
					<p>姓名</p>
					<input class="edit" type="text" 
					name="name" value="<?php echo $current_user['name']; ?>">
				</div>
				<div class="edit2">
					<p>年龄</p>
					<input class="edit" type="number" min="0" max="120" 
					name="age" value="<?php echo $current_user['age']; ?>">
				</div>
				<div class="clear"></div>
				<div class="edit1">
					<p>联系电话</p>
					<input class="edit" type="text" 
					name="phone" value="<?php echo $current_user['phone']; ?>">
				</div>
				<div class="edit1">
					<p>电子邮箱</p>
					<input class="edit" type="text" 
					name="email" value="<?php echo $current_user['email']; ?>">
				</div>
				<input class="button" type="submit" 
				name="submit" value="更新信息">
			</form>

		</div>
	</div>
</div>
</div>
</div>

</body>
<script type="text/javascript" src="assets/JS/common.js"></script>

</html>