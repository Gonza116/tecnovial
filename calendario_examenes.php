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
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script>
        function fechaHoy() {
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            
        $(document).ready(function(){
            $("#fecha_hoy").append( "<p>Hoy estamos a " + fecha.getDate() + "/" + mes + "/" + fecha.getFullYear() + ". ¡Qué tengas un buen día!</p>");
        })
        }
    </script>
</head>
    
<body onload="fechaHoy();">
    <?php include_once("./cabecera.php"); ?>
    <a href="calendario.php"><img src="./images/car.png"></a>
    <h1 id="titulo">Calendario de Exámenes</h1>
    <div id="fecha_hoy"></div>
    <div id="ex_t">
        <legend id="ex">Exámenes teóricos</legend>
        <table> 
        <tr>
            <th id="fecha">Fecha</th>
            <th id="alumno">Alumno</th>
        </tr>
        <?php foreach($examenesTeoricos as $et){ ?>
        <tr>
            <td id="fecha_cl"><?php echo $et['FECHA_EX'] ?></td>
            <td id="alumno_cl"><?php echo $et['NOMBRE'] . " " . $et['APELLIDOS'] ?></td>
        </tr>
        <?php } ?>
        </table>
        </div>
    <div id="ex_p">
        <legend id="ex">Exámenes prácticos</legend>
        <table> 
        <tr>
            <th>Fecha</th>
            <th>Alumno</th>
        </tr>
        <?php foreach($examenesPracticos as $ep){ ?>
        <tr>
            <td id="fecha_cl"><?php echo $ep['FECHA_EX'] ?></td>
            <td id="alumno_cl"><?php echo $ep['NOMBRE'] . " " . $ep['APELLIDOS'] ?></td>
        </tr>
        <?php } ?>
        </table>
        </div>
    </body>
    
    
</html>