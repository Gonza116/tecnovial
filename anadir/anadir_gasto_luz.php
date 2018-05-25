<?php
    require_once('../utiles/gestionDB.php');
    require_once('../utiles/gestionarGastos.php');

    $conexion = crearConexionBD();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Tecnovial: Añadiendo cobro luz</title>
    <meta charset="utf-8" />
    <script src = "../js/validacion_gasto_luz.js" type="text/javascript"></script>
</head>
<body>
    <h1>Añadiendo nuevo cobro de luz</h1>
    <form action="../acciones/accion_anadir_gasto_luz.php" onsubmit="return validarFormulario()">
        <p>Fecha del cobro: <input type="date" name="fecha" id="fecha" required/></p>
        <p>Fecha del proximo cobro: <input type="date" name="proximo_cobro" id="proximo_cobro" required/></p>
        <p>Coste: <input type="text" name="coste" id="coste" required/></p> <div id="div_coste"></div>
        <p>Gasto en kWh: <input type="text" name="gasto_kwh" id="gasto_kwh" required/></p><div id="div_gasto_kwh"></div>
        <p><input type="submit" value="Añadir" /> <input type="reset" value="Limpiar" /></p>
    </form>
</body>
</html>