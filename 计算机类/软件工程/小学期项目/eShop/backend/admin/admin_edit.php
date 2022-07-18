<?php
	require '../db.func.php';
	require '../tools.php';
	require 'auth.php';
	// 得到管理员id
	$adminid=getSession('admin','adminid');
	$adminuser=getSession('admin','adminuser'); 
	// 判断是否有POST提交
	if(!empty($_POST['password'])){
		// 接受POST数据
		$password=htmlentities($_POST['password']);
		$newpass=htmlentities($_POST['newpass']);
		$confirmpass=htmlentities($_POST['confirmpass']);
		// 判断是否一致
		if($newpass!=$confirmpass){
			setInfo('两次密码不一致！');
		}
		else{
			// 判断旧密码
			$password=md5($password);
			$sql="SELECT * FROM lxy_admin WHERE id=$adminid 
				AND adminpass='$password'";
			$result=queryOne($sql);
			if($result){
				// 修改
				$newpass=md5($newpass);
				$sql="UPDATE lxy_admin SET adminpass='$newpass' 
				WHERE id=$adminid";
				$res=execute($sql);
				if($res){
					echo "<script>
					alert('更新成功，请重新登录！');
					location.href='action.php?action=logout'
					</script>";
				}
				else{
					setInfo('更新失败!');
				}
			}
			else{
				setInfo('旧密码不正确！');
			}
		}
	}
	require 'header.php';
?>
<!-- 内容区 -->
<div class="content">
	<div class="table_card">
		<div class="table_desc">
			<div class="desc1">修改管理员</div>
			<div class="desc2">修改一个管理员</div>
		</div>
		<div class="form">
			<div class="note"><?php if(hasInfo()) echo getInfo();?></div>
			<form action="admin_edit.php?adminid=<?php echo $adminid; ?>" method="post">
				<div class="edit1">
					<p>用户名</p>
					<input class="edit" type="text" name="adminuser" 
					value="<?php echo $adminuser; ?>">
				</div>
				<div class="edit1">
					<p>密码</p>
					<input class="edit" type="password" name="password" value="">
				</div>
				<div class="edit1">
					<p>新密码</p>
					<input class="edit" type="password" name="newpass" value="">
				</div>
				<div class="edit1">
					<p>确认密码</p>
					<input class="edit" type="password" name="confirmpass" value="">
				</div>
				<input class="button" type="submit" name="submit">
			</form>
		</div>
	</div>
</div>
</div>
</div>

</body>
<script type="text/javascript" src="assets/JS/common.js"></script>

</html>