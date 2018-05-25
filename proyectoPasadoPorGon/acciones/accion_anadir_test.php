<?php
    session_start();
    include_once('../utiles/gestionDB.php');
    include_once('../utiles/gestionarAlumnos.php');

    $conexion = crearConexionBD();

    if(isset($_REQUEST['num_test'])){
        if(trim($_REQUEST['num_alum'], " ") == ""){
            $error['num_alum'] = "El id del alumno no puede estar vacío";
        }
        if(trim($_REQUEST['fecha'], " ") == ""){
            $error['fecha'] = "La fecha del test no puede estar vacía";
        }
        if(trim($_REQUEST['num_test'], " ") == ""){
            $error['test'] = "El número de test no puede estar vacío";
        }
        if(trim($_REQUEST['num_fallos'], " ") == ""){
            $error['fallos'] = "El número de fallos no puede estar vacío";
        }
        if($_REQUEST['num_fallos'] > 30){
            $error['muchos_fallos'] = "El número de fallos no puede ser superior a 30";
        }
        
        if(isset($error)){
            $error['donde'] = "<strong>El error ha ocurrido añadiendo un nuevo test teórico</strong>";
            $_SESSION['error'] = $error;
            header("Location: ../lista_alumnos.php");
        } else {
            anadirClaseTeorica($conexion, $_REQUEST['num_alum'], $_REQUEST['fecha'], $_REQUEST['num_test'], $_REQUEST['num_fallos']);
            header("Location: ../ficha_alumno.php?id_alumno=" . $_REQUEST['num_alum']);
        }
    } else {
        header("Location: ../index.php");
    }
?>