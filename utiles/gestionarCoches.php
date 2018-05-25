<?php
    require_once('gestionarAlumnos.php');

    function consultarCoches($conexion) {
        try{
            $consulta = "SELECT * FROM COCHES";
            return $conexion->query($consulta);
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function anadirCoche($conexion, $matricula, $itv, $kms, $repostaje){
        try{
            $itv_format = getFechaFormateada($itv);
            $repostaje_format = getFechaFormateada($repostaje);
            $stmt = $conexion->prepare("CALL ANADIR_COCHE(:matricula, :itv, :kms, :repo)");
            $stmt->bindParam(':matricula', $matricula);
            $stmt->bindParam(':itv', $itv_format);
            $stmt->bindParam('kms', $kms);
            $stmt->bindParam(':repo', $repostaje_format);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function actualizarRepostaje($conexion, $id_coche, $repostaje){
        try{
            $repostaje_format = getFechaFormateada($repostaje);
            $stmt = $conexion->prepare("CALL ACTUALIZAR_REPOSTAJE(:id, :repo)");
            $stmt->bindParam(':id', $id_coche);
            $stmt->bindParam(':repo', $repostaje_format);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function actualizarITV($conexion, $id_coche, $itv){
        try{
            $itv_format = getFechaFormateada($itv);
            $ultima_itv_antes = ultimaITV($conexion, $id_coche);
            $stmt = $conexion->prepare("CALL ACTUALIZAR_ITV(:id, :itv)");
            $stmt->bindParam(':id', $id_coche);
            $stmt->bindParam(':itv', $itv_format);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            return $e->getMessage();
        }
    }

    function actualizarKMS($conexion, $id_coche, $kms){
        try{
            $stmt = $conexion->prepare("CALL ACTUALIZAR_KMS(:coche, :kms)");
            $stmt->bindParam(":coche", $id_coche);
            $stmt->bindParam(":kms", $kms);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarPracticasCoche($conexion, $id_coche){
        try{
            $consulta = "SELECT * FROM CLASE_PRACTICA WHERE (NUM_COCHE = " . $id_coche . " AND KMS_CLASE IS NOT NULL) ORDER BY FECHA";
            return $conexion->query($consulta);
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarCoche($conexion, $id_coche){
        try{
            $consulta = "SELECT * FROM COCHES WHERE NUM_COCHE = " . $id_coche;
            return $conexion->query($consulta);
            //$stmt = $conexion->prepare("SELECT * FROM COCHES WHERE NUM_COCHE = :id_coche");
            //$stmt->bindParam(":id_coche", $id_coche);
            //$stmt->execute();
            //return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function ultimaITV($conexion, $id_coche){
        try{
            //$consulta = "SELECT ULTIMA_ITV FROM COCHES WHERE NUM_COCHE = " . $id_coche;
            //return $conexion->query($consulta);
            $stmt = $conexion->prepare("SELECT ULTIMA_ITV FROM COCHES WHERE NUM_COCHE = :id_coche");
            $stmt->bindParam(":id_coche", $id_coche);
            $stmt->execute();
            return $stmt->fetch();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function borrarCoche($conexion, $id_coche){
    try{
        $stmt = $conexion->prepare("DELETE FROM COCHES WHERE NUM_COCHE=:id)");
        $stmt->bindParam(":id", $id_coche);
        $stmt->execute();
        $res = $stmt->fetch();
        return $res;
    } catch(PDOException $e) {
        $_SESSION['excepcion'] = $e->getMessage();
        header("Location: excepcion.php");
    }
}

?>
