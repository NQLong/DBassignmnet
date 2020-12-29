<?php
    if (isset($_GET['submit'])){
        $username = "root";
        $password = "140199";
        $hostname = "localhost"; 
        $db="something";
        $connect = new mysqli($hostname, $username, $password, $db);
        $data=$_GET['ID']. ",'".$_GET['Tinh']. "','" .$_GET['DiaChi']."',".$_GET['DienTich'].",'".$_GET['Ten']."'";
        $addKho_sql = "CALL UPDATE_KHO($data)";
        if ($connect->query($addKho_sql)){
            header('Location: kho.php');
        }
        else {
            echo "Error Adding record :" .$connect->error;
        }
    };
?>