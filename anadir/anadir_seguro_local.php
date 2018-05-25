<?php
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');

    $conexion = crearConexionBD();

?>
<!DOCTYPE html>
<html>
<head>
    <title>Tecnovial: Añadiendo cobro seguro</title>
    <meta charset="utf-8" />
    <script src="../js/validacion_seguro_local.js"></script>
</head>
<body>
    <h1>Añadiendo nuevo cobro de seguro del local</h1>
    <form action="../acciones/accion_anadir_seguro_local.php" onsubmit="return validarFormulario();">
        <p>Fecha del cobro: <input type="date" name="fecha" required /></p>
        <p>Fecha de renovacion: <input type="date" name="fecha_renovacion" required/></p>
        <p>Precio del seguro: <input type="text" name="coste" id="costeSeguroLocal" required/></p>
        <p><input type="submit" value="Añadir" /> <input type="reset" value="Limpiar" /></p>
    </form>
</body>
</html>