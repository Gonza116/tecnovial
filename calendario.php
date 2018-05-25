<?php
    session_start();
    $prof = $_SESSION['profesor'];
    $id_prof = $prof['id'];
    
    require_once("utiles/gestionDB.php");
    require_once("utiles/gestionarAlumnos.php");
    $conexion = crearConexionBD();
    $clases = consultarTodasClasesPracticas($conexion, $id_prof);
    
?>
<!DOCTYPE HTML>
<html>
<head>
    <title> Calendario</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="./css/calendario.css">
</head>
    
<body id="formulario">
    <?php include_once("./cabecera.php");
    ?>
    <a href="calendario-examenes.php"> Cambiar a exámenes</a>
    <h1>Calendario de Clases*</h1>
    <table> 
    <tr>
        <th>Fecha</th>
        <th>Alumno</th>
        <th>Coche</th>
    </tr>
    <?php foreach($clases as $c){ ?>
    <tr>
        <td><?php echo $c['FECHA'] ?></td>
        <td><?php echo $c['NOMBRE'] . " " . $c['APELLIDOS'] ?></td>
        <td><?php echo $c['MATRICULA'] ?></td>
    </tr>
    <?php } ?>
    </table>
    <p>*Solo se muestran las clases del profesor <?php echo ($prof['nombre'] . " " . $prof['apellidos']) ?></p>
    </body>
    
    
</html>