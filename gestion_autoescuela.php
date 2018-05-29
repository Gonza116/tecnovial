<?php
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
    <fieldset>
        <legend>Compras</legend>
        <fieldset>
            <legend>Nueva compra</legend>
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
                <input type="submit" value="Añadir compra" />
            </form>
            </p>
        </fieldset>
        <fieldset>
            <legend>Histórico de compras</legend>
            <table>
            <tr>
                <th>Concepto</th> <th>Fecha</th> <th>Precio</th>
            </tr>
            <?php foreach($compras as $compra){ ?>
            <tr>
                <td><?php echo $compra['PRODUCTO'] ?></td>
                <td><?php echo $compra['FECHA_COMPRA'] ?></td>
                <td><?php echo $compra['PRECIO_PROD_FACT'] ?></td>
            </tr>
            <?php } ?>
        </table>
        </fieldset>
    <fieldset>
        <legend>Productos</legend>
        
        <fieldset>
            <legend>Productos en activo</legend>
            <table>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                </tr>
                <?php foreach ($productosActivos as $pa){ ?>
                <tr>
                    <td><?php echo $pa['COD_PROD'] ?></td>
                    <td><?php echo $pa['PRODUCTO'] ?></td>
                    <td><?php echo $pa['PRECIO_PRODUCTO'] ?></td>
                    <form action="acciones/hacer_obsoleto.php">
                        <input type="text" name="id_prod" value="<?php echo $pa['COD_PROD'] ?>" hidden/>
                        <td><input type="submit" value="Hacer obsoleto" /></td>
                    </form>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
        <fieldset>
            <legend>Productos obsoletos</legend>
            <table>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                </tr>
                <?php foreach ($productosObsoletos as $po){ ?>
                <tr>
                    <td><?php echo $po['COD_PROD'] ?></td>
                    <td><?php echo $po['PRODUCTO'] ?></td>
                    <form action="acciones/hacer_activo.php">
                        <input type="text" name="id_prod" value="<?php echo $po['COD_PROD'] ?>" hidden/>
                        <td><input type="submit" value="Volver a activar" /></td>
                    </form>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
        <fieldset>
            <legend>Crear nuevo producto</legend>
            <form action="acciones/accion_anadir_producto.php">
                <p>
                Nombre del producto: <input type="text" name="nombre_prod" required />
                Precio del producto: <input type="number" name="precio_prod" value="10" /> € <input type="submit" value="Añadir" />
                </p>
            </form>
        </fieldset>
    </fieldset>
    <fieldset>
        <legend>Coches</legend>
        <a href="anadir/anadir_coche.php">+ Nuevo coche</a>
        <table>
            <tr>
                <th>Matrícula</th>
                <th>Kilómetros</th>
                <th>Último repostaje</th>
                <th>Última itv</th>
            </tr>
            <?php foreach($coches as $coche){ ?>
            <tr>
                <td id="mat_<?php $coche['NUM_COCHE'] ?>"><?php echo $coche['MATRICULA'] ?></td>
                <td><?php echo $coche['KMS'] ?></td>
                <td><?php echo $coche['ULTIMO_REPOSTAJE'] ?></td>
                <td id = "itv_<?php $coche['NUM_COCHE'] ?>"><?php echo $coche['ULTIMA_ITV'] ?></td>
                <td><form action="ficha_coche.php">
                    <input type="number" name="id_coche" value="<?php echo $coche['NUM_COCHE'] ?>" hidden />
                    <input type="submit" value="Ver más" />
                    </form></td>
                
            <?php } ?>
              <input type="hidden" id="itv" name="itv" value="<?php echo $coche['ULTIMA_ITV'] ?>" hidden>
              <input type="hidden" id="itv_id" name="itv_id" value="itv_<?php $coche['NUM_COCHE'] ?>" hidden>
              <input type="hidden" id="mat" name="mat" value="mat_<?php $coche['NUM_COCHE'] ?>" hidden>
            </tr>

        </table>
    </fieldset>
    <fieldset>
        <legend>Gastos</legend>
        <form action="gestion_autoescuela.php" method="post">
            <p>El total de gastos de <input type="number" name="anyo_consulta" value="<?php echo $anyo ?>" />asciende a <?php echo $gasto_total ?>€. <input type="submit" value="Cambiar"></p>
        </form>
        <fieldset>
            <legend>Seguro de los coches</legend>
            <a href="anadir/anadir_seguro_coche.php">Añadir cobro seguro coche</a>
            <table>
                <tr>
                    <th>Matrícula</th>
                    <th>Fecha del pago</th>
                    <th>Fecha de renovacion</th>
                    <th>Precio</th>
                </tr>
                <?php foreach($seguroCoche as $sc){ ?>
                <tr>
                    <td><?php echo $sc['MATRICULA'] ?></td>
                    <td><?php echo $sc['FECHA'] ?></td>
                    <td><?php echo $sc['FECHA_VENCIMIENTO'] ?></td>
                    <td><?php echo $sc['COSTE'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_coche" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $sc['COD_GASTO']?>" hidden> 
                            <input type="submit" value="Borrar">
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
                    <th>Fecha de cobro</th>
                    <th>Fecha de renovación</th>
                    <th>Precio</th>
                </tr>
                <?php foreach($seguroLocal as $sl){ ?>
                <tr>
                    <td><?php echo $sl['FECHA'] ?></td>
                    <td><?php echo $sl['FECHA_RENOVACION'] ?></td>
                    <td><?php echo $sl['COSTE'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_local" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $sl['COD_GASTO']?>" hidden> 
                            <input type="submit" value="Borrar">
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
                    <th>Alumno</th>
                    <th>Fecha</th>
                    <th>Coste</th>
                </tr>
                <?php foreach($tasas as $t) { ?>
                <tr>
                    <td><?php echo $t['NOMBRE'] . " " . $t['APELLIDOS'] ?></td>
                    <td><?php echo $t['FECHA'] ?></td>
                    <td><?php echo $t['COSTE'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_tasa" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $t['COD_GASTO']?>" hidden> 
                            <input type="submit" value="Borrar">
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
                    <th>Fecha</th>
                    <th>Consumo</th>
                    <th>Fecha del proximo cobro</th>
                </tr>
                <?php foreach($luz as $l){ ?>
                <tr>
                    <td><?php echo $l['FECHA'] ?></td>
                    <td><?php echo $l['GASTO_KWH'] ?></td>
                    <td><?php echo $l['PROXIMO_COBRO'] ?></td>
                    <td>
                        <form action="acciones/accion_borrar_gastos.php">
                            <input name="es_luz" type="text" value="true" hidden>
                            <input name="id" type="number" value="<?php echo $l['COD_GASTO']?>" hidden> 
                            <input type="submit" value="Borrar">
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
    </fieldset>
</body>
</html>