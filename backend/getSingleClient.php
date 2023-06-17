<?php 
include "config.php";
$data = array();
$id = $_GET['id'];
$q = msqli_query($conn, "SELECT * FROM 'client' WHERE 'id' = $id LIMIT 1");

while ($row = mysqli_fecth_object($q)) {
    $data[] = $row;
}

echo json_encode($data);
echo mysqli_error($conn);

?>