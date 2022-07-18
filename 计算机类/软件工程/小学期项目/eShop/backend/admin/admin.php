<?php
require '../tools.php';
require '../db.func.php';
require 'auth.php';

$sql = "SELECT id,adminuser,created_at,login_at,login_ip
		FROM lxy_admin ORDER BY created_at";
$admins = query($sql);
//var_dump($admins);exit();
require 'header.php'
?>
<!-- 内容区 -->
<div class="content">
	<div class="table_card">
		<div class="table_desc">
			<div class="desc1">所有管理员</div>
			<div class="desc2">控制台所有管理员列表</div>
		</div>
		<div class="table">
			<table>
				<thead>
					<th>
						ID
					</th>
					<th>
						用户名
					</th>
					<th>
						创建时间
					</th>
					<th>
						最后登录时间
					</th>
					<th>
						最后登录IP
					</th>
				</thead>
				<tbody>
					<tr>
						<?php foreach ($admins as $admin) : ?>
							<td>
								<?php echo $admin['id']; ?>
							</td>
							<td>
								<?php echo $admin['adminuser']; ?>
							</td>
							<td>
								<?php echo $admin['created_at']; ?>
							</td>
							<td>
								<?php echo $admin['login_at']; ?>
							</td>
							<td>
								<?php echo long2ip($admin['login_ip']); ?>
							</td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
</div>

</body>
<script type="text/javascript" src="assets/JS/common.js"></script>

</html>