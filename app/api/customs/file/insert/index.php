<?php
require '../../../../db.php';
require '../../../../mysql.php';
require '../../../../functions.php';

$date = date("Ymdhms");
$random = (string) rand(100, 999);
$fileId = $date.$random;

if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);

    $data = is_assoc($request["data"]);

    $fileData = $data[0]["main"];
    $nessData = json_decode($data[0]["ness_data"],true);
    $products = json_decode($data[0]["products"],true);
    $containers = json_decode($data[0]["containers"],true);
//    $products = $data[0]["products"];

    $fileData["file_id"] = $fileId;

    $result = insert("files", $fileData, $conn);
    if($result){
        foreach ($nessData as $nessD){
            $nessD["file_id"] = $fileId;
//                $container["id"] = 0;
            $result = insert("file_data", $nessD, $conn);
        }
        foreach ($containers as $container){
            $container["file_id"] = $fileId;
//                $container["id"] = 0;
            $result = insert("file_containers", $container, $conn);
        }
            if($result){
                foreach ($products as $product){
                    $product["file_id"] = $fileId;
                    $result = insert("file_items", $product, $conn);
                }
            }

    }

$res['msg'] = 'Error , IN your syntac , check ur params';

if($result){
    $res['msg'] = $result;
}


}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);
?>
