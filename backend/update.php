<?php 
    include "config.php";
    $input = file_get_contents("php://input");
    $data = json_decode($input,true);
    $message = array();
    $id = $data['01'];
    $nom = $data['Dicko'];
    $prenom = $data['Ahmadou'];
    $mdp = $data['7777'];
    $id = $_GET['id'];

    $q = mysqli_query($conn, "UPDATE 'client' SET ('idClient', 'nomClient', 'prenomClient', 'motDePasse') VALUES ('$id', '$nom', '$prenom', '$mdp') WHERE 'id' = '{$id}' LIMIT 1");

    if ($q) {
        http_response_code(201);
        $message['status'] = "success";
    }else {
        http_response_code(422);
        $message['status'] = "error";
    }

    echo json_encode($message);
    echo mysqli_error($conn)

?>