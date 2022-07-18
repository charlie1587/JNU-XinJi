<?php
    // 在php.ini 设置保存路径，需要重启apache
    // 打开session
    session_start();
    // $_SESSION['user'] = ['username'=>'tom',"id"=>5];
    // $_SESSION['user'] = 'peter';
    // $_SESSION['id'] = 6;

    // 输出session信息
    // echo session_id().'<br>';
    // echo session_save_path().'<br>';
    // echo session_name().'<br>';

    // // 清空session文件
    // session_unset();
    // 销毁session文件
    // session_destroy();
    // 设置为空
    $_SESSION['user']=null;
?>