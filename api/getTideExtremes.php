<?php
require('../php/env.php');
header('content-type:application/json');

$data_timestamp = $_REQUEST['data_timestamp'];

$sql_tide_extremes = "SELECT * FROM tide_extremes WHERE request_timestamp > now()-interval 1 day AND data_timestamp = '$data_timestamp'";
$tide_extremes = mysqli_fetch_row($link->query($sql_tide_extremes));

if ($tide_extremes[0] == "") {
    echo "{}";
} else {
    echo $tide_extremes[0];
}
