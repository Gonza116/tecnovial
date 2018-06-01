<?php
    session_start();
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarAlumnos.php");

    $conexion = crearConexionBD();

    function getAge($then, $cump) {
        $fecha_ex = DateTime::createFromFormat('Y-m-d', $then);
        $fecha_cu = DateTime::createFromFormat('d/m/y', $cump);
        $diff = $fecha_ex->diff($fecha_cu);

        return $diff->y;

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
        if(DateTime::createFromFormat('d/m/y', $alumno['CAD_TASAS']) < DateTime::createFromFormat('Y-m-d', $_REQUEST['fecha_ex_p'])){
            $error['tasas'] = "El alumno no puede tener las tasas caducadas el día del examen";
        }
        if($alumno['OPORTUNIDADES'] <= 0){
            $error['opor'] = "El alumno no puede hacer un examen si no le quedan oportunidades";
        }
        if(isset($error)){
            $error['donde'] = "<strong>El error ha ocurrido en el formulario para añadir un nuevo examen práctico</strong>";
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