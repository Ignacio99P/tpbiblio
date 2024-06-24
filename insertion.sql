USE Biblioteca;

INSERT INTO Usuarios (nombre, direccion, telefono, dni) VALUES 
('Juan Pérez', 'Calle Falsa 123', '123456789', '12345678A'),
('María López', 'Avenida Siempre Viva 456', '987654321', '87654321B'),
('Carlos Sánchez', 'Calle del Sol 789', '112233445', '11223344C'),
('Ana Gómez', 'Boulevard de la Luna 101', '556677889', '22334455D'),
('Laura Rodríguez', 'Plaza Mayor 202', '998877665', '33445566E'),
('Miguel Fernández', 'Camino Real 303', '667788990', '44556677F');

INSERT INTO Libros (titulo, autor, categoria, estado) VALUES 
('Cien Años de Soledad', 'Gabriel García Márquez', 'Novela', 'disponible'),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Novela', 'disponible'),
('1984', 'George Orwell', 'Distopía', 'disponible'),
('El Principito', 'Antoine de Saint-Exupéry', 'Infantil', 'disponible'),
('Matar a un ruiseñor', 'Harper Lee', 'Novela', 'disponible'),
('La Odisea', 'Homero', 'Épica', 'disponible');

INSERT INTO Bibliotecarios (id_usuario) VALUES 
(1),
(2),
(3),
(4),
(5),
(6);


INSERT INTO Socios (id_usuario) VALUES 
(1),
(2),
(3),
(4),
(5),
(6);


INSERT INTO Prestamos (id_libro, id_usuario, fecha_prestamo, fecha_devolucion) VALUES 
(1, 1, '2024-06-01 10:00:00', '2024-06-15 10:00:00'),
(2, 2, '2024-06-02 11:00:00', '2024-06-16 11:00:00'),
(3, 3, '2024-06-03 12:00:00', '2024-06-17 12:00:00'),
(4, 4, '2024-06-04 13:00:00', '2024-06-18 13:00:00'),
(5, 5, '2024-06-05 14:00:00', '2024-06-19 14:00:00'),
(6, 6, '2024-06-06 15:00:00', '2024-06-20 15:00:00');


INSERT INTO AuditoriaPrestamos (id_prestamo, accion, fecha) VALUES 
(1, 'Prestamo Creado', '2024-06-01 10:00:00'),
(2, 'Prestamo Creado', '2024-06-02 11:00:00'),
(3, 'Prestamo Creado', '2024-06-03 12:00:00'),
(4, 'Prestamo Creado', '2024-06-04 13:00:00'),
(5, 'Prestamo Creado', '2024-06-05 14:00:00'),
(6, 'Prestamo Creado', '2024-06-06 15:00:00');

