<?php
require('../php/env.php');
header('content-type:application/json');

$data_timestamp = $_REQUEST['data_timestamp'];

$sql_tide_sea = "SELECT * FROM tide_sea WHERE request_timestamp > now()-interval 1 day AND data_timestamp = '$data_timestamp'";
$tide_sea = mysqli_fetch_row($link->query($sql_tide_sea));

if ($tide_sea[0] == "") {
    echo "{}";
} else {
    echo $tide_sea[0];
}
