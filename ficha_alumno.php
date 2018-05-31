<?php
    session_start();
    require_once("utiles/gestionDB.php");
    require_once("utiles/gestionarAlumnos.php");
    require_once("utiles/gestionarProfesores.php");
    require_once("utiles/gestionarCoches.php");
    require_once("utiles/gestionarProductos.php");
    require_once("utiles/gestionarCompras.php");
    $conexion = crearConexionBD();
    $profesores = consultarProfesores($conexion);
    $coches = consultarCoches($conexion);
    if(isset($_REQUEST['id_alumno'])){
        $id = $_REQUEST['id_alumno'];
    } else {
         Header("Location: lista_alumnos.php");
    }
    $alumno = consultaAlumno($conexion, $id);
    $clasesPracticasPagadas = consultaPracticasPagadasAlumno($conexion, $id);
    $clasesRecibidas = consultaPracticasAlumno($conexion, $id);
    $clasesPorRecibir =  consultaPracticasPorHacerAlumno($conexion, $id);
    $puntosActuales = puntosAlumno($conexion, $id) == ""? 0 : puntosAlumno($conexion, $id);
    $clasesTeoricas = consultarClasesTeoricas($conexion, $id);
    $teoricosHechos = consultarExamenesTeoricosHechos($conexion, $id);
    $teoricosNoHechos = consultarExamenesTeoricosNoHechos($conexion, $id);
    $practicosHechos = consultarExamenesPracticosHechos($conexion, $id);
    $practicosNoHechos = consultarExamenesPracticosNoHechos($conexion, $id);
    //$fecha_cad_tasas = $alumno['CAD_TASAS'];
    $compras_alumno = consultarComprasDeAlumno($conexion, $id);
?>

<!DOCTYPE html>
<html lang="es">
    <head>
    <title>Tecnovial: Ficha de alumno</title>
    <meta charset="utf-8">
    <script src="js/notificaciones.js" type="text/javascript">
    </script>
        <link rel="stylesheet" type="text/css" href="./css/ficha_alumno.css">
</head>
<body onload="notificationTasas();">
    <div id="izquierda" class="col-4">
    <fieldset id="datos_alumno">
      <a href="lista_alumnos.php"><img src="images/return.png" title="Volver a lista"></a>
        <a href="calendario.php"><img src="images/calendar.png" title="Ir al calendario"></a>
        <label>
            <?php echo ($alumno['NOMBRE'] . " " . $alumno['APELLIDOS']) ?>
            <input type="hidden" id="nombre_alumno" name="nombre_alumno" value="<?php echo $alumno['NOMBRE'] ?>">
        </label>
        <form action="acciones/accion_baja.php">
            <input type="text" name="id" value="<?php echo $id ?>" hidden />
            <input id="bot" type="submit" value="Dar de baja" />
        </form>
        <fieldset id="form_f1">
            <legend id="form_l">
            Datos del alumno
            </legend>
            <p><strong>DNI: </strong><span id="form"> <?php echo $alumno['DNI'] ?></span>
            <p><strong>Fecha de nacimiento: </strong> <span id="form"> <?php echo $alumno['FECHA_NAC'] ?> </span>
                <input type="hidden" id="fecha_nac" name="fecha_nac" value="<?php echo $alumno['FECHA_NAC'] ?>">
            <p><strong>Fecha de matriculación: </strong> <span id="form"> <?php echo $alumno['FECHA_MATRICULACION'] ?></span>
            <p><strong>Caducidad de las tasas: </strong> <span id="form"> <?php echo $alumno['CAD_TASAS'] ?> </span>
                <input type="hidden" id="cad_tasas" name="cad_tasas" value="<?php echo $alumno['CAD_TASAS'] ?>">
            <p><strong>Restricciones: </strong> <?php echo $alumno['RESTRICCIONES'] ?>
            <p><strong>Oportunidades restantes: </strong> <span id="form">  <?php echo $alumno['OPORTUNIDADES'] ?></span>
            <p><strong>Teléfono: </strong> <span id="form"> <?php echo $alumno['TELEFONO'] ?> </span>
            <p><strong>Dirección: </strong> <?php echo $alumno['DOMICILIO'] ?>
            <p><strong>Estudios: </strong> <?php echo $alumno['ESTUDIOS'] ?>
        </fieldset>
    </fieldset>
    <fieldset id="form_f">
        <legend id="titulo">
        Compras
        </legend>
        <fieldset id="form_f1">
        <a href="gestion_autoescuela.php"><img src="images/gastos.png" title="Ir a gestión de productos"></a>
        <table>
            <tr>
                <th>Concepto</th> <th>Fecha</th> <th>Precio</th>
            </tr>
            <?php foreach($compras_alumno as $compra){ ?>
            <tr>
                <td><?php echo $compra['PRODUCTO'] ?></td>
                <td><span id="form"> <?php echo $compra['FECHA_COMPRA'] ?></span></td>
                <td><span id="form"> <?php echo $compra['PRECIO_PROD_FACT'] ?></span></td>
            </tr>
            <?php } ?>
        </table>
        <!-- <p><strong>Clases prácticas: </strong> <?php echo $clasesPracticasPagadas ?></p> -->
            </fieldset>
    </fieldset>
        </div>
    <div id="centro" class="col-4">
    <fieldset id="form_f">
        <legend id="titulo">
            Clases teóricas
        </legend>
        <fieldset id="form_f1">
            <legend id="form_l">Añadir test hecho</legend>
            <form action="acciones/accion_anadir_test.php">
                <p><input name="num_alum" type="text" value="<?php echo $id ?>" hidden>
                Fecha del test: <input name="fecha" type="date" required><br><br>
                Número del test: <input name="num_test" type="number" min="1" max="90" value="1"><br><br>
                Número de fallos: <input name="num_fallos" type="number" min="0" max="30" value="0"><br><br>
                <input id="bot" type="submit" value="Añadir test"></p>
            </form>
        </fieldset>
<!-- <fieldset>
            <legend>
                Temas dados
            </legend>
        </fieldset> -->
        <fieldset id="form_f1">
            <legend id="form_l">
                Test hechos
            </legend>
            <table>
                <tr>
                    <th>Número</th> <th>Fallos</th> <th>Fecha</th>
                </tr>
                <?php foreach($clasesTeoricas as $ct){ ?>
                <tr>
                    <td><span id="form"> <?php echo $ct['NUM_TEST'] ?></span></td>
                    <td><span id="form"> <?php echo $ct['NUM_FALLOS'] ?></span></td>
                    <td><span id="form"> <?php echo $ct['FECHA'] ?></span></td>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
    </fieldset>
    <fieldset id="form_f">
        <legend id="titulo">
        Clases prácticas
        </legend>
        <fieldset id="form_f1">
            <legend id="form_l">
            Añadir clase práctica
            </legend>
            <form action="acciones/accion_anadir_practica.php">
                <input type="text" value="<?php echo $id ?>" name="id_alumno" hidden>
                <p>Profesor: <select name="id_prof">
                    <?php foreach ($profesores as $profesor){ ?>
                    <option value="<?php echo $profesor['NUM_PROF'] ?>"><?php echo $profesor['NOMBRE'] . " " . $profesor['APELLIDOS'] ?></option>
                    <?php } ?>
                    </select><br><br>
                Coche: <select name="id_coche">
                    <?php foreach ($coches as $coche){ ?>
                    <option value="<?php echo $coche['NUM_COCHE'] ?>"><?php echo $coche['MATRICULA'] ?></option>
                    <?php } ?>
                    </select><br><br>
                Fecha: <input type="date" name="fecha_clase" required> <br><br>
                ¿Reciclaje? <select name="reciclaje">
                    <option value="SI">Sí</option>
                    <option value="NO" selected>No</option>
                    </select><br><br>
                <input id="bot" type="submit" value="Añadir"></p>
            </form>
        </fieldset>
        <fieldset id="form_f1">
            <legend id="form_l">
                Puntuación actual
            </legend>
            <?php $puntoPalabra = $puntosActuales == 1? "punto" : "puntos" ?>
            <p>Actualmente, tiene <span id="form"> <?php echo $puntosActuales . "</span> " . $puntoPalabra ?> de <span id="form">  20.</span></p>
        </fieldset>
        <fieldset id="form_f1">
            <legend id="form_l">
                Clases recibidas
            </legend>
            <table>
                <tr>
                    <th>Fecha</th>
                    <th>Valoracion</th>
                    <th>Incidencias</th>
                </tr>
            <?php foreach($clasesRecibidas as $cr){ ?>
                <tr>
                    <td><span id="form"><?php echo $cr['FECHA'] ?></span></td>
                    <td><span id="form"><?php echo $cr['VALORACION'] ?></span></td>
                    <td><?php echo $cr['INCIDENCIA'] ?></td>
                </tr>   
            <?php } ?>
            </table>
        </fieldset>
        <fieldset id="form_f1">
            <legend id="form_l">
                Clases por recibir
            </legend>
            <table>
                <tr>
                    <th>Fecha</th>
                </tr>
            <?php foreach($clasesPorRecibir as $cpr){ ?>
                <tr>
                    <td><span id="form"><?php echo $cpr['FECHA'] ?></span></td>
                    <form action="anadir/anadir_valoracion.php">
                        <input type="text" name="id_alumno" value="<?php echo $id ?>" hidden />
                        <input type="number" name="id_clase" value="<?php echo $cpr['NUM_CLASE'] ?>" hidden />
                        <input type="number" name="id_coche" value="<?php echo $cpr['NUM_COCHE'] ?>" hidden />
                    <td><input id="bot" type="submit" value="Práctica realizada" /></td>
                    </form>
                </tr>
            <?php } ?>
            </table>
        </fieldset>
    </fieldset>
        </div>
    <div id="derecha" class="col-4">
    <fieldset id="form_f">
        <legend id="titulo">Exámenes</legend>
        <fieldset id="form_fe">
            <legend id="form_fex">Exámenes teóricos</legend>
            <fieldset id="form_f1">
                <legend id="form_l">Exámenes hechos</legend>
                <table>
                    <tr><th>Fecha</th> <th>Calificación</th></tr>
                    <?php foreach($teoricosHechos as $th){ ?>
                    <tr>
                        <td><span id="form"><?php echo $th['FECHA_EX'] ?></span></td>
                        <td><?php echo $th['APTO'] ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset id="form_f1">
                <legend id="form_l">Exámenes por hacer</legend>
                <table>
                    <tr><th>Fecha</th><th>¿Apto?</th></tr>
                    <?php foreach($teoricosNoHechos as $tnh){ ?>
                    <tr>
                        <td><span id="form"><?php echo $tnh['FECHA_EX'] ?></span></td>
                            <form action='acciones/accion_anadir_apto_t.php'>
                                <input name="id" type="text" value="<?php echo $id ?>" hidden />
                                <input name="id_ex" type="text" value="<?php echo $tnh['NUM_EX_T'] ?>" hidden />
                                <td><select name="apto">
                                    <option value="SI">Sí</option>
                                    <option value="NO">No</option>
                                    </select></td>
                                <td><input id="bot" type="submit" value="Añadir calificación" /></td>
                            </form>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset id="form_f1"> 
                <legend id="form_l">Añadir examen teórico</legend>
                <form action="acciones/accion_anadir_examen_t.php" onsubmit="return notificationTExams();">
                    <input name="id" type="text" value="<?php echo $id ?>" hidden />
                    <input name="fecha_ex_t" id="fecha_ex_t" type="date" required/>
                    <input id="bot" type="submit" value="Añadir"/>
                </form>
            </fieldset>
        </fieldset>
        <fieldset id="form_fe">
            <legend id="form_fex">Exámenes prácticos</legend>
            <fieldset id="form_f1">
                <legend id="form_l">Exámenes hechos</legend>
                <table>
                    <tr><th>Fecha</th> <th>Calificación</th></tr>
                    <?php foreach($practicosHechos as $ph){ ?>
                    <tr>
                        <td><span id="form"><?php echo $ph['FECHA_EX'] ?></span></td>
                        <td><?php echo $ph['APTO'] ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset id="form_f1">
                <legend id="form_l">Exámenes por hacer</legend>
                <table>
                    <tr><th>Fecha</th> <th>¿Apto?</th></tr>
                    <?php foreach($practicosNoHechos as $pnh){ ?>
                    <tr>
                        <td><span id="form"><?php echo $pnh['FECHA_EX'] ?></span></td>
                        <form action='acciones/accion_anadir_apto_p.php'>
                                <input name="id" type="text" value="<?php echo $id ?>" hidden />
                                <input name="id_ex" type="text" value="<?php echo $pnh['NUM_EX_P'] ?>" hidden />
                                <td><select name="apto">
                                    <option value="SI">Sí</option>
                                    <option value="NO">No</option>
                                    </select></td>
                                <td><input id="bot" type="submit" value="Añadir calificación" /></td>
                            </form>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset id="form_f1">
                <legend id="form_l">Añadir examen práctico</legend>
                <form action="acciones/accion_anadir_examen_p.php" onsubmit="return notificationPExams();">
                    <input name="id" type="text" value="<?php echo $id ?>" hidden />
                    <input name="fecha_ex_p" id="fecha_ex_p" type="date" required/>
                    <input id="bot" type="submit" value="Añadir"/>
                </form>
            </fieldset>
        </fieldset>
    </fieldset>
        </div>
</body>
</html>