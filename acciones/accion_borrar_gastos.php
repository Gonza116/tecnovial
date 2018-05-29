<?php
    session_start();
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarGastos.php");

    $conexion = crearConexionBD();

    if(isset($_REQUEST['id']) || trim($_REQUEST['id'], " ") == ""){
        if(isset($_REQUEST['es_coche'])){
            borrarGastoSeguroCoche($conexion, $_REQUEST['id']);
            header("Location: ../gestion_autoescuela.php");   
        } else if (isset($_REQUEST['es_tasa'])){
            borrarGastoTasas($conexion, $_REQUEST['id']);
            header("Location: ../gestion_autoescuela.php"); 
        } else if (isset($_REQUEST['es_luz'])){
            borrarGastoLuz($conexion, $_REQUEST['id']);
            header("Location: ../gestion_autoescuela.php"); 
        } else if (isset($_REQUEST['es_local'])){
            borrarGastoLocal($conexion, $_REQUEST['id']);
            header("Location: ../gestion_autoescuela.php"); 
        } else {
            $error['no_es_nada'] = "La acción de borrar un gasto debe estar referida a un gasto";
            $error['donde'] = "El error se ha dado borrando un gasto";
            $_SESSION['error'] = $error;
            header("Location: ../gestion_autoescuela.php"); 
        }
    } else {
        $error['id'] = "El id del gasto no puede estar vacío";
        $error['donde'] = "El error se ha dado borrando un gasto";
        $_SESSION['error'] = $error;
        header("Location: ../gestion_autoescuela.php");
    }
    
?>