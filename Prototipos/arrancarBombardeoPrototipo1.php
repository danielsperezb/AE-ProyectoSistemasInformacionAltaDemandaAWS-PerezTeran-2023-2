<?php

while (true) {
$servername = "databaseprototipo1.co2c3dt7yhhx.us-east-1.rds.amazonaws.com";
$username = "admin";
$password = "password";
$dbname = "ejemplo_db";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Conexión exitosa<br>";
}

// Leer el contenido del archivo SQL
$sqlFile = 'script.sql';
$sqlCommands = file_get_contents($sqlFile);

// Dividir comandos SQL por punto y coma
$sqlArray = preg_split("/;\s*(?=([^']*'[^']*')*[^']*$)/", $sqlCommands);

// Limpiar cada comando SQL de espacios y saltos de línea al final
foreach ($sqlArray as &$sqlCommand) {
    $sqlCommand = trim($sqlCommand);
}

// Ejecutar cada comando SQL
foreach ($sqlArray as $sqlCommand) {
    if (!empty($sqlCommand)) {
        // Solo ejecutar consultas SELECT
        if (stripos($sqlCommand, 'SELECT') !== false) {
            $result = $conn->query($sqlCommand);

            if ($result) {
                echo "Comando SQL ejecutado correctamente: $sqlCommand<br>";
                while ($row = $result->fetch_assoc()) {
                    //echo "Resultado: " . implode(", ", $row) . "<br>";
                }
                $result->free();
            } else {
                echo "Error al ejecutar el comando SQL: " . $conn->error . "<br>";
                echo "Comando SQL: $sqlCommand<br>";
            }
        } else {
            // Ejecutar otros tipos de consultas (INSERT, UPDATE, DELETE, etc.)
            if ($conn->query($sqlCommand) === TRUE) {
                echo "Comando SQL ejecutado correctamente: $sqlCommand<br>";
            } else {
                echo "Error al ejecutar el comando SQL: " . $conn->error . "<br>";
                echo "Comando SQL: $sqlCommand<br>";
            }
        }
    }
}

// Cerrar conexión
$conn->close();
 // Pausar el script por un período de tiempo antes de volver a ejecutarlo
    //sleep(5); // espera 60 segundos antes de volver a ejecutar el bucle
}

?>
