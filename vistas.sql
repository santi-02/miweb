-- Vista de Pedidos con Detalles de Usuario

CREATE VIEW vista_pedidos_detalles_usuario AS
SELECT p.id_pedido, u.nombre_usuario, u.cedula, p.fecha, p.descripcion
FROM pedido p
JOIN usuario u ON p.id_usuario = u.id_usuario;

-- Esta vista muestra los detalles de los pedidos, incluyendo el nombre 
-- y la cédula del usuario asociado.

-- Vista de Total de Ventas por Tipo de Producto

CREATE VIEW vista_ventas_tipo_producto AS
SELECT tp.categoria, SUM(f.total) AS total_ventas
FROM tipo_producto tp
JOIN producto p ON tp.id_tipo_producto = p.id_tipo_producto
JOIN producto_almuerzo_dia pad ON p.id_producto = pad.id_producto
JOIN menu_personalizado mp ON pad.id_almuerzo_dia = mp.id_almuerzo_dia
JOIN factura f ON mp.id_pedido = f.id_pedido

-- Esta vista muestra el total de ventas por categoría de producto.

-- Vista de Pedidos por Usuario
CREATE VIEW vista_pedidos_usuario AS
SELECT u.nombre_usuario, COUNT(p.id_pedido) AS total_pedidos
FROM usuario u
LEFT JOIN pedido p ON u.id_usuario = p.id_usuario


-- Esta vista muestra la cantidad total de pedidos realizados 
-- por cada usuario.

-- Vista de Promedio de Propina por Mes
CREATE VIEW vista_promedio_propina_mes AS
SELECT MONTH(f.fecha) AS mes, AVG(f.propina) AS promedio_propina
FROM factura f
GROUP BY mes;

-- Esta vista muestra el promedio de propina por mes en las facturas.


-- Vista de Productos más Solicitados
CREATE VIEW vista_productos_solicitados AS
SELECT p.nombre, COUNT(mp.id_menu_personalizado) AS total_solicitudes
FROM producto p
JOIN producto_almuerzo_dia pad ON p.id_producto = pad.id_producto
JOIN menu_personalizado mp ON pad.id_almuerzo_dia = mp.id_almuerzo_dia
GROUP BY p.nombre
ORDER BY total_solicitudes DESC;

-- Esta vista muestra los productos más solicitados, ordenados por la cantidad 
-- total de solicitudes

-- Vista de Facturas por Mes
CREATE VIEW vista_facturas_mes AS
SELECT MONTH(f.fecha) AS mes, COUNT(f.id_factura) AS total_facturas
FROM factura f
GROUP BY mes;
-- Esta vista muestra el número total de facturas generadas por mes


-- Vista de Total de Ventas por Usuario
CREATE VIEW vista_ventas_usuario AS
SELECT u.nombre_usuario, SUM(f.total) AS total_ventas
FROM usuario u
JOIN pedido p ON u.id_usuario = p.id_usuario
JOIN factura f ON p.id_pedido = f.id_pedido
GROUP BY u.nombre_usuario;

-- Esta vista muestra el total de ventas realizado por cada usuario

-- Vista de Menú Personalizado por Pedido
CREATE VIEW vista_menu_pedido AS
SELECT p.id_pedido, ad.descripcion AS almuerzo_dia, m.id_menu_personalizado
FROM pedido p
JOIN menu_personalizado m ON p.id_pedido = m.id_pedido
JOIN almuerzo_dia ad ON m.id_almuerzo_dia = ad.id_almuerzo_dia;

-- Esta vista muestra el menú personalizado asociado a cada pedido.

-- Vista de Productos Agotados
CREATE VIEW vista_productos_agotados AS
SELECT p.nombre, p.cantidad_disponible
FROM producto p
WHERE p.cantidad_disponible = 0;
-- Esta vista muestra los productos que se han agotado 
-- (con cantidad disponible igual a cero)


-- Vista de Pedidos con Detalles de Factura
CREATE VIEW vista_pedidos_detalles_factura AS
SELECT p.id_pedido, f.fecha, f.subtotal, f.propina, f.total
FROM pedido p
JOIN factura f ON p.id_pedido = f.id_pedido;

-- Esta vista muestra los detalles de los pedidos, incluyendo 
-- la información de la factura asociada


