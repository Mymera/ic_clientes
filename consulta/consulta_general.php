<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <link rel="stylesheet" href="./Bootstrap-5.3.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="./assets/css/styles.css">
  <link href="./iconos/fontawesome-6.5.2/css/fontawesome.css" rel="stylesheet" />
  <link href="./iconos/fontawesome-6.5.2/css/brands.css" rel="stylesheet" />
  <link href="./iconos/fontawesome-6.5.2/css/solid.css" rel="stylesheet" />
  <script src="./Bootstrap-5.3.3/js/bootstrap.bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>

<div class="login">

    <article class="centrarcont col-12 vh-100" > 
    <section class="cajalogin h-75"> 

        <div class="col-12 h-100 float-start p-5">

            <div class="w-50 ">
                <img src="../img/evaluna.png" class="img-fluid h-100" style="max-width: 30%; min-width: 30%;" alt="login 1 logo"/>
            </div>
            <div class="col-12 text-center titulologin">      
                <h5 class="titulologin my-5"> Este es nuestro registro de clientes para hoy: </h5>      
        </div>

    <div class="mt-5">
        
        <table class="table table-striped table-bordered mt-3 text-center">
        <thead class="table-dark">         
                <tr >
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Ciudad</th>
                    <th>Tipo Teléfono</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Configuración de la base de datos
                $host = "localhost";  // Cambia a la dirección de tu servidor de base de datos
                $user = "root"; // Cambia al nombre de usuario de tu base de datos
                $password = ""; // Cambia a la contraseña de tu base de datos
                $dbname = "sistema_telefonico"; // Cambia al nombre de tu base de datos

                // Crear la conexión
                $conn = new mysqli($host, $user, $password, $dbname);

                // Verificar la conexión
                if ($conn->connect_error) {
                    die("<div class='alert alert-danger'>Conexión fallida: " . $conn->connect_error . "</div>");
                }

                // Escribir una consulta
                $sql = "select p.dir_nombre,p.dir_direccion,c.ciud_nombre,p.dir_tipo_tel,p.dir_tel,p.dir_email
                        from personas p left join ciudades c on p.dir_ciud_id =c.ciud_id"; // Cambia 'tu_tabla' y las columnas según tu base de datos
                $result = $conn->query($sql);

                // Verificar si hay resultados
                if ($result->num_rows > 0) {
                    // Recorrer los datos
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["dir_nombre"] . "</td>";
                        echo "<td>" . $row["dir_direccion"] . "</td>";
                        echo "<td>" . $row["ciud_nombre"] . "</td>";
                        echo "<td>" . $row["dir_tipo_tel"] . "</td>";
                        echo "<td>" . $row["dir_tel"] . "</td>";
                        echo "<td>" . $row["dir_email"] . "</td>";
                        

                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='3' class='text-center'>No se encontraron resultados</td></tr>";
                }

                // Cerrar la conexión
                $conn->close();
                ?>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
