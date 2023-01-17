<?php
    include 'conexion.php';

    $nombre=$_POST['nombre'];
    $institucion=$_POST['institucion'];
    $tiposerv=$_POST['tiposerv'];
    $direccion=$_POST['direccion'];
    $numcel=$_POST['numcel'];
    $correo=$_POST['correo'];
    $numemerg=$_POST['numemerg'];
    //$grupos=$_POST['grupos'];
    $insertar="INSERT INTO Alumnos(nombre,institucion,tiposerv,direccion,numcel,correo,numemerg) VALUES ('$nombre','$institucion','$tiposerv','$direccion','$numcel','$correo','$numemerg')";
    echo $nombre.$institucion.$tiposerv.$direccion.$numcel.$correo.$numemerg ;
    /*$resultadp=mysqli_query($conn,$insertar);
    if (!$resultado) {
        # code...
        echo 'error al Registrarse';
    }else{
        echo 'Alumno registrado exitosamente';
    }
    */mysqli_close($conn)
?>
