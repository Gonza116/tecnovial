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
</head>
<body onload="notificationTasas();">
    <a href="lista_alumnos.php">Volver a lista</a>
    <fieldset>
        <label>
            <?php echo ($alumno['NOMBRE'] . " " . $alumno['APELLIDOS']) ?>
            <input type="hidden" id="nombre_alumno" name="nombre_alumno" value="<?php echo $alumno['NOMBRE'] ?>">
        </label>
        <form action="acciones/accion_baja.php">
            <input type="text" name="id" value="<?php echo $id ?>" hidden />
            <input type="submit" value="Dar de baja" />
        </form>
        <fieldset>
            <legend>
            Datos del alumno
            </legend>
            <p><strong>DNI: </strong> <?php echo $alumno['DNI'] ?>
            <p><strong>Fecha de nacimiento: </strong> <?php echo $alumno['FECHA_NAC'] ?>
                <input type="hidden" id="fecha_nac" name="fecha_nac" value="<?php echo $alumno['FECHA_NAC'] ?>">
            <p><strong>Fecha de matriculación: </strong> <?php echo $alumno['FECHA_MATRICULACION'] ?>
            <p><strong>Caducidad de las tasas: </strong> <?php echo $alumno['CAD_TASAS'] ?>
                <input type="hidden" id="cad_tasas" name="cad_tasas" value="<?php echo $alumno['CAD_TASAS'] ?>">
            <p><strong>Restricciones: </strong> <?php echo $alumno['RESTRICCIONES'] ?>
            <p><strong>Oportunidades restantes: </strong> <?php echo $alumno['OPORTUNIDADES'] ?>
            <p><strong>Teléfono: </strong> <?php echo $alumno['TELEFONO'] ?>
            <p><strong>Dirección: </strong> <?php echo $alumno['DOMICILIO'] ?>
            <p><strong>Estudios: </strong> <?php echo $alumno['ESTUDIOS'] ?>
        </fieldset>
    </fieldset>
    <a href="calendario.php">Al calendario</a>
    <fieldset>
        <legend>
            Clases teoricas
        </legend>
        <fieldset>
            <legend>Añadir test hecho</legend>
            <form action="acciones/accion_anadir_test.php">
                <p><input name="num_alum" type="text" value="<?php echo $id ?>" hidden>
                Fecha del test: <input name="fecha" type="date" required>
                Número del test: <input name="num_test" type="number" min="1" max="90" value="1">
                Número de fallos: <input name="num_fallos" type="number" min="0" max="30" value="0">
                <input type="submit" value="Añadir test"></p>
            </form>
        </fieldset>
<!-- <fieldset>
            <legend>
                Temas dados
            </legend>
        </fieldset> -->
        <fieldset>
            <legend>
                Test hechos
            </legend>
            <table>
                <tr>
                    <th>Número</th> <th>Fallos</th> <th>Fecha</th>
                </tr>
                <?php foreach($clasesTeoricas as $ct){ ?>
                <tr>
                    <td><?php echo $ct['NUM_TEST'] ?></td>
                    <td><?php echo $ct['NUM_FALLOS'] ?></td>
                    <td><?php echo $ct['FECHA'] ?></td>
                </tr>
                <?php } ?>
            </table>
        </fieldset>
    </fieldset>
    <fieldset>
        <legend>Exámenes</legend>
        <fieldset>
            <legend>Examenes teóricos</legend>
            <fieldset>
                <legend>Exámenes hechos</legend>
                <table>
                    <tr><th>Fecha</th> <th>Calificación</th></tr>
                    <?php foreach($teoricosHechos as $th){ ?>
                    <tr>
                        <td><?php echo $th['FECHA_EX'] ?></td>
                        <td><?php echo $th['APTO'] ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset>
                <legend>Exámenes por hacer</legend>
                <table>
                    <tr><th>Fecha</th><th>¿Apto?</th></tr>
                    <?php foreach($teoricosNoHechos as $tnh){ ?>
                    <tr>
                        <td><?php echo $tnh['FECHA_EX'] ?></td>
                            <form action='acciones/accion_anadir_apto_t.php'>
                                <input name="id" type="text" value="<?php echo $id ?>" hidden />
                                <input name="id_ex" type="text" value="<?php echo $tnh['NUM_EX_T'] ?>" hidden />
                                <td><select name="apto">
                                    <option value="SI">Sí</option>
                                    <option value="NO">No</option>
                                    </select></td>
                                <td><input type="submit" value="Añadir calificación" /></td>
                            </form>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset>
                <legend>Añadir examen teórico</legend>
                <form action="acciones/accion_anadir_examen_t.php" onsubmit="return notificationTExams();">
                    <input name="id" type="text" value="<?php echo $id ?>" hidden />
                    <input name="fecha_ex_t" id="fecha_ex_t" type="date" required/>
                    <input type="submit" value="Añadir"/>
                </form>
            </fieldset>
        </fieldset>
        <fieldset>
            <legend>Examenes prácticos</legend>
            <fieldset>
                <legend>Exámenes hechos</legend>
                <table>
                    <tr><th>Fecha</th> <th>Calificación</th></tr>
                    <?php foreach($practicosHechos as $ph){ ?>
                    <tr>
                        <td><?php echo $ph['FECHA_EX'] ?></td>
                        <td><?php echo $ph['APTO'] ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset>
                <legend>Exámenes por hacer</legend>
                <table>
                    <tr><th>Fecha</th> <th>¿Apto?</th></tr>
                    <?php foreach($practicosNoHechos as $pnh){ ?>
                    <tr>
                        <td><?php echo $pnh['FECHA_EX'] ?></td>
                        <form action='acciones/accion_anadir_apto_p.php'>
                                <input name="id" type="text" value="<?php echo $id ?>" hidden />
                                <input name="id_ex" type="text" value="<?php echo $pnh['NUM_EX_P'] ?>" hidden />
                                <td><select name="apto">
                                    <option value="SI">Sí</option>
                                    <option value="NO">No</option>
                                    </select></td>
                                <td><input type="submit" value="Añadir calificación" /></td>
                            </form>
                    </tr>
                    <?php } ?>
                </table>
            </fieldset>
            <fieldset>
                <legend>Añadir examen practico</legend>
                <form action="acciones/accion_anadir_examen_p.php" onsubmit="return notificationPExams();">
                    <input name="id" type="text" value="<?php echo $id ?>" hidden />
                    <input name="fecha_ex_p" id="fecha_ex_p" type="date" required/>
                    <input type="submit" value="Añadir"/>
                </form>
            </fieldset>
        </fieldset>
    </fieldset>
    <fieldset>
        <legend>
        Clases practicas
        </legend>
        <fieldset>
            <legend>
            Añadir clase practica
            </legend>
            <form action="acciones/accion_anadir_practica.php">
                <input type="text" value="<?php echo $id ?>" name="id_alumno" hidden>
                <p>Profesor: <select name="id_prof">
                    <?php foreach ($profesores as $profesor){ ?>
                    <option value="<?php echo $profesor['NUM_PROF'] ?>"><?php echo $profesor['NOMBRE'] . " " . $profesor['APELLIDOS'] ?></option>
                    <?php } ?>
                    </select>
                Coche: <select name="id_coche">
                    <?php foreach ($coches as $coche){ ?>
                    <option value="<?php echo $coche['NUM_COCHE'] ?>"><?php echo $coche['MATRICULA'] ?></option>
                    <?php } ?>
                    </select>
                Fecha: <input type="date" name="fecha_clase" required> 
                ¿Reciclaje? <select name="reciclaje">
                    <option value="SI">Sí</option>
                    <option value="NO" selected>No</option>
                    </select>
                <input type="submit" value="Añadir"></p>
            </form>
        </fieldset>
        <fieldset>
            <legend>
                Puntuacion actual
            </legend>
            <?php $puntoPalabra = $puntosActuales == 1? "punto" : "puntos" ?>
            <p>Actualmente, tiene <?php echo $puntosActuales . " " . $puntoPalabra ?> de 20.</p>
        </fieldset>
        <fieldset>
            <legend>
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
                    <td><?php echo $cr['FECHA'] ?></td>
                    <td><?php echo $cr['VALORACION'] ?></td>
                    <td><?php echo $cr['INCIDENCIA'] ?></td>
                </tr>   
            <?php } ?>
            </table>
        </fieldset>
        <fieldset>
            <legend>
                Clases por recibir
            </legend>
            <table>
                <tr>
                    <th>Fecha</th>
                </tr>
            <?php foreach($clasesPorRecibir as $cpr){ ?>
                <tr>
                    <td><?php echo $cpr['FECHA'] ?></td>
                    <form action="anadir/anadir_valoracion.php">
                        <input type="text" name="id_alumno" value="<?php echo $id ?>" hidden />
                        <input type="number" name="id_clase" value="<?php echo $cpr['NUM_CLASE'] ?>" hidden />
                        <input type="number" name="id_coche" value="<?php echo $cpr['NUM_COCHE'] ?>" hidden />
                    <td><input type="submit" value="Práctica realizada" /></td>
                    </form>
                </tr>
            <?php } ?>
            </table>
        </fieldset>
    </fieldset>
    <fieldset>
        <legend>
        Compras
        </legend>
        <a href="gestion_autoescuela.php">A gestión de productos</a>
        <table>
            <tr>
                <th>Concepto</th> <th>Fecha</th> <th>Precio</th>
            </tr>
            <?php foreach($compras_alumno as $compra){ ?>
            <tr>
                <td><?php echo $compra['PRODUCTO'] ?></td>
                <td><?php echo $compra['FECHA_COMPRA'] ?></td>
                <td><?php echo $compra['PRECIO_PROD_FACT'] ?></td>
            </tr>
            <?php } ?>
        </table>
        <!-- <p><strong>Clases prácticas: </strong> <?php echo $clasesPracticasPagadas ?></p> -->
    </fieldset>
</body>
</html>