<?php 
function crearConexionBD(){
	$host="oci:dbname=localhost/XE;charset=UTF8";
	$usuario="Tecnovial";
	$password="tecnovial";

	try{
		$conexion=new PDO($host,$usuario,$password,array(PDO::ATTR_PERSISTENT => true));
    	$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $conexion;
	} catch(PDOException $e) {
        $_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function cerrarConexionDB($conexion){
	$conexion=null;
}

?>