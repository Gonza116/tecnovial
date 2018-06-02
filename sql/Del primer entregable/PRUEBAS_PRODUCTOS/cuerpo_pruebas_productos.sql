CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_PRODUCTOS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM PRODUCTOS;
  INSERT INTO productos VALUES (0, 'Clase práctica gratis', 0, 'NO'); 
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_producto VARCHAR2, w_precio_producto NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  producto PRODUCTOS%ROWTYPE;
  w_cod_prod INTEGER;
  BEGIN
  ANADIR_PRODUCTO(w_producto, w_precio_producto);
  w_cod_prod := cod_prod.currval;

  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.producto <> w_producto) THEN
    salida := false;
  END IF;
    IF (producto.precio_producto <> w_precio_producto) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
    END insertar;



PROCEDURE actualizar_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_producto VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    producto PRODUCTOS%ROWTYPE;
  BEGIN 
  UPDATE PRODUCTOS SET  producto = w_producto WHERE cod_prod = w_cod_prod;
  
  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.producto <> w_producto) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_producto;
 
PROCEDURE actualizar_precio_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_precio_producto NUMBER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    producto PRODUCTOS%ROWTYPE;
  BEGIN 
  UPDATE PRODUCTOS SET  precio_producto = w_precio_producto WHERE cod_prod = w_cod_prod;
  
  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.precio_producto <> w_precio_producto) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_precio_producto;
  
PROCEDURE actualizar_obsoleto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_obsoleto CHAR, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    producto PRODUCTOS%ROWTYPE;
  BEGIN 
  UPDATE PRODUCTOS SET  obsoleto = w_obsoleto WHERE cod_prod = w_cod_prod;
  
  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.obsoleto <> w_obsoleto) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_obsoleto;
  
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2,w_cod_prod INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  cod_prods INTEGER;
  
  BEGIN 
  DELETE FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
      
  SELECT COUNT(*) INTO cod_prods FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (cod_prods <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END eliminar;

END PRUEBAS_PRODUCTOS;