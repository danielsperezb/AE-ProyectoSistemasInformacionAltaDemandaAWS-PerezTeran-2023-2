-- Crear base de datos
CREATE DATABASE IF NOT EXISTS prototipo2;
USE prototipo2;

SET SQL_SAFE_UPDATES = 0;
-- Crear tablas
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT
);

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(50),
    precio DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    producto_id INT,
    cantidad INT,
    fecha_pedido DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS productos_categorias (
    producto_id INT,
    categoria_id INT,
    PRIMARY KEY (producto_id, categoria_id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Añadir registros
INSERT INTO usuarios (nombre, edad) VALUES ('Juan', 25), ('María', 30), ('Carlos', 22);
INSERT INTO productos (nombre_producto, precio) VALUES ('Laptop', 1200.50), ('Teléfono', 500.75), ('Cámara', 300.25);
INSERT INTO categorias (nombre_categoria) VALUES ('Electrónica'), ('Tecnología'), ('Fotografía');

-- Actualizar registros
UPDATE usuarios SET edad = 26 WHERE nombre = 'Juan';

-- Añadir más registros
INSERT INTO productos (nombre_producto, precio) VALUES ('Tablet', 300.00), ('Smartwatch', 150.50);
INSERT INTO productos_categorias (producto_id, categoria_id) VALUES (1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3);

-- Eliminar registros
DELETE FROM usuarios WHERE nombre = 'Carlos';
DELETE FROM usuarios WHERE nombre = 'Alberto';
DELETE FROM usuarios WHERE nombre = 'Diego';
DELETE FROM usuarios WHERE nombre = 'Isabel';
DELETE FROM usuarios WHERE nombre = 'Miguel';
DELETE FROM usuarios WHERE nombre = 'Pedro';
DELETE FROM usuarios WHERE nombre = 'Sofía';
DELETE FROM usuarios WHERE nombre = 'Laura';

-- Añadir más registros
INSERT INTO usuarios (nombre, edad) VALUES ('María', 30);
INSERT INTO usuarios (nombre, edad) VALUES ('Carlos', 40);
INSERT INTO usuarios (nombre, edad) VALUES ('Ana', 25);
INSERT INTO usuarios (nombre, edad) VALUES ('Roberto', 42);
INSERT INTO usuarios (nombre, edad) VALUES ('Laura', 28);
INSERT INTO usuarios (nombre, edad) VALUES ('Pedro', 35);
INSERT INTO usuarios (nombre, edad) VALUES ('Sofía', 27);
INSERT INTO usuarios (nombre, edad) VALUES ('Juan', 33);
INSERT INTO usuarios (nombre, edad) VALUES ('Elena', 29);
INSERT INTO usuarios (nombre, edad) VALUES ('Luis', 38);
INSERT INTO usuarios (nombre, edad) VALUES ('Lucía', 31);
INSERT INTO usuarios (nombre, edad) VALUES ('Miguel', 45);
INSERT INTO usuarios (nombre, edad) VALUES ('Isabel', 26);
INSERT INTO usuarios (nombre, edad) VALUES ('Francisco', 37);
INSERT INTO usuarios (nombre, edad) VALUES ('Carmen', 39);
INSERT INTO usuarios (nombre, edad) VALUES ('Javier', 32);
INSERT INTO usuarios (nombre, edad) VALUES ('Rosa', 34);
INSERT INTO usuarios (nombre, edad) VALUES ('Alberto', 41);
INSERT INTO usuarios (nombre, edad) VALUES ('Patricia', 28);
INSERT INTO usuarios (nombre, edad) VALUES ('Diego', 36);


DELETE FROM usuarios WHERE nombre = 'Lucia';


