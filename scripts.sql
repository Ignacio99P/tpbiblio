use biblioteca;

CREATE PROCEDURE registrar_prestamo(
    IN p_id_libro INT,
    IN p_id_usuario INT,
    IN p_fecha_prestamo DATETIME
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Prestamos
        WHERE id_libro = p_id_libro
        AND fecha_devolucion IS NULL
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El libro ya está prestado.';
    ELSE
        INSERT INTO Prestamos (id_libro, id_usuario, fecha_prestamo)
        VALUES (p_id_libro, p_id_usuario, p_fecha_prestamo);
    END IF;
END;

SHOW PROCEDURE STATUS WHERE Db = 'Biblioteca';

CALL registrar_prestamo(1, 2, '2024-06-23 10:00:00');

CREATE VIEW vista_prestamos_actuales AS
SELECT
    p.id AS id_prestamo,
    l.titulo AS nombre_libro,
    u.nombre AS nombre_usuario,
    p.fecha_prestamo
FROM
    Prestamos p
    INNER JOIN Libros l ON p.id_libro = l.id
    INNER JOIN Usuarios u ON p.id_usuario = u.id
WHERE
    p.fecha_devolucion IS NULL;


DELIMITER //

CREATE TRIGGER actualizar_fecha_devolucion
BEFORE UPDATE ON Prestamos
FOR EACH ROW
BEGIN
    IF NEW.fecha_devolucion IS NOT NULL THEN
        SET NEW.fecha_devolucion = NOW();
    END IF;
END //

DELIMITER ;

START TRANSACTION;

INSERT INTO Prestamos (id_libro, id_usuario, fecha_prestamo)
VALUES (1, 2, NOW());

SET @id_prestamo = LAST_INSERT_ID();

UPDATE Libros
SET estado = 'prestado'
WHERE id = 1;


INSERT INTO AuditoriaPrestamos (id_prestamo, accion, fecha)
VALUES (@id_prestamo, 'Registro de préstamo', NOW());


COMMIT;
