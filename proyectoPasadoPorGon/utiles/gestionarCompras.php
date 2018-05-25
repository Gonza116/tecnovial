<?php
    require_once("gestionarAlumnos.php");

    function anadirCompra($conexion, $id_alumno, $id_producto, $fecha_compra){
        try{
            $fcompra_format = getFechaFormateada($fecha_compra);
            $stmt = $conexion->prepare("CALL ANADIR_COMPRA(:alumno, :producto, :fecha)");
            $stmt->bindParam(":alumno", $id_alumno);
            $stmt->bindParam(":producto", $id_producto);
            $stmt->bindParam(":fecha", $fcompra_format);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarTodasCompras($conexion){
        try{
            $consulta = "SELECT * FROM COMPRAS NATURAL JOIN PRODUCTOS";
            return $conexion->query($consulta);
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarComprasDeAlumno($conexion, $id_alumno){
        try{
            $consulta = "SELECT * FROM COMPRAS NATURAL JOIN PRODUCTOS WHERE NUM_ALUM = '" . $id_alumno . "'";
            return $conexion->query($consulta);
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarComprasDeProducto($conexion, $id_producto){
        try{
            $consulta = "SELECT * FROM COMPRAS WHERE COD_PROD = " . $id_producto;
            return $conexion->query($consulta);
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function anadirFactura($conexion, $id_alumno){
        try{
            $stmt = $conexion->prepare("CALL ANADIR_FACTURA(:id_alumno)");
            $stmt->bindParam(":id_alumno", $id_alumno);
            $stmt->execute();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarTodasFacturas($conexion){
        try{
            $consulta = "SELECT * FROM FACTURAS";
            return $conexion->query($consulta);
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarFacturasAlumno($conexion, $id_alumno){
        try{
            $consulta = "SELECT * FROM FACTURAS WHERE NUM_ALUM = " . $id_alumno;
            return $conexion->query($consulta);
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }
?>