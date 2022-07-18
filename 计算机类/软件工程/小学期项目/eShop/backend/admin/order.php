<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';
require 'header.php';

$sql="SELECT id,price,quantity,products,uid,created_at
FROM lxy_order";
$users=query($sql);

?>
        <!-- 内容区 -->
        <div class="content">
          <div class="table_card">
            <div class="table_desc">
              <div class="desc1">所有订单</div>
              <div class="desc2">所有订单列表</div>
            </div>

            <div class="table">
              <table>
                <thead>
                  <th>
                    ID
                  </th>
                  <th>
                    下单用户
                  </th>
                  <th>
                    订单总价
                  </th>
                  <th>
                    下单时间
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
                    <?php 
              $uid=$user['uid'];
              $sql="SELECT * FROM lxy_user WHERE id='$uid'";
              $user2=queryOne($sql);
              echo $user2['name'];
            ?>       
                    </td>
                    <td>
                    <?php echo $user['price'];?>          
                    </td>
                    <td>
                    <?php echo $user['created_at'];?>  
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