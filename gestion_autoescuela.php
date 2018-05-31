<?php
    session_start();
    require_once("utiles/gestionDB.php");
    require_once("utiles/gestionarProductos.php");
    require_once("utiles/gestionarCoches.php");
    require_once("utiles/gestionarGastos.php");
    require_once("utiles/gestionarAlumnos.php");
    require_once("utiles/gestionarCompras.php");

    $conexion = crearConexionBD();
    $productosActivos = consultarProductosActivos($conexion);
    $productosObsoletos = consultarProductosObsoletos($conexion);
    $coches = consultarCoches($conexion);
    $seguroCoche = consultarGastosCoche($conexion);
    $luz = consultarGastosLuz($conexion);
    $seguroLocal = consultarGastosLocal($conexion);
    $tasas = consultarGastosTasas($conexion);
    $alumnos = consultarAlumnos($conexion);
    $compras = consultarTodasCompras($conexion);

    $hayErrores = false;
    if(isset($_SESSION['error'])){
        $error = $_SESSION['error'];
        $hayErrores = true;
        unset($_SESSION['error']);
    }

    if(isset($_REQUEST['anyo_consulta'])){
        $anyo = $_REQUEST['anyo_consulta'];
    } else {
        $anyo = '2018';
    }
    if(isset($_SESSION["itv"])) {
        $fecha = $_SESSION["itv"];
    } else {
        $fecha = " ";
}
    $gasto_total = consultarGastosAnyo($conexion, $anyo);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Tecnovial: Gestión</title>
    <meta charset="utf-8">
    <script src="js/notificaciones.js" type="text/javascript"></script>
     <script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="./css/gestion_autoescuela.css">
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
    <?php if($hayErrores){ ?>
    <fieldset>
        <legend>Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } ?>
    <fieldset id="izquierda" class="col-6">
        <fieldset id="form_f">
        <legend id="titulo">Compras</legend>
        <fieldset id="form_f1">
            <legend id="form_l">Nueva compra</legend>
            <p>
            <form action="acciones/accion_anadir_compra.php">
                Alumno:
                <select name="id_alumno" required>
                    <?php foreach($alumnos as $a){ ?>
                    <option value="<?php echo $a['NUM_ALUM'] ?>"><?php echo $a['NOMBRE'] . " " . $a['APELLIDOS']?></option>
                    <?php } ?>
                </select>
                Producto:
                <select name="id_producto" required>
                    <?php foreach($productosActivos as $pa){ ?>
                    <option value="<?php echo $pa['COD_PROD'] ?>"><?php echo $pa['PRODUCTO'] ?></option>
                    <?php } ?>
                </select>
                Fecha:
                <input type="date" name="fecha_compra" required />
                <input id="bot" type="submit" value="Añadir compra" />
            </form>
        </fieldset>
            <fieldset id="form_f1">
            <legend id="form_l">Histórico de compras</legend>
            <table>
            <tr>
                <th class="col-4">Concepto</th> <th class="col-4">Fecha</th> <th class="col-4">Precio</th>
            </tr>
            <?php foreach($compras as $compra){ ?>
            <tr>
                <td class="col-4"><?php echo $compra['PRODUCTO'] ?></td>
                <td id="form" class="col-4"><?php echo $compra['FECHA_COMPRA'] ?></td>
                <td id="form" class="col-4"><?php echo $compra['PRECIO_PROD_FACT'] ?></td>
            </tr>
            <?php } ?>
        </table>
                </fieldset>
        </fieldset>
    <fieldset id="form_f">
        <legend id="titulo">Productos</legend>
        
        <fieldset id="form_f1">
            <legend id="form_l">Productos en activo</legend>
            <table>
                <tr>
                    <th class="col-3">Código</th>
                    <th class="col-3">Nombre</th>
                    <th class="col-3">Precio</th>
                </tr>
                <?php foreach ($productosActivos as $pa){ ?>
                <tr>
                    <td id="form" class="col-3"><?php echo $pa['COD_PROD'] ?></td>
                    <td class="col-3"><?php echo $pa['PRODUCTO'] ?></td>
                    <td id="form" class="col-3"><?php echo $pa['PRECIO_PRODUCTO'] ?></td>
                    <form action="acciones/hacer_obsoleto.php">
                        <input type="text" name="id_prod" value="<?php echo $pa['COD_PROD'] ?>" hidden/>
                        <td><input id="bot" type="submit" value="Hacer obsoleto" /></td>
                    </form>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
        <fieldset id="form_f1">
            <legend id="form_l">Productos obsoletos</legend>
            <table>
                <tr>
                    <th class="col-4">Código</th>
                    <th class="col-4">Nombre</th>
                </tr>
                <?php foreach ($productosObsoletos as $po){ ?>
                <tr>
                    <td id="form" class="col-4"><?php echo $po['COD_PROD'] ?></td>
                    <td class="col-4"><?php echo $po['PRODUCTO'] ?></td>
                    <form action="acciones/hacer_activo.php">
                        <input type="text" name="id_prod" value="<?php echo $po['COD_PROD'] ?>" hidden/>
                        <td><input id="bot" type="submit" value="Volver a activar" /></td>
                    </form>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
        <fieldset id="form_f1">
            <legend id="form_l">Crear nuevo producto</legend>
            <form action="acciones/accion_anadir_producto.php">
                <p>
                Nombre del producto: <input type="text" name="nombre_prod" required />
                Precio del producto: <input type="number" name="precio_prod" value="10" /> € <input id="bot" type="submit" value="Añadir" />
                </p>
            </form>
        </fieldset>
    </fieldset>
    <fieldset id="form_f">
        <legend id="titulo">Coches</legend>
        
        <fieldset id="form_f1">
            <legend><a href="anadir/anadir_coche.php"><img src="images/car_anadir.png" title="Añadir coche"></a></legend>
        <table>
            <tr>
                <th class="col-2-5">Matrícula</th>
                <th class="col-2-5">Kilómetros</th>
                <th class="col-2-5">Último repostaje</th>
                <th class="col-2-5">Última itv</th>
            </tr>
            <?php foreach($coches as $coche){ ?>
            <tr>
                <td id="form" class="col-2-5" id="mat_<?php $coche['NUM_COCHE'] ?>"><?php echo $coche['MATRICULA'] ?></td>
                <td id="form" class="col-2-5"><?php echo $coche['KMS'] ?></td>
                <td id="form" class="col-2-5"><?php echo $coche['ULTIMO_REPOSTAJE'] ?></td>
                <td id="form" class="col-2-5" id = "itv_<?php $coche['NUM_COCHE'] ?>"><?php echo $coche['ULTIMA_ITV'] ?></td>
                <td><form action="ficha_coche.php">
                    <input type="number" name="id_coche" value="<?php echo $coche['NUM_COCHE'] ?>" hidden />
                    <input type="image" src="images/update.png" sralt="Submit" title="Actualizar"/>
                    </form></td>
                
            <?php } ?>
              <input type="hidden" id="itv" name="itv" value="<?php echo $coche['ULTIMA_ITV'] ?>" hidden>
              <input type="hidden" id="itv_id" name="itv_id" value="itv_<?php $coche['NUM_COCHE'] ?>" hidden>
              <input type="hidden" id="mat" name="mat" value="mat_<?php $coche['NUM_COCHE'] ?>" hidden>
            </tr>

        </table>
        </fieldset>
    </fieldset>
    </fieldset>
    <fieldset id="derecha" class="col-6">
    <fieldset>
        <legend id="titulo">Gastos</legend>
        <form action="gestion_autoescuela.php" method="post">
            <p>El total de gastos de <input type="number" name="anyo_consulta" value="<?php echo $anyo ?>" />asciende a <span id="form"><?php echo $gasto_total ?></span>€. <input id="bot" type="submit" value="Cambiar"></p>
        </form>
        <fieldset>
            <legend>Seguro de los coches</legend>
            <a href="anadir/anadir_seguro_coche.php">Añadir cobro seguro coche</a>
            <table>
                <tr>
                    <th class="col-2-5">Matrícula</th>
                    <th class="col-2-5">Fecha del pago</th>
                    <th class="col-2-5">Fecha de renovación</th>
                    <th class="col-2-5">Precio</th>
                </tr>
                <?php foreach($seguroCoche as $sc){ ?>
                <tr>
                    <td id="form" class="col-2-5"><?php echo $sc['MATRICULA'] ?></td>
                    <td id="form" class="col-2-5"><?php echo $sc['FECHA'] ?></td>
                    <td id="form" class="col-2-5"><?php echo $sc['FECHA_VENCIMIENTO'] ?></td>
                    <td id="form" class="col-2-5"><?php echo $sc['COSTE'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_coche" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $sc['COD_GASTO']?>" hidden>
                            <input type="image" src="images/delete.png" sralt="Submit" title="Borrar"/>
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
        <fieldset>
            <legend>Seguro del local</legend>
            <a href="anadir/anadir_seguro_local.php">Añadir cobro seguro local</a>
            <table>
                <tr>
                    <th class="col-3">Fecha de cobro</th>
                    <th class="col-3">Fecha de renovación</th>
                    <th class="col-3">Precio</th>
                </tr>
                <?php foreach($seguroLocal as $sl){ ?>
                <tr>
                    <td id="form" class="col-3"><?php echo $sl['FECHA'] ?></td>
                    <td id="form" class="col-3"><?php echo $sl['FECHA_RENOVACION'] ?></td>
                    <td id="form" class="col-3"><?php echo $sl['COSTE'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_local" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $sl['COD_GASTO']?>" hidden> 
                            <input type="image" src="images/delete.png" sralt="Submit" title="Borrar"/>
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
        <fieldset>
            <legend>Tasas</legend>
            <a href='anadir/anadir_tasas.php'>Añadir pago de tasas</a>
            <table>
                <tr>
                    <th class="col-3">Alumno</th>
                    <th class="col-3">Fecha</th>
                    <th class="col-3">Coste</th>
                </tr>
                <?php foreach($tasas as $t) { ?>
                <tr>
                    <td class="col-3"><?php echo $t['NOMBRE'] . " " . $t['APELLIDOS'] ?></td>
                    <td id="form" class="col-3"><?php echo $t['FECHA'] ?></td>
                    <td id="form" class="col-3"><?php echo $t['COSTE'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_tasa" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $t['COD_GASTO']?>" hidden> 
                            <input type="image" src="images/delete.png" sralt="Submit" title="Borrar"/>
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
        <fieldset>
            <legend>Luz</legend>
            <a href="anadir/anadir_gasto_luz.php">Añadir gasto de luz</a>
            <table>
                <tr>
                    <th class="col-3">Fecha</th>
                    <th class="col-3">Consumo</th>
                    <th class="col-3">Fecha del próximo cobro</th>
                </tr>
                <?php foreach($luz as $l){ ?>
                <tr>
                    <td id="form" class="col-3"><?php echo $l['FECHA'] ?></td>
                    <td id="form" class="col-3"><?php echo $l['GASTO_KWH'] ?></td>
                    <td id="form" class="col-3"><?php echo $l['PROXIMO_COBRO'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_luz" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $l['COD_GASTO']?>" hidden> 
                            <input type="image" src="images/delete.png" sralt="Submit" title="Borrar"/>
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
    </fieldset>
    </fieldset>    
</body>
</html>
