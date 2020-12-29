<?php
    if (isset($_GET['submit'])){
        $username = "root";
        $password = "140199";
        $hostname = "localhost"; 
        $db="something";
        $connect = new mysqli($hostname, $username, $password, $db);
        $data="'".$_GET['CMND']. "','" .$_GET['NgayTuyendung']."','".$_GET['DiaChi']."','".$_GET['Ho']."','".$_GET['Ten']."'";
        if($_GET['chucvu']==1){
            $add_sql = "CALL INSERT_TAIXE($data)";
        } else if($_GET['chucvu']==2){
            $add_sql = "CALL INSERT_LoXe($data)";
        } else if($_GET['chucvu']==3){
            $add_sql = "CALL INSERT_NGUOIQUANLY($data)";
        } 
        if ($connect->query($add_sql)){
            header('Location: nhanvien.php');
        }
        else {
            echo "Error Adding record :" .$connect->error;
        }
    };
?>