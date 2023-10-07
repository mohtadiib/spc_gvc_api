<?php
require '../db.php';
require '../mysql.php';

$row = ['err'=>'Error No Feilds'];

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
 $request = json_decode($postdata,true);
 if (isset($request["table"])){
     $table = $request["table"];
 }
 if(isset($request["foreignKey"])){
    $foreignKey = $request["foreignKey"];
 }
 if(isset($request["foreignFields"])){
    $foreignFields = $request["foreignFields"];
 }
 if (isset($request["inner_tables"])){
     $innerTables = $request["inner_tables"];
 }
    $where = '';
 if (isset($request["where"])){
     $where = $request["where"];
 }

    if (isset($request["dashboard"])){
        $dashboard = $request["dashboard"];
    }

    if(isset($foreignFields)){
        //fetch where set foreign key
        if ($where){
            $row = fetch_all($table,$conn,$where);
        }else{
            if (isset($foreignKey)){
              $row = fetch_by_id($table,array_values($foreignKey)[0],$conn,array_keys($foreignKey)[0]);
            }else{
              $row = fetch_all($table,$conn);
            }
        }
        $rowTempList = [];
        foreach ($row as $rowItem){
            foreach ($foreignFields as $foreign){
                if (isset($foreign["table"])){
//                        echo $foreign["table"].' / ';
                    if (isset($rowItem[$foreign["field"]])){
                        $innerRowsTemp = selectRecord($foreign["table"], "doc_id", $rowItem[$foreign["field"]], $conn);
                        if ($innerRowsTemp) {
                            $object["name"] = $innerRowsTemp["name"];
                            $object["doc_id"] = $innerRowsTemp["doc_id"];
                            $rowItem[$foreign["field"]] = $object;
                        }
                    }
                }
            }
            $rowTempList[] = $rowItem;
        }
        $row = $rowTempList;
    }else{
        if (isset($table)){
            $row = fetch_all($table,$conn,$where);
        }
    }
//
 if (isset($request["field1"]) ){
     $field_1 = $request["field1"];
     $id_1 = $request["id"];
     $row = innerSelectDeep("$table","$field_1","$id_1",
         "","","","", $conn);
 }
// if (isset($request["table2"]) ){
//     $field_1 = $request["field1"];
//     $id_1 = $request["id"];
//     $table2 = $request["table2"];
//     $field2 = $request["field2"];
//     $row = innerSelectDeep("$table","$field_1","$id_1",
//         "$table2","$field2","","", $conn);
////     $row = [];
// }
// if (isset($request["table3"]) ){
//     $field_1 = $request["field1"];
//     $id_1 = $request["id"];
//     $table2 = $request["table2"];
//     $field2 = $request["field2"];
//     $table3 = $request["table3"];
//     $field3 = $request["field3"];
//     $row = innerSelectDeep("$table","$field_1","$id_1",
//         "$table2","$field2","$table3","$field3", $conn);
//  }

    if (isset($request["inner_tables"])){
        $innerTables = $request["inner_tables"]["tables"];
        $foreignField = $request["inner_tables"]["foreignField"];
        foreach ($innerTables as $innerTable){
            $finalRow = [];
            foreach ($row as $rowItem){
                $innerRows = innerSelectDeep("$innerTable",$foreignField,$rowItem["doc_id"],
                    "","","","", $conn);
                $rowItem[$innerTable] = count($innerRows);
                $finalRow[] = $rowItem;
            }
            $row = $finalRow;
        }
//        $id_1 = $request["id"];
    }


    if (isset($request["dashboard"])){
        $dashboard = $request["dashboard"];
        if (isset($foreignKey)){
          $userRow = fetch_by_id("users",array_values($foreignKey)[0],$conn,"doc_id");
        }

        foreach ($dashboard as $item){
            $table = $item["table"];
            if (isset($foreignKey) && isset($item["user"]) && $item["user"] && $userRow[0]["role"] != "1"){
                $row = fetch_by_id($table,array_values($foreignKey)[0],$conn,array_keys($foreignKey)[0]);
            }else{
                $row = fetch_all($table,$conn);
            }
            $total = 0;
            foreach ($row as $itemRow){
                if (isset($item["field"]) && isset($itemRow[$item["field"]])){
                    $total += (int) $itemRow[$item["field"]];
                }
            }
            $finalRow[$item["table"]]["total"] = $total;
            if (isset($item["user"]) && $item["user"]){
                $finalRow[$item["table"]]["count"] = count($row);
            }else{
                $finalRow[$item["table"]] = count($row);
            }
        }
        if (isset($userRow)){
          $finalRow["role"] = $userRow[0]["role"];
        }
       $row = $finalRow;
    }
}

echo json_encode($row);
mysqli_close($conn);
?>
