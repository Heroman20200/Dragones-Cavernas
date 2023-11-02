/*
CONSULTA 1:
SELECT *
FROM dragon
WHERE nombre='Griffin' 
UNION
SELECT *
FROM dragon
WHERE nombre='Ocho Cabezas';

CONSULTA 2:
SELECT guerrero.idGuerrero
FROM guerrero 
INNER JOIN guerrero_compra ON guerrero_compra.idGuerrero = guerrero.idGuerrero
	INNER JOIN guerrero_forja ON guerrero_forja.idGuerrero= guerrero.idGuerrero
			WHERE guerrero_forja.idForja IN (SELECT idForja FROM forja WHERE mote='Forja del enano risueño')
			AND guerrero_compra.idTienda IN (SELECT idTienda FROM tienda WHERE nombreT='Tienda de Rolla');
CONSULTA 3:
SELECT idMago AS personaje, mago.oro
FROM mago

UNION

SELECT idGuerrero AS personaje, guerrero.oro
FROM guerrero

UNION 
SELECT idTanque AS personaje, tanque.oro
FROM tanque

ORDER BY oro desc

Consulta 4:
SELECT jugadores.nombre, SUM(DRAGONES_DERROTADOS) AS DRAGONES
FROM jugadores, (
SELECT jugador_mago.nombre,mago_forma.idMago,COUNT(grupo_derrota_dragon.nombre) AS DRAGONES_DERROTADOS
FROM mago_forma 
    INNER JOIN jugador_mago ON mago_forma.idMago=jugador_mago.idMago
		INNER JOIN grupo_derrota_dragon 
        
		WHERE mago_forma.idGrupo=grupo_derrota_dragon.idGrupo 
		GROUP BY mago_forma.idMago,jugador_mago.nombre
UNION
SELECT jugador_tanque.nombre,tanque_forma.idTanque,COUNT(grupo_derrota_dragon.nombre) AS DRAGONES_DERROTADOS
FROM tanque_forma 
    INNER JOIN jugador_tanque ON tanque_forma.idTanque=jugador_tanque.idTanque
    	INNER JOIN grupo_derrota_dragon 
        
		WHERE tanque_forma.idGrupo=grupo_derrota_dragon.idGrupo 
		GROUP BY tanque_forma.idTanque,jugador_tanque.nombre
UNION
SELECT jugador_guerrero.nombre,guerrero_forma.idGuerrero,COUNT(grupo_derrota_dragon.nombre) AS DRAGONES_DERROTADOS
FROM guerrero_forma 
    INNER JOIN jugador_guerrero ON guerrero_forma.idGuerrero=jugador_guerrero.idGuerrero
		INNER JOIN grupo_derrota_dragon 
        
		WHERE guerrero_forma.idGrupo=grupo_derrota_dragon.idGrupo 
		GROUP BY guerrero_forma.idGuerrero,jugador_guerrero.nombre
) AS A 
WHERE jugadores.nombre=A.nombre
GROUP BY(jugadores.nombre)
ORDER BY (DRAGONES) desc;

Consulta 5:
SELECT DISTINCT jugadores.nombre
FROM jugadores 
				 INNER JOIN jugador_mago ON (jugadores.nombre NOT IN (SELECT jugador_mago.nombre FROM jugador_mago)) OR jugador_mago.nombre= jugadores.nombre
				 	INNER JOIN mago_compra ON jugador_mago.idMago!=mago_compra.idMago
				 		INNER JOIN tienda ON mago_compra.idTienda=tienda.idTienda
                        
				 INNER JOIN jugador_tanque ON (jugadores.nombre NOT IN (SELECT jugador_tanque.nombre FROM jugador_tanque)) OR jugador_tanque.nombre= jugadores.nombre 
				 	INNER JOIN tanque_compra ON jugador_tanque.idTanque!=tanque_compra.idTanque AND tanque_compra.idTienda=tienda.idTienda
				 	
				 INNER JOIN jugador_guerrero ON (jugadores.nombre NOT IN (SELECT jugador_guerrero.nombre FROM jugador_guerrero)) OR jugador_guerrero.nombre= jugadores.nombre 
					INNER JOIN guerrero_compra ON jugador_guerrero.idGuerrero!=guerrero_compra.idGuerrero AND guerrero_compra.idTienda=tienda.idTienda 
						
					INNER JOIN forja WHERE tienda.nombreC IN (SELECT forja.nombreC FROM forja GROUP BY(forja.nombreC) HAVING COUNT(forja.idForja)>2 );
Consulta 6: 
SELECT idTanque
FROM tanque_arma
WHERE idTanque IN (
	SELECT  idTanque FROM tanque_arma
		GROUP BY (idTanque) HAVING COUNT(idHacha)=1) 
	AND idHacha= 'Hacha de doble punta';
    
Consulta 7: 
SELECT idGuerrero, vida, fuerza
FROM guerrero 
WHERE NOT EXISTS (SELECT idDruida FROM druida 
				  WHERE idDruida NOT IN (SELECT idDruida
										 FROM guerrero_interactua
										 WHERE guerrero.idGuerrero=guerrero_interactua.idGuerrero));
/*
Consulta 8:
SELECT idMago, nivel
FROM mago
WHERE NOT EXISTS(SELECT idEspectro FROM espectros WHERE idEspectro NOT IN 
					(SELECT idEspectro FROM mago_ataca WHERE idMago=mago.idMago))
	  AND 
	  NOT EXISTS(SELECT tipo FROM daga WHERE tipo!='madera' AND tipo NOT IN 
					(SELECT tipo FROM mago_compra WHERE idMago=mago.idMago));
Consulta 9:
SELECT idTanque
FROM tanque_forma,(
	SELECT COUNT(*) cuenta
	FROM tanque_forma,(
		SELECT MAX(idTanque) maximo
		FROM tanque_forma
		)AS A
	WHERE idTanque=maximo
	)AS B
GROUP BY idTanque, B.cuenta HAVING COUNT(*)=B.cuenta;

Consulta 10:
SELECT hachas.idHacha,mote
FROM hachas 
	JOIN tanque_forja ON hachas.idHacha=tanque_forja.idhacha 
		JOIN forja ON tanque_forja.idForja=forja.idForja
			WHERE hachas.peso=(SELECT min(peso)FROM hachas);
*/ 
