CREATE DATABASE restaurante;
use restaurante;

CREATE TABLE usuario(
  id_usuario int(100) PRIMARY KEY,
  nombre_usuario varchar(30),
  cedula int(10)
);

CREATE TABLE pago(
	id_pago INT PRIMARY KEY,
	metodo_pago VARCHAR(20)
);

CREATE TABLE factura (
  id_factura INT PRIMARY KEY,
  fecha DATE,
  total_iva INT(10),
  id_pago INT,
    
  FOREIGN KEY (id_pago) REFERENCES pago(id_pago)
);

CREATE TABLE pedido(
	id_pedido int(100) PRIMARY KEY,
    id_usuario int(100),
    id_factura int(100),
    
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN key (id_factura) REFERENCES factura(id_factura)
);

CREATE TABLE pedido(
	id_pedido int(100) PRIMARY KEY,
    id_usuario int(100),
    id_factura int(100),
    
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN key (id_factura) REFERENCES factura(id_factura)
);



CREATE TABLE tipoProducto(
id_tipoProducto INT PRIMARY KEY,
categoria VARCHAR(20)
);
CREATE TABLE producto(
id_producto INT PRIMARY KEY,
nombre VARCHAR(20),
cantidadDisponible INT (20),
precioAdicional INT (20),
id_tipoProducto INT,
FOREIGN KEY (id_tipoProducto) REFERENCES tipoProducto(id_tipoProducto)
);

CREATE TABLE menu_personalizado(
   id_menu_personalizado INT PRIMARY KEY,
   numero_combo INT,
   cant_prod_x_dia_adicion INT,
   id_producto_dia INT,
   id_pedido INT,
   FOREIGN KEY (id_producto_dia) REFERENCES	producto_del_dia(id_producto_dia ),
   FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);



/*INSERT INTO `usuario`(`id_usuario`, `nombre_usuario`, `cedula`) 
VALUES (0,'Laura Ortiz','25299233' ),
	     (1,'Alonso Navarroo','68732109' ),
       (2,'Alejo Guerrero','1002514867' ),
       (3,'María Yolanda','1002312345' ),
       (4,'María Ofelia','74125896' ),
       (5,'Gerardo Genaro','1001312874' ),
       (6,'Víctor Hugo','87653210' ),
       (7,'Javier Leonardo','1002113654' ),
       (8,'Miguel Ángel','64589127' ),
       (9,'Mario Andrés','1002913874' ),
       (10,'Luis Alberto','97845623' ),
       (11,'Sandra Verónica','1003114567' ),
       (12,' María de Lourdes','76543219' ),
       (13,'Mayra del Carmen','1002713654' ),
       (14,'Manuel Augusto','95876321' );*/