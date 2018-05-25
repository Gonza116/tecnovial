<?php
    session_start();
    require_once("../utiles/gestionDB.php");
    require_once("../utiles/gestionarAlumnos.php");
    $conexion = crearConexionBD();

    $hayErrores = false;
    if(isset($_SESSION['error'])){
        $error = $_SESSION['error'];
        $hayErrores = true;
        unset($_SESSION['error']);
    }

    $alumnos = consultarAlumnos($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Tecnovial: Creando nuevo alumno</title>
    <script src="../js/validacion_alumno.js" type="text/javascript"></script>
    <meta charset="utf-8">
</head>
<body>
    <?php if($hayErrores){ ?>
    <fieldset>
        <legend>Han ocurrido errores</legend>
        <?php foreach($error as $e){ ?>
        <p><?php echo $e ?></p>
        <?php } ?>
    </fieldset>
    <?php } ?>
    
    <form action="../acciones/accion_anadir_alumno.php" method="post" onsubmit="return validarFormulario();">
        <p>Nombre: <input type="text" name="alum_nombre" id="alum_nombre" required></p>
        <p>Apellidos: <input type="text" name="alum_apellidos" id="alum_apellidos" required></p>
        <p>DNI: <input type="text" name="alum_DNI" id="alum_DNI" required oninput="validarDNI();"></p>
        <p>Fecha de nacimiento: <input type="date" name="alum_fecha_nac" id="alum_fecha_nac" required></p>
        <p>Fecha de matriculación: <input type="date" name="alum_fecha_mat" id="alum_fecha_mat" required></p>
        <p>Teléfono: <input type="text" name="alum_telefono" id="alum_telefono" oninput="validarTelefono()"></p>
        <p>Restricciones: <input type="text" name="alum_rest" id="alum_rest"></p>
        <p>Estudios: <input type="radio" name="alum_estudios" id="alum_estudios0" value="BASICOS" required>Básicos<br>
                     <input type="radio" name="alum_estudios" id="alum_estudios1" value="SECUNDARIOS">Secundarios<br>
                     <input type="radio" name="alum_estudios" id="alum_estudios2" value="FORMACION PROFESIONAL">Formación Profesional<br>
                     <input type="radio" name="alum_estudios" id="alum_estudios3" value="UNIVERSITARIOS">Universitarios</p>
        <p>Domicilio: <input type="text" name="alum_domicilio" id="alum_domicilio" required></p>
        <p>Oportunidades: <input type="number" name="alum_opor" id="alum_opor" value="3" min="0" max="3" required></p>
        <p>Código de amigo (si se aplica): <select name="alum_amigo" id="alum_amigo">
            <?php foreach($alumnos as $alumno) { ?>
                <option value="<?php echo $alumno['NUM_ALUM'] ?>"><?php echo $alumno['APELLIDOS'] ?>, <?php echo $alumno['NOMBRE'] ?></option>
            <?php } ?>
                <option value="">No</option>
            </select>
        <p><input type="submit" value="Enviar"> <input type="reset" value="Reestablecer"></p>
    </form>
</body>
</html>