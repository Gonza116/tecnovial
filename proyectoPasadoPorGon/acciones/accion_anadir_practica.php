<?php
require_once("../utiles/gestionDB.php");
require_once("../utiles/gestionarAlumnos.php");

$conexion = crearConexionBD();

if(isset($_REQUEST['fecha_clase'])){
    if(trim($_REQUEST['id_alumno'], " ") == ""){
        $error['alumno'] = "El id de alumno no puede estar vacío";
    }
    if(trim($_REQUEST['id_prof'], " ") == ""){
        $error['profesor'] = "El id del profesor no puede estar vacío";
    }
    if(trim($_REQUEST['id_coche'], " ") == ""){
        $error['coche'] = "El id del coche no puede estar vacío";
    }
    if(trim($_REQUEST['fecha_clase'], " ") == ""){
        $error['fecha'] = "La fecha no puede estar vacía";
    }
    if(trim($_REQUEST['reciclaje'], " ") == ""){
        $error['reciclaje'] = "La clase debe ser de reciclaje o no";
    }
    
    if(isset($error)){
        $error['donde'] = "<strong>Los errores han ocurrido en el formulario para añadir una práctica</strong>";
        $_SESSION['error'] = $error;
        header("Location: ../lista_alumnos.php");
    } else {
        anadirClasePractica($conexion, $_REQUEST['id_alumno'], $_REQUEST['id_prof'], $_REQUEST['id_coche'], $_REQUEST['fecha_clase'], $_REQUEST['reciclaje']);
        header("Location: ../ficha_alumno.php?id_alumno=" . $_REQUEST['id_alumno']);
    }
} else {
    header("Location: ../lista_alumnos.php");
}
?>