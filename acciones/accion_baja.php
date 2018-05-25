<?php
    session_start();
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarAlumnos.php");
    $conexion = crearConexionBD();
    if(isset($_REQUEST['id'])){
        if(trim($_REQUEST['id'], " ") == ""){
            $error['id'] = "El id del alumno no puede estar vacío";
            $error['donde'] = "<strong>El error ha ocurrido dando de baja a un alumno</strong>";
            $_SESSION['error'] = $error;
            header("Location: ../lista_alumnos.php");
        } else {
            darDeBaja($conexion, $_REQUEST['id']);
            header("Location: ../lista_alumnos.php");   
        }
    } else {
        header("Location: ../index.php");
    }
?>