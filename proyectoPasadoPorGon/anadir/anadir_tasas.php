<?php
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');
    require_once('../utiles/gestionarAlumnos.php');

    $conexion = crearConexionBD();
    $alumnos = consultarAlumnosSinTasas($conexion);

    $hayErrores = false;
    if(isset($_SESSION['error'])){
        $error = $_SESSION['error'];
        $hayErrores = true;
        unset($_SESSION['error']);
    }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Tecnovial: Añadiendo tasas</title>
    <meta charset="utf-8" />
    <script src="../js/validacion_tasas.js"></script>
</head>
<body>
    <h1>Añadiendo nuevas tasas</h1>
    <?php if($hayErrores){ ?>
    <fieldset>
        <legend>Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } ?>
    <form action="../acciones/accion_anadir_tasas.php" onsubmit="return validarFormulario();">
        <p>Alumnos:
            <select name='num_alum'>
                <?php foreach($alumnos as $a){ ?>
                <option value="<?php echo $a['NUM_ALUM'] ?>"><?php echo $a['APELLIDOS'] . ", " . $a['NOMBRE'] ?></option>
                <?php } ?>
            </select>
        </p>
        <p>Fecha del cobro: <input type="date" name="fecha" required /></p>
        <p>Precio de las tasas: <input type="text" name="coste" id="coste_tasas" required/></p>
        <p><input type="submit" value="Añadir" /> <input type="reset" value="Limpiar" /></p>
    </form>
</body>
</html>