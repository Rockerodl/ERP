<?php

 include("db.php");

$nombre = $_POST["txtusuario"];
$pass = $_POST["txtpassword"];
$correo = $_POST["txtcorreo"];
if(empty($nombre) or empty($pass)){
	echo '<script type="text/javascript">
	alert("¡Algunos campos estan vacios, favor de rellenarlos!");
	window.location="index.html";
	</script>;';
}
else{
	$query = "INSERT INTO usuarios (Nombre, contraseña, correo) VALUES ('$nombre','$pass','$correo')";
	$result = mysqli_query($conn, $query);

	if(!$result){
		die("Query Failed!");
	}
	header("Location: index.html");
}
?>