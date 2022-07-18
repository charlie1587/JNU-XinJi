<?php 
require '../tools.php';
require '../db.func.php';
require 'auth.php';

// 接收产品id
$product_id=intval($_GET['id']);
// 用户id
$uid=getSession('shop','id');
// auth

if(empty($product_id)){
    header('location:cart.php');
    exit;
}
// 查询购物车
$sql="SELECT id,price,quantity,products FROM lxy_cart WHERE uid='$uid'";
$cart=queryOne($sql);
// 删除对应id数据，更新数量、总价
$cart['products']=json_decode($cart['products'],true);
$cart['price']-=$cart['products'][$product_id]['quantity']*
    $cart['products'][$product_id]['product']['price'];
$cart['quantity']-=$cart['products'][$product_id]['quantity'];
unset($cart['products'][$product_id]);
$cart['products']=json_encode($cart['products']);
$sql="UPDATE lxy_cart SET price= '{$cart['price']}', 
quantity='{$cart['quantity']}',
products='{$cart['products']}'
WHERE uid='$uid'";

if(execute($sql)){
    echo "<script>
			alert('删除成功！');
			location.href='cart.php'
			</script>";
}
else{
    echo "<script>
			alert('删除失败！');
			location.href='cart.php'
			</script>";
}
?>