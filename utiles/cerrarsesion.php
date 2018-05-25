<?php
    session_start();
    $_SESSION['profesor_logueado'] = false;
    unset($_SESSION['admin_try']);
    unset($_SESSION['admin_log']);
    Header('Location: ../index.php');
?>