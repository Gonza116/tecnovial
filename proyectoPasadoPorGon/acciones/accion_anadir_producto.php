<?php
session_start();
include_once("../utiles/gestionarProductos.php");
include_once("../utiles/gestionDB.php");
$conexion = crearConexionBD();
if(isset($_REQUEST['nombre_prod'])){
    if(trim($_REQUEST['nombre_prod'], " ") == ""){
        $error['nombre'] = "El nombre del producto no puede estar vacío";
    }
    if(trim($_REQUEST['precio_prod'], " ") == ""){
        $error['precio'] = "El precio del producto no puede estar vacío";
    }
    
    if(isset($error)){
        $error['donde'] = "<strong>El error ha ocurrido en el formulario para añadir un nuevo producto</strong>";
        $_SESSION['error'] = $error;
        header("Location: ../gestion_autoescuela.php");
    } else {
        anadirProducto($conexion, $_REQUEST['nombre_prod'], $_REQUEST['precio_prod']);
        header("Location: ../gestion_autoescuela.php");   
    }
} else {
    header("Location: ../index.php");
}
?>