<?php

function getFechaFormateada($fecha){
       $fechaFormat = date('d/m/Y', strtotime($fecha));
       return $fechaFormat;
} 

function consultarAlumnos($conexion) {
    try{
        $consulta = "SELECT * FROM ALUMNOS";
        return $conexion->query($consulta);
    } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function nuevoAlumno($conexion,$nuevoAlumno) {
	try {
		$stmt=$conexion->prepare('CALL ANADIR_ALUMNO(:dni, :fecha_nac, :nombre, :apellidos, :fecha_mat, :telefono, :rest, :estudios, :domicilio, :opor, :amigo)');
		$stmt->bindParam(':dni',$nuevoAlumno['DNI']);
        $stmt->bindParam(':fecha_nac',$nuevoAlumno['fecha_nac']);
        $stmt->bindParam(':nombre',$nuevoAlumno['nombre']);
        $stmt->bindParam(':apellidos',$nuevoAlumno['apellidos']);
        $stmt->bindParam(':fecha_mat',$nuevoAlumno['fecha_mat']);
        $stmt->bindParam(':telefono',$nuevoAlumno['telefono']);
        $stmt->bindParam(':rest',$nuevoAlumno['rest']);
        $stmt->bindParam(':estudios',$nuevoAlumno['estudios']);
        $stmt->bindParam(':domicilio',$nuevoAlumno['domicilio']);
        $stmt->bindParam(':opor',$nuevoAlumno['opor']);
        $stmt->bindParam(':amigo',$nuevoAlumno['amigo']);
        
		$stmt->execute();
		return "";
	} catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultaAlumno($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT * FROM ALUMNOS WHERE NUM_ALUM = :id");
        $stmt->bindParam(":id", $id);
        $stmt->execute();
        return $stmt->fetch();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarAlumnosSinTasas($conexion) {
    try{
        $consulta = "SELECT * FROM ALUMNOS WHERE OPORTUNIDADES = 0 OR CAD_TASAS < SYSDATE";
        return $conexion->query($consulta);
    } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}


function consultaPracticasPorHacerAlumno($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT * FROM CLASE_PRACTICA WHERE (NUM_ALUM = :id AND VALORACION IS NULL)");
        $stmt->bindParam(':id',$id);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultaPracticasAlumno($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT * FROM CLASE_PRACTICA WHERE (NUM_ALUM = :id AND VALORACION IS NOT NULL)");
        $stmt->bindParam(':id',$id);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultaPracticasPagadasAlumno($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT COUNT(*) AS TOTAL FROM CLASE_PRACTICA WHERE NUM_ALUM = :id");
        $stmt->bindParam(':id',$id);
        $stmt->execute();
        $result = $stmt->fetch();
		$total = $result['TOTAL'];
		return  $total;
	 } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
} 

function anadirClasePractica($conexion, $id_alum, $id_prof, $id_coche, $fecha, $reciclaje){
    $fechaFormateada = getFechaFormateada($fecha);
    try {
		$stmt=$conexion->prepare('CALL ANADIR_CLASE_PRACTICA(:id_alum, :id_prof, :id_coche, :fecha, :reciclaje)');
		$stmt->bindParam(':id_alum',$id_alum);
        $stmt->bindParam(':id_prof',$id_prof);
        $stmt->bindParam(':id_coche',$id_coche);
        $stmt->bindParam(':fecha',$fechaFormateada);
        $stmt->bindParam(':reciclaje',$reciclaje);
		$stmt->execute();
		return "";
	 } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function anadirValoracion($conexion, $id_alum, $id_clase, $id_coche, $valoracion, $kms, $incidencia){
    try {
		$stmt=$conexion->prepare('CALL ANADIR_VALORACION(:id_alum, :id_clase, :valoracion, :id_coche, :kms, :incidencia)');
		$stmt->bindParam(':id_alum',$id_alum);
        $stmt->bindParam(':id_clase',$id_clase);
        $stmt->bindParam(':valoracion',$valoracion);
        $stmt->bindParam(':id_coche',$id_coche);
        $stmt->bindParam(':kms',$kms);
        $stmt->bindParam(':incidencia',$incidencia);
		$stmt->execute();
		return "";
	 } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function puntosAlumno($conexion, $id_alum){
    try{
        $stmt=$conexion->prepare('SELECT SUM(VALORACION) AS SUMA FROM CLASE_PRACTICA WHERE (NUM_ALUM = :id AND VALORACION IS NOT NULL)');
        $stmt->bindParam(':id',$id_alum);
        $stmt->execute();
        $result = $stmt->fetch();
        $suma = $result['SUMA'];
        return  $suma;
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function anadirClaseTeorica($conexion, $num_alum, $fecha, $num_test, $num_fallos){
    $fechaFormat = getFechaFormateada($fecha);
    try{
        $stmt=$conexion->prepare('CALL ANADIR_TEST_T(:num_alum, :fecha, :num_test, :num_fallos)');
        $stmt->bindParam(':num_alum',$num_alum);
        $stmt->bindParam(':fecha',$fechaFormat);
        $stmt->bindParam(':num_test',$num_test);
        $stmt->bindParam(':num_fallos',$num_fallos);
        $stmt->execute();
        return "";
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarClasesTeoricas($conexion, $num_alum){
    try{
        $stmt = $conexion->prepare("SELECT * FROM TEST_TEORICO WHERE NUM_ALUM = :id");
        $stmt->bindParam(':id',$num_alum);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function anadirExamenTeorico($conexion, $id, $fecha){
    $fechaFormat = getFechaFormateada($fecha);
    try{
        $stmt=$conexion->prepare('CALL ANADIR_EXAMEN_T(:num_alum, :fecha, null)');
        $stmt->bindParam(':num_alum',$id);
        $stmt->bindParam(':fecha',$fechaFormat);
        $stmt->execute();
        return "";
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function anadirExamenPractico($conexion, $id, $fecha){
     $fechaFormat = getFechaFormateada($fecha);
    try{
        $stmt=$conexion->prepare('CALL ANADIR_EXAMEN_P(:num_alum, :fecha, null)');
        $stmt->bindParam(':num_alum',$id);
        $stmt->bindParam(':fecha',$fechaFormat);
        $stmt->execute();
        return "";
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function resultadoExamenTeorico($conexion, $id_ex, $id, $apto){
    try{
        $stmt=$conexion->prepare('CALL APTO_EXAMEN_T(:num_ex, :num_alum, :apto)');
        $stmt->bindParam(':num_ex', $id_ex);
        $stmt->bindParam(':num_alum',$id);
        $stmt->bindParam(':apto',$apto);
        $stmt->execute();
        return "";
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function resultadoExamenPractico($conexion, $id_ex, $id, $apto){
    try{
        $stmt=$conexion->prepare('CALL APTO_EXAMEN_P(:num_ex, :num_alum, :apto)');
        $stmt->bindParam(':num_ex', $id_ex);
        $stmt->bindParam(':num_alum',$id);
        $stmt->bindParam(':apto',$apto);
        $stmt->execute();
        return "";
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarExamenesTeoricosHechos($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT * FROM EXAMEN_TEORICO_DGT WHERE (NUM_ALUM = :id AND APTO IS NOT NULL)");
        $stmt->bindParam(':id',$id);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarExamenesTeoricosNoHechos($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT * FROM EXAMEN_TEORICO_DGT WHERE (NUM_ALUM = :id AND APTO IS NULL)");
        $stmt->bindParam(':id',$id);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarExamenesPracticosHechos($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT * FROM EXAMEN_PRACTICO_DGT WHERE (NUM_ALUM = :id AND APTO IS NOT NULL)");
        $stmt->bindParam(':id',$id);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarExamenesPracticosNoHechos($conexion, $id){
    try{
        $stmt = $conexion->prepare("SELECT * FROM EXAMEN_PRACTICO_DGT WHERE (NUM_ALUM = :id AND APTO IS NULL)");
        $stmt->bindParam(':id',$id);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarTodosExamenesPracticos($conexion){
    try{
        $stmt = $conexion->prepare("SELECT * FROM EXAMEN_PRACTICO_DGT NATURAL JOIN ALUMNOS WHERE APTO IS NULL");
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarTodosExamenesTeoricos($conexion){
    try{
        $stmt = $conexion->prepare("SELECT * FROM EXAMEN_TEORICO_DGT NATURAL JOIN ALUMNOS WHERE APTO IS NULL");
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function consultarTodasClasesPracticas($conexion, $id_prof){
    try{
        $stmt = $conexion->prepare("SELECT * FROM CLASE_PRACTICA NATURAL JOIN ALUMNOS NATURAL JOIN COCHES WHERE (VALORACION IS NULL AND NUM_PROF = :id_prof)");
        $stmt->bindParam(':id_prof', $id_prof);
        $stmt->execute();
        return $stmt->fetchAll();
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function darDeBaja($conexion, $id){
    try{
        $stmt = $conexion->prepare("CALL BAJA_ALUMNO(:id)");
        $stmt->bindParam(':id', $id);
        $stmt->execute();
    } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function comprobarPreparadoT($conexion, $id_alumno){
    try{
        $stmt = $conexion->prepare("CALL COMPROBAR_PREPARADO_T(:id)");
        $stmt->bindParam(":id", $id_alumno);
        $stmt->execute();
        $res = $stmt->fetch();
        return $res;
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}
    
function comprobarPreparadoP($conexion, $id_alumno){
    try{
        $stmt = $conexion->prepare("CALL COMPROBAR_PREPARADO_P(:id)");
        $stmt->bindParam(":id", $id_alumno);
        $stmt->execute();
        $res = $stmt->fetch();
        return $res;
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

function borrarAlumno($conexion, $id_alumno){
    try{
        $stmt = $conexion->prepare("DELETE FROM ALUMNOS WHERE NUM_ALUM=:id)");
        $stmt->bindParam(":id", $id_alumno);
        $stmt->execute();
        $res = $stmt->fetch();
        return $res;
     } catch(PDOException $e) {
		$_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

?>