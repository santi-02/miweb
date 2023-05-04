     CREATE TABLE usuarios(
	codigo_usuario INT PRIMARY KEY,
      correo VARCHAR (10),
      contraseña VARCHAR(10),
      nombre VARCHAR(10),
      edad INT(2),
      telefono INT (10),
      genero VARCHAR (10) 
    );
	
    CREATE TABLE amigos(
	codigo_amigo INT PRIMARY KEY,
      nombre VARCHAR(10),
      descripcion VARCHAR(10),
      numero_de_amigos_agregados INT (200), 
      codigo_usuario INT,
      FOREIGN KEY (codigo_usuario)REFERENCES usuarios(codigo_usuario)
    );
	
    CREATE TABLE comentarios(
	codigo_comentario INT PRIMARY KEY,
      fecha_de_publicaion datetime(6),
      hora_de_publicacion datetime(6),
      mensaje VARCHAR (500),
	codigo_usuario INT,
	codigo_publicaion INT,
      FOREIGN KEY (codigo_usuario)REFERENCES usuarios(codigo_usuario),
      FOREIGN KEY (codigo_publicaion)REFERENCES publicaion(codigo_publicaion)
 
     );
    
    CREATE TABLE publicaion(
	codigo_publicaion INT PRIMARY KEY,
      fecha_de_publicaion datetime(6),
      hora_de_publicacion datetime(6),
      mensaje VARCHAR (500),
      codigo_usuario INT,
      FOREIGN KEY (codigo_usuario)REFERENCES usuarios(codigo_usuario)
    
     );
	
	INSERT INTO usuarios(codigo_usuario, correo, contraseña, nombre,edad, telefono, genero) VALUES 
	(0,'js@',123,'james',21,3210,'M'),
	(1,'dn@',456,'dani',26,4510,'M'),
	(2,'ma@',789,'maria',20,7412,'F'),
	(3,'li@',963,'lina',30,4523,'F'),
	(4,'cr@',432,'cris',32,7323,'M')

	INSERT INTO publicaion(codigo_publicaion, fecha_de_publicaion,hora_de_publicacion, mensaje, codigo_usuario) VALUES 
	(0,'2022-02-06','12:30','hola juan',4),
	(1,'2022-02-06','1:30','que haces hoy',2),
	(2,'2022-01-16','10:30','hoy es futbol',3),
	(3,'2022-11-26','11:40','vacaciones...',0),
	(4,'2023-11-20','6:40','navidad...',1)
	
	INSERT INTO comentarios(codigo_comentario, fecha_de_publicaion, hora_de_publicacion, mensaje, codigo_usuario, codigo_publicaion) VALUES 	
  (0,'2023-11-20','6:40','navidad...',0,4),
	(1,'2022-02-06','12:30','hola juan',0,4),
	(2,'2022-01-26','11:40','vacaciones...',3,0),
	(3,'2022-01-16','10:30','hoy es futbol',2,3),
	(4,'2022-02-06','1:30','que haces hoy',1,2)
	
	INSERT INTO amigos(codigo_amigo, nombre,descripcion, numero_de_amigos_agregados, codigo_usuario) VALUES 
	(0,'james','colombiano','200',0),
	(1,'cris','gym bro','100',4),
	(2,'dani','pintar','120',1),
	(3,'lina','makeup','400',3),
	(4,'maria','crossfit','50',2)
	
	UPDATE amigos SET numero_de_amigos_agregados= 20 WHERE codigo_amigo = 1
	UPDATE amigos SET numero_de_amigos_agregados= 80 WHERE codigo_amigo = 0
  UPDATE amigos SET numero_de_amigos_agregados= 95 WHERE codigo_amigo = 4
	UPDATE amigos SET numero_de_amigos_agregados= 110 WHERE codigo_amigo = 2
	UPDATE amigos SET numero_de_amigos_agregados= 111 WHERE codigo_amigo = 3

	UPDATE comentarios SET hora_de_publicacion='10:00' WHERE codigo_comentario = 3
	UPDATE comentarios SET hora_de_publicacion='11:00' WHERE codigo_comentario = 4
	UPDATE comentarios SET hora_de_publicacion='8:00' WHERE codigo_comentario = 1
	UPDATE comentarios SET hora_de_publicacion='9:00' WHERE codigo_comentario = 0
	UPDATE comentarios SET hora_de_publicacion='12:00' WHERE codigo_comentario = 2
	
	UPDATE publicaion SET hora_de_publicacion= '1:00' WHERE codigo_publicaion= 1
	UPDATE publicaion SET hora_de_publicacion= '7:00' WHERE codigo_publicaion= 0
	UPDATE publicaion SET hora_de_publicacion= '3:00' WHERE codigo_publicaion= 3
	UPDATE publicaion SET hora_de_publicacion= '5:30' WHERE codigo_publicaion= 2
	UPDATE publicaion SET hora_de_publicacion= '8:30' WHERE codigo_publicaion= 4

	UPDATE usuarios SET edad=40 WHERE codigo_usuario=4
	UPDATE usuarios SET edad=36 WHERE codigo_usuario=1
	UPDATE usuarios SET edad=17 WHERE codigo_usuario=2
	UPDATE usuarios SET edad=37 WHERE codigo_usuario=0
	UPDATE usuarios SET edad=31 WHERE codigo_usuario=3
	

