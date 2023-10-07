<?php
require '../../../../db.php';
require '../../../../mysql.php';
require '../../../../functions.php';

if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);
    $fileId = $request["file_id"];

    $result["data"] = selectFile($fileId, $conn);
    if($result["data"]){
        $result["containers"] = selectArrayRecord("file_containers","file_id", $fileId, $conn);
        $result["items"] = innerSelect(
            "file_items",
            "file_id",
            "$fileId",
            "clearance_items",
            "item_id",
            $conn
        );
    }

    $res['msg'] = 'Error , IN your syntac , check ur params';

    if($result){
        $res['msg'] = $result;
    }
}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($result);
mysqli_close($conn);



function selectFile($fileId, $conn){

    $row = selectRecord("files", "file_id", $fileId, $conn);
    if ($row){
        $row["service"] = selectRecord("services", "id", $row["service_id"], $conn);
        $steps = json_decode("[".$row["service"]["steps"]."]");

        $stepsChanges = array();
        foreach ($steps as $step){
            $stepRow = selectRecord("clearance_steps", "id", $step, $conn);
            $stepRow["done"] = false;
            $stepRow["description"] = "تأكد من اكمال المستندات المطلوبة في هذه الخطوة واضغط على التالي";

            $docs[] = json_decode("[".$stepRow["necessary_docs"]."]");
            $necessary_docs = array();
            $documents = array();
            $currentDocIds = array();

            foreach ($docs as $doc){
                foreach ($doc as $necessary_doc){
                    $necessary_docs[] = $necessary_doc;
                }
            }
            $arr = array_unique($necessary_docs);
            $docUniqued = array_values($arr);
            $currentDocTemp = array();

            $currentDocs = selectArrayRecord("file_docs", "file_id", $fileId, $conn);
            if ($currentDocs){
                foreach ($currentDocs as $currentDoc){
                    $currentDocIds["ids"][] = (int) $currentDoc["doc_id"];
                    $currentDocTemp["id"] = $currentDoc["id"];
                    $currentDocTemp["doc_id"] = $currentDoc["doc_id"];
                    $currentDocTemp["img"] = $currentDoc["img_path"];
                    $currentDocIds["img_paths"][] = $currentDocTemp;
                }
            }

            foreach ($docUniqued as $docUniqItem){
                $docu = selectRecord("clearance_docs", "id", $docUniqItem, $conn);
                if ($currentDocIds){
                    if (in_array($docUniqItem, $currentDocIds["ids"]))
                    {
                        foreach ($currentDocIds["img_paths"] as $currentDocImg){
                            if ($docUniqItem == $currentDocImg["doc_id"]){
                                $docu["img_path"] = $currentDocImg["img"];
                                $docu["file_doc_id"] = $currentDocImg["doc_id"];
                            }
                        }
                        $docu["uploaded"] = true;
                    }else{
                        $docu["img_path"] = "";
                        $docu["file_doc_id"] = "0";
                        $docu["uploaded"] = false;
                    }
                }else{
                    $docu["img_path"] = "";
                    $docu["file_doc_id"] = "0";
                    $docu["uploaded"] = false;

                }
                $docu["file_id"] = $fileId;
                $documents[] = $docu;
            }
            $row["docs"] = $documents;
            $row["steps"][] = $stepRow;


        }

        if ($row["current_step"] != $steps[0]){
            for ($x = 0; $x < count($steps); $x++) {
                $row["steps"][$x]["done"] = true;
                if ($row["current_step"] == $steps[$x]) {
                    break;
                }
            }
        }else{
            $row["steps"][0]["done"] = true;
        }

        $row["supplier_name"] = selectRecord("suppliers", "id", $row["supplier_id"], $conn)["name"];;
        $row["shipping_line_name"] = selectRecord("shipping_lines", "id", $row["shipping_line_id"], $conn)["name"];;
    }

    return $row;
}

?>
