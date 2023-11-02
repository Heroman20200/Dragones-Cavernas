DELIMITER $$
CREATE PROCEDURE jugadores_afk()
BEGIN 
    DELETE 
    FROM jugadores
    WHERE (nombre IN 
					 (SELECT nombre FROM jugador_mago WHERE (nombre=jugadores.nombre AND idMago IN (SELECT idMago FROM mago WHERE datediff(curdate(),ultima_conexion)>=60))) 
					  OR jugadores.nombre NOT IN (SELECT nombre FROM jugador_mago))
	AND   (nombre IN			   
					 (SELECT nombre FROM jugador_tanque WHERE (nombre=jugadores.nombre AND idTanque IN (SELECT idTanque FROM tanque WHERE datediff(curdate(),ultima_conexion)>=60))) 
                      OR jugadores.nombre NOT IN (SELECT nombre FROM jugador_tanque))
	AND   (nombre IN 
					 (SELECT nombre FROM jugador_guerrero WHERE (nombre=jugadores.nombre AND idGuerrero IN (SELECT idGuerrero FROM guerrero WHERE datediff(curdate(),ultima_conexion)>=60))) 
					  OR jugadores.nombre NOT IN (SELECT nombre FROM jugador_guerrero));
                      
	DELETE FROM mago WHERE idMago NOT IN (SELECT idMago FROM jugador_mago WHERE nombre IN (SELECT nombre FROM jugadores));
	DELETE FROM tanque WHERE idTanque NOT IN (SELECT idTanque FROM jugador_tanque WHERE nombre IN (SELECT nombre FROM jugadores));
	DELETE FROM guerrero WHERE idGuerrero NOT IN (SELECT idGuerrero FROM jugador_guerrero WHERE nombre IN (SELECT nombre FROM jugadores));
END$$
DELIMITER ;

SELECT * FROM jugadores;
SELECT * FROM mago;
SELECT * FROM guerrero;
SELECT * FROM tanque;

CALL jugadores_afk();

SELECT * FROM jugadores;
SELECT * FROM mago;
SELECT * FROM guerrero;
SELECT * FROM tanque;

