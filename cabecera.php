<!DOCTYPE html>
<html lang="es">
<head>
    <title>Tecnovial</title>
    <meta charset="utf-8">
    <link rel = "stylesheet" type="text/css" href="css/cabecera.css">
</head>
<body>
    <header id="cabecera">
        <nav id="head">
        <form action="acciones/accion_pestañas.php">
            <ul class="topnav" id="header">
            <li id="alumnos"><input type="submit" name="gestion_de_alumnos" value="Gestión de alumnos"></li>
            <li id="autoescuela"><input type="submit" name="gestion_de_autoescuela" value="Gestión de autoescuela"></li>
            <li  id="calendario"><input type="submit" name="calendario" value="Calendario"></li>
            <li class="icon">
				<a href="javascript:void(0);" onclick="myToggleMenu()">&#9776;</a>
            </ul>
        </form>
        </nav>
    </header>
</body>
</html>