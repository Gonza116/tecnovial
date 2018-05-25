<?php
    session_start();
    require_once("../utiles/gestionarAlumnos.php");
    require_once("../utiles/gestionarCoches.php");
    require_once("../utiles/gestionDB.php");
    
    $conexion = crearConexionBD();
    if(isset($_REQUEST['id_clase'])){
        $id_alum = $_REQUEST['id_alumno'];
        $id_clase = $_REQUEST['id_clase'];
        $id_coche = $_REQUEST['id_coche'];
    } else {
        header("Location: ../index.php");
    }
    $clases = consultarPracticasCoche($conexion, $id_coche);
    $km = 0;
    foreach($clases as $clase) {
       $km = $km + $clase['KMS_CLASE']; 
    }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <script src="../js/notificaciones.js" type="text/javascript"></script>
    <title>Añadiendo valoración</title>
</head>
<body>
    <form action="../acciones/accion_anadir_valoracion.php" method="post">
        <input type="number" id="kms_anteriores" name="kms_anteriores" value="<?php echo $km ?>" hidden>
        <input type="text" name="id_alumno" value="<?php echo $id_alum ?>" hidden>
        <input type="number" name="id_clase" value="<?php echo $id_clase ?>" hidden>
        <input type="number" name="id_coche" value="<?php echo $id_coche?>" hidden>
        <p>Nota: <select name="valoracion">
            <option value="1">1</option>
            <option value="0" selected>0</option>
            <option value="-1">-1</option>
            </select></p>
        <p>Kilómetros recorridos: <input id="kms" name="kms" value="30" type="number"></p>
        <p>Incidencias: 
        <textarea name="incidencias" cols="40" rows="5"></textarea></p>
        <input type="submit" value="Guardar" onclick="notificationOil();">
    </form>
</body>
</html>