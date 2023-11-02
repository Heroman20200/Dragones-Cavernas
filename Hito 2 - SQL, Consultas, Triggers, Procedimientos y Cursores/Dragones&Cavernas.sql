CREATE SCHEMA DC
DEFAULT CHARACTER SET utf8
COLLATE utf8_spanish2_ci;

USE DC;

CREATE TABLE daga(
tipo VARCHAR(250) NOT NULL,
PRIMARY KEY(tipo)
);

CREATE TABLE mago(
idMago VARCHAR(250) NOT NULL,
fuerza INT DEFAULT NULL,
nivel INT DEFAULT NULL,
vida INT DEFAULT NULL,
mana INT DEFAULT NULL,
oro INT DEFAULT NULL,
tipo VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(idMago),
CONSTRAINT FOREIGN KEY(tipo) REFERENCES daga (tipo)
);

CREATE TABLE baculos(
idBaculo VARCHAR(250) NOT NULL,
daño INT DEFAULT NULL,
peso INT DEFAULT NULL,
PRIMARY KEY(idBaculo)
);

CREATE TABLE mago_arma(
idBaculo VARCHAR(250) NOT NULL,
idMago VARCHAR(250) NOT NULL,
PRIMARY KEY(idBaculo, idMago),
CONSTRAINT FOREIGN KEY(idBaculo) REFERENCES baculos (idBaculo),
CONSTRAINT FOREIGN KEY(idMago) REFERENCES mago(idMago) ON DELETE CASCADE
);

CREATE TABLE habilidadesM(
nombre VARCHAR(250) NOT NULL,
descripcion VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(nombre)
);

CREATE TABLE mago_habilidad(
nombre varchar(250) NOT NULL,
idMago VARCHAR(250) NOT NULL,
PRIMARY KEY(nombre, idMago),
CONSTRAINT FOREIGN KEY (nombre) REFERENCES habilidadesM (nombre),
CONSTRAINT FOREIGN KEY (idMago) REFERENCES mago (idMago) ON DELETE CASCADE
);

CREATE TABLE espectros(
idEspectro INT NOT NULL,
nombre VARCHAR(250) DEFAULT NULL,
vida INT DEFAULT NULL,
PRIMARY KEY(idEspectro)
);

CREATE TABLE mago_ataca(
idEspectro INT NOT NULL,
idMago VARCHAR(250) NOT NULL,
oro INT DEFAULT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY(idEspectro, idMago, fecha),
CONSTRAINT FOREIGN KEY (idEspectro) REFERENCES espectros (idEspectro),
CONSTRAINT FOREIGN KEY (idMago) REFERENCES mago (idMago) ON DELETE CASCADE
);

CREATE TABLE tanque(
idTanque VARCHAR(250) NOT NULL,
fuerza INT DEFAULT NULL,
nivel INT DEFAULT NULL,
vida INT DEFAULT NULL,
mana INT DEFAULT NULL,
oro INT DEFAULT NULL,
tipo VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(idTanque),
CONSTRAINT FOREIGN KEY (tipo) REFERENCES daga (tipo)
);

CREATE TABLE hachas(
idHacha VARCHAR(250) NOT NULL,
daño INT DEFAULT NULL,
peso INT DEFAULT NULL,
PRIMARY KEY(idHacha)
);

CREATE TABLE tanque_arma(
idHacha VARCHAR(250) NOT NULL,
idTanque VARCHAR(250) NOT NULL,
PRIMARY KEY(idHacha, idTanque),
CONSTRAINT FOREIGN KEY(idHacha) REFERENCES hachas (idHacha),
CONSTRAINT FOREIGN KEY(idTanque) REFERENCES tanque (idTanque) ON DELETE CASCADE
);

CREATE TABLE habilidadesT(
nombre VARCHAR(250) NOT NULL,
descripcion VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(nombre)
);

CREATE TABLE tanque_habilidad(
nombre varchar(250) NOT NULL,
idTanque VARCHAR(250) NOT NULL,
PRIMARY KEY(nombre, idTanque),
CONSTRAINT FOREIGN KEY (nombre) REFERENCES habilidadesT (nombre),
CONSTRAINT FOREIGN KEY (idTanque) REFERENCES tanque (idTanque) ON DELETE CASCADE
);

CREATE TABLE trolls(
idTroll INT NOT NULL,
nombre VARCHAR(250) DEFAULT NULL,
vida INT DEFAULT NULL, 
PRIMARY KEY(idTroll)
);

CREATE TABLE tanque_ataca(
idTroll INT NOT NULL,
idTanque VARCHAR(250) NOT NULL, 
oro INT DEFAULT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY(idTroll, idTanque, fecha),
CONSTRAINT FOREIGN KEY (idTroll) REFERENCES trolls (idTroll),
CONSTRAINT FOREIGN KEY (idTanque) REFERENCES tanque (idTanque) ON DELETE CASCADE
);

CREATE TABLE guerrero(
idGuerrero VARCHAR(250) NOT NULL,
fuerza INT DEFAULT NULL,
nivel INT DEFAULT NULL,
vida INT DEFAULT NULL,
mana INT DEFAULT NULL,
oro INT DEFAULT NULL,
tipo VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(idGuerrero),
CONSTRAINT FOREIGN KEY(tipo) REFERENCES daga (tipo)
);

CREATE TABLE espadas(
idEspada VARCHAR(250) NOT NULL,
daño INT DEFAULT NULL,
peso INT DEFAULT NULL,
PRIMARY KEY(idEspada)
);

CREATE TABLE guerrero_arma(
idEspada VARCHAR(250) NOT NULL,
idGuerrero VARCHAR(250) NOT NULL,
PRIMARY KEY(idEspada, idGuerrero),
CONSTRAINT FOREIGN KEY(idEspada) REFERENCES espadas (idEspada),
CONSTRAINT FOREIGN KEY(idGuerrero) REFERENCES guerrero (idGuerrero) ON DELETE CASCADE
);

CREATE TABLE habilidadesG(
nombre VARCHAR(250) NOT NULL,
descripcion VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(nombre)
);

CREATE TABLE guerrero_habilidad(
nombre varchar(250) NOT NULL,
idGuerrero VARCHAR(250) NOT NULL,
PRIMARY KEY(nombre, idGuerrero),
CONSTRAINT FOREIGN KEY (nombre) REFERENCES habilidadesG (nombre),
CONSTRAINT FOREIGN KEY (idGuerrero) REFERENCES guerrero (idGuerrero) ON DELETE CASCADE
);

CREATE TABLE goblins(
idGoblin INT NOT NULL,
nombre VARCHAR(250) DEFAULT NULL,
vida INT DEFAULT NULL,
PRIMARY KEY(idGoblin)
);

CREATE TABLE guerrero_ataca(
idGoblin INT NOT NULL,
idGuerrero VARCHAR(250) NOT NULL, 
fecha DATETIME NOT NULL,
oro INT DEFAULT NULL,
PRIMARY KEY(idGoblin, idGuerrero, fecha),
CONSTRAINT FOREIGN KEY (idGoblin) REFERENCES goblins (idGoblin),
CONSTRAINT FOREIGN KEY (idGuerrero) REFERENCES guerrero (idGuerrero) ON DELETE CASCADE
);

CREATE TABLE dragon(
nombre VARCHAR(250) NOT NULL,
vida INT DEFAULT NULL,
PRIMARY KEY(nombre)
);

CREATE TABLE dragon_desbloquea_dragon(
sujeto VARCHAR(250) NOT NULL,
objeto VARCHAR(250) NOT NULL,
PRIMARY KEY(sujeto, objeto),
CONSTRAINT FOREIGN KEY (sujeto) REFERENCES dragon(nombre),
CONSTRAINT FOREIGN KEY(objeto) REFERENCES dragon(nombre)
);

CREATE TABLE grupo(
idGrupo INT NOT NULL,
PRIMARY KEY(idGrupo)
);

CREATE TABLE mago_forma(
idMago VARCHAR(250) NOT NULL,
idGrupo INT NOT NULL,
fecha_entrada DATE NOT NULL,
fecha_salida DATE NOT NULL,
PRIMARY KEY(idMago, idGrupo, fecha_entrada, fecha_salida),
CONSTRAINT FOREIGN KEY (idMago) REFERENCES mago (idMago) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idGrupo) REFERENCES grupo (idGrupo) 
);

CREATE TABLE tanque_forma(
idTanque VARCHAR(250) NOT NULL,
idGrupo INT NOT NULL,
fecha_entrada DATE NOT NULL,
fecha_salida DATE NOT NULL,
PRIMARY KEY(idTanque, idGrupo, fecha_entrada, fecha_salida),
CONSTRAINT FOREIGN KEY (idTanque) REFERENCES tanque (idTanque) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idGrupo) REFERENCES grupo (idGrupo)
);

CREATE TABLE guerrero_forma(
idGuerrero VARCHAR(250) NOT NULL,
idGrupo INT NOT NULL,
fecha_entrada DATE NOT NULL,
fecha_salida DATE NOT NULL,
PRIMARY KEY(idGuerrero, idGrupo, fecha_entrada, fecha_salida),
CONSTRAINT FOREIGN KEY (idGuerrero) REFERENCES guerrero (idGuerrero) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idGrupo) REFERENCES grupo (idGrupo)
);

CREATE TABLE grupo_derrota_dragon(
nombre VARCHAR(250) NOT NULL,
idGrupo INT NOT NULL,
fecha DATE DEFAULT NULL,
PRIMARY KEY(nombre, idGrupo),
CONSTRAINT FOREIGN KEY (nombre) REFERENCES dragon (nombre),
CONSTRAINT FOREIGN KEY (idGrupo) REFERENCES grupo (idGrupo)
);

CREATE TABLE ciudad(
nombreC VARCHAR(250) NOT NULL,
PRIMARY KEY(nombreC)
);

CREATE TABLE forja(
idForja INT NOT NULL,
mote VARCHAR(250) DEFAULT NULL,
nombreC VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(idForja),
CONSTRAINT FOREIGN KEY (nombreC) REFERENCES ciudad(nombreC) 
);

CREATE TABLE mago_forja(
idForja INT NOT NULL,
idMago VARCHAR(250) NOT NULL,
idBaculo VARCHAR(250) NOT NULL,
fecha_creacion DATE DEFAULT NULL,
PRIMARY KEY(idForja, idMago, idBaculo),
CONSTRAINT FOREIGN KEY (idForja) REFERENCES forja(idForja),
CONSTRAINT FOREIGN KEY (idMago) REFERENCES mago (idMago) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idBaculo) REFERENCES baculos (idBaculo)
);

CREATE TABLE tanque_forja(
idForja INT NOT NULL,
idTanque VARCHAR(250) NOT NULL,
idHacha VARCHAR(250) NOT NULL,
fecha_creacion DATE DEFAULT NULL,
PRIMARY KEY(idForja, idTanque, idHacha),
CONSTRAINT FOREIGN KEY (idForja) REFERENCES forja(idForja),
CONSTRAINT FOREIGN KEY (idTanque) REFERENCES tanque (idTanque) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idHacha) REFERENCES hachas (idHacha)
);

CREATE TABLE guerrero_forja(
idForja INT NOT NULL,
idGuerrero VARCHAR(250) NOT NULL,
idEspada VARCHAR(250) NOT NULL,
fecha_creacion DATE DEFAULT NULL,
PRIMARY KEY(idForja, idGuerrero, idEspada),
CONSTRAINT FOREIGN KEY (idForja) REFERENCES forja(idForja),
CONSTRAINT FOREIGN KEY (idGuerrero) REFERENCES guerrero (idGuerrero) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idEspada) REFERENCES espadas (idEspada)
);

CREATE TABLE tienda(
idTienda INT NOT NULL,
nombreT VARCHAR(250) DEFAULT NULL,
nombreC VARCHAR(250) DEFAULT NULL,
PRIMARY KEY(idTienda),
CONSTRAINT FOREIGN KEY (nombreC) REFERENCES ciudad (nombreC) 
);

CREATE TABLE mago_compra(
idTienda INT NOT NULL,
idMago VARCHAR(250) NOT NULL,
tipo VARCHAR(250) NOT NULL,
PRIMARY KEY(idTienda, idMago, tipo),
CONSTRAINT FOREIGN KEY (idTienda) REFERENCES tienda (idTienda),
CONSTRAINT FOREIGN KEY(idMago) REFERENCES mago (idMago) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY(tipo) REFERENCES daga (tipo)
);

CREATE TABLE tanque_compra(
idTienda INT NOT NULL,
idTanque VARCHAR(250) NOT NULL,
tipo VARCHAR(250) NOT NULL,
PRIMARY KEY(idTienda, idTanque, tipo),
CONSTRAINT FOREIGN KEY (idTienda) REFERENCES tienda (idTienda),
CONSTRAINT FOREIGN KEY(idTanque) REFERENCES tanque (idTanque) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY(tipo) REFERENCES daga (tipo)
);

CREATE TABLE guerrero_compra(
idTienda INT NOT NULL,
idGuerrero VARCHAR(250) NOT NULL,
tipo VARCHAR(250) NOT NULL,
PRIMARY KEY(idTienda, idGuerrero, tipo),
CONSTRAINT FOREIGN KEY (idTienda) REFERENCES tienda (idTienda),
CONSTRAINT FOREIGN KEY(idGuerrero) REFERENCES guerrero (idGuerrero) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY(tipo) REFERENCES daga (tipo)
);

CREATE TABLE druida(
idDruida VARCHAR(250) NOT NULL,
PRIMARY KEY(idDruida)
);

CREATE TABLE pociones(
idPocion VARCHAR(250) NOT NULL,
vida INT DEFAULT NULL,
mana INT DEFAULT NULL, 
PRIMARY KEY(idPocion)
);

CREATE TABLE druida_otorga(
idDruida VARCHAR(250) NOT NULL,
idPocion VARCHAR(250) NOT NULL,
PRIMARY KEY(idDruida, idPocion),
CONSTRAINT FOREIGN KEY (idDruida) REFERENCES druida (idDruida),
CONSTRAINT FOREIGN KEY(idPocion) REFERENCES pociones (idPocion)
);

CREATE TABLE mago_interactua(
idDruida VARCHAR(250) NOT NULL,
idMago VARCHAR(250) NOT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY(idDruida, idMago, fecha),
CONSTRAINT FOREIGN KEY (idDruida) REFERENCES druida (idDruida),
CONSTRAINT FOREIGN KEY(idMago) REFERENCES mago (idMago) ON DELETE CASCADE
);

CREATE TABLE tanque_interactua(
idDruida VARCHAR(250) NOT NULL,
idTanque VARCHAR(250) NOT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY(idDruida, idTanque, fecha),
CONSTRAINT FOREIGN KEY (idDruida) REFERENCES druida (idDruida),
CONSTRAINT FOREIGN KEY(idTanque) REFERENCES tanque (idTanque) ON DELETE CASCADE
);

CREATE TABLE guerrero_interactua(
idDruida VARCHAR(250) NOT NULL,
idGuerrero VARCHAR(250) NOT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY(idDruida, idGuerrero, fecha),
CONSTRAINT FOREIGN KEY (idDruida) REFERENCES druida (idDruida),
CONSTRAINT FOREIGN KEY(idGuerrero) REFERENCES guerrero (idGuerrero) ON DELETE CASCADE
);

CREATE TABLE jugadores(
nombre VARCHAR(250) NOT NULL,
PRIMARY KEY(nombre)
);

CREATE TABLE jugador_mago(
nombre VARCHAR(250) NOT NULL,
idMago VARCHAR(250) NOT NULL,
PRIMARY KEY(nombre, idMago),
CONSTRAINT FOREIGN KEY (nombre) REFERENCES jugadores (nombre) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idMago) REFERENCES mago (idMago) ON DELETE CASCADE
);

CREATE TABLE jugador_tanque(
nombre VARCHAR(250) NOT NULL,
idTanque VARCHAR(250) NOT NULL,
PRIMARY KEY(nombre, idTanque),
CONSTRAINT FOREIGN KEY (nombre) REFERENCES jugadores (nombre) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idTanque) REFERENCES tanque(idTanque) ON DELETE CASCADE
);

CREATE TABLE jugador_guerrero(
nombre VARCHAR(250) NOT NULL,
idGuerrero VARCHAR(250) NOT NULL,
PRIMARY KEY(nombre, idGuerrero),
CONSTRAINT FOREIGN KEY (nombre) REFERENCES jugadores (nombre) ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (idGuerrero) REFERENCES guerrero(idGuerrero) ON DELETE CASCADE
);
/*5.a*/
DELIMITER $$
CREATE TRIGGER vida_update AFTER INSERT ON grupo_derrota_dragon
FOR EACH ROW BEGIN
 UPDATE mago SET mago.vida=mago.vida+5
		WHERE idMago IN (SELECT mago_forma.idMago FROM mago_forma WHERE mago_forma.idGrupo=NEW.idGrupo)
			AND idMago IN (SELECT mago_forma.idMago FROM mago_forma 
				INNER JOIN jugador_mago ON mago_forma.idMago=jugador_mago.idMago
							INNER JOIN grupo_derrota_dragon 
							WHERE mago_forma.idGrupo=grupo_derrota_dragon.idGrupo
							GROUP BY(mago_forma.idMago) HAVING COUNT(grupo_derrota_dragon.nombre)=3);
                                                
UPDATE tanque SET tanque.vida=tanque.vida+5
	   WHERE idTanque IN (SELECT tanque_forma.idTanque FROM tanque_forma WHERE tanque_forma.idGrupo=NEW.idGrupo) 
       AND idTanque IN (SELECT tanque_forma.idTanque FROM tanque_forma 
		   INNER JOIN jugador_tanque ON tanque_forma.idTanque=jugador_tanque.idTanque
						INNER JOIN grupo_derrota_dragon 
						WHERE tanque_forma.idGrupo=grupo_derrota_dragon.idGrupo 
						GROUP BY(tanque_forma.idTanque) HAVING COUNT(grupo_derrota_dragon.nombre)=3);
                                                
UPDATE guerrero SET guerrero.vida=guerrero.vida+5 
	   WHERE idGuerrero IN (SELECT guerrero_forma.idGuerrero FROM guerrero_forma WHERE guerrero_forma.idGrupo=NEW.idGrupo) 
       AND idGuerrero IN (SELECT guerrero_forma.idGuerrero FROM guerrero_forma 
       INNER JOIN jugador_guerrero ON guerrero_forma.idGuerrero=jugador_guerrero.idGuerrero
					INNER JOIN grupo_derrota_dragon 
					WHERE guerrero_forma.idGrupo=grupo_derrota_dragon.idGrupo
					GROUP BY(guerrero_forma.idGuerrero) HAVING COUNT(grupo_derrota_dragon.nombre)=3);
                                                
END$$

/*5.b*/
CREATE TRIGGER vida_mago BEFORE INSERT ON grupo_derrota_dragon
FOR EACH ROW 
BEGIN
IF (SELECT COUNT(idMago)
	FROM mago_forma WHERE mago_forma.idGrupo=NEW.idGrupo 
    AND idMago NOT IN (SELECT idMago FROM mago_forma
					   JOIN grupo_derrota_dragon ON mago_forma.idGrupo=grupo_derrota_dragon.idGrupo
				       JOIN dragon_desbloquea_dragon ON grupo_derrota_dragon.nombre=sujeto AND dragon_desbloquea_dragon.objeto=NEW.nombre 
))>0
 
OR (SELECT COUNT(idTanque)
	FROM tanque_forma WHERE tanque_forma.idGrupo=NEW.idGrupo
    AND idTanque NOT IN (SELECT idTanque FROM tanque_forma
						 JOIN grupo_derrota_dragon ON tanque_forma.idGrupo=grupo_derrota_dragon.idGrupo
						 JOIN dragon_desbloquea_dragon ON grupo_derrota_dragon.nombre=sujeto AND dragon_desbloquea_dragon.objeto=NEW.nombre
))>0

OR (SELECT COUNT(idGuerrero) 
	FROM guerrero_forma WHERE guerrero_forma.idGrupo=NEW.idGrupo 
    AND idGuerrero NOT IN (SELECT idGuerrero FROM guerrero_forma
						   JOIN grupo_derrota_dragon ON guerrero_forma.idGrupo=grupo_derrota_dragon.idGrupo
						   JOIN dragon_desbloquea_dragon ON grupo_derrota_dragon.nombre=sujeto AND dragon_desbloquea_dragon.objeto=NEW.nombre
))>0
                   
THEN 
	IF(new.Nombre!='Dehiss') THEN 
	SIGNAL SQLSTATE '02000'
	SET MESSAGE_TEXT = 'Un miembro del grupo no ha desbloqueado el siguiente dragon.';
	END IF;
END IF;
END$$

/*Para reemplazar dagas*/
CREATE TRIGGER mago_tipo AFTER INSERT ON mago_compra
FOR EACH ROW BEGIN
 UPDATE mago 
 SET mago.tipo= NEW.tipo
 WHERE idMago= NEW.idMago;
END$$

CREATE TRIGGER tanque_tipo AFTER INSERT ON tanque_compra
FOR EACH ROW BEGIN
 UPDATE tanque
 SET tanque.tipo= NEW.tipo
 WHERE idTanque=NEW.idTanque;
END$$

CREATE TRIGGER guerrero_tipo AFTER INSERT ON guerrero_compra
FOR EACH ROW BEGIN
 UPDATE guerrero
 SET guerrero.tipo= NEW.tipo
 WHERE idGuerrero=NEW.idGuerrero;
END$$

DELIMITER ; 

/*Añadir ultima conexion*/
ALTER TABLE mago
ADD ultima_conexion DATE;

ALTER TABLE tanque
ADD ultima_conexion DATE;

ALTER TABLE guerrero
ADD ultima_conexion DATE;

INSERT INTO `daga`(`tipo`) VALUES
('Madera'),
('Bronce'),
('Marfil'),
('Diamante');

INSERT INTO `mago` (`idMago`,`fuerza`,`nivel`,`vida`,`mana`,`oro`,`tipo`,`ultima_conexion`) VALUES
('Raendan', '50', '2', '70', '150', '20', 'Madera', '2021-09-21'),
('Manddin', '100', '5', '120', '170', '120', 'Madera', '2020-11-20'),
('Xadel', '130', '10', '160', '230', '300', 'Madera', '2021-11-15'),
('Enso', '100', '6', '110', '200', '50', 'Madera', '2020-11-10');

INSERT INTO`baculos` (`idBaculo`, `daño`, `peso`) VALUES
('Baculo de madera', '40','5'),
('Mensajero de Mana', '80','10'),
('Raiz de Oscuridad', '150','20');

INSERT INTO `habilidadesM` (`nombre`,`descripcion`) VALUES
('Intelecto Arcano','Concentra todo su maná en un poderoso rayo de luz afectando a todos los enemigos en su área.'),
('Traslación','Selecciona un punto donde teletransportarse en un área de 15m.'),
('Nova de Escarcha','Genera una avalancha que congela a los enemigos que golpee y dejandolos inmóviles.');

INSERT INTO `mago_arma`(`idBaculo`,`idMago`) VALUES
('Mensajero de Mana','Raendan'),
('Raiz de Oscuridad','Manddin'),
('Raiz de Oscuridad','Xadel'),
('Baculo de madera','Enso');

INSERT INTO `espectros`(`idEspectro`,`nombre`,`vida`) VALUES
('1','Ligos','80'),
('2','Bachpai','130'),
('3','Lira','180'),
('4','Hana','230');

INSERT INTO `mago_ataca` (`idEspectro`,`idMago`, `oro`, `fecha`) VALUES
('3','Manddin', '15', '2021-10-17 00:00:00'),
('1','Xadel', '5', '2021-10-17 00:00:00'),
('2','Xadel', '10', '2021-10-17 00:01:00'),
('3','Xadel', '15', '2021-10-17 00:02:00'),
('4','Xadel', '20', '2021-10-17 00:03:00'),
('4','Xadel', '20', '2021-10-17 00:04:00'),
('1','Enso', '10', '2021-10-17 00:00:00'),
('2','Enso', '10', '2021-10-17 00:01:00'),
('3','Enso', '10', '2021-10-17 00:02:00'),
('4','Enso', '20', '2021-10-17 00:03:00');

INSERT INTO `tanque` (`idTanque`,`fuerza`,`nivel`,`vida`,`mana`,`oro`,`tipo`,`ultima_conexion`) VALUES 
('Ahkarg', '100', '5', '200', '50', '10', 'Madera', '2012-05-14'),
('Bucksel', '250', '9', '400', '150', '230', 'Madera', '2021-10-12'),
('Mashgor', '120', '4', '220', '70', '50', 'Madera', '2020-10-13'),
('Gim', '250', '8', '360', '120', '200', 'Madera', '2020-10-14');

INSERT INTO`hachas` (`idHacha`, `daño`, `peso`) VALUES
('Hacha de mano', '50','15'),
('Hacha arrojadiza', '90','20'),
('Hacha de doble punta', '130','25');

INSERT INTO `habilidadesT` (`nombre`,`descripcion`) VALUES
('Impacto feroz','Carga hacie delante paralizando al primer enemigo que golpee.'),
('Rompespaldas','Coge al enemigo más cercano haciendole daño crítico y paralizandole por 2s.'),
('Seísmo','Golpea con su hacha al suelo elevando a los enemigos por los aires y estuneandolos por 5s.');

INSERT INTO`tanque_arma` (`idHacha`, `idTanque`) VALUES
('Hacha de mano', 'Ahkarg'),
('Hacha de doble punta','Bucksel'),
('Hacha de mano','Bucksel'),
('Hacha de mano','Mashgor'),
('Hacha de doble punta','Gim');

INSERT INTO `trolls`(`idTroll`,`nombre`,`vida`)VALUES
('1','Ibe','120'),
('2','Ry','170'),
('3','Ulne','220'),
('4','Fargan','270');

INSERT INTO `tanque_ataca` (`idTroll`,`idTanque`,`oro`, `fecha`) VALUES
('1','Ahkarg','5', '2021-10-17 00:00:00'),
('1','Gim','5', '2021-10-17 00:00:00'),
('2','Gim','10', '2021-10-17 00:01:00'),
('1','Bucksel','5', '2021-10-17 00:00:00'),
('2','Bucksel','10', '2021-10-17 00:01:00'),
('3','Bucksel','15', '2021-10-17 00:02:00'),
('2','Mashgor','10', '2021-10-17 00:03:00');

INSERT INTO `guerrero` (`idGuerrero`,`fuerza`,`nivel`,`vida`,`mana`,`oro`,`tipo`,`ultima_conexion`) VALUES
('Stanto', '100', '3', '100', '40', '100', 'Madera', '1999-12-31'),
('Makwi', '150', '5', '150', '70', '40', 'Madera', '2021-11-16'),
('Carorhall', '230', '11', '300', '160', '600', 'Madera', '2021-10-17'),
('Dryto', '180', '5', '150', '80', '100', 'Madera', '2021-10-18'); 

INSERT INTO`espadas` (`idEspada`, `daño`, `peso`) VALUES
('Alfanje', '45','10'),
('Espada flamigera', '70','15'),
('Bracamarte', '100','30');

INSERT INTO `habilidadesG` (`nombre`,`descripcion`) VALUES
('Tajo de mandoble','Carga un ataque frontal con daño en area que efectúa daño extra.'),
('Impacto abrumador','Salta en el aire y hace un golpe de caida que afecta a los enemigos de alrededor.'),
('Ataque en torbellino','Reliza un giro que golpea a todos los enemigos de alrededor multiples veces.');

INSERT INTO `guerrero_arma` (`idEspada`,`idGuerrero`) VALUES
('Alfanje','Stanto'),
('Espada flamígera','Makwi'),
('Bracamarte','Carorhall'),
('Espada flamígera','Dryto');

INSERT INTO `goblins`(`idGoblin`,`nombre`,`vida`)VALUES 
('1','Kruulha','100'),
('2','Rargbal','150'),
('3','Aalor','200'),
('4','Goleth','250');

INSERT INTO `guerrero_ataca` (`idGoblin`,`idGuerrero`,`oro`, `fecha`) VALUES
('1','Makwi','5', '2021-10-17 00:00:00'),
('2','Makwi','10', '2021-10-17 00:01:00'),
('3','Makwi','10', '021-10-17 00:02:00'),
('4','Makwi','10', '021-10-17 00:03:00'),
('1','Makwi','5', '2021-10-17 00:04:00'),
('2','Makwi','10', '2021-10-17 00:05:00'),
('3','Makwi','10', '021-10-17 00:06:00'),
('4','Makwi','10', '021-10-17 00:07:00'),
('1','Makwi','5', '2021-10-17 00:08:00'),
('2','Makwi','10', '2021-10-17 00:09:00'),
('3','Makwi','10', '021-10-17 00:10:00'),
('4','Makwi','10', '021-10-17 00:11:00'),
('1','Makwi','5', '2021-10-17 00:12:00'),
('2','Makwi','10', '2021-10-17 00:13:00'),
('3','Makwi','10', '021-10-17 00:14:00'),
('4','Makwi','10', '021-10-17 00:15:00'),
('1','Makwi','5', '2021-10-17 00:16:00'),
('2','Makwi','10', '2021-10-17 00:17:00'),
('3','Makwi','10', '021-10-17 00:18:00'),
('4','Makwi','10', '021-10-17 00:19:00'),
('1','Makwi','5', '2021-10-17 00:20:00'),
('2','Makwi','10', '2021-10-17 00:21:00'),
('3','Makwi','10', '021-10-17 00:22:00'),
('4','Makwi','10', '021-10-17 00:23:00'),
('1','Makwi','5', '2021-10-17 00:24:00'),
('2','Makwi','10', '2021-10-17 00:25:00'),
('3','Makwi','10', '021-10-17 00:26:00'),
('4','Makwi','10', '021-10-17 00:27:00'),
('1','Makwi','5', '2021-10-17 00:28:00'),
('2','Makwi','10', '2021-10-17 00:29:00'),
('3','Makwi','10', '021-10-17 00:30:00'),
('4','Makwi','10', '021-10-17 00:31:00'),
('1','Makwi','5', '2021-10-17 00:32:00'),
('2','Makwi','10', '2021-10-17 00:33:00'),
('3','Makwi','10', '021-10-17 00:34:00'),
('4','Makwi','10', '021-10-17 00:35:00'),
('1','Makwi','5', '2021-10-17 00:36:00'),
('2','Makwi','10', '2021-10-17 00:37:00'),
('3','Makwi','10', '021-10-17 00:38:00'),
('4','Makwi','10', '021-10-17 00:39:00'),
('1','Makwi','5', '2021-10-17 00:40:00'),
('2','Makwi','10', '2021-10-17 00:41:00'),
('3','Makwi','10', '021-10-17 00:42:00'),
('4','Makwi','10', '021-10-17 00:43:00'),
('2','Makwi','10', '2021-10-17 00:44:00'),
('3','Makwi','10', '021-10-17 00:45:00'),
('4','Makwi','10', '021-10-17 00:46:00'),
('1','Makwi','5', '2021-10-17 00:47:00'),
('2','Makwi','10', '2021-10-17 00:48:00'),
('4','Makwi','10', '021-10-17 00:49:00'),
('1','Makwi','5', '2021-10-17 00:50:00'),
('4','Carorhall','20', '2021-10-17 00:00:00'),
('1','Stanto','5','2021-10-18 00:00:00'),
('2','Stanto','10', '2021-10-18 00:01:00'),
('3','Stanto','15', '2021-10-18 00:02:00'),
('3','Dryto','15', '2021-10-20 00:00:00');

INSERT INTO `jugadores` (`nombre`) VALUES
('Breakfury'),
('Hammerpowerthunder'),
('Battlerboar'),
('Cloakbane'),
('Greyblade');

INSERT INTO `jugador_mago` (`nombre`,`idMago`) VALUES
('Breakfury','Raendan'),
('Hammerpowerthunder','Manddin'),
('Greyblade','Xadel'),
('Cloakbane','Enso');

INSERT INTO `jugador_guerrero` (`nombre`,`idGuerrero`) VALUES
('Cloakbane','Stanto'),
('Breakfury','Makwi'),
('Breakfury','Carorhall'),
('Battlerboar','Dryto');

INSERT INTO `jugador_tanque` (`nombre`,`idTanque`) VALUES
('Battlerboar', 'Ahkarg'),
('Greyblade','Bucksel'),
('Cloakbane','Mashgor'),
('Hammerpowerthunder','Gim');

INSERT INTO `ciudad`(`nombreC`)VALUES
('Glider'),
('Forgesand'),
('Hiltore'),
('Gazegreenelven'),
('Greenbat'),
('Huntdwarf');

INSERT INTO `forja`(`idForja`, `mote`,`nombreC`)VALUES
('1', 'Forja de Harmek','Glider'),
('2', 'Forja del enano risueño','Forgesand'), 
('3', 'Forja de Tébez','Hiltore'),
('4', 'Forja de Harmek','Gazegreenelven'),
('5', 'Forja del enano risueño','Greenbat'), 
('6', 'Forja de Tébez','Huntdwarf'),
('7', 'Forja de Tébez','Glider'),
('8', 'Forja del enano risueño','Glider'),
('9', 'Forja de Tébez','Forgesand'), 
('10', 'Forja de Harmek','Hiltore'),
('11', 'Forja del enano risueño','Gazegreenelven'),
('12', 'Forja de Tébez','Greenbat'), 
('13', 'Forja de Harmek','Huntdwarf');

INSERT INTO `mago_forja`(`idForja`,`idMago`,`idBaculo`,`fecha_creacion`)VALUES
('1','Raendan','Baculo de madera','2021-09-01'),
('2','Manddin','Mensajero de Mana','2021-09-02'),
('3','Xadel','Raiz de Oscuridad','2021-09-03'),
('4','Enso','Baculo de madera','2021-09-04');

INSERT INTO `tanque_forja`(`idForja`,`idTanque`,`idHacha`,`fecha_creacion`)VALUES
('5','Ahkarg','Hacha de mano','2021-09-05'),
('6','Bucksel','Hacha arrojadiza','2021-09-06'),
('1','Mashgor','Hacha de doble punta','2021-09-07'),
('2','Gim','Hacha arrojadiza','2021-09-08');

INSERT INTO `guerrero_forja`(`idForja`,`idGuerrero`,`idEspada`,`fecha_creacion`)VALUES
('5','Stanto','Alfanje','2021-09-09'),
('3','Makwi','Espada flamigera','2021-09-01'),
('5','Carorhall','Bracamarte','2021-09-02'),
('6','Dryto','Bracamarte','2021-09-03');

INSERT INTO `grupo`(`idGrupo`)VALUES
('1'),
('2'),
('3'),
('4');

INSERT INTO `tanque_forma`(`idTanque`,`idGrupo`,`fecha_entrada`,`fecha_salida`)VALUES
('Ahkarg','1','2021-09-16', '2021-09-19'),
('Bucksel','1','2021-09-16', '2021-09-19'),
('Mashgor','2','2021-09-21', '2021-09-24'),
('Ahkarg','2','2021-09-21', '2021-09-24'),
('Gim','2','2021-09-21', '2021-09-24'),
('Mashgor','3','2021-10-21', '2021-10-24'),
('Mashgor','4','2021-10-22', '2021-10-25'),
('Ahkarg','4','2021-09-21', '2021-09-24');

INSERT INTO `guerrero_forma`(`idGuerrero`,`idGrupo`,`fecha_entrada`, `fecha_salida`)VALUES
('Stanto','1','2021-09-16', '2021-09-19'),
('Makwi','1','2021-09-16', '2021-09-19'),
('Carorhall','2','2021-09-21', '2021-09-24'),
('Carorhall','3','2021-10-21', '2021-10-24'),
('Carorhall','4','2021-10-22', '2021-10-25'),
('Dryto','4','2021-10-22', '2021-10-25');

INSERT INTO `mago_forma`(`idMago`,`idGrupo`,`fecha_entrada`, `fecha_salida`)VALUES
('Raendan','1','2021-09-16', '2021-09-19'),
('Manddin','1','2021-09-16', '2021-09-19'),
('Xadel','2','2021-09-21', '2021-09-24'),
('Enso','2','2021-09-21', '2021-09-24'),
('Xadel','3','2021-10-21', '2021-09-24'),
('Xadel','4','2021-10-22', '2021-10-25');

INSERT INTO `dragon`(`nombre`,`vida`)VALUES
('Dehiss','1000'),
('Rannyexbea','2000'), 
('Pastan','3000'),
('Griffin','4000'),
('Kystorm','5000'),
('Ocho Cabezas','6000');

INSERT INTO `dragon_desbloquea_dragon`(`sujeto`,`objeto`)VALUES
('Dehiss','Rannyexbea'),
('Rannyexbea','Pastan'), 
('Pastan','Griffin'),
('Griffin','Kystorm'),
('Kystorm','Ocho Cabezas');

INSERT INTO `grupo_derrota_dragon`(`idGrupo`,`nombre`,`fecha`)VALUES
('1','Dehiss','2021-09-16'),
('1','Rannyexbea','2021-09-16'),
('1','Pastan','2021-09-17'),
('1','Griffin','2021-09-17'),
('1','Kystorm','2021-09-18'),
('1','Ocho Cabezas','2021-09-18');

INSERT INTO `grupo_derrota_dragon`(`idGrupo`,`nombre`,`fecha`)VALUES
('2','Dehiss','2021-09-21'),
('2','Rannyexbea','2021-09-21');

INSERT INTO `grupo_derrota_dragon`(`idGrupo`,`nombre`,`fecha`)VALUES
('3','Pastan','2021-10-21');

/*
INSERT INTO `grupo_derrota_dragon`(`idGrupo`,`nombre`,`fecha`)VALUES
('4','Griffin','2021-10-22');
*/

INSERT INTO `tienda`(`idTienda`,`nombreT`,`nombreC`) VALUES
('1','Tienda de Rolla','Glider'),
('2','Tienda de Swithron','Forgesand'),
('3','Tienda de Aldlas','Hiltore'),
('4','Tienda de Rolla','Gazegreenelven'),
('5','Tienda de Swithron','Greenbat'),
('6','Tienda de Aldlas','Huntdwarf');

INSERT INTO `tanque_compra`(`idTienda`,`idTanque`,`tipo`)VALUES
('1','Ahkarg', 'Marfil'),
('2','Bucksel', 'Marfil'),
('3', 'Gim', 'Diamante');

INSERT INTO `guerrero_compra`(`idTienda`,`idGuerrero`, `tipo`)VALUES
('1','Stanto', 'Bronce'),
('3','Makwi', 'Marfil'),
('2','Dryto', 'Diamante');

INSERT INTO `mago_compra`(`idTienda`,`idMago`, `tipo`)VALUES
('3','Raendan', 'Bronce'),
('1','Manddin', 'Bronce'),
('3','Xadel', 'Bronce'),
('4','Xadel', 'Marfil'),
('5','Xadel', 'Diamante'),
('2','Xadel', 'Marfil'),
('6','Enso', 'Marfil');

INSERT INTO `druida` (`idDruida`) VALUES
('Zucsur'),
('Losla'),
('Tar'),
('Pikduk');

INSERT INTO `pociones` (`idPocion`,`vida`,`mana`) VALUES
('Pocion de vida','50','0'),
('Pocion de mana','0','50'),
('Pocion mixta','50','50');

INSERT INTO `druida_otorga`(`idDruida`,`idPocion`) VALUES
('Zucsur','pocion de vida'),
('Losla','pocion de mana'),
('Tar','pocion mixta'),
('Pikduk','pocion mixta');

INSERT INTO `tanque_interactua`(`idDruida`,`idTanque`, `fecha`)VALUES
('Zucsur','Ahkarg', '2021-09-20 00:00:00'),
('Losla','Bucksel', '2021-09-21 01:00:00'),
('Tar','Mashgor', '2021-09-22 02:00:00'),
('Pikduk','Gim', '2021-09-23 03:00:00');

INSERT INTO `guerrero_interactua`(`idDruida`,`idGuerrero`, `fecha`)VALUES
('Zucsur','Stanto', '2021-09-20 04:00:00'),
('Zucsur','Stanto', '2021-09-20 05:00:00'),
('Losla','Stanto', '2021-09-21 06:00:00'),
('Tar','Stanto', '2021-09-22 07:00:00'),
('Pikduk','Stanto', '2021-09-23 08:00:00'),
('Losla','Makwi', '2021-09-25 09:00:00'),
('Tar','Carorhall', '2021-09-26 10:00:00'),
('Pikduk','Dryto', '2021-09-27 11:00:00');

INSERT INTO `mago_interactua`(`idDruida`,`idMago`, `fecha`)VALUES
('Zucsur','Raendan', '2021-09-20 12:00:00'),
('Losla','Manddin', '2021-09-21 13:00:00'),
('Tar','Xadel', '2021-09-22 14:00:00'),
('Pikduk','Enso', '2021-09-23 15:00:00');