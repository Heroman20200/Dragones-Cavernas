DELIMITER $$
CREATE PROCEDURE guerrero_vida()
BEGIN
	DECLARE idG VARCHAR(250) DEFAULT NULL;
    DECLARE done INT DEFAULT FALSE;
    DECLARE guerrero_vida_cursor CURSOR FOR
		SELECT guerrero.idGuerrero
		FROM guerrero INNER JOIN guerrero_ataca ON guerrero.idGuerrero=guerrero_ataca.idGuerrero
		GROUP BY idGuerrero
		HAVING COUNT(guerrero_ataca.idGoblin)>=3; /*(50)*/
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	OPEN guerrero_vida_cursor; 
	read_loop: LOOP
	FETCH guerrero_vida_cursor INTO idG; 
	IF done THEN
	LEAVE read_loop;
	END IF;
	UPDATE guerrero
    SET vida= vida+10
    WHERE idG=idGuerrero;
	END LOOP;
	CLOSE guerrero_vida_cursor;
    
END$$
DELIMITER ;