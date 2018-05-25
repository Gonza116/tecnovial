<?php
    
    session_start();

    require_once("../utiles/gestionarAlumnos.php");
    require_once("../utiles/gestionDB.php");

    $conexion = crearConexionBD();

    if(trim($_REQUEST['alum_nombre'], " ") == ""){
        $error['nombre'] = "El nombre del alumno no puede estar vacío";
    }
    if(trim($_REQUEST['alum_apellidos'], " ") == ""){
        $error['apellidos'] = "Los apellidos del alumno no pueden estar vacíos";
    }
    if(trim($_REQUEST['alum_DNI'], " ") == ""){
        $error['dni_vacio'] = "El DNI del alumno no puede estar vacío";
    }
    if(!preg_match("/^\d{8}[a-zA-Z]$/", $_REQUEST['alum_DNI'])){
        $error['dni_formato'] = "El formato del DNI es inválido";
    }
    if(trim($_REQUEST['alum_fecha_mat'], " ") < $_REQUEST['alum_fecha_nac']){
        $error['fechas'] = "La fecha de matriculación no puede ser anterior a la de nacimiento";
    }
    if(trim($_REQUEST['alum_estudios'], " ") == ""){
        $error['estudios'] = "Los estudios del alumno no pueden estar vacíos";
    }
    if(trim($_REQUEST['alum_fecha_nac'], " ") == ""){
        $error['fecha_nac'] = "La fecha de nacimiento no puede estar vacía";
    }
    if(trim($_REQUEST['alum_domicilio'], " ") == ""){
        $error['domicilio'] = "El domicilio no puede estar vacío";
    }

    if(isset($error)){
        $_SESSION['error'] = $error;
        header("Location: ../anadir/anadir_alumno.php");
    } else {
        $nuevoAlumno['nombre'] = $_REQUEST['alum_nombre'];
        $nuevoAlumno['apellidos'] = $_REQUEST['alum_apellidos'];
        $nuevoAlumno['DNI'] = $_REQUEST['alum_DNI'];
        $nuevoAlumno['fecha_nac'] = getFechaFormateada($_REQUEST['alum_fecha_nac']);
        $nuevoAlumno['fecha_mat'] = isset($_REQUEST['alum_fecha_mat'])? getFechaFormateada($_REQUEST['alum_fecha_mat']) : date(d/m/Y);
        $nuevoAlumno['telefono'] = isset($_REQUEST['alum_telefono'])? $_REQUEST['alum_telefono'] : null;
        $nuevoAlumno['rest'] = isset($_REQUEST['alum_rest'])? $_REQUEST['alum_rest'] : null;
        $nuevoAlumno['estudios'] = $_REQUEST['alum_estudios'];
        $nuevoAlumno['domicilio'] = $_REQUEST['alum_domicilio'];
        $nuevoAlumno['opor'] = $_REQUEST['alum_opor'];
        $nuevoAlumno['amigo'] = isset($_REQUEST['alum_amigo'])? $_REQUEST['alum_amigo'] : null;  

        $excepcion = nuevoAlumno($conexion, $nuevoAlumno);
        if ($excepcion<>"") {
                $_SESSION["excepcion"] = $excepcion;
                $_SESSION["destino"] = "index.php";
                echo 'Ha ocurrido un error añadiendo el profesor';
                echo $excepcion;
        } else Header("Location: ../lista_alumnos.php");
    }

    
?>