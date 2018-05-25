<?php
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarCoches.php");
    $conexion = crearConexionBD();
    session_start();
    if(isset($_REQUEST['repostaje'])){
        if(trim($_REQUEST['matricula'], " ") == ""){
            $error['matricula'] = "La matrícula no puede estar vacía";
        }
        if(trim($_REQUEST['kms'], " ") == ""){
            $error['kms'] = "Los kilómetros no pueden estar vacíos";
        }
        if(trim($_REQUEST['itv'], " ") == ""){
            $error['itv'] = "La fecha de la última ITV no puede estar vacía. En caso de no existir, introduzca la fecha de la compra";
        }
        if(trim($_REQUEST['repostaje'], " ") == ""){
            $error['repostaje'] = "La fecha del último repostaje no puede estar vacía. En caso de no existir, introduzca la fecha de la compra";
        }
        
        if(isset($error)){
            $_SESSION['error'] = $error;
            header("Location: ../anadir/anadir_coche.php");
        } else {
            anadirCoche($conexion, $_REQUEST['matricula'], $_REQUEST['itv'], $_REQUEST['kms'], $_REQUEST['repostaje']);
            header("Location: ../gestion_autoescuela.php");
        }
    } else {
        header("Location: ../index.php");
    }
?>