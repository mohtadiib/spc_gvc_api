<?php
require '../../../db.php';
require '../../../mysql.php';

$res = ['running'=> false];
if(isset($postdata))
{
    $request = json_decode($postdata,true);
    $sessionId = $request["sessionId"];
    if ($sessionId && $sessionId != "undefined"){
        $sessionData = getUserBySession($sessionId,$conn);
    }
    if (isset($sessionData)){
        $res["running"] = true;
        $res["session"] = $sessionData;
    }
}
echo json_encode($res);
mysqli_close($conn);
?>