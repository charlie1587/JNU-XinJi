<?php
if(empty(getSession('shop','username'))){
    header("location:login.php");
    die;
}
?>