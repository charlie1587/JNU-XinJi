<?php
require '../db.func.php';
require '../tools.php';
require 'auth.php';
// 获取购物车数据
$uid = getSession('shop','id');
$sql="SELECT id,price,quantity,products,uid
FROM lxy_cart WHERE uid='$uid'";

$cart=queryOne($sql);
if(empty($cart)){
    header('location:cart.php');
    exit;
}
// 将购物车数据写入订单中
$price=$cart['price'];
$quantity=$cart['quantity'];
$products=$cart['products'];
$created_at=date('Y-m-d H:i:s');
$sql="INSERT INTO lxy_order(price,quantity,products,created_at,uid)
VALUES('$price','$quantity','$products','$created_at','$uid')";
if(execute($sql)){
    setInfo('下单成功');
    $sql="DELETE FROM lxy_cart WHERE uid='$uid'";
    execute($sql);
}else{
    setInfo('下单失败');
}
header('location:order_status.php');
?>