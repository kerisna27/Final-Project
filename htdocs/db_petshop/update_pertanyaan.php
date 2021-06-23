<?php

include 'connection.php';

$id = $_POST['id'];
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$notelepon = $_POST['notelepon'];
$pertanyaan = $_POST['pertanyaan'];

$sql = "UPDATE db_petshop set 
        
        nama='$nama', 
        alamat='$alamat',
        notelepon='$notelepon', 
        pertanyaan='$pertanyaan' WHERE id='$id'";
       
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