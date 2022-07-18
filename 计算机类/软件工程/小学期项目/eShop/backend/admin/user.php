<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';
require 'header.php';
$sql="SELECT id,username,password,name,age,email,phone,created_at
FROM lxy_user";
$users=query($sql);
//print_r($users);exit;
?>
<!-- 内容区 -->
<div class="content">
  <div class="table_card">
    <div class="table_desc">
      <div class="desc1">所有用户</div>
      <div class="desc2">所有用户列表</div>
      <a href="user_add.php"><button>添加用户</button></a>
    </div>

    <div class="table">
    <div style="color:red";><?php if(hasInfo())echo getInfo(); ?></div>
      <table>
        <thead>
          <th>
            ID
          </th>
          <th>
            用户名
          </th>
          <th>
            姓名
          </th>
          <th>
            年龄
          </th>
          <th>
            邮箱
          </th>
          <th>
            联系电话
          </th>
          <th>
            注册时间
          </th>
          <th>
            操作
          </th>
        </thead>
        <tbody>
          <?php if(!empty($users)):?>
            <?php foreach($users as $user):?>
          <tr>
            <td>
              <?php echo $user['id'];?>
            </td>
            <td>
            <?php echo $user['username'];?>
            </td>
            <td>
            <?php echo $user['name'];?>
            </td>
            <td>
            <?php echo $user['age'];?>
            </td>
            <td>
            <?php echo $user['email'];?>
            </td>
            <td>
            <?php echo $user['phone'];?>
            </td>
            <td>
            <?php echo $user['created_at'];?>
            </td>
            <td>
              <a href="user_edit.php?id=<?php echo $user['id'];?>">编辑 |</a>
              <a href="user_del.php?id=<?php echo$user['id'];?>">删除 </a>
            </td>
          </tr>
          <?php endforeach;?>
          <?php endif;?>
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