-- Creacion de base de datos

CREATE DATABASE restaurantes;
use restaurantes;


-- Creacion de tablas 

CREATE TABLE usuario(
    id_usuario int(100) PRIMARY KEY,
    nombre_usuario varchar(30),
    cedula int(10)
);

CREATE TABLE pedido(
    id_pedido int(100) PRIMARY KEY,
    id_usuario int(100),
    fecha date,
    descripcion varchar(20),

    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE factura(
    id_factura int(100) PRIMARY KEY,
    id_pedido int(100),
    fecha date,
    subtotal int(6),
    propina int(6),
    total int(6),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE pago(
    id_pago INT(100) PRIMARY KEY,
    id_factura INT(10),
    metodo_pago VARCHAR(20),
    valor int (6),
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura)
);


CREATE TABLE tipo_producto(
    id_tipo_producto INT(100) PRIMARY KEY,
    categoria VARCHAR(20)
);

CREATE TABLE producto(
    id_producto INT(100) PRIMARY KEY,
    id_tipo_producto INT(100),
    nombre VARCHAR(20),
    cantidad_disponible INT (20),
    
    FOREIGN KEY (id_tipo_producto) REFERENCES tipo_producto(id_tipo_producto)
);


CREATE TABLE almuerzo_dia(
    id_almuerzo_dia INT(100) PRIMARY KEY,
    descripcion VARCHAR(200)
);


CREATE TABLE producto_almuerzo_dia(
    id_producto_almuerzo_dia INT(100) PRIMARY KEY,
    id_almuerzo_dia INT(10),
    id_producto INT(10),
    cantidad_disponible INT(3),	

    FOREIGN KEY (id_almuerzo_dia) REFERENCES almuerzo_dia(id_almuerzo_dia),
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

CREATE TABLE menu_personalizado(
    id_menu_personalizado INT(100) PRIMARY KEY,
    id_almuerzo_dia INT(100),
    id_pedido INT(100),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_almuerzo_dia) REFERENCES almuerzo_dia(id_almuerzo_dia)
);



-- incercion de datos: 


-- datos usuario

INSERT INTO `usuario`(`id_usuario`, `nombre_usuario`, `cedula`) 
VALUES
      (0,'Laura Ortiz',25299233 ),
      (1,'Alonso Navarroo',68732109 ),
      (2,'Alejo Guerrero',1002514867 ),
      (3,'María Yolanda',1002312345 ),
      (4,'María Ofelia',74125896 ),
      (5,'Gerardo Genaro',1001312874 ),
      (6,'Víctor Hugo',87653210 ),
      (7,'Javier Leonardo',1002113654 ),
      (8,'Miguel Ángel',64589127 ),
      (9,'Mario Andrés',1002913874 ),
      (10,'Luis Alberto',97845623 ),
      (11,'Sandra Verónica',1003114567 ),
      (12,' María de Lourdes',76543219 ),
      (13,'Mayra del Carmen',1002713654 ),
      (14,'Manuel Augusto',95876321 );


-- pedido

INSERT INTO `pedido`(`id_pedido`, `id_usuario`, `fecha`, `descripcion`) VALUES 
    (0,1,'2023-04-23','arroz bajo en sal'),
    (1,2,'2023-04-25','caldo sin sal'),
    (2,0,'2023-04-25','normal'),
    (3,5,'2023-04-25','sin jugo'),
    (4,4,'2023-04-27','normal'),
    (5,6,'2023-04-27','si jugo'),
    (6,8,'2023-04-26','normal'),
    (7,9,'2023-04-28','sin jugo'),
    (8,7,'2023-05-01','normal'),
    (9,10,'2023-05-01','sin sopa'),
    (10,12,'2023-05-01','arros bajo en sal'),
    (11,14,'2023-05-03','sin arroz'),
    (12,13,'2023-05-04','normal'),
    (13,11,'2023-05-05','normal'),
    (14,3,'2023-06-07','sin sopa');

-- datos tipo producto

INSERT INTO `tipo_producto`(`id_tipo_Producto`, `categoria`) 
VALUES 
       (0,'principios'),
       (1,'sopas'),
       (2,'jugos'),
       (3,'proteinas'),
       (4,'arroces');

-- datos producto

INSERT INTO `producto`(`id_producto`, `id_tipo_producto`, `nombre`, `cantidad_disponible`)
VALUES  (0,0,'lentejas',50),
        (1,0,'frijoles',40),
        (2,4,'arroz Mixto',40),
        (3,4,'arroz',50),
        (4,4,'arroz Integral',50),
        (5,0,'papas fritas',50),
        (6,2,'limonada',50),
        (7,2,'limococo',30),
        (8,2,'limomango',30),
        (9,2,'jugomora',50),
        (10,2,'jugofresa',20),
        (11,3,'carne Res',50),
        (12,3,'carne de Cerdo',50),
        (13,3,'tofu',50),
        (14,3,'pollo',40),
        (15,1,'consome',40),
        (16,1,'sancocho',30),
        (17,1,'caldo de pescado',30),
        (18,1,'caldo de costilla',30),
        (19,1,'ajiaco',40);

-- almuerzo dia 

INSERT INTO `almuerzo_dia`(`id_almuerzo_dia`, `descripcion`) 
VALUES  
    (0,'arroz, pollo, limonada, caldo de pescado,lentejas'),
    (1,'arroz mixto, carne de cerdo, limococo, caldo de costilla,lenteja'),
    (2,'arroz integral , pollo, limococo, consome,frijol'),
    (3,'arroz, pollo, limonada ,papas'),
    (4,'arroz integral, carne  res, limo mango, caldo de pescado, lentejas'),
    (5,'arroz, pollo, limonada, ajiaco, frijoles'),
    (6,'arroz, tofu, limomango, papas'),
    (7,'arroz, pollo, limonada, caldo de pescado,frijoles'),
    (8,'arroz, carne de res, jugo de mora,papas'),
    (9,'arroz integral, tofu, limonada, consome, frijoles'),
    (10,'arroz, pollo, jugo mora, caldo de costilla'),
    (11,'arroz mixto, res, jugo fresa, caldo de consome'),
    (12,'arroz mixto, tofu, limonada, consome, lentejas'),
    (13,'arroz integral, carne de res, limonada, caldo de pescado, frijoles'),
    (14,'arroz, carne de cerdo, limonada, sancocho, papas a la francesa');

-- producto almuerzo dia 

INSERT INTO `producto_almuerzo_dia`(`id_producto_almuerzo_dia`, `id_almuerzo_dia`, `id_producto`, `cantidad_disponible`)
VALUES 	
        (0, 0, 3, 49),
        (1, 0, 14, 39),
        (2, 0, 6, 49),
        (3, 0, 17, 29),
        (4, 0, 0, 49),
        (5, 1, 2, 39),
        (6, 1, 12, 49),
        (7, 1, 7, 29),
        (8, 1, 18, 29),
        (9, 1, 0, 48),
        (10, 2, 4, 49),
        (11, 2, 14, 38),
        (12, 2, 7, 28),
        (13, 2, 15, 39),
        (14, 2, 1, 39),
        (15, 3, 3, 48),
        (16, 3, 14, 37),
        (17, 3, 6, 48),
        (18, 3, 5, 49),
        (19, 6, 3, 47),
        (20, 6, 13, 19),
        (21, 6, 8, 29),
        (22, 6, 5, 48),
        (23, 8, 3, 46),
        (24, 8, 11, 49),
        (25, 8, 9, 49),
        (26, 8, 5, 47);


-- menu personalizado 

INSERT INTO `menu_personalizado`(`id_menu_personalizado`, `id_almuerzo_dia`, `id_pedido`) 
VALUES  (0,0,1),
        (1,1,8),
        (2,2,0),
        (3,3,6),
        (4,4,1),
        (5,5,3),
        (6,6,2),
        (7,7,3),
        (8,8,8),
        (9,9,3),
        (10,10,0),
        (11,11,1),
        (12,12,1),
        (13,13,0),
        (14,14,6);

-- datos factura

INSERT INTO `factura`(`id_factura`, `id_pedido`, `fecha`, `subtotal`, `propina`, `total`) 
VALUES  (0,2,'2023-04-25',20000,2000,22000),
        (1,3,'2023-04-25',15000,2000,17000),
        (2,4,'2023-04-27',20000,2000,22000),
        (3,6,'2023-04-28',20000,2000,22000),
        (4,8,'2023-05-01',20000,2000,22000),
        (5,9,'2023-05-01',15000,2000,17000),
        (6,10,'2023-05-01',20000,2000,22000),
        (7,11,'2023-05-03',15000,2000,17000),
        (8,7,'2023-04-28',15000,2000,17000),
        (9,12,'2023-05-03',20000,2000,22000),
        (10,1,'2023-04-25',20000,2000,22000),
        (11,0,'2023-04-23',20000,2000,22000),
        (12,14,'2023-06-07',15000,2000,17000),
        (13,5,'2023-04-27',15000,2000,17000),
        (14,13,'2023-05-05',20000,2000,22000);


-- datos pago

INSERT INTO `pago`(`id_pago`, `id_factura`, `metodo_pago`, `valor`)
VALUES  (0,14,'nequi',22000),
        (1,12,'efectivo',17000),
        (2,10,'davidplata',22000),
        (3,8,'nequi',17000),
        (4,6,'efectivo',22000),
        (5,4,'efectivo',22000),
        (6,3,'davidplata',22000),
        (7,1,'efectivo',17000),
        (8,0,'nequi',22000),
        (9,5,'nequi',17000),
        (10,7,'nequi',17000),
        (11,9,'davidplata',22000),
        (12,2,'davidplata',22000),
        (13,11,'davidplata',22000),
        (14,13,'efectivo',17000);

-- consultas join: 

--1)en este join se unen las tablas factura y pago
SELECT * FROM factura a lEFT JOIN pago b ON a.id_factura = b.id_pago
UNION
SELECT * FROM factura a RIGHT JOIN pago b ON a.id_factura = b.id_pago;

--2)en este join se unen las tablas tipo_producto y producto
SELECT * FROM tipo_producto a lEFT JOIN producto b ON a.id_tipo_producto = b.id_producto
UNION
SELECT * FROM tipo_producto a RIGHT JOIN producto b ON a.id_tipo_producto= b.id_producto;

--3)en este join se busca entre la tabla pago y la tabla tipo producto se buscan los productos de la categoria de jugos
SELECT * FROM producto JOIN tipo_producto ON producto.id_tipo_producto = tipo_producto.id_tipo_producto
WHERE tipo_producto.categoria = 'jugos';

--4)-- en este join unimos las tablas que buscamos 
SELECT * FROM usuario a lEFT JOIN pedido b ON a.id_usuario = b.id_pedido
UNION
SELECT * FROM usuario a RIGHT JOIN pedido b ON a.id_usuario = b.id_pedido;
--5)aqui se busca hacer union entre la tablas de pedido y ususario
SELECT * FROM usuario  CROSS JOIN pedido;

--6)aqui aparece los datos de la tabla usuario y los datos que comparte con la tabla pedido
SELECT * FROM usuario LEFT JOIN pedido ON usuario.id_usuario= pedido.id_pedido WHERE pedido.id_pedido ;

--7)En este join sacamos los datos de la tabla tipo de producto dependiendo que categoria escojamos
SELECT * FROM producto JOIN tipo_producto ON producto.id_tipo_producto = tipo_producto.id_tipo_producto
WHERE tipo_producto.categoria = 'sopas';

--8)este da una union entre almuerzo_dia y producto_almuerzo_dia
SELECT * FROM almuerzo_dia  CROSS JOIN producto_almuerzo_dia;

--9)esta nos muestra la consulta en las dos tablas pero especificamente en los datos descripcion y total
SELECT descripcion,total FROM pedido  CROSS JOIN factura;

--10)esta consula consulta corrsponde a la union entre usuario y factura con una tabla intermedia que es pedido con datos especifico para 
--su consulta
SELECT u.nombre_usuario, p.descripcion, f.total
FROM usuario u
JOIN pedido p ON u.id_usuario = p.id_usuario
JOIN factura f ON p.id_pedido = f.id_pedido;


--consultas:

--"esta consulta muestra los totales mas altos de la tabla de factura"
SELECT * FROM factura WHERE total=(SELECT MAX(total)FROM factura);

--"esta consulta muestra los totales mas bajos de la tabla de factura"
SELECT * FROM factura WHERE total=(SELECT MIN(total)FROM factura);

--"esta consulta corresponde a cuales productos de la tabla producto tiene la cantidad de disponibles mas alta"
SELECT * FROM producto WHERE cantidad_disponible = (SELECT MAX(cantidad_disponible) FROM producto);

--"esta consulta da el resultado de los productos de la tabla producto que tenga cantidad de disponibles menores a 35 unidades"
SELECT * FROM producto WHERE cantidad_disponible < 35;

--"esta consulta muestra el numero total de usuario registrados"
SELECT COUNT(*) AS total_usuarios FROM usuario;


--"esta tiene el objetivo de mostrar la suma total con cada metodo de pago "
SELECT metodo_pago, SUM(valor) AS total_pago FROM pago GROUP BY metodo_pago;


--"esta corresponde al cual es el numero total de facturas que se hicieron en esa fecha"
SELECT COUNT(*) AS total_facturas FROM factura  WHERE fecha = '2023-05-01';

--"esta muestra todos los usuarios que empiecen con la letra M"
SELECT * FROM usuario WHERE nombre_usuario LIKE 'M%';

--"se muestran cuales son las facturas que estan por encima de los 18000"
SELECT * FROM factura WHERE total > 18000;

--"esta obtiene los pedido que se hicieron en el mes 5"
SELECT fecha FROM pedido WHERE MONTH(fecha) = 5;

