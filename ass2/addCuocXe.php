<?php
    $data="'".$_GET['NgayDen']. "','" .$_GET['NgayDi']."','".$_GET['PhuongTien']."','".$_GET['TaiXeCMND']."','".$_GET['LoXeCMND']."'";
    echo $data;
    // if (isset($_GET['submit'])){
    //     $username = "root";
    //     $password = "140199";
    //     $hostname = "localhost"; 
    //     $db="something";
    //     $connect = new mysqli($hostname, $username, $password, $db);
    //     $data="'".$_GET['NgayDen']. "','" .$_GET['NgayDi']."','".$_GET['PhuongTien']."','".$_GET['TaiXeCMND']."','".$_GET['LoXeCMND']."'";
    //     $addCuocXe_sql = "CALL INSERT_CUOCXE($data)";
    //     if ($connect->query($addCuocXe_sql)){
    //         header('Location: cuocxe.php');
    //     }
    //     else {
    //         echo "Error Adding record :" .$connect->error;
    //     }
    // };
?>