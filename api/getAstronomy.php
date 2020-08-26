<?php
require('../php/env.php');
header('content-type:application/json');

$data_timestamp = $_REQUEST['data_timestamp'];

$sql_astronomy = "SELECT * FROM astronomy WHERE request_timestamp > now()-interval 1 day AND data_timestamp = '$data_timestamp'";
$astronomy = mysqli_fetch_row($link->query($sql_astronomy));

if ($astronomy[0] == "") {
    echo "{}";
} else {
    echo $astronomy[0];
}
