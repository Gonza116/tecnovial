<?php
    session_start();
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');
    
    $conexion = crearConexionBD();
    if(isset($_REQUEST['fecha_contratacion'])){
        if(trim($_REQUEST['coste'], " ") == ""){
            $error['coste'] = "El coste no puede estar vacío";
        }
        if(trim($_REQUEST['fecha'], " ") == ""){
            $error['fecha'] = "La fecha del gasto no puede estar vacía";
        }
        if(trim($_REQUEST['fecha_contratacion'], " ") == ""){
            $error['fecha_contratacion'] = "La fecha de contratación del seguro no puede estar vacía";
        }
        if(trim($_REQUEST['fecha_vencimiento'], " ") == ""){
            $error['fecha_vencimiento'] = "La fecha de vencimiento del seguro no puede estar vacía";
        }
        if($_REQUEST['fecha_vencimiento'] < $_REQUEST['fecha_contratacion']){
            $error['fechas'] = "El seguro no puede vencer antes de su contratación";
        }
        if(trim($_REQUEST['num_coche'], " ") == ""){
            $error['num_coche'] = "Se tiene que seleccionar algún coche";
        }
        
        if(isset($error)){
            $error['donde'] = "<strong>El error ha ocurrido al añadir un seguro de coche</strong>";
            $_SESSION['error'] = $error;
            header("Location: ../gestion_autoescuela.php");
        } else {
            gastoSeguroCoche($conexion, $_REQUEST['coste'], $_REQUEST['fecha'], $_REQUEST['fecha_contratacion'], $_REQUEST['fecha_vencimiento'], $_REQUEST['num_coche']);
            header('Location: ../gestion_autoescuela.php'); 
        }
    } else {
        header('Location: ../index.php');
    }

?>