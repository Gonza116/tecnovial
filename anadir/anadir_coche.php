<?php

    session_start();

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
    <title>Tecnovial: Añadiendo nuevo coche</title>
    <meta charset="utf-8">
</head>
<body>
    <?php if($hayErrores){ ?>
    <fieldset>
        <legend>Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } ?>
    <fieldset>
        <legend>Añadir nuevo coche</legend>
        <form action="../acciones/accion_anadir_coche.php">
            <p>
                Matrícula: <input type="text" name="matricula" /> 
                Kilometraje: <input type="number" name="kms" value="0" />
                Último repostaje: <input type="date" name="repostaje" />
                Última ITV: <input type="date" name="itv" />
                <input type="submit" value="Añadir" />
            </p>
        </form>
    </fieldset>
</body>
</html>