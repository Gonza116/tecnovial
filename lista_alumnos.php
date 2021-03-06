<?php
    session_start();
    require_once("utiles/gestionDB.php");
    require_once("utiles/gestionarAlumnos.php");
    require_once("utiles/paginacion_consultas.php");
    require_once("utiles/gestionarProfesores.php");
    $conexion = crearConexionBD();

    if(isset($_REQUEST['page_num'])){
            $page_num = $_REQUEST['page_num'];
            $page_size = $_REQUEST['page_size'];
    } else if (isset($_SESSION['page_num'])){
        $page_num = $_SESSION['page_num'];
        $page_size = $_SESSION['page_size'];
    } else {
        $page_num = isset($_GET['page_num'])? (int)$_GET['page_num'] : 1;
        $page_size = isset($_GET['page_size'])? (int)$_GET['page_size'] : 10;
    }

    if($page_num < 1){
        $page_num = 1;
    }

    if($page_size < 1){
        $page_size = 10;
    }


    $_SESSION['page_num'] = $page_num;
    $_SESSION['page_size'] = $page_size;
    $searchingAlum = false;
    if(isset($_SESSION['alumnos_buscados'])){
        $alumnos = $_SESSION['alumnos_buscados'];
        unset($_SESSION['alumnos_buscados']);
        $searchingAlum = true;
    } else {
        $query = 'SELECT * FROM ALUMNOS ORDER BY BAJA, APELLIDOS, NOMBRE';
        $alumnos = consulta_paginada($conexion, $query, $page_num, $page_size);
        $total_size = total_consulta($conexion, $query);
        $mostrando = $total_size > $page_size? $page_size : $total_size;
    }

    $hayErrores = false;
    if(isset($_SESSION['error'])){
        $error = $_SESSION['error'];
        $hayErrores = true;
        unset($_SESSION['error']);
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Tecnovial: Listado de alumnos</title>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="./css/lista_alumnos.css">
    <script>
        function fechaHoy() {
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            
        $(document).ready(function(){
            $("#fecha_hoy").append( "<p id='saludo'>Hoy estamos a <span id='fecha_form'>" + fecha.getDate() + "/" + mes + "/" + fecha.getFullYear() + "</span>. ¡Qué tengas un buen día!</p>");
        })
        }
    </script>
</head>
<body onload="fechaHoy();">
<?php include_once("cabecera.php") ?>
    <div id="fecha_hoy"></div>    
<fieldset id="lista">
    <legend>
        <h1 id="titulo">Lista de alumnos</h1>
    </legend>
    <form action="utiles/busqueda_alumnos.php">
        <input class="col-3" id="buscarnombre" name="buscarnombre" type="text" placeholder="Buscar por nombre">
        <input class="col-3" id="buscarapellido" name="buscarapellido" type="text" placeholder="Buscar por apellido">
        <input class="col-3" id="buscardni" name="buscardni" type="text" placeholder="Buscar por DNI" pattern="^[0-9]{8}[A-Z]">
        <input id="bot" type="submit" value="Buscar">
        <a id="cerrarsesion" href='utiles/cerrarsesion.php'><img src="images/csesion_sesion.png"></a>
    </form>
    <form method="get" action="lista_alumnos.php">
        <input id="bot" type="submit" value="Resetear">
    </form>
    <br>
    <?php if(!$searchingAlum){ ?>
    <div id="enlaces">
			<!-- Código para poner los enlaces a las páginas -->
        <?php 
                $n_paginas = ceil($total_size / $page_size);
                $i_paginas = 1;
                for($i_paginas = 1; $i_paginas <= $n_paginas; $i_paginas++){
        ?>    
        <a id='form' href = "lista_alumnos.php?page_num=<?php echo $i_paginas?>&page_size=<?php echo $page_size?>"><?php echo $i_paginas?></a>
        
		</div>
		  <?php } ?>
		<form method="get" action="lista_alumnos.php">
			<!-- Formulario que contiene el número y cambio de tamaño de página -->
            Mostrando <input type="number" name="page_size" min="1" max="<?php echo $total_size?>" value="<?php echo $mostrando?>"> entradas de <span id='form'><?php echo $total_size?></span><input type="number" name="page_num" value="<?php echo $page_num?>" hidden>. <input id="bot" type=submit value="Cambiar"><br>
            <a href = "anadir/anadir_alumno.php"><img src="images/anadir_alumno.png" title="Añadir alumno"></a>
		</form>
    <br>
    <?php } ?>

    <?php if($hayErrores){ ?>
    <fieldset id="errores">
        <legend id="errores">Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p id="errores"><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } ?>
    <?php foreach($alumnos as $alumno){ ?>
    <form class="col-1" id="ver_mas" action="ficha_alumno.php">
                <input type="text" name="id_alumno" id="id_alumno" value="<?php echo $alumno['NUM_ALUM']?>" hidden>
        <input type="image" src="images/ver_mas.png" sralt="Submit" title="Ver más"/>
          </form>
    <div class="col-11" id="alum" > <?php echo $alumno['APELLIDOS'] ?>, <?php echo $alumno['NOMBRE'] ?> 
        <br><strong>DNI: </strong> <span id='form'><?php echo $alumno['DNI'] ?></span>
        <em><?php if ($alumno['BAJA']=='SI'){ echo ' (Dado de baja)'; } ?></em>
    </div>
    <?php } ?>
</fieldset>
</body>
</html>