<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';
require 'header.php';

$sql="SELECT id,name,code,description,stock,price,created_at
FROM lxy_product";
$users=query($sql);
?>
<!-- 内容区 -->
<div class="content">
  <div class="table_card">
    <div class="table_desc">
      <div class="desc1">所有商品</div>
      <div class="desc2">所有商品列表</div>
      <a href="product_add.php"><button>添加商品</button></a>
    </div>

    <div class="table">
    <div style="color:red";><?php if(hasInfo())echo getInfo(); ?></div>
      <table>
        <thead>
          <th>
            ID
          </th>
          <th>
            商品名
          </th>
          <th>
            商品编码
          </th>
          <th>
            库存
          </th>
          <th>
            价格
          </th>
          <th>
            创建时间
          </th>
          <th>
            描述
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
            <?php echo $user['name'];?>
            </td>
            <td>
            <?php echo $user['code'];?>
            </td>
            <td>
            <?php echo $user['stock'];?>
            </td>
            <td>
            <?php echo $user['price'];?>
            </td>
            <td>
            <?php echo $user['created_at'];?>
            </td>
            <td>
            <?php echo $user['description'];?>
            </td>
            <td>
              <a href="product_edit.php?id=<?php echo $user['id'];?>">编辑 |</a>
              <a href="product_del.php?id=<?php echo $user['id'];?>">删除 </a>
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