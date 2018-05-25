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
        $query = 'SELECT * FROM ALUMNOS';
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
    <script>
        function fechaHoy() {
            var fecha = new Date();
            var mes = fecha.getMonth() + 1;
            document.getElementById('fecha_hoy').innerHTML = "<p>Hoy estamos a " + fecha.getDate() + "/" + mes + "/" + fecha.getFullYear() + ". ¡Qué tengas un buen día!</p>";
    }
    </script>
</head>
<body onload="fechaHoy();">
<?php include_once("cabecera.php") ?>
    <div id="fecha_hoy"></div>    
<fieldset>
    <form action="utiles/busqueda_alumnos.php">
        <input id="buscarnombre" name="buscarnombre" type="text" placeholder="Buscar por nombre">
        <input id="buscarapellido" name="buscarapellido" type="text" placeholder="Buscar por apellido">
        <input id="buscardni" name="buscardni" type="text" placeholder="Buscar por DNI" pattern="^[0-9]{8}[A-Z]">
        <input type="submit" value="Buscar">
    </form>
    <form method="get" action="lista_alumnos.php">
        <input type="submit" value="Resetear">
    </form>
    <a href='utiles/cerrarsesion.php'>Cerrar sesión</a>
    <br>
    <br>
    <?php if(!$searchingAlum){ ?>
    <div id="enlaces">
			<!-- Código para poner los enlaces a las páginas -->
            <?php 
                $n_paginas = ceil($total_size / $page_size);
                $i_paginas = 1;
                for($i_paginas = 1; $i_paginas <= $n_paginas; $i_paginas++){
            ?>
            <a href = "lista_alumnos.php?page_num=<?php echo $i_paginas?>&page_size=<?php echo $page_size?>"><?php echo $i_paginas?></a>
		</div>
		  <?php } ?>
		<form method="get" action="lista_alumnos.php">
			<!-- Formulario que contiene el número y cambio de tamaño de página -->
            Mostrando <input type="number" name="page_size" min="1" max="<?php echo $total_size?>" value="<?php echo $mostrando?>"> entradas de <?php echo $total_size?><input type="number" name="page_num" value="<?php echo $page_num?>" hidden>. <input type=submit value="Cambiar">
		</form>
    <?php } ?>
    <legend>
    Lista de alumnos
    </legend>
    <a href = "anadir/anadir_alumno.php">+ Nuevo alumno</a>
    <?php if($hayErrores){ ?>
    <fieldset>
        <legend>Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } ?>
    <?php foreach($alumnos as $alumno){ ?>
    <div> <?php echo $alumno['APELLIDOS'] ?>, <?php echo $alumno['NOMBRE'] ?> 
          <strong>DNI: </strong> <?php echo $alumno['DNI'] ?>
          <p><em><?php if ($alumno['BAJA']=='SI'){ echo 'Dado de baja'; } ?></em></p>
          <form action="ficha_alumno.php">
                <input type="text" name="id_alumno" id="id_alumno" value="<?php echo $alumno['NUM_ALUM']?>" hidden>
                <input type="submit" value="Ver más">
          </form>
    </div>
    <?php } ?>
</fieldset>
</body>
</html>