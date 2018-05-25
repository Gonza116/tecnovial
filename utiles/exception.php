<?php

session_start();
if(!isset($_SESSION['excepcion'])){
    header("Location: ../index.php");
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Tecnovial: Error</title>
</head>
<body>
    <h1>HOSTIA PACO QUE S'AMATAO</h1>
    <p>Ha ocurrido el siguiente error: <?php echo $_SESSION['excepcion']?></p>
    <?php unset($_SESSION['excepcion']) ?>
</body>
</html>