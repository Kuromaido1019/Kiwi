<?php

$flag = $_GET['flag'];
$descripcion;

if ($flag == "a") {
    $descripcion = "";
    header('Location: ../Vistas/clase_UnirPalabras.html');
} else if ($flag == "b") {
    $descripcion = "";
    header('Location: ../Vistas/clase_SumarCirculos.html');
} else {
    header('Location: ../Vistas/');
}
