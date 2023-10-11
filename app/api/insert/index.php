<?php
require '../../db.php';
require '../../mysql.php';
require '../../functions.php';

$date = date("ds");
$random = (string) rand(100, 999);

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
$request = json_decode($postdata,true);
$table = $request["table"];
$dataList = is_assoc($request["data"]);
if(isset($dataList[0]["innerItem"])){
    $innerItems = $dataList[0]["innerItem"];
}
unset($dataList[0]["innerItem"]);
if(isset($request["foreignField"])){
$foreignField = $request["foreignField"];
}
if(isset($request["sessionId"])){
$sessionId = $request["sessionId"];
}
    $sessionData = getUserBySession($sessionId,$conn);
    foreach ($dataList as $item){
//            if(isset($foreignField)){
//                $item[$foreignField['foreignKeys'][0]] = $foreignField['foreignKeys'][0];
//            }
            $item["user_id"] = $sessionData["user_id"];
            $items[] = $item;
    }
$result = insertAll($table, $items, $conn);
//
$res['msg'] = 'Error , IN your syntac , check ur params';
//
if($result){
    $res['msg'] = $result;
    if ($res && isset($innerItems)){
        $data = $innerItems["data"];
        foreach ($data as $item){
            $random = (string) rand(100, 999);
            $docId = $date.$random;
            $item["doc_id"] = $docId;
            $itemsData[] = $item;
        }
        $result = insertAll($innerItems["table"], $itemsData, $conn);
    }
    $res['msg'] = $result;
}
}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);
?>
