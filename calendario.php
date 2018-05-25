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
    
<body id="formulario" onload="fechaHoy();">
    <?php include_once("./cabecera.php");
    ?>
    <a href="calendario_examenes.php"><img src="./images/examen.png"></a>
    <h1 id="titulo">Calendario de Clases*</h1>
    <div id="fecha_hoy"></div>
    <table> 
    <tr>
        <th>Fecha</th>
        <th>Alumno</th>
        <th>Coche</th>
    </tr>
    <?php foreach($clases as $c){ ?>
    <tr>
        <td id="fecha_cl"><?php echo $c['FECHA'] ?></td>
        <td id="alumno_cl"><?php echo $c['NOMBRE'] . " " . $c['APELLIDOS'] ?></td>
        <td id="coche_cl"><?php echo $c['MATRICULA'] ?></td>
    </tr>
    <?php } ?>
    </table>
    <p>*Solo se muestran las clases del profesor <?php echo ($prof['nombre'] . " " . $prof['apellidos']) ?></p>
    </body>
    
    
</html>