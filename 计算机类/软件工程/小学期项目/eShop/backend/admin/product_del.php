<?php
    require '../db.func.php';
    require '../tools.php';
    require 'auth.php';

    $id=intval($_GET['id']);
    $sql="DELETE FROM lxy_product where id='$id'";
    if(execute($sql)){
        setInfo('删除成功！');
    }
    else{
        setInfo('删除失败！');
    }
    header("location:product.php");
?>