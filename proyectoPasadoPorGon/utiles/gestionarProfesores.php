<?php

function consultarProfesores($conexion) {
    try{
        $consulta = "SELECT * FROM PROFESORES";
        return $conexion->query($consulta);
    } catch(PDOException $e) {
        $_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function passProfesor($conexion, $profesor_id) {
    try {
		$stmt=$conexion->prepare("SELECT * FROM PROFESORES WHERE num_prof = :profesor_id");
		$stmt->bindParam(":profesor_id", $profesor_id);
		$stmt->execute();
		return $stmt;
	} catch(PDOException $e) {
        $_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function nuevoProfesor($conexion,$nuevoProfesor) {
	try {
		$stmt=$conexion->prepare('CALL ANADIR_PROFESOR(:nombre, :apellidos, :pass)');
		$stmt->bindParam(':nombre',$nuevoProfesor['nombre']);
        $stmt->bindParam(':apellidos',$nuevoProfesor['apellidos']);
        $stmt->bindParam(':pass',$nuevoProfesor['pass']);
		$stmt->execute();
		return "";
	} catch(PDOException $e) {
        $_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function borrarProfesor($conexion, $id){
    try {
        $stmt=$conexion->prepare("DELETE FROM PROFESORES WHERE num_prof = :profesor_id");
        $stmt->bindParam(":profesor_id", $id);
        $stmt->execute();
        return $stmt;
    } catch(PDOException $e) {
        $_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}
?>