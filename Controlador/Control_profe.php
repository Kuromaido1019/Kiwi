<?php
    class CRUD_profe{

        /**
         * @param $rut_profesor esta sera la PK de la tabla profesor
         * @param $nombre_profesor nombre del profesor en cuestion
         * @param $apellido_profesor apellido del profesor en cuestion
         * @param $estado_profesor estado del profesor dentro del sistema
         */
         
        public function crear_profesor($rut_profesor,$nombre_profesor,$apellido_profesor,$estado_profesor){
            $con = conectarBD();
            $query="INSERT INTO profesor(rut_profesor,nombre_profesor,apellido_profesor,estado_profesor) VALUES('$rut_profesor','$nombre_profesor','$apellido_profesor','$estado_profesor')";
            $sql=mysqli_query($con,$query);
            $con->close();
            
        }
    }

?>