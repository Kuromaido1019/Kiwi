<?php

    
    function conectarBD(){
        $host="";
        $user="";
        $pass="";
        $db="";
        $conexion=mysqli_connect($host,$user,$pass,$db) or die("Error al conectar".mysql_error());
        return $conexion;
    }


?>