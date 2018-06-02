CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_COMPRAS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM COMPRAS;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_cod_prod integer, w_fecha_compra DATE, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  compra COMPRAS%ROWTYPE;
  w_cod_compra INTEGER;
  BEGIN
  ANADIR_COMPRA(w_num_alum, w_cod_prod, w_fecha_compra);
  w_cod_compra := cod_compra.currval;

  SELECT COD_COMPRA , NUM_ALUM ,COD_PROD ,PRECIO_PROD_FACT ,FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;
    IF (compra.COD_PROD <> w_cod_prod) THEN
    salida := false;
  END IF;
  IF (compra.FECHA_COMPRA <> w_fecha_compra) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_cod_compra INTEGER, w_num_alum VARCHAR2, salidaEsperada BOOLEAN)
  AS 
    salida BOOLEAN := true;
    compra COMPRAS%ROWTYPE;
  BEGIN 
  UPDATE COMPRAS SET  num_alum = w_num_alum WHERE cod_compra = w_cod_compra;
  
   SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_alum;
 
 PROCEDURE  actualizar_cod_prod (nombre_prueba VARCHAR2,  w_cod_compra INTEGER, w_cod_prod integer, salidaEsperada BOOLEAN)
  AS 
    salida BOOLEAN := true;
   compra COMPRAS%ROWTYPE;
  BEGIN 
  UPDATE COMPRAS SET cod_prod = w_cod_prod WHERE cod_compra = w_cod_compra;
  
  SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.COD_PROD <> w_cod_prod) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_cod_prod;
  
   PROCEDURE actualizar_precio_prod_fact (nombre_prueba VARCHAR2, w_cod_compra INTEGER, w_precio_prod_fact NUMBER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    compra COMPRAS%ROWTYPE;
  BEGIN 
  UPDATE COMPRAS SET  precio_prod_fact = w_precio_prod_fact WHERE cod_compra = w_cod_compra;
  
  SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.precio_prod_fact <> w_precio_prod_fact) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_precio_prod_fact;
    
  PROCEDURE actualizar_fecha_compra (nombre_prueba VARCHAR2, w_cod_compra INTEGER, w_fecha_compra DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    compra COMPRAS%ROWTYPE;
  BEGIN 
  UPDATE COMPRAS SET  fecha_compra = w_fecha_compra WHERE cod_compra = w_cod_compra;
  
  SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.fecha_compra <> w_fecha_compra) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_compra;
  
 PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_compra INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_compras INTEGER;
  
  BEGIN 
  DELETE FROM COMPRAS WHERE cod_compra = w_cod_compra;
      
  SELECT COUNT(*) INTO num_compras FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (num_compras <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_COMPRAS;