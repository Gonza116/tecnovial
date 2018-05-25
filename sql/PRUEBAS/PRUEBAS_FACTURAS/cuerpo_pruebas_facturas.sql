CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_FACTURAS AS

PROCEDURE inicializar AS
BEGIN
DELETE FROM FACTURAS;
END inicializar;

PROCEDURE insertar(nombre_prueba VARCHAR2, w_num_alum VARCHAR2,salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  factura FACTURAS%ROWTYPE;
  w_num_factura VARCHAR2(50);
  BEGIN
  ANADIR_FACTURA(w_num_alum);
  w_num_factura := num_factura.currval || '/' || 2018;

  SELECT NUM_FACTURA, NUM_ALUM, PRECIO_TOTAL  INTO factura FROM FACTURAS WHERE num_factura = w_num_factura;
  IF (factura.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    
END insertar;

PROCEDURE actualizar_num_alum(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    factura FACTURAS%ROWTYPE;
  BEGIN 
  UPDATE FACTURAS SET  num_alum = w_num_alum WHERE num_factura = w_num_factura;
  
  SELECT NUM_FACTURA, NUM_ALUM, PRECIO_TOTAL  INTO factura FROM FACTURAS WHERE num_factura = w_num_factura;
  IF (factura.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
   
  END actualizar_num_alum;
  
  PROCEDURE actualizar_precio_total(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_precio_total NUMBER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    factura FACTURAS%ROWTYPE;
  BEGIN 
  UPDATE FACTURAS SET precio_total = w_precio_total WHERE num_factura = w_num_factura;
  
  SELECT NUM_FACTURA, NUM_ALUM, PRECIO_TOTAL  INTO factura FROM FACTURAS WHERE num_factura = w_num_factura;
  IF (factura.PRECIO_TOTAL <> w_precio_total) THEN
    salida := false;
  END IF;
 
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
   

  END actualizar_precio_total;
  
  PROCEDURE  eliminar(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_facturas INTEGER;
  
  BEGIN 
  DELETE FROM FACTURAS WHERE  num_factura = w_num_factura;
      
  SELECT COUNT(*) INTO num_facturas FROM FACTURAS WHERE  num_factura = w_num_factura;
  IF (num_facturas <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    

  END eliminar;
END PRUEBAS_FACTURAS;