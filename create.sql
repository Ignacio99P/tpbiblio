CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    categoria VARCHAR(255),
    estado ENUM('disponible', 'prestado') NOT NULL DEFAULT 'disponible'
);

CREATE TABLE Bibliotecarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

CREATE TABLE Socios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

CREATE TABLE Prestamos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_libro INT,
    id_usuario INT,
    fecha_prestamo DATETIME NOT NULL,
    fecha_devolucion DATETIME,
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

CREATE TABLE AuditoriaPrestamos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_prestamo INT,
    accion VARCHAR(255) NOT NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id)
);


