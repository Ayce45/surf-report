<?php
require('../php/env.php');

$json = file_get_contents("php://input");
$data_timestamp = $_REQUEST['data_timestamp'];

$sql_astronomy = "INSERT INTO astronomy (json, data_timestamp) VALUES (?, ?)";
$query = $link->prepare($sql_astronomy);
$result = $query->bind_param('ss', $json, $data_timestamp);
$query->execute();
