<?php
require '../db.func.php';
require '../tools.php';

switch ($_GET['action']) {
    case 'login':
        // 判断是否有POST
        if (!empty($_POST['username'])) {

            $username = htmlentities($_POST['username']);
            $password = md5(htmlentities($_POST['password']));
            // 验证客户
            $sql = "SELECT id,username FROM lxy_user WHERE
            username='$username' AND password='$password'";

            $user = queryOne($sql);
            if ($user) {

                setSession('shop', 'username', $username);
                setSession('shop', 'id', $user['id']);
                // 判断session中是否已经存在购物车
                if (getSession('shop', 'cart')) {
                    //存在,合并购物车，删除session
                    $cart2 = getSession('shop', 'cart');
                    // 遍历session中的每一个物品
                    foreach ($cart2['products'] as $product2) :
                        $pid = $product2['product']['id'];
                        $quantity = $product2['quantity'];
                        $uid = $user['id'];
                        $sql = "SELECT id,name,code,price,stock,description,created_at
                            FROM lxy_product WHERE id='$pid'";
                        $product = queryOne($sql);
                        // 已经登录，写入数据库cart
                        $sql = "SELECT id,price,quantity,products,created_at,uid
                                FROM lxy_cart WHERE uid='$uid'";
                        $cart = queryOne($sql);

                        // 判断是否已经存在购物车
                        if ($cart) {
                            // 存在，更新购物车
                            $products = json_decode($cart['products'], true);
                            if (array_key_exists($pid, $products)) {
                                $products[$pid]['quantity'] += $quantity;
                            } else {
                                $products[$pid] = ['quantity' => $quantity, 'product' => $product];
                            }
                            $products = json_encode($products);
                            $price = $cart['price'] + $quantity * $product['price'];
                            $quantity = $cart['quantity'] + $quantity;
                            $sql = "UPDATE lxy_cart SET products='$products',
                                    price='$price',quantity='$quantity' WHERE id='{$cart['id']}'";
                            execute($sql);
                            header("Location:cart.php");
                        } else {
                            // 不存在，插入购物车
                            $products[$product['id']] = ['quantity' => $quantity, 'product' => $product];
                            $products = json_encode($products);
                            $created_at = date('Y-m-d H:i:s');
                            $price = $quantity * $product['price'];
                            $sql = "INSERT lxy_cart(uid,price,quantity,products,created_at)
                                    VALUES('$uid','$price','$quantity','$products','$created_at')";
                            execute($sql);
                            header("Location:cart.php");
                        }

                    endforeach;
                    //合并完毕，删除session
                    deleteSession('shop', 'cart');
                }
                header('Location:index.php');
            } else {
                setInfo('用户名或密码不正确！');
                header("location:login.php");
                die();
            }
        }
        break;
    case 'regin':
        if (!empty($_POST['username'])) {
            $username = htmlentities($_POST['username']);
            $password = md5(htmlentities($_POST['password']));
            $email = htmlentities($_POST['email']);
            $sql = "INSERT lxy_user(username,password,email)
            VALUES('$username','$password','$email')";
            if (execute($sql)) {
                setInfo('注册成功');
                header("location:login.php");
            } else {
                setInfo('注册失败！');
                header('Location:login.php');
            }
        }
        break;
    case 'logout':
        deleteSession('shop', 'username');
        deleteSession('shop', 'id');
        header('Location:login.php');
        break;
}
