<?php
require('../php/env.php');

$json = file_get_contents("php://input");
$data_timestamp = $_REQUEST['data_timestamp'];

$sql_weather = "INSERT INTO weather (json, data_timestamp) VALUES (?, ?)";
$query = $link->prepare($sql_weather);
$result = $query->bind_param('ss', $json, $data_timestamp);
$result = $query->execute();
