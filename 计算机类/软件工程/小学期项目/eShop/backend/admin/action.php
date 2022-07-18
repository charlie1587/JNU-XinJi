<?php
    require '../db.func.php';
    require '../tools.php';
    $action = $_REQUEST['action'];

    //echo $action;exit();

    switch($action){
        case 'login':
            // 是否有POST提交
            if(empty($_POST['adminuser'])){
                setInfo('用户名不能为空');
                header('Location:login.php');
                exit;
            }

            // 接收POST数据
            $adminuser = htmlentities($_POST['adminuser']);
            $adminpass = md5(htmlentities($_POST['adminpass']));

            // echo $adminpass;
            // echo $adminuser;
            // exit;

            // 连接数据库，查询是否存在该管理员

            $sql = "SELECT id,adminuser,adminpass FROM lxy_admin WHERE 
            adminuser ='$adminuser' AND adminpass ='$adminpass' ";
            // echo $sql;exit;

            $admin=queryOne($sql);
            //var_dump($admin);exit;
            if($admin){
                // 将该管理员名字、ID写入session，将登陆时间、IP地址写入session
                setSession('admin','adminuser',$adminuser);
                setSession('admin','adminid',$admin['id']);
                //var_dump($_SESSION['admin']);exit;
                $login_at=date('Y-m-d H:i:s');
                // ip地址
                $login_ip=$_SERVER['REMOTE_ADDR']=='::1'?'127.0.1':$_SERVER['REMOTE_ADDR'];
                //echo $login_at;echo $login_ip;exit;
                $sql="UPDATE lxy_admin SET login_at='$login_at',login_ip='$login_ip' 
                    WHERE id={$admin['id']}";
                execute($sql);
                header('location:admin.php');
            }
            else{
                // 给出错误提示
                setInfo('用户名或密码错误');
                header('location:login.php');
            }
            break;
        case 'logout':
            deleteSession('admin','adminuser');
            deleteSession('admin','adminid');
            header('location:login.php');
            break;

    }
    
?>
