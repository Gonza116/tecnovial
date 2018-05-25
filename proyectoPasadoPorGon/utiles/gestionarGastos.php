<?php
    session_start();
    require_once('gestionarAlumnos.php');

    function consultarGastosAnyo($conexion, $anyo){
        try{
            $stmt = $conexion->prepare("select sum(coste) as coste_total from gastos where extract(YEAR from fecha) = :anio");
            $stmt->bindParam(':anio', $anyo);
            $stmt->execute();
            $res = $stmt->fetch();
            $coste_total = $res['COSTE_TOTAL'];
            return $coste_total;
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarGastosLuz($conexion){
        try{
            $stmt = $conexion->prepare("SELECT * FROM GASTOS NATURAL JOIN LUZ");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function gastoLuz($conexion, $fecha, $coste, $proximo_cobro, $gasto_kwh){
        try{
            $fechaformat = getFechaFormateada($fecha);
            $pc_format = getFechaFormateada($proximo_cobro);
            $stmt = $conexion->prepare("CALL GASTO_LUZ(:fecha, :coste, :pcobro, :gasto)");
            $stmt->bindParam(':fecha', $fechaformat);
            $stmt->bindParam(':coste', $coste);
            $stmt->bindParam(':pcobro', $pc_format);
            $stmt->bindParam(':gasto', $gasto_kwh);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarGastosCoche($conexion){
        try{
            $stmt = $conexion->prepare("SELECT * FROM GASTOS NATURAL JOIN SEGURO_COCHE NATURAL JOIN COCHES");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function gastoSeguroCoche($conexion, $coste, $fecha, $fecha_contratacion, $fecha_vencimiento, $num_coche){
        $ff_format = getFechaFormateada($fecha);
        $fc_format = getFechaFormateada($fecha_contratacion);
        $fv_format = getFechaFormateada($fecha_vencimiento);
        try{
            $stmt = $conexion->prepare("CALL GASTO_COCHE(:fecha, :coste, :fc, :fv, :nc)");
            $stmt->bindParam(':fecha', $ff_format);
            $stmt->bindParam(':coste', $coste);
            $stmt->bindParam(':fc', $fc_format);
            $stmt->bindParam(':fv', $fv_format);
            $stmt->bindParam(':nc', $num_coche);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarGastosTasas($conexion){
        try{
            $stmt = $conexion->prepare("SELECT * FROM GASTOS NATURAL JOIN TASAS NATURAL JOIN ALUMNOS");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function gastoTasas($conexion, $fecha, $coste, $fecha_abono, $num_alum){
        $ffformat = getFechaFormateada($fecha);
        $faformat = getFechaFormateada($fecha_abono);
        try{
            $stmt = $conexion->prepare("CALL GASTO_TASAS(:fecha, :coste, :fecha_abono, :num_alum)");
            $stmt->bindParam(':fecha', $ffformat);
            $stmt->bindParam(':coste', $coste);
            $stmt->bindParam(':fecha_abono', $faformat);
            $stmt->bindParam(':num_alum', $num_alum);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarGastosLocal($conexion){
        try{
            $stmt = $conexion->prepare("SELECT * FROM GASTOS NATURAL JOIN SEGURO_LOCAL");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }
   
    function gastoLocal($conexion, $fecha, $coste, $fecha_renovacion){
        try{
            $ffformat = getFechaFormateada($fecha);
            $frformat = getFechaFormateada($fecha_renovacion);
            $stmt = $conexion->prepare("CALL GASTO_LOCAL(:fecha, :coste, :renovacion)");
            $stmt->bindParam(':fecha', $ffformat);
            $stmt->bindParam(':coste', $coste);
            $stmt->bindParam(':renovacion', $frformat);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }
?>