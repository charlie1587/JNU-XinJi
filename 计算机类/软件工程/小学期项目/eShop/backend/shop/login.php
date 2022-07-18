<?php
	require '../db.func.php';
	require '../tools.php';

	require 'header.php';
	

?>
<!-- Start Login Register Area -->
<div class="htc__login__register bg__white ptb--130">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<ul class="login__register__menu" role="tablist">
					<li role="presentation" class="login active"><a href="#login" role="tab" data-toggle="tab">登录</a></li>
					<li role="presentation" class="register"><a href="#register" role="tab" data-toggle="tab">注册</a></li>
				</ul>
			</div>
		</div>
		<!-- Start Login Register Content -->
		<div class="row">
		
			<div class="col-md-6 col-md-offset-3">
			
				<div class="htc__login__register__wrap">
					<!-- Start Single Content -->
					
					<div id="login" role="tabpanel" class="single__tabs__panel tab-pane fade in active">
					<div style="color:red;"><?php
					if(hasInfo())echo getInfo();
					?></div>					
					<form id="loginform" class="login" method="post" 
						action="action.php?action=login"
						>
							<input type="text" placeholder="User Name*"
							name="username";
							>
							<input type="password" placeholder="Password*"
							name="password";
							>
						</form>

						<div class="htc__login__btn mt--30">
							<a href="javascript:document.getElementById('loginform').submit();">登录</a>
						</div>

					</div>
					<!-- End Single Content -->
					<!-- Start Single Content -->
					<div id="register" role="tabpanel" class="single__tabs__panel tab-pane fade">
					<div style="color:red;"><?php
					if(hasInfo())echo getInfo();
					?></div>
					<form id="regform" class="login" method="post" 
						action="action.php?action=regin"
						>
							<input type="text" placeholder="Name*"
							name="username"
							>
							<input type="email" placeholder="Email*"
							name="email"
							>
							<input type="password" placeholder="Password*"
							name="password"
							>
						</form>

						<div class="htc__login__btn">
							<a href="javascript:document.getElementById('regform').submit();">注册</a>
						</div>

					</div>
					<!-- End Single Content -->
				</div>
			</div>
		</div>
		<!-- End Login Register Content -->
	</div>
</div>
<!-- End Login Register Area -->

<div class="only-banner ptb--10 bg__white">
</div>
<?php require 'footer.php'; ?>