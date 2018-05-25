<?php 
    require_once("utiles/gestionDB.php");
    require_once("utiles/gestionarAlumnos.php");
    $conexion = crearConexionBD();
    $examenesTeoricos = consultarTodosExamenesTeoricos($conexion);
    $examenesPracticos = consultarTodosExamenesPracticos($conexion);
?>
<!DOCTYPE HTML>
<html>
<head>
    <title> Calendario</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="./css/calendario.css">
</head>
    
<body>
    <?php include_once("./cabecera.php"); ?>
    <a href="calendario.php">Cambiar a clases</a>
    <h1>Calendario de Exámenes</h1>
    <div id="ex_t">
        <legend>Exámenes teóricos</legend>
        <table> 
        <tr>
            <th id="fecha">Fecha</th>
            <th id="alumno">Alumno</th>
        </tr>
        <?php foreach($examenesTeoricos as $et){ ?>
        <tr>
            <td><?php echo $et['FECHA_EX'] ?></td>
            <td><?php echo $et['NOMBRE'] . " " . $et['APELLIDOS'] ?></td>
        </tr>
        <?php } ?>
        </table>
        </div>
    <div id="ex_p">
        <legend>Examenes prácticos</legend>
        <table> 
        <tr>
            <th>Fecha</th>
            <th>Alumno</th>
        </tr>
        <?php foreach($examenesPracticos as $ep){ ?>
        <tr>
            <td><?php echo $ep['FECHA_EX'] ?></td>
            <td><?php echo $ep['NOMBRE'] . " " . $ep['APELLIDOS'] ?></td>
        </tr>
        <?php } ?>
        </table>
        </div>
    </body>
    
    
</html>