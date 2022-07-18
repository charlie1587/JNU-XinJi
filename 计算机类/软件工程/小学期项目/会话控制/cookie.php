<?php
    //服务器像用户发送setcookie
    //用户生成cookie文件
    // $result=setcookie('username','tom',time()+3600);// time有效时长
    // if($result){
    //     echo "success!";
    // }
    // else{
    //     echo "failed!";
    // }

    // 读取cookie
    var_dump($_COOKIE['username']);
?>