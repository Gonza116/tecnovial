<?php

    session_start();

    require_once("utiles/gestionarProfesores.php");
    require_once("utiles/gestionDB.php");
    
    $conexion = crearConexionBD();
    $login_try = false;
    $profesores = consultarProfesores($conexion);
    if(isset($_REQUEST["profesor_id"])){
        $login_try = true;
        $profesor_id = $_REQUEST["profesor_id"];
        if(isset($_REQUEST['profesor_pass'])){
            $pass = $_REQUEST['profesor_pass'];
    }}
    if(isset($_SESSION['profesor_logueado'])){
        if($_SESSION['profesor_logueado']){
            header("Location: lista_alumnos.php");
        }
    } else {
        $_SESSION['profesor_logueado'] = false;
    }

    if(isset($_REQUEST['admin-wanna-log'])){
        $admintry = true;
        $_SESSION['admin_try'] = true;
    } else if (isset($_SESSION['admin_try'])) {
        $admintry = $_SESSION['admin_try'];
    } else {
        $admintry = false;
    }

    $adminfail = false;
    $adminok = false;
    if(isset($_REQUEST['adminpass'])){
        if($_REQUEST['adminpass'] == "admin"){
            $adminok = true;
            $_SESSION['admin_log'] = true;
        } else {
            $adminfail = true;
        }
        unset($_REQUEST['adminpass']);
    } else if(isset($_SESSION['admin_log'])){
        $adminok =  $_SESSION['admin_log'];
    }

    if(isset($_REQUEST['borrar_prof'])){
        borrarProfesor($conexion, $_REQUEST['borrar_prof_id']);
        header("Location: index.php");
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Tecnovial</title>
    <meta charset="utf-8">
    <script src="js/validacion-profesor.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="./css/index_admin.css">
    <link rel="stylesheet" type="text/css" href="./css/index_notadmin.css">
</head>
<body>
    
    <?php 
    foreach($profesores as $profesor){ 
    ?> 
    <div id="profes_pass">
    <form action="index.php" method="post">
        <p><?php echo $profesor['APELLIDOS'] ?>, <?php echo $profesor['NOMBRE'] ?></p>
        <input type="number" value="<?php echo $profesor['NUM_PROF'] ?>" name="profesor_id" hidden>
        <input type="text" value="<?php echo $profesor['NOMBRE'] ?>" name="profesor_nombre" hidden>
        <input type="text" value="<?php echo $profesor['APELLIDOS'] ?>" name="profesor_apellidos" hidden>
        <?php if($login_try){
                if($profesor['NUM_PROF'] == $profesor_id){
                    if(isset($pass)){
                        if($pass == $profesor['PASS']){
                            $profesor_con['nombre'] = $_REQUEST['profesor_nombre'];
                            $profesor_con['apellidos'] = $_REQUEST['profesor_apellidos'];
                            $profesor_con['id'] = $profesor_id;
                            $profesor_con['pass'] = $pass;
                            $_SESSION['profesor'] = $profesor_con;
                            $_SESSION['profesor_nombre']=$_REQUEST['profesor_nombre'];
                            $_SESSION['profesor_logueado'] = true;
                            Header("Location: lista_alumnos.php");
                        } else{
        ?> 
                <p><b>Contraseña incorrecta.</b></p>
        <?php
                        }
                    } else{
                    ?>
                <p>Contraseña: <input type="password" name="profesor_pass" id="profesor_pass" required
                placeholder="Mínimo 8 caracteres entre letras y dígitos" oninput="passwordValidation();"></p>
                <?php }}} ?>
        <input id="log_b" type="submit" value="Log-in"><br>
        <?php if($adminok){ ?>
    
        <form action="index.php" method="get">
            <input type="text" name="borrar_prof_id" value="<?php echo $profesor['NUM_PROF'] ?>" hidden>
            <input id="del_b" type="submit" name="borrar_prof" value="Borrar profesor">
        </form>
    <?php } ?>
    </form></div><br>
    <?php } ?>
    <?php if($adminok){ ?>
    <div id="anadir_prof">
    <a href="anadir/anadir_profesor.php">+ Añadir profesor</a><br>
    <a href="utiles/cerrarsesion.php">Abandonar modo admin</a>
        </div>
    <?php } ?>
    <?php if(!$admintry) { ?>
    <form action="index.php" method="post">
        <div id="log_ad">
        <input id="log_b" type="submit" name="admin-wanna-log" value="Log-in como admin"></div>
    </form>
    <?php } else if (!$adminok) { ?>
    
    <form action="index.php" method="post">
        <div  id="cod_ad">
        <p>Código de administrador: <br><input type="password" name="adminpass"><br><br><input id="log_b" type="submit" value="Enviar"></p>
        <?php if($adminfail){ ?>
        <p><strong>Código incorrecto</strong></p>
        <?php } ?></div>
    </form>
        
    <?php } ?>
</body>
</html>