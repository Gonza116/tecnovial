<?php
    session_start();

    if(isset($_SESSION['admin_log'])){
        if($_SESSION['admin_log']){
            
        } else {
            header("Location: ../index.php");
        }
    } else {
        header("Location: ../index.php");
    }

  /*  $fail_pass = false;
    if(isset($_SESSION["excepcion_pass"])){
        $fail_pass = $_SESSION["excepcion_pass"];
        unset($_SESSION["excepcion_pass"]);
    }   */ 
    $hayErrores = false;
    if(isset($_SESSION['error'])){
        $error = $_SESSION['error'];
        $hayErrores = true;
        unset($_SESSION['error']);
    }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Tecnovial: Creando nuevo profesor</title>
    <meta charset="utf-8">
    <script src="../js/validacion_profesor.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../css/formularios.css">
</head>

<body id="formulario">
    <h1>Añadir nuevo profesor</h1>
    <?php if($hayErrores){ ?>
    <fieldset id="errores">
        <legend id="errores">Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p id="errores"><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } ?>
    <form action="../acciones/accion_anadir_profesor.php" onsubmit="return validarFormulario();">
        <p>Nombre: <input type="text" name="nuevoProfesor_nombre" id="nuevoProfesor_nombre" required></p><div id="div_nombre"></div>
        <p>Apellidos: <input type="text" name="nuevoProfesor_apellidos" id="nuevoProfesor_apellidos" required></p><div id="div_apellidos"></div>
        <p>Contraseña: <input type="password" name="nuevoProfesor_pass" id="nuevoProfesor_pass" required placeholder="Mínimo 8 caracteres entre letras y dígitos" oninput="passwordValidation();"></p>
        <p>Repetir contraseña: <input type="password" name="nuevoProfesor_passrep" id="nuevoProfesor_passrep" required oninput="passwordConfirmation();"></p>
        <!-- php if($fail_pass){ ?>
        <p><strong>Las contraseñas no coinciden</strong></p>
        php } -->
        <input id="bot" type="submit" value="Dar de alta">
    </form>
</body>
</html>