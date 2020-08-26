<?php
require('../php/env.php');

$json = file_get_contents("php://input");
$data_timestamp = $_REQUEST['data_timestamp'];

$sql_tide_extremes = "INSERT INTO tide_extremes (json, data_timestamp) VALUES (?, ?)";
$query = $link->prepare($sql_tide_extremes);
$result = $query->bind_param('ss', $json, $data_timestamp);
$query->execute();
