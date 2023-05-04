   CREATE TABLE artistas(
    codigo_artista INT PRIMARY KEY,
    nombre VARCHAR (15),
    edad INT (3),
    nacionalidad VARCHAR(10),
    genero VARCHAR(15),
    fecha_naciomiento datetime (6)
   );

   CREATE TABLE albumes(
    codigo_album INT PRIMARY KEY,
    titulo VARCHAR(10),
    fecha_lanzamiento datetime(6),
    cantante VARCHAR (10),
    genero VARCHAR(10)
   );

   CREATE TABLE canciones(
    codigo_cancion INT PRIMARY KEY,
    titulo VARCHAR (15),
    duracion time (4),
    idioma VARCHAR(10),
    compositor VARCHAR(15),
    genero VARCHAR (10),
    codigo_artista INT,
    codigo_album INT,
    codigo_lista INT,
    FOREIGN KEY (codigo_artista) REFERENCES artistas(codigo_artista),
    FOREIGN KEY (codigo_lista) REFERENCES lista_de_reproducciones(codigo_lista),
    FOREIGN KEY (codigo_album) REFERENCES albumes(codigo_album)
   );

   CREATE TABLE lista_de_reproducciones(
    codigo_lista INT PRIMARY KEY,
    numero_canciones INT(200),
    titulo VARCHAR(15),
    tiempo_reproduccion datetime(6),
    cantante VARCHAR (15),
    codigo_usuario INT,
    FOREIGN KEY (codigo_usuario)  REFERENCES usuarios (codigo_usuario)	
    );

   CREATE TABLE usuarios(
    codigo_usuario INT PRIMARY KEY,
    nombre VARCHAR (15),
    edad INT (2),
    telefono INT (10),
    direccion VARCHAR(10),
    nacionalidad VARCHAR (15),
    idioma VARCHAR (10),
    codigo_lista INT,
    FOREIGN KEY (codigo_lista) REFERENCES lista_de_reproducciones (codigo_lista)
   );
	

INSERT INTO albumes(codigo_album, titulo, fecha_lanzamiento, cantante, genero) VALUES 
 (1,'paraiso','10/2/18','vicente','ranchera'),
 (2,'shy','13/8/17','lincoln','reggar'),
 (3,'fire','1/4/19','laura','rock'),
 (4,'niebla','1/4/15','daniel','tango'),
 (5,'cielo','10/9/22','lili','salsa')

INSERT INTO artistas(codigo_artista, nombre, edad, nacionalidad, genero, fecha_naciomiento) VALUES 
(11,'jim',33,'gales','balce','10/02/1997'),
(22,'lina',25,'italia','rock','10/03/1997'),
(33,'Dante',45,'mexico','baladas','6/03/1987'),
(44,'Frank',31,'brasil','tecno','13/10/1991'),
(55,'salomon',40,'colombia','reggeaton','9/12/1990');

INSERT INTO canciones(codigo_cancion, titulo, duracion, idioma, compositor, genero, codigo_artista) VALUES 
(0,'vida','5min','español','dante','tango',3),
(1,'luz','5min','ingles','lina','rock',2),
(2,'clean','3min','ingles','jim','balce',0.1),
(3,'todos','10min','frances','salomon','metal',5),
(4,'carnaval','4min','español','salomon','reaggton',5)

INSERT INTO usuarios(codigo_usuario, nombre, edad, telefono, direccion, nacionalidad, idioma) VALUES 
(0,'jaime','18','1234','el norte','colombiano','español'),
(1,'laura','48','3534','las lomas','peruana','español'),
(2,'felipe','38','5234','rosas','español','español'),
(3,'ingrid','32','1452','los pinos','mexicana','español'),
(4,'ben','22','4578','malibu','estado unidense','ingles')

INSERT INTO lista_de_reproducciones(codigo_lista, numero_canciones, titulo, tiempo_reproduccion, cantante, codigo_usuario) VALUES 
(0,'500','fav','1:00:00','jaime',0),
(1,'200','relaz','5:00','laura',1),
(2,'50','fenix','5:00','felipe',2),
(3,'10','danz','4:00','ingrid',3),
(4,'120','viejas','3:00','ben',4)

INSERT INTO canciones(codigo_cancion,titulo, duracion, idioma, compositor, genero, codigo_artista, codigo_album, codigo_lista) VALUES 
(0,'vida','5:00','español','dante','tango',33,4,0),
(1,'luz','5:00','ingles','lina','rock',2,3,2),
(2,'clean','5:00','ingles','jim','balce',11,4,1),
(3,'todos','5:00','frances','salomon','metal',55,3,4),
(4,'carnval','5:00','español','salomon','reaggeton',55,2,3)

UPDATE albumes SET cantante='daniel' WHERE codigo_album = 1;
UPDATE albumes SET cantante='cristina' WHERE codigo_album = 4;
UPDATE albumes SET cantante='cristina' WHERE codigo_album = 4;
UPDATE albumes SET fecha_lanzamiento='15/4/11' WHERE codigo_album = 3;

UPDATE artistas SET codigo_artista='2'WHERE codigo_artista = 22;
UPDATE artistas SET nombre='lucia' WHERE codigo_artista=33;
UPDATE artistas SET nacionalidad='holanda' WHERE codigo_artista =11;
UPDATE artistas SET edad='42' WHERE codigo_artista= 55;
UPDATE artistas SET nacionalidad='costa rica'WHERE codigo_artista =44;

UPDATE canciones SET codigo_cancion='02'WHERE codigo_cancion = 06;
UPDATE canciones SET duracion='6min'WHERE codigo_cancion = 03;
UPDATE canciones SET idioma='español',genero='reaggton' WHERE codigo_cancion = 04;
UPDATE canciones SET duracion='4:30min' WHERE codigo_cancion = 04;
UPDATE canciones SET compositor='frank',genero='tecno' WHERE codigo_cancion = 4;

UPDATE lista_de_reproducciones SET numero_canciones='100' WHERE  codigo_lista = 4;
UPDATE lista_de_reproducciones SET numero_canciones='50' WHERE  codigo_lista = 3;
UPDATE lista_de_reproducciones SET numero_canciones='80' WHERE  codigo_lista = 2;
UPDATE lista_de_reproducciones SET numero_canciones='150' WHERE  codigo_lista = 1;
UPDATE lista_de_reproducciones SET numero_canciones='300' WHERE  codigo_lista = 0;

UPDATE usuarios SET nacionalidad='canadiense'WHERE codigo_usuario = 4 ;
UPDATE usuarios SET nacionalidad='guatemalteco'WHERE codigo_usuario = 3 ;
UPDATE usuarios SET nacionalidad='ecuatoriana'WHERE codigo_usuario = 1 ;
UPDATE usuarios SET nacionalidad='colombiano'WHERE codigo_usuario =  0;
UPDATE usuarios SET nacionalidad='argentino'WHERE codigo_usuario = 2 ;
