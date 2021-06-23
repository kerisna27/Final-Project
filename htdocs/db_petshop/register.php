<?php
include 'connection.php';

$username = $_POST['username'];
$password = md5($_POST['password']);

// $sql = "INSERT INTO tb_user (username, password) VALUES ('".$username."', '".$password."')";
$sql = "INSERT INTO user set username ='$username', password ='$password'";

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