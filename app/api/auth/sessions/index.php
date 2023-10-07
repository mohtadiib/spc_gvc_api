<?php
require '../../db.php';
require '../../mysql.php';

$result = ['msg'=>'Error No Feilds'];

function saveToken(){
    $result = insertAll("se", $items, $conn);
}
echo json_encode($result);
mysqli_close($conn);
?>
