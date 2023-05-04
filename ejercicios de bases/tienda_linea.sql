    CREATE TABLE clientes(
	 codigo_cliente INT PRIMARY KEY,
	 nombre VARCHAR(20),
	 apellido VARCHAR(20),
 	 cedula INT(10),
	 ciudad VARCHAR(15),
	 direccion VARCHAR(15)
	);
	
	CREATE TABLE pedidos(
	 codigo_pedido INT PRIMARY KEY,
	 lugar_de_entrega VARCHAR (50),
	 fecha_de_entrega datetime(6),
 	 fecha_de_creacion datetime(6),
	 codigo_cliente INT,
	 FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente)
	);
	
	CREATE TABLE pagos(
	 codigo_pago INT PRIMARY KEY,
	 forma_de_pago VARCHAR(10),
	 valor_de_pedido INT (9),
	 codigo_pedido INT,
	 FOREIGN KEY (codigo_pedido) REFERENCES pedidos (codigo_pedido)
	);

	CREATE TABLE productos (
	 codigo_producto INT PRIMARY KEY,
	 nombre VARCHAR (20),
	 categoria VARCHAR(20),
	 precio INT (9),
	 tipo_producto VARCHAR(15)
	);

	CREATE TABLE pedido_producto(
	 codigo_pedido INT,
	 codigo_producto INT,
	 PRIMARY KEY(codigo_pedido,codigo_producto),
	 FOREIGN KEY (codigo_pedido) REFERENCES pedidos (codigo_pedido),
	 FOREIGN KEY (codigo_producto) REFERENCES productos (codigo_producto)
	);

	INSERT INTO clientes(codigo_cliente,nombre, apellido, cedula, ciudad, direccion) VALUES 
	(0,'alex','alvez',1001,'cali','Los bosques'),
	(1,'ben','barrios',1010,'medellin','El poblado'),
	(2,'carlos','cortez',1011,'bolivar','El rosal'),
	(3,'dana','dolce',1021,'armenia','La terraza'),
	(4,'elsa','edson',1030,'cucuta','La riviera')

	INSERT INTO pedidos(codigo_pedido, lugar_de_entrega, fecha_de_entrega, fecha_de_creacion, codigo_cliente) VALUES 
	(0,'cali','2/2/2021','2/1/2021',4),
	(1,'cucuta','10/5/2021','2/2/2021',1),
	(2,'bolivar','1/5/2021','2/12/2021',2),
	(3,'armenia','2022-05-07','2022-01-25',3),
	(4,'medellin','2023-05-19','2023-01-29',3)

	INSERT INTO pagos(codigo_pago, forma_de_pago, valor_de_pedido, codigo_pedido) VALUES 
	(0,'tarjeta','100','3'),
	(1,'efecty','500','1'),
	(2,'nequi','1','4'),
	(3,'efecty','1.000','2'),
	(4,'tarjeta','1.500','0')

	INSERT INTO productos(codigo_producto, nombre,categoria, precio, tipo_producto) VALUES 
	(0,'ps4','tecnologia',1000000,'media'),
	(1,'camisa','ropa',100000,'baja'),
	(2,'balon','deportes',50000,'baja'),
	(3,'tv','tecnologia',2000000,'alta'),
	(4,'nevera','electrodomestico',2000000,'alta')

	INSERT INTO pedido_producto(codigo_pedido, codigo_producto) VALUES 
	(0,0),
	(4,4),
	(1,3),
	(2,1),
	(3,2)

	UPDATE clientes SET ciudad='bogota' WHERE codigo_cliente= 4
	UPDATE clientes SET ciudad='manizales' WHERE codigo_cliente= 2
	UPDATE clientes SET ciudad='pasto' WHERE codigo_cliente= 1

	UPDATE pagos SET valor_de_pedido=2000000 WHERE codigo_pago =0
	UPDATE pagos SET valor_de_pedido=1000000 WHERE codigo_pago =4
	UPDATE pagos SET valor_de_pedido=50000 WHERE codigo_pago =3
	UPDATE pagos SET valor_de_pedido=100000 WHERE codigo_pago =1
	UPDATE pagos SET valor_de_pedido=2000000 WHERE codigo_pago =2

	UPDATE pedidos SET lugar_de_entrega='bogota' WHERE codigo_pedido = 0
	UPDATE pedidos SET lugar_de_entrega='manizales' WHERE codigo_pedido = 2
	UPDATE pedidos SET lugar_de_entrega='pasto' WHERE codigo_pedido = 1
	UPDATE pedidos SET codigo_cliente='0' WHERE codigo_pedido= 3

	UPDATE pedido_producto SET codigo_producto ='4' WHERE codigo_pedido = 1
	UPDATE pedido_producto SET codigo_producto ='3' WHERE codigo_pedido = 4