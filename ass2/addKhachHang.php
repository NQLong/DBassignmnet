<?php
    if (isset($_GET['submit'])){
        $username = "root";
        $password = "140199";
        $hostname = "localhost"; 
        $db="something";
        $connect = new mysqli($hostname, $username, $password, $db);
        $data="'".$_GET['Ten']. "','" .$_GET['DiaChi']."'";
        if($_GET['vaitro']==1){
            $add_sql = "CALL INSERT_NGUOIGUI($data)";
        } else if($_GET['vaitro']==2){
            $add_sql = "CALL INSERT_NGUOINHAN($data)";
        };
        if ($connect->query($add_sql)){
            header('Location: khachhang.php');
        }
        else {
            echo "Error Adding record :" .$connect->error;
        }
    };
?>