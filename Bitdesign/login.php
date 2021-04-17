<?php

 include("db.php");

$nombre = $_POST["txtusuario"];
$pass = $_POST["txtpassword"];
if (empty($nombre) or empty($pass)) {
	echo '<script type="text/javascript">
	alert("¡Algunos campos estan vacios, favor de rellenarlos!");
	window.location="index.html";
	</script>;';
}
else{
	$query = mysqli_query($conn,"SELECT * FROM usuarios WHERE Nombre = '".$nombre."' and contraseña = '".$pass."'");
	$nr = mysqli_num_rows($query);

	if($nr == 1){
		header("Location: /aplication/views/home.html");
		echo "Bienvenido:" .$nombre;
		}

	else if ($nr == 0) {
		header("Location: index.html");
		}
}
?>