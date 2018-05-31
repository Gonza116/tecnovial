<?php

    session_start();

    $hayErrores = false;
    if(isset($_SESSION['error'])){
        $error = $_SESSION['error'];
        $hayErrores = true;
        unset($_SESSION['error']);
    }

    $error_sesion = false;
    if(isset($_SESSION['coche_mal'])){
        $error_sesion = true;
        $coche_mal = $_SESSION['coche_mal'];
        unset($_SESSION['coche_mal']);
    }

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Tecnovial: Añadiendo nuevo coche</title>
    <meta charset="utf-8">
    <script src="../js/validacion_coche.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/formularios.css">
</head>
<body id="formulario">
    <h1>Añadir nuevo coche</h1>
    <?php if($hayErrores){ ?>
    <fieldset>
        <legend>Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } 
    
    if($error_sesion){ ?>
        <fieldset>
        <form action="../acciones/accion_anadir_coche.php" onsubmit="return validarFormulario();">
            
                Matrícula: <input type="text" name="matricula" id="matricula" value="<?php echo $coche_mal['matricula'] ?>"/> <div id="div_matricula"></div>
                Kilometraje: <input type="number" name="kms" value="<?php echo $coche_mal['kms'] ?>" /><br>
                Último repostaje: <input type="date" name="repostaje" value="<?php echo $coche_mal['repostaje'] ?>" /><br>
                Última ITV: <input type="date" name="itv" value="<?php echo $coche_mal['itv'] ?>" /><br>
                <input type="submit" value="Añadir" />
            
        </form>
    </fieldset>
    <?php } else { ?>
        <fieldset>
        <form action="../acciones/accion_anadir_coche.php" onsubmit="return validarFormulario();">
 
                Matrícula: <input type="text" name="matricula"id="matricula" /> <div id="div_matricula"></div>
                Kilometraje: <input type="number" name="kms" value="0" /><br>
                Último repostaje: <input type="date" name="repostaje" /><br>
                Última ITV: <input type="date" name="itv" /><br>
                <input type="submit" value="Añadir" />
  
        </form>
    </fieldset>  
    <?php } ?>
</body>
</html>