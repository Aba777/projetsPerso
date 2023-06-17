<?php 
    include "config.php";
    $input = file_get_contents("php://input");
    $data = json_decode($input,true);
    $message = array();
    $nom = $data['nom'];
    $prenom = $data['prenom'];
    $mdp = $data['mdp'];
    

    $q = mysqli_query($conn, "INSERT INTO client (nomClient, prenomClient, motDePasse) VALUES ('$nom', '$prenom', '$mdp')" );

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