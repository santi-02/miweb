    CREATE TABLE autores(
	codigo_autor INT PRIMARY KEY,
      nombre VARCHAR (30),
      nacionalidad VARCHAR(35),
      genero VARCHAR(20),
      fecha_de_nacimiento datetime(6),
      numero_de_libros INT (3) 
     );
	
    CREATE TABLE libros(
	codigo_libro INT PRIMARY KEY,
      titulo VARCHAR (30),
      editorial VARCHAR(20),
      genero VARCHAR(10),
	codigo_autor INT,
      FOREIGN KEY (codigo_autor)REFERENCES autores(codigo_autor)
     );
    
    CREATE TABLE usuarios(
	codigo_usuario INT PRIMARY KEY,
      nombre VARCHAR (30),
      telefono INT(10),
      correo VARCHAR(20),
      membresia VARCHAR(10)
     );

    CREATE TABLE prestamos(
	codigo_prestamo INT PRIMARY KEY,
      nombre VARCHAR (30),
      telefono INT(10),
      correo VARCHAR(20),
      membresia VARCHAR(10),
      codigo_usuario INT,
      codigo_libro INT,
	FOREIGN KEY (codigo_usuario) REFERENCES usuarios(codigo_usuario),
	FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro)
     );
    
   CREATE TABLE multas(
	codigo_multa INT PRIMARY KEY,
   	valor_de_retraso INT(10),
      penitencia_de_retraso VARCHAR(20),
      codigo_prestamo INT(10),
	FOREIGN KEY (codigo_prestamo) REFERENCES prestamos(codigo_prestamo)
     );

   CREATE TABLE producto_categoria (
	codigo_prestamo INT,
	codigo_libro INT,
	PRIMARY KEY (codigo_prestamo,codigo_libro),
	FOREIGN KEY (codigo_prestamo) REFERENCES prestamos(codigo_prestamo),
	FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro)
     );
	 CREATE TABLE autores(
	codigo_autor INT PRIMARY KEY,
      nombre VARCHAR (30),
      nacionalidad VARCHAR(35),
      genero VARCHAR(20),
      fecha_de_nacimiento datetime(6),
      numero_de_libros INT (3) 
     );
	
    CREATE TABLE libros(
	codigo_libro INT PRIMARY KEY,
      titulo VARCHAR (30),
      editorial VARCHAR(20),
      genero VARCHAR(10),
	codigo_autor INT,
      FOREIGN KEY (codigo_autor)REFERENCES autores(codigo_autor)
     );
    
    CREATE TABLE usuarios(
	codigo_usuario INT PRIMARY KEY,
      nombre VARCHAR (30),
      telefono INT(10),
      correo VARCHAR(20),
      membresia VARCHAR(10)
     );

    CREATE TABLE prestamos(
	codigo_prestamo INT PRIMARY KEY,
      nombre VARCHAR (30),
      telefono INT(10),
      correo VARCHAR(20),
      membresia VARCHAR(10),
      codigo_usuario INT,
      codigo_libro INT,
	FOREIGN KEY (codigo_usuario) REFERENCES usuarios(codigo_usuario),
	FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro)
     );
    
   CREATE TABLE multas(
	codigo_multa INT PRIMARY KEY,
   	valor_de_retraso INT(10),
      penitencia_de_retraso VARCHAR(20),
      codigo_prestamo INT(10),
	FOREIGN KEY (codigo_prestamo) REFERENCES prestamos(codigo_prestamo)
     );

   CREATE TABLE producto_categoria (
	codigo_prestamo INT,
	codigo_libro INT,
	PRIMARY KEY (codigo_prestamo,codigo_libro),
	FOREIGN KEY (codigo_prestamo) REFERENCES prestamos(codigo_prestamo),
	FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro)
     );
	

INSERT INTO autores(codigo_autor, nombre, nacionalidad, genero, fecha_de_nacimiento, numero_de_libros) VALUES
('0','alan','aleman','M','6/02/1990','6'),
('1','bruno','belice','M','20/12/1993','1'),
('2','carol','colombia','F','26/10/1999','2'),
('3','diana','dubai','F','1/5/1931','11'),
('4','evan','españa','M','30/07/1990','4')

INSERT INTO libros(codigo_libro, titulo, editorial, genero, codigo_autor) VALUES 
('0','miedoso','popa','comico','4'),
('1','fuego','loste','ficcion','2'),
('2','mas alla','lob','accion','1'),
('3','colombia antes','colo','historia','3'),
('4','dramatastico','usefer','drama','0')

INSERT INTO usuarios(codigo_usuario, nombre, telefono, correo, membresia) VALUES 
('0','lana','321','la@','basic'),
('1','esteban','456','et@','basic'),
('2','daniel','556','dl@','normal'),
('3','cristina','951','ct@','alta'),
('4','nelson','147','nl@','alta')

INSERT INTO prestamos(codigo_prestamo, nombre, telefono, correo,membresia, codigo_usuario, codigo_libro) VALUES 
('0','nelson','147','nl@','alta','4','0'),
('1','lana','321','la@','basic','0','4'),
('2','esteban','456','et@','basic','1','3'),
('3','daniel','556','dl@','normal','2','1'),
('4','cristina','951','ct@','alta','3','2')

INSERT INTO multas(codigo_multa, valor_de_retraso, penitencia_de_retraso, codigo_prestamo) VALUES 
('0','100','suspedido','4'),
('1','50','no presta','2'),
('2','200','expulsado','0'),
('3','10','ninguna','3'),
('4','0','ninguna','1')


INSERT INTO producto_categoria(codigo_prestamo,codigo_libro) VALUES 
('0','0'),
('1','4'),
('3','1'),
('2','3'),
('4','2')

UPDATE autores SET numero_de_libros ='1' WHERE codigo_autor = 3
UPDATE autores SET numero_de_libros='7' WHERE codigo_autor = 4
UPDATE autores SET numero_de_libros='3' WHERE codigo_autor = 2
UPDATE autores SET numero_de_libros='3' WHERE codigo_autor = 1
UPDATE autores SET numero_de_libros='3' WHERE codigo_autor = 0

UPDATE libros SET codigo_autor='3' WHERE codigo_libro = 0
UPDATE libros SET codigo_autor='4' WHERE codigo_libro = 2
UPDATE libros SET codigo_autor='1' WHERE codigo_libro = 3
UPDATE libros SET codigo_autor='2' WHERE codigo_libro = 4
UPDATE libros SET codigo_autor='0' WHERE codigo_libro = 1

UPDATE usuarios SET membresia='alta' WHERE codigo_usuario=0
UPDATE usuarios SET membresia='normal' WHERE codigo_usuario=4
UPDATE usuarios SET membresia='basic' WHERE codigo_usuario=2
UPDATE usuarios SET membresia='alta' WHERE codigo_usuario=1
UPDATE usuarios SET membresia='normal' WHERE codigo_usuario=3

UPDATE prestamos SET codigo_libro='4' WHERE codigo_usuario=0
UPDATE prestamos SET codigo_libro='3' WHERE codigo_usuario=1
UPDATE prestamos SET codigo_libro='2' WHERE codigo_usuario=2
UPDATE prestamos SET codigo_libro='1' WHERE codigo_usuario=3
UPDATE prestamos SET codigo_libro='0' WHERE codigo_usuario=4


