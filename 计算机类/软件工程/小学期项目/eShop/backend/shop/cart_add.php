<?php
require '../db.func.php';
require '../tools.php';

// 接收数据
$pid=intval($_REQUEST['id']);
$quantity=intval($_REQUEST['qtybutton']);

// 获取当前用户id
$uid=getSession('shop','id');

// 产品信息
$sql="SELECT id,name,code,price,stock,description,created_at
FROM lxy_product WHERE id='$pid'";
$product=queryOne($sql);

if(!empty($uid)){
    // 已经登录，写入数据库cart
    $sql="SELECT id,price,quantity,products,created_at,uid
    FROM lxy_cart WHERE uid='$uid'";
    $cart=queryOne($sql);
    
    // 判断是否已经存在购物车
    if($cart){
        // 存在，更新购物车
        $products=json_decode($cart['products'],true);
        if(array_key_exists($pid,$products)){
            $products[$pid]['quantity']+=$quantity;
        }
        else{
            $products[$pid]=['quantity'=>$quantity,'product'=>$product];
        }
        $products=json_encode($products);
        $price=$cart['price']+$quantity*$product['price'];
        $quantity=$cart['quantity']+$quantity;
        $sql="UPDATE lxy_cart SET products='$products',
        price='$price',quantity='$quantity' WHERE id='{$cart['id']}'";
        execute($sql);
        header("Location:cart.php");
    }
    else{
        // 不存在，插入购物车
        $products[$product['id']]=['quantity'=>$quantity, 'product'=>$product];
        $products=json_encode($products);
        $created_at=date('Y-m-d H:i:s');
        $price=$quantity*$product['price'];
        $sql="INSERT lxy_cart(uid,price,quantity,products,created_at)
        VALUES('$uid','$price','$quantity','$products','$created_at')";
        execute($sql);
        header("Location:cart.php");
    }
}
else{
    // 如果没有登录，写入SESSION
    $cart=getSession('shop','cart');
    if(!empty($cart)){
        // 如果用户session中有购物车，更新购物车
        if(array_key_exists($pid,$cart['products'])){
            $cart['products'][$pid]['quantity']+=$quantity;
        }
        else{
            $cart['products'][$pid]=['quantity'=>$quantity, 'product'=>$product];
        }
        $cart['price']+=$quantity*$product['price'];
        $cart['quantity']+=$quantity;
        setSession('shop','cart',$cart);
        header("Location:index.php");
    }
    else{
        // 如果用户session中没有购物车，创建购物车
        $cart['products'][$pid]=['quantity'=>$quantity, 'product'=>$product];
        $cart['price']=$quantity*$product['price'];
        $cart['quantity']=$quantity;
        setSession('shop','cart',$cart);
        header("Location:lindex.php");
    }
    
}



?>