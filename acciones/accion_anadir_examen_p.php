<?php
    session_start();
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarAlumnos.php");

    $conexion = crearConexionBD();

    function getAge($then, $cump) {
    $then = date('Ymd', strtotime($then));
    $cump = date('Ymd', strtotime($cump));
    $diff = $then - $cump;
    return substr($diff, 0, -4);
    }

    if(isset($_REQUEST['id'])){
        $alumno = consultaAlumno($conexion, $_REQUEST['id']);
        $cump = $alumno['FECHA_NAC'];
        if(trim($_REQUEST['id'], " ") == ""){
            $error['id'] = "El id del alumno no puede estar vacío";
        }
        if(trim($_REQUEST['fecha_ex_p'], " ") == ""){
            $error['fecha'] = "La fecha del examen no puede estar vacía";
        }
        if(getAge($_REQUEST['fecha_ex_p'], $cump) < 18){
            $error['edad'] = "El alumno no puede ser menor de edad en la fecha del examen";
        }
        if(isset($error)){
            $error['donde'] = "El error ha ocurrido en el formulario para añadir un nuevo examen práctico";
            $_SESSION['error'] = $error;
            header("Location: ../lista_alumnos.php");
        } else {
            anadirExamenPractico($conexion, $_REQUEST['id'], $_REQUEST['fecha_ex_p']);
            header("Location: ../ficha_alumno.php?id_alumno=" . $_REQUEST['id']);
        }
    } else {
        header("Location: ../index.php");
    }
?>