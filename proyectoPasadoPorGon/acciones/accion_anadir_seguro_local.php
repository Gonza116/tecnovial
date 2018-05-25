<?php
    session_start();
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');
    
    $conexion = crearConexionBD();
    if(isset($_REQUEST['fecha_renovacion'])){
        if(trim($_REQUEST['fecha'], " ") == ""){
            $error['fecha'] = "La fecha del gasto no puede estar vacía";
        }
        if(trim($_REQUEST['coste'], " ") == ""){
            $error['coste'] = "El coste no puede estar vacía";
        }
        if(trim($_REQUEST['fecha_renovacion'], " ") == ""){
            $error['renovacion'] = "La fecha de renovación no puede estar vacía";
        }
        if(isset($error)){
            $error['donde'] = "El error ha ocurrido añadiendo un seguro de local";
            $_SESSION['error'] = $error;
             header("Location: ../gestion_autoescuela.php");
        } else {
            gastoLocal($conexion, $_REQUEST['fecha'], $_REQUEST['coste'], $_REQUEST['fecha_renovacion']);
            header('Location: ../gestion_autoescuela.php');   
        }
    } else {
        header('Location: ../index.php');
    }

?>