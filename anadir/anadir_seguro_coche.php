<?php
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');
    require_once('../utiles/gestionarCoches.php');

    $conexion = crearConexionBD();
    $coches = consultarCoches($conexion);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Tecnovial: Añadiendo cobro seguro</title>
    <meta charset="utf-8" />
    <script src="../js/validacion_seguro_coche.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/formularios.css">
</head>
<body id="formulario">
    <h1>Añadiendo nuevo cobro de seguro del coche</h1>
    <form action="../acciones/accion_anadir_seguro_coche.php" onsubmit="return validarFormulario();">
        <p>Coche:
            <select name='num_coche'>
                <?php foreach($coches as $c){ ?>
                <option value="<?php echo $c['NUM_COCHE'] ?>"><?php echo $c['MATRICULA'] ?></option>
                <?php } ?>
            </select>
        </p>
        <p>Fecha del cobro: <input type="date" name="fecha_contratacion" /></p>
        <p>Fecha de entrada en vigor: <input type="date" name="fecha" /></p>
        <p>Fecha de vencimiento: <input type="date" name="fecha_vencimiento" /></p>
        <p>Precio anual del seguro: <input type="text" name="coste" id="coste" /></p> <div id="div_coste"></div>
        <p><input type="submit" value="Añadir" /> <input type="reset" value="Limpiar" /></p>
    </form>
</body>
</html>