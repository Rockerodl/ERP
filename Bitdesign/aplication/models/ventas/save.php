<?php
include("db.php");

if(isset($_POST["save"])){
    //$id_venta = $_POST["id_ventas"];
    $empleado = $_POST["vendedor"];
    $producto = $_POST["producto"];
    $cantidad = $_POST["cantidad"];
    //$precio_unitario = $_POST["precio_unitario"];
    //$fecha = $_POST["fecha_venta"];
    //$valor = $_POST["valor_venta"];

    //Valida que cantidad tenga un numero positivo
    if($cantidad>=0){

        $query = "SELECT precio FROM inventario WHERE id = '$producto'";
        $run = mysqli_query($conn, $query);

        while($row = mysqli_fetch_array($run)){
            $campo = $row[0];
        }
        
        $precio_venta = $campo*$cantidad;

        $query = mysqli_query($conn, "SELECT cantidad FROM inventario where id = '$producto';");
        $row = mysqli_fetch_array($query);
        $variable = $row['cantidad'];

        if(($variable - $cantidad) >= 0){
            $query = "UPDATE inventario SET cantidad = cantidad - '$cantidad' where id = '$producto';";
            $query .= "INSERT INTO ventas (id_empleado_venta, cantidad, valor_venta, id_producto) VALUES ('$empleado', '$cantidad', '$precio_venta', '$producto');";
            $result = mysqli_multi_query($conn, $query);
            if(!$result){
                die("Query Failed!");
            }
            header("Location: ../../views/ventas.html");
            echo '<script language="javascript">';
            echo 'alert("Datos ingresados!")';
            echo '</script>';
        }

        else{
            header("Location: ../../views/ventas.html");
            echo '<script language="javascript">';
            echo 'alert("Cantidad insuficiente")';
            echo '</script>';
        }
    }

    else{
        header("Location: ../../views/ventas.html");
        echo '<script language="javascript">';
        echo 'alert("Favor de ingresar una cantidad valida")';
        echo '</script>';
    }
}
?>
