<?php
require '../../db.php';
require '../../mysql.php';
require '../../functions.php';

$result = ['msg'=>'Error No Feilds'];
$date = date("Ymdhms");
$random = (string) rand(100, 999);
$docId = $date.$random;


if(!empty($postdata))
{
 // Extract the data.
 $request = json_decode($postdata,true);

 $table = "users";

//  $email = mysqli_real_escape_string($conn, $request["email"]);
 $phone = mysqli_real_escape_string($conn, $request["phone"]);;
 $password = mysqli_real_escape_string($conn, $request["password"]);

//  $sql = "SELECT * FROM `users` WHERE (phone = $phone or email = $email) AND password = $password";
 $sql = "SELECT * FROM `users` WHERE phone = '$phone' AND password = '$password'";
 $row = query_result($sql, $conn);

 if(!empty($row) && count($row) == 1){
    $row = $row[0];
    $active = (int) $row['active'];
    $msg = "success";
     if($active != 1){
         $msg = "disabled";
         $row = [];
     }else{
         $session = array(
             "doc_id"=> $docId,
             "user_id"=> $row["doc_id"],
         );
         $session = is_assoc($session);
         $result = insertAll("sessions", $session, $conn);
     }
     $isAdmin = false;
     if ($row["role"] == 1){
         $isAdmin = true;
     }
     $session = ['sessionId'=> $docId, 'name' =>  $row['name'], 'isAdmin'=> $isAdmin];
     $result = ['msg'=> $msg, 'session' => $session];
 }else {
  $msg = "error";
  $result = ['msg'=> $msg, 'user'=> []];
 }
}

echo json_encode($result);
mysqli_close($conn);
?>
