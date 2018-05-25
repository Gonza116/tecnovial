<?php
    
    session_start();

    require_once("../utiles/gestionarProfesores.php");
    require_once("../utiles/gestionDB.php");

    $conexion = crearConexionBD();

    if(trim($_REQUEST['nuevoProfesor_nombre'], " ") == ""){
        $error['nombre'] = "El nombre del profesor no puede estar vacío";
    }

    if(trim($_REQUEST['nuevoProfesor_apellidos'], " ") == ""){
        $error['apellidos'] = "Los apellidos del profesor no puede estar vacío";
    }

    if(trim($_REQUEST['nuevoProfesor_pass'], " ") == ""){
        $error['pass'] = "La pass del profesor no puede estar vacío";
    }

    if(trim($_REQUEST['nuevoProfesor_passrep'], " ") == ""){
        $error['paasrep'] = "La repetición de pass del profesor no puede estar vacío";
    }

/*    if($_REQUEST['nuevoProfesor_nombre'] == trim($_REQUEST['nuevoProfesor_nombre'])){
        }
    if($_REQUEST['nuevoProfesor_apellidos'] == trim($_REQUEST['nuevoProfesor_apellidos'])){
        $error['apellidos'] = "Los apellidos del profesor no pueden estar vacíos";
    }
    if($_REQUEST['nuevoProfesor_pass'] == trim($_REQUEST['nuevoProfesor_pass'])){
        $error['pass'] = "La contraseña del profesor no puede estar vacía";
    }
    if($_REQUEST['nuevoProfesor_passrep'] == trim($_REQUEST['nuevoProfesor_passrep'])){
        $error['passrep'] = "El campo de repetir contraseña es obligatorio";
    }
*/    if($_REQUEST['nuevoProfesor_pass'] != $_REQUEST['nuevoProfesor_passrep']){
        $error['comprobacion_pass'] = "Las contraseñas no coinciden";
    }
    
    if(isset($error)){
        $_SESSION['error'] = $error;
        header("Location: ../anadir/anadir_profesor.php");
    } else {
        $nuevoProfesor['nombre'] = $_REQUEST['nuevoProfesor_nombre'];
        $nuevoProfesor['apellidos'] = $_REQUEST['nuevoProfesor_apellidos'];
        $nuevoProfesor['pass'] = $_REQUEST['nuevoProfesor_pass'];

        if ($nuevoProfesor['pass'] != $_REQUEST['nuevoProfesor_passrep']) {
            $_SESSION["excepcion_pass"] = true;
            header("Location: ../anadir/anadir_profesor.php");
        } else {
            nuevoProfesor($conexion, $nuevoProfesor);
            header("Location: ../index.php");
        }   
    }
?>