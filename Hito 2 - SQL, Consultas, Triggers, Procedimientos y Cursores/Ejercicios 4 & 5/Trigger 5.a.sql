DELIMITER $$
CREATE TRIGGER vida_mago BEFORE UPDATE ON mago
FOR EACH ROW 
BEGIN
IF NEW.idMago IN (SELECT mago_forma.idMago
FROM mago_forma 
    INNER JOIN jugador_mago ON mago_forma.idMago=jugador_mago.idMago
	INNER JOIN grupo_derrota_dragon 
	WHERE mago_forma.idGrupo=grupo_derrota_dragon.idGrupo 
	GROUP BY(mago_forma.idMago) HAVING COUNT(grupo_derrota_dragon.nombre)>3)
THEN 
SET NEW.vida=NEW.vida+5;
END IF;
END$$

CREATE TRIGGER vida_tanque BEFORE UPDATE ON tanque
FOR EACH ROW 
BEGIN
IF NEW.idTanque IN (SELECT tanque_forma.idTanque
FROM tanque_forma 
    INNER JOIN jugador_tanque ON tanque_forma.idTanque=jugador_tanque.idTanque
    INNER JOIN grupo_derrota_dragon 
	WHERE tanque_forma.idGrupo=grupo_derrota_dragon.idGrupo 
	GROUP BY(tanque_forma.idTanque) HAVING COUNT(grupo_derrota_dragon.nombre)>3)
THEN 
SET NEW.vida=NEW.vida+5;
END IF;
END$$

CREATE TRIGGER vida_guerrero BEFORE UPDATE ON guerrero
FOR EACH ROW 
BEGIN
IF NEW.idGuerrero IN (SELECT guerrero_forma.idGuerrero
FROM guerrero_forma
    INNER JOIN jugador_guerrero ON guerrero_forma.idGuerrero=jugador_guerrero.idGuerrero
    INNER JOIN grupo_derrota_dragon 
	WHERE guerrero_forma.idGrupo=grupo_derrota_dragon.idGrupo 
	GROUP BY(guerrero_forma.idGuerrero) HAVING COUNT(grupo_derrota_dragon.nombre)>3)
THEN 
SET NEW.vida=NEW.vida+5;
END IF;
END$$
DELIMITER ;