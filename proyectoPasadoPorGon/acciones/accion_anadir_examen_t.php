<?php
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarAlumnos.php");

    $conexion = crearConexionBD();

    if(isset($_REQUEST['id'])){
        if(trim($_REQUEST['id'], " ") == ""){
            $error['id'] = "El id del alumno no puede estar vacío";
        }
        if(trim($_REQUEST['fecha_ex_t'], " ") == ""){
            $error['fecha'] = "La fecha del examen no puede estar vacía";
        }
        if(isset($error)){
            $error['donde'] = "El error ha ocurrido en el formulario para añadir un nuevo examen práctico";
            $_SESSION['error'] = $error;
            header("Location: ../lista_alumnos.php");
        } else {
            anadirExamenTeorico($conexion, $_REQUEST['id'], $_REQUEST['fecha_ex_t']);
            header("Location: ../ficha_alumno.php?id_alumno=" . $_REQUEST['id']);
        }
    } else {
        header("Location: ../index.php");
    }
?>