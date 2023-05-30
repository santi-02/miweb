
-- Funciones --

----Esta función recibe como entrada la id de usuario y devuelve el nombre asociado a dicho usuario.
DELIMITER //
CREATE FUNCTION getUserByID(id INT) RETURNS VARCHAR(255)
BEGIN
  DECLARE username VARCHAR(255);
  SELECT nombre_usuario INTO username FROM usuario WHERE id_usuario = id;
  RETURN username;
END //
DELIMITER ;


-- Esta función permite calcular el número total de pedidos realizados por cada usuario.:

DELIMITER //
CREATE FUNCTION getTotalPedidosByUser(id INT) RETURNS INT
BEGIN
  DECLARE total INT;
  SELECT COUNT(*) INTO total FROM pedido WHERE id_usuario = id;
  RETURN total;
END //
DELIMITER ;

-- Calcular el subtotal de una factura:////

DELIMITER //
CREATE FUNCTION calculateSubtotal(facturaID INT) RETURNS DECIMAL(10,2)
BEGIN
  DECLARE subtotal DECIMAL(10,2);
  SELECT subtotal INTO subtotal FROM factura WHERE id_factura = facturaID;
  RETURN subtotal;
END //
DELIMITER ;

-- Esta función proporciona el tipo de producto correspondiente a una ID específica.

DELIMITER //
CREATE FUNCTION getProductTypeByID(id INT) RETURNS VARCHAR(255)
BEGIN
  DECLARE category VARCHAR(255);
  SELECT categoria INTO category FROM tipo_producto WHERE id_tipo_Producto = id;
  RETURN category;
END //
DELIMITER ;


-- Esta función permite actualizar la cantidad disponible de un producto existente en el inventario:

DELIMITER //
CREATE PROCEDURE updateProductQuantity(productID INT, newQuantity INT)
BEGIN
  UPDATE producto SET cantidad_disponible = newQuantity WHERE id_producto = productID;
END //
DELIMITER ;

-- Calcular el total de ventas en un rango de fechas://///

DELIMITER //
CREATE FUNCTION calculateTotalSales(startDate DATE, endDate DATE) RETURNS DECIMAL(10,2)
BEGIN
  DECLARE total DECIMAL(10,2);
  SELECT SUM(total) INTO total FROM factura WHERE fecha BETWEEN startDate AND endDate;
  RETURN total;
END //
DELIMITER ;

-- Esta función permite obtener el menú asociado a un pedido específico mediante su ID de pedido.:

DELIMITER //
CREATE PROCEDURE getMenuByPedidoID(pedidoID INT)
BEGIN
  SELECT almuerzo_dia.descripcion 
  FROM menu_personalizado 
  INNER JOIN almuerzo_dia ON menu_personalizado.id_almuerzo_dia = almuerzo_dia.id_almuerzo_dia 
  WHERE menu_personalizado.id_pedido = pedidoID;
END //
DELIMITER ;

-- Esta función realiza el cálculo del total de propina acumulada de todas las facturas registradas.:

DELIMITER //
CREATE FUNCTION calculateTotalTips() RETURNS DECIMAL(10,2)
BEGIN
  DECLARE totalTips DECIMAL(10,2);
  SELECT SUM(propina) INTO totalTips FROM factura;
  RETURN totalTips;
END //
DELIMITER ;

-- Esta función permite eliminar un pedido específico junto con su factura correspondiente, eliminando así todos los registros relacionados:

DELIMITER //
CREATE PROCEDURE deletePedido(pedidoID INT)
BEGIN
  DELETE FROM factura WHERE id_pedido = pedidoID;
  DELETE FROM pedido WHERE id_pedido = pedidoID;
END //
DELIMITER ;

-- Esta función permite obtener el método de pago utilizado en una factura específica.

DELIMITER //
CREATE FUNCTION getPaymentMethod(facturaID INT) RETURNS VARCHAR(255)
BEGIN
  DECLARE paymentMethod VARCHAR(255);
  SELECT metodo_pago INTO paymentMethod FROM pago WHERE id_factura = facturaID;
  RETURN paymentMethod;
END //
DELIMITER ;
