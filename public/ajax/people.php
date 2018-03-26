<?php

require_once '../../app/Models/People.php';

use app\Models\People;


$people = new People;

switch (strtolower($_SERVER['REQUEST_METHOD'])) {
    case "post":
        $valor = filter_input(INPUT_POST, 'nome', FILTER_SANITIZE_STRING);
        $result = $people->findNumChildren($valor);

        if ($valor == '' || !$result) {
        	echo json_encode('noresult');
        } else {
        	echo json_encode($result);
        }
        break;
    case "get":
        echo json_encode($people->findAllNumChildren());
        break;
    case "delete":
        //
        break;
    default:
        break;
}
