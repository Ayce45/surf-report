<?php
require('../php/env.php');
header('content-type:application/json');

$data_timestamp = $_REQUEST['data_timestamp'];

$sql_weather = "SELECT * FROM weather WHERE request_timestamp > now()-interval 1 hour AND data_timestamp = '$data_timestamp'";
$weather = mysqli_fetch_row($link->query($sql_weather));

if ($weather[0] == "") {
    echo "{}";
} else {
    echo $weather[0];
}
