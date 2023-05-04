CREATE TABLE clientes(
	 codigo_cliente INT PRIMARY KEY,
	 nombre VARCHAR(20),
	 edad INT(3),
	 telefono INT (10),
	 direccion VARCHAR(15)
	);

	CREATE TABLE reservas(
	 codigo_reserva INT PRIMARY KEY,
       cliente VARCHAR(15),
       hotel VARCHAR (15),
       lugar VARCHAR (10),
       fecha_de_nacimiento datetime(6),
       telefono INT (10),
       precio INT(10),
       tipo_de_habitacion VARCHAR(10),
       codigo_cliente INT,
	 codigo_hotel INT,
	 FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente),
	 FOREIGN KEY (codigo_hotel) REFERENCES hoteles (codigo_hotel)
	);

	CREATE TABLE hoteles(
	 codigo_hotel INT PRIMARY KEY,
       nombre VARCHAR(15),
       direccion VARCHAR (15),
       telefono INT (10),
       habitacion VARCHAR(10),
       categoria VARCHAR(10)
	);


	CREATE TABLE reserva_vuelo(
       codigo_cliente INT,
	 codigo_vuelo INT,
       PRIMARY KEY (codigo_cliente,codigo_vuelo),
	 FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente),
	 FOREIGN KEY (codigo_vuelo) REFERENCES vuelos (codigo_vuelo)
	);

	CREATE TABLE vuelos(
	   codigo_vuelo INT PRIMARY KEY,
       aerolinea VARCHAR(15),
       avion VARCHAR (10),
       duracion datetime(6),
       capacidad INT (10),
       precio_silla INT(10),
       precio_ticket INT(10),
       metodo_de_pago VARCHAR(10),
       codigo_cliente INT,
	   FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente)
	);

	INSERT INTO clientes(codigo_cliente, nombre, edad, telefono, direccion) VALUES 
	(0,'laura',18,321,'los prados'),
	(1,'lina',28,323,'los sauces'),
	(2,'marcos',30,315,'la sienda'),
	(3,'elena',20,305,'valparaiso'),
	(4,'nicolas',27,349,'valles')

	INSERT INTO hoteles(codigo_hotel,nombre, direccion, telefono, habitacion, categoria) VALUES 
	(0,'royal','las palmas',1234,10,'estandar'),
	(1,'alpha','boca grande',4321,30,'estandar'),
	(2,'clasic','los caudales',1324,21,'media'),
	(3,'roosevelt','Los leones',4567,102,'plus'),
	(4,'el mar','bahia blanca',4863,106,'plus')

	INSERT INTO vuelos(codigo_vuelo, aerolinea, avion, duracion,capacidad, precio_silla, precio_ticket, metodo_de_pago, codigo_cliente) VALUES 
	(0,'avianca','grande', '2:00:00',150,150000,200000,'tarjeta',0),
	(1,'avianca','grande','2:00:00',150,250000,300000,'tarjeta',4),
	(2,'vivacolombia','pequeño','1:00:00',50,100000,200000,'tarjeta',2),
	(3,'latam','mediano','2:30:00',100,250000,200000,'tarjeta',1),
	(4,'satena','pequeño','1:30:00',40,250000,100000,'tarjeta',3)

	INSERT INTO reservas(codigo_reserva, cliente, hotel, lugar, fecha_de_reserva, telefono, precio, tipo_de_habitacion, codigo_cliente, codigo_hotel) VALUES 
	(0,'elena','alpha','boca grande','2023-02-06','1234','2000000','plus',3,1),
	(1,'nicoles','royal','las palmas','2023-01-04','3434','2500000','estandar',4,0),
	(2,'marcos','el mar','bahia blanca','2023-06-14','2534','3500000','plus',2,4),
	(3,'laura','classic','los caudales','2023-10-7','1464','1500000','media',0,2),
	(4,'lina','roosevelt','los leones','2023-11-17','3564','4500000','plus',1,3)

	INSERT INTO reserva_vuelo(codigo_cliente,codigo_vuelo) VALUES 
	(0,2),
	(1,4),
	(2,1),
	(3,3),
	(4,0)

	UPDATE clientes SET edad=30WHERE  codigo_cliente=0
	UPDATE clientes SET edad=25WHERE  codigo_cliente=3
	UPDATE clientes SET edad=20WHERE  codigo_cliente=4
	UPDATE clientes SET edad=24WHERE  codigo_cliente=1
	UPDATE clientes SET edad=32WHERE  codigo_cliente=2

	UPDATE hoteles SET habitacion=12 WHERE codigo_hotel=2 
	UPDATE hoteles SET habitacion=35 WHERE codigo_hotel=1
	UPDATE hoteles SET habitacion=105 WHERE codigo_hotel=3
	UPDATE hoteles SET habitacion=110 WHERE codigo_hotel=4
	UPDATE hoteles SET habitacion=8 WHERE codigo_hotel=0

	UPDATE vuelos SET codigo_cliente=0 WHERE codigo_vuelo= 2
	UPDATE vuelos SET codigo_cliente=1 WHERE codigo_vuelo= 3
	UPDATE vuelos SET codigo_cliente=3 WHERE codigo_vuelo= 4
	UPDATE vuelos SET codigo_cliente=2 WHERE codigo_vuelo= 0

	UPDATE reservas SET tipo_de_habitacion='plus' WHERE  codigo_reserva = 3
	UPDATE reservas SET tipo_de_habitacion='estandar' WHERE  codigo_reserva = 0
	UPDATE reservas SET tipo_de_habitacion='media' WHERE  codigo_reserva = 1

	UPDATE reserva_vuelo SET codigo_vuelo=4 WHERE codigo_cliente=0
	UPDATE reserva_vuelo SET codigo_vuelo=3 WHERE codigo_cliente=1
	UPDATE reserva_vuelo SET codigo_vuelo=2 WHERE codigo_cliente=3