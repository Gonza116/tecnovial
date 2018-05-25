<?php
    session_start();
    require_once("utiles/gestionDB.php");
    require_once("utiles/gestionarAlumnos.php");
    require_once("utiles/gestionarCoches.php");

    $conexion = crearConexionBD();
    $id_coche = $_REQUEST['id_coche'];
    $clases_coche = consultarPracticasCoche($conexion, $id_coche);
    $coches = consultarCoches($conexion);
    $coche = null;
    foreach($coches as $c){
        if($c['NUM_COCHE'] == $id_coche){
            $coche = $c;
        }
    }

    if(isset($_REQUEST['fecha_nueva_itv'])){
        actualizarITV($conexion, $id_coche, $_REQUEST['fecha_nueva_itv']);
        header("Location: ficha_coche.php?id_coche=" . $id_coche);
    }

    if(isset($_REQUEST['fecha_nuevo_repostaje'])){
        actualizarRepostaje($conexion, $id_coche, $_REQUEST['fecha_nuevo_repostaje']);
        header("Location: ficha_coche.php?id_coche=" . $id_coche);
    }
?>

<!DOCTYPE html>
<html lang="es">
<header>
    <meta charset="utf-8">
    <title>Tecnovial: Viendo coche</title>
</header>
<body>
    <h1>Información del coche</h1>
    <fieldset>
        <legend>Última ITV</legend>
        <p><strong>Fecha: </strong> <?php echo $coche['ULTIMA_ITV'] ?></p>
        <p><strong>Fecha de la nueva ITV:</strong>
            <form action="ficha_coche.php">
                <input type="number" name="id_coche" value="<?php echo $id_coche ?>" hidden />
                <input type="date" name="fecha_nueva_itv" />
                <input type="submit" value="Actualizar fecha" />
            </form>
        </p>
    </fieldset>
    <fieldset>
        <legend>Último repostaje</legend>
        <p><strong>Fecha: </strong> <?php echo $coche['ULTIMO_REPOSTAJE'] ?></p>
        <p><strong>Fecha del nuevo repostaje:</strong>
            <form action="ficha_coche.php">
                <input type="number" name="id_coche" value="<?php echo $id_coche ?>" hidden />
                <input type="date" name="fecha_nuevo_repostaje" />
                <input type="submit" value="Actualizar fecha" />
            </form>
        </p>
    </fieldset>
    <fieldset>
        <legend>Kilometraje total</legend>
        <p><strong>Kilómetros totales: </strong> <?php echo $coche['KMS'] ?> kilómetros</p>
        <p><strong>Desglose: </strong></p>
        <table>
            <tr>
                <th>Fecha</th>
                <th>Kilómetros</th>
            </tr>
            <?php foreach($clases_coche as $cp){ ?>
            <tr>
                <td><?php echo $cp['FECHA'] ?></td>
                <td><?php echo $cp['KMS_CLASE'] ?></td>
            </tr>
            <?php } ?>
        </table>
    </fieldset>
</body>
</html>