<?php

    session_start();
    if(!isset($_SESSION['excepcion'])){
        header("Location: ../index.php");
    }

    $e = $_SESSION['excepcion'];
    unset($_SESSION['excepcion']);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Tecnovial: Error</title>
</head>
<body>
    <h1>Algo ha salido mal</h1>
    <p>Ha ocurrido el siguiente error: <?php echo $e ?></p>
    <p>Si el error persiste, contacte con su administrador.</p>
</body>
</html>