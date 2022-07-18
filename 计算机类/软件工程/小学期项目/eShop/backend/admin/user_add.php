<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';

// 验证密码
if(!empty($_POST)){
	$username=htmlentities($_POST['username']);
	$password=htmlentities($_POST['password']);
	$confirmpass=htmlentities($_POST['confirmpass']);
	$name=htmlentities($_POST['name']);
	$age=htmlentities($_POST['age']);
	$phone=htmlentities($_POST['phone']);
	$email=htmlentities($_POST['email']);
	$created_at=date('Y-m-d H:i:s');

	if($confirmpass!=$password){
		setInfo('密码不一致');
	}
	else{
		$password=md5($password);
		$sql="INSERT INTO lxy_user(id,username,password,name,age,email,phone,created_at) 
		VALUES(NULL,'$username','$password','$name',$age,'$email',$phone,'$created_at')";
		$res=execute($sql);
		if($res){
			echo "<script>
			alert('添加成功！');
			location.href='admin.php'
			</script>";
		}
		else{
			setInfo('添加失败!');
		}
	}
}
// 写sql，执行添加


require 'header.php';
?>
<!-- 内容区 -->
<div class="content">
	<div class="table_card">
		<div class="table_desc">
			<div class="desc1">添加用户</div>
			<div class="desc2">添加一个用户</div>
		</div>
		<div class="form">
			<form action="user_add.php" method="post">
			<div style="color:red";><?php if(hasInfo())echo getInfo(); ?></div>
				<div class="edit3">
					<p>用户名</p>
					<input class="edit" type="text" name="username" value="">
				</div>
				<div class="edit3">
					<p>密码</p>
					<input class="edit" type="password" name="password" value="">
				</div>
				<div class="edit3">
					<p>确认密码</p>
					<input class="edit" type="password" name="confirmpass" value="">
				</div>
				<div class="edit2">
					<p>姓名</p>
					<input class="edit" type="text" name="name" value="">
				</div>
				<div class="edit2">
					<p>年龄</p>
					<input class="edit" type="number" min="0" max="120" 
					name="age" value="">
				</div>
				<div class="clear"></div>
				<div class="edit1">
					<p>联系电话</p>
					<input class="edit" type="text" name="phone" value="">
				</div>
				<div class="edit1">
					<p>电子邮箱</p>
					<input class="edit" type="text" name="email" value="">
				</div>
				<input class="button" type="submit" name="submit" value="添加用户">
			</form>

		</div>
	</div>
</div>
</div>
</div>

</body>
<script type="text/javascript" src="assets/JS/common.js"></script>

</html>