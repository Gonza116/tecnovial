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
    <link rel="stylesheet" type="text/css" href="/tecnovial/css/exception.css">
    <title>Tecnovial: Error</title>
</head>
<body>
    <h1>Algo ha salido mal</h1>
    <p>Ha ocurrido el siguiente error: </p>
    <p><strong><?php echo $e ?></strong></p>
    <p>Asegurese de que ha escrito correctamente la URL y de que las operaciones que ha hecho son correctas.</p>
    <p>Si está seguro de que lo ha hecho todo correctamente, vuelva a intentarlo en 30 segundos.</p>
    <p>Si el error persiste, contacte con el administrador.</p>
</body>
</html>