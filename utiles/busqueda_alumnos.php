<?php
    session_start();
    require_once("gestionDB.php");
    $conexion = crearConexionBD();

    $query = "SELECT * FROM ALUMNOS WHERE ";
    $nombreset = false;
    $apellidoset = false;
    $dniset = false;
    if($_REQUEST["buscarnombre"] <> ""){
        $query .= "(NOMBRE = :nombre";
        $nombreset = true;
    }
    if($_REQUEST["buscarapellido"] <> ""){
        if($nombreset){
            $query .= " AND APELLIDOS = :apellidos";
        } else {
            $query .= "(APELLIDOS = :apellidos";
        }
        $apellidoset = true;
    }
    if($_REQUEST["buscardni"] <> ""){
        if($nombreset || $apellidoset){
            $query .= " AND DNI = :dni";
        } else {
            $query .= "(DNI = :dni";
        }
        $dniset = true;
    }
    $query .= ")";
    if(!($nombreset || $dniset || $apellidoset)){
        Header("Location: ../lista_alumnos.php");
    } else {
        $_SESSION['alumnos_buscados'] = buscaAlumnos($conexion, $query, $nombreset, $apellidoset, $dniset);
        header("Location: ../lista_alumnos.php");
    }

    function buscaAlumnos($conexion, $query, $nombreset, $apellidoset, $dniset){
    $stmt = $conexion->prepare($query);
    if($nombreset){
        $stmt->bindParam(':nombre' ,$_REQUEST["buscarnombre"]);
    }
    if($apellidoset){
        $stmt->bindParam(':apellidos' ,$_REQUEST["buscarapellido"]);
    }
    if($dniset){
        $stmt->bindParam(':dni' ,$_REQUEST["buscardni"]);
    }
    $stmt->execute();
    return $stmt->fetchAll();
}
?>