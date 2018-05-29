<?php
    session_start();
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarAlumnos.php");
    require_once("../utiles/gestionarCompras.php");
    $conexion = crearConexionBD();
    if(isset($_REQUEST['fecha_compra'])){
        if(trim($_REQUEST['id_alumno'], " ") == ""){
            $error['id_alumno'] = "La id del alumno no puede estar vacía";
        }
        if(trim($_REQUEST['id_producto'], " ") == ""){
            $error['id_producto'] = "La id del producto no puede estar vacío";
        }
        if(trim($_REQUEST['fecha_compra'], " ") == ""){
            $error['fecha_c'] = "La fecha de compra no puede estar vacía";
        }
        if($_REQUEST['fecha_compra'] > date("Y-m-d")){
            $error['fecha_t'] = "La fecha de compra no puede ser posterior al día de hoy";
        }
        
        if(isset($error)){
            $error['donde'] = "<strong>El error ha ocurrido en el formulario de añadir una compra</strong>";
            $_SESSION['error'] = $error;
            header("Location: ../gestion_autoescuela.php");
        } else {
            anadirCompra($conexion, $_REQUEST['id_alumno'], $_REQUEST['id_producto'], $_REQUEST['fecha_compra']);
            header("Location: ../gestion_autoescuela.php");
        }
    } else {
        header("Location: ../index.php");
    }
?>