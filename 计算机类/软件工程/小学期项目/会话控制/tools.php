<?php
    // 设置SESSION，PREFIX为前缀，key为键名，data为值
    function setSession($prefix,$key,$data){
        session_id()||@session_start();
        $_SESSION[$prefix][$key]=$data;
    }
    // 读取Session
    function getSession($prefix,$key){
        session_id()||@session_start();
        return isset($_SESSION[$prefix][$key])?$_SESSION[$prefix][$key]:[];
    }
    // 删除Session
    function deleteSession($prefix,$key){
        session_id()||@session_start();
        $_SESSION[$prefix][$key]=null;
    }
    // 设置错误信息
    function setInfo($str){
        setSession('system','info',$str);
    }
    // 获取错误信息
    function getInfo(){
        $info=getSession('system','info');
        deleteSession('system','info');
        return $info;
    }
    // 判断是否有错误信息
    function hasInfo(){
        return !empty(getSession('system','info'));
    }

?>