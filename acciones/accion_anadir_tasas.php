<?php
    session_start();
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');
    
    $conexion = crearConexionBD();
    if(isset($_REQUEST['fecha'])){
        if(trim($_REQUEST['fecha'], " ") == ""){
            $error['fecha'] = "La fecha del gasto no puede estar vacía";
        }
        if(trim($_REQUEST['coste'], " ") == ""){
            $error['coste'] = "El coste del gasto no puede estar vacío";
        }
        if(trim($_REQUEST['num_alum'], " ") == ""){
            $error['num_alum'] = "Se debe especificar el alumno para el que se pagan las tasas";
        }
        
        if(isset($error)){
            $error['donde'] = "<strong>El error ha ocurrido añadiendo las tasas a un alumno</strong>";
            $_SESSION['error'] = $error;
            header('Location: ../gestion_autoescuela.php'); 
        } else {
            gastoTasas($conexion, $_REQUEST['fecha'], $_REQUEST['coste'], $_REQUEST['fecha'], $_REQUEST['num_alum']);
            header('Location: ../gestion_autoescuela.php');   
        }
    } else {
        header('Location: ../index.php');
    }