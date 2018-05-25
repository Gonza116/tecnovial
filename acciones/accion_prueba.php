<?php
    session_start();
    $fecha = $_REQUEST['itv'];
    $_SESSION['itv'] = $fecha;
    header("Location: gestion_autoescuela.php");
?>