<?php
    session_start();
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');
    
    $conexion = crearConexionBD();
    if(isset($_REQUEST['proximo_cobro'])){
        if(trim($_REQUEST['fecha'], " ") == ""){
            $error['fecha'] = "La fecha no puede estar vacía";
        }
        if(trim($_REQUEST['coste'], " ") == ""){
            $error['coste'] = "El coste no puede estar vacío";
        }
        if(trim($_REQUEST['proximo_cobro'], " ") == ""){
            $error['proximo_cobro'] = "La fecha de proximo cobro no puede estar vacía";
        }
        if(trim($_REQUEST['gasto_kwh'], " ") == ""){
            $error['gasto_kwh'] = "El gasto no puede estar vacío";
        }
        if(isset($error)){
            $error['donde'] = "<strong>El error ha ocurrido en el formulario para añadir una factura de luz</strong>";
            $_SESSION['error'] = $error;
             header("Location: ../gestion_autoescuela.php");
        } else {
            gastoLuz($conexion, $_REQUEST['fecha'], $_REQUEST['coste'], $_REQUEST['proximo_cobro'], $_REQUEST['gasto_kwh']);
            header('Location: ../gestion_autoescuela.php');
        }
    } else {
        header('Location: ../index.php');
    }
?>