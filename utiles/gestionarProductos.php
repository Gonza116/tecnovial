<?php
    function consultarProductosActivos($conexion){
        try{
            $stmt = $conexion->prepare("SELECT * FROM PRODUCTOS WHERE OBSOLETO = 'NO'");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function consultarProductosObsoletos($conexion){
        try{
            $stmt = $conexion->prepare("SELECT * FROM PRODUCTOS WHERE OBSOLETO = 'SI'");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function hacerObsoleto($conexion, $id_prod){
        try{
            $stmt = $conexion->prepare("UPDATE PRODUCTOS SET OBSOLETO = 'SI' WHERE COD_PROD = :id_prod");
            $stmt->bindParam("id_prod", $id_prod);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function hacerActivo($conexion, $id_prod){
        try{
            $stmt = $conexion->prepare("UPDATE PRODUCTOS SET OBSOLETO = 'NO' WHERE COD_PROD = :id_prod");
            $stmt->bindParam("id_prod", $id_prod);
            $stmt->execute();
            return "";
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }

    function anadirProducto($conexion, $nombre_prod, $precio_prod){
        try{
            $stmt = $conexion->prepare("CALL ANADIR_PRODUCTO(:nombre, :precio)");
            $stmt->bindParam(":nombre", $nombre_prod);
            $stmt->bindParam(":precio", $precio_prod);
            $stmt->execute();
            return "";
        } catch(PDOException $e) {
            $_SESSION['excepcion'] = $e->getMessage();
            header("Location: excepcion.php");
        }
    }
?>