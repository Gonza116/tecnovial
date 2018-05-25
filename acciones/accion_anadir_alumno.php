<?php
    
    session_start();

    require_once("../utiles/gestionarAlumnos.php");
    require_once("../utiles/gestionDB.php");

    $conexion = crearConexionBD();

    $dnis = consultarDNIs($conexion);

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
    foreach($dnis as $dni){
        if($_REQUEST['alum_DNI'] == $dni[0]){
            $error['dni_rep'] = "Ya existe un alumno con ese DNI";
        }
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
    if(isset($_REQUEST['alum_telefono'])){
        $tlf = trim($_REQUEST['alum_telefono'], " ");
        $len = strlen($tlf);
        if($len < 9 || $len > 14){
            $error['telefono'] = 'El formato de teléfono no es correcto';
        }
    }

    if(isset($error)){
        $_SESSION['error'] = $error;
        $nuevoAlumno['nombre'] = $_REQUEST['alum_nombre'];
        $nuevoAlumno['apellidos'] = $_REQUEST['alum_apellidos'];
        $nuevoAlumno['DNI'] = $_REQUEST['alum_DNI'];
        $nuevoAlumno['fecha_nac'] = $_REQUEST['alum_fecha_nac'];
        $nuevoAlumno['fecha_mat'] = $_REQUEST['alum_fecha_mat'];
        $nuevoAlumno['telefono'] = $_REQUEST['alum_telefono'];
        $nuevoAlumno['rest'] = $_REQUEST['alum_rest'];
        $nuevoAlumno['estudios'] = $_REQUEST['alum_estudios'];
        $nuevoAlumno['domicilio'] = $_REQUEST['alum_domicilio'];
        $nuevoAlumno['opor'] = $_REQUEST['alum_opor'];
        $nuevoAlumno['amigo'] = $_REQUEST['alum_amigo'];
        $_SESSION['alumno_mal'] = $nuevoAlumno;
        
        header("Location: ../anadir/anadir_alumno.php");
    } else {
        $nuevoAlumno['nombre'] = $_REQUEST['alum_nombre'];
        $nuevoAlumno['apellidos'] = $_REQUEST['alum_apellidos'];
        $nuevoAlumno['DNI'] = $_REQUEST['alum_DNI'];
        $nuevoAlumno['fecha_nac'] = getFechaFormateada($_REQUEST['alum_fecha_nac']);
        $nuevoAlumno['fecha_mat'] = isset($_REQUEST['alum_fecha_mat'])? getFechaFormateada($_REQUEST['alum_fecha_mat']) : date(d/m/Y);
        $nuevoAlumno['telefono'] = isset($tlf)? $tlf : null;
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