<?php
session_start();
include_once("../utiles/gestionarAlumnos.php");
include_once("../utiles/gestionDB.php");
$conexion = crearConexionBD();
if(isset($_REQUEST['id_clase'])){
    if(trim($_REQUEST['id_alumno'], " ") == ""){
        $error['alumno'] = "La valoración debe ser referida a un alumno";
    }
    if(trim($_REQUEST['id_clase'], " ") == ""){
        $error['clase'] = "La valoración debe ser referida a una clase";
    }
    if(trim($_REQUEST['id_coche'], " ") == ""){
        $error['coche'] = "La clase debe haberse dado en un coche";
    }
    if(trim($_REQUEST['valoracion'], " ") == ""){
        $error['valoracion'] = "La valoración no puede estar vacía";
    }
    if(trim($_REQUEST['kms'], " ") == ""){
        $error['kms'] = "los kilómetros no pueden estar vacíos";
    }
    
    if(isset($error)){
        $_SESSION['error'] = $error; 
        header("Location: ../lista_alumnos.php");
    } else{
        anadirValoracion($conexion, $_REQUEST['id_alumno'], $_REQUEST['id_clase'], $_REQUEST['id_coche'], $_REQUEST['valoracion'], $_REQUEST['kms'], $_REQUEST['incidencias']);
        header("Location: ../ficha_alumno.php?id_alumno=" . $_REQUEST['id_alumno']);
    }
} else {
    header("Location: ../index.php");
}
?>