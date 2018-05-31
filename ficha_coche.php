<?php
    session_start();
    require_once("utiles/gestionDB.php");
    require_once("utiles/gestionarAlumnos.php");
    require_once("utiles/gestionarCoches.php");

    $conexion = crearConexionBD();
    $id_coche = $_REQUEST['id_coche'];

    if(!isset($id_coche)){
        header("Location: index.php");
    }

    $clases_coche = consultarPracticasCoche($conexion, $id_coche);
    $coches = consultarCoches($conexion);
    $coche = null;
    foreach($coches as $c){
        if($c['NUM_COCHE'] == $id_coche){
            $coche = $c;
        }
    }

    if(isset($_REQUEST['fecha_nueva_itv'])){
        $e_itv = actualizarITV($conexion, $id_coche, $_REQUEST['fecha_nueva_itv']);
        if($e_itv != ""){
            echo "<p>" . $e_itv . "</p>";  
        } else {
            header("Location: ficha_coche.php?id_coche=" . $id_coche);
        }
    }

    if(isset($_REQUEST['fecha_nuevo_repostaje'])){
        $e_rep = actualizarRepostaje($conexion, $id_coche, $_REQUEST['fecha_nuevo_repostaje']);
        if($e_rep != ""){
            echo "<p>" . $e_rep . "</p>";  
        } else {
            header("Location: ficha_coche.php?id_coche=" . $id_coche);
        }
    }
?>

<!DOCTYPE html>
<html lang="es">
<header>
    <meta charset="utf-8">
    <script src="js/notificaciones.js" type="text/javascript">
    </script>
    <link rel="stylesheet" type="text/css" href="./css/ficha_coche.css">
    <title>Tecnovial: Viendo coche</title>
</header>
<body onload="notificationITV();">
    <h1>Información del coche</h1>
    <fieldset id="izquierda" class="col-4">
        <legend>Última ITV</legend>
        <p><strong>Fecha: </strong> <?php echo $coche['ULTIMA_ITV'] ?></p>
        <input type="hidden" id="ult_itv" name="ult_itv" value="<?php echo $coche['ULTIMA_ITV'] ?>"/>
        <p><strong>Fecha de la nueva ITV:</strong></p>
            <form action="ficha_coche.php" onsubmit="return notificationITVAnterior();">
                <input type="number" name="id_coche" value="<?php echo $id_coche ?>" hidden />
                <input type="date" id="fecha_nueva_itv" name="fecha_nueva_itv" required/><div id="div_fecha_nueva_itv"></div>
                <input type="submit" value="Actualizar fecha" />
            </form> 
    </fieldset>
    <fieldset id="centro" class="col-4">
        <legend>Último repostaje</legend>
        <p><strong>Fecha: </strong> <?php echo $coche['ULTIMO_REPOSTAJE'] ?></p>
        <input type="hidden" id="ult_rep" name="ult_rep" value="<?php echo $coche['ULTIMA_ITV'] ?>"/>
        <p><strong>Fecha del nuevo repostaje:</strong></p>
            <form action="ficha_coche.php" onsubmit="return notificationRepAnterior();">
                <input type="number" name="id_coche" value="<?php echo $id_coche ?>" hidden />
                <input type="date" id="fecha_nuevo_repostaje" name="fecha_nuevo_repostaje" required/><div id="div_fecha_nuevo_rep"></div>
                <input type="submit" value="Actualizar fecha"/>
            </form>  
    </fieldset>
    <fieldset id="derecha" class="col-4">
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