<?php
    if(isset($_REQUEST['gestion_de_alumnos'])){
        header("Location: ../lista_alumnos.php");
    }

    if(isset($_REQUEST['gestion_de_autoescuela'])){
        header("Location: ../gestion_autoescuela.php");
    }

    if(isset($_REQUEST['calendario'])){
        header("Location: ../calendario.php");
    }

?>