<?php
session_start();
include_once("../utiles/gestionarProductos.php");
include_once("../utiles/gestionDB.php");
$conexion = crearConexionBD();
if(isset($_REQUEST['id_prod'])){
    if(trim($_REQUEST['id_prod'], " ") == ""){
        $error['producto'] = "El id del producto no puede estar vacío";
        $error['donde'] = "<strong>El error ha ocurrido haciendo un producto obsoleto</strong>";
        header("Location: ../gestion_autoescuela.php");
    } else {
        hacerObsoleto($conexion, $_REQUEST['id_prod']);
        header("Location: ../gestion_autoescuela.php");
    }
} else {
    header("Location: ../index.php");
}
?>