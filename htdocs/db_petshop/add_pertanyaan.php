<?php

include 'connection.php';

$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$notelepon = $_POST['notelepon'];
$pertanyaan = $_POST['pertanyaan'];

$sql = "INSERT INTO db_petshop set 
        nama='$nama', 
        alamat='$alamat',
        notelepon='$notelepon', 
        pertanyaan='$pertanyaan'";
$result = $connect->query($sql);

if($result){
    echo json_encode(array(
        "succes" => true,
      
    ));
}else{
    echo json_encode(array(
        "succes" => false,
   
    ));
}