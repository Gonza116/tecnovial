<?php
    session_start();
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarAlumnos.php");

    $conexion = crearConexionBD();

    if(isset($_REQUEST['id'])){
        if(trim($_REQUEST['id_ex'], " ") == ""){
            $error['id_ex'] = "El id del examen no puede estar vacío";
        }
        if(trim($_REQUEST['id'], " ") == ""){
            $error['id'] = "El id del alumno no puede estar vacío";
        }
        if(trim($_REQUEST['apto'], " ") == ""){
            $error['apto'] = "El alumno debe estar apto o no apto";
        }
        
        if(isset($error)){
            $error['donde'] = "<strong>Los errores han ocurrido en el formulario para añadir la nota de un examen práctico</strong>";
            $_SESSION['error'] = $error;
            header("Location: ../lista_alumnos.php");
        } else {
            resultadoExamenPractico($conexion, $_REQUEST['id_ex'], $_REQUEST['id'], $_REQUEST['apto']);
            header("Location: ../ficha_alumno.php?id_alumno=" . $_REQUEST['id']);
        }
    } else {
        header("Location: ../index.php");
    }
?>