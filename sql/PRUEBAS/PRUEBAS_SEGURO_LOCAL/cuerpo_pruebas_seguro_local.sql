CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_SEGURO_LOCAL AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM SEGURO_LOCAL;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_renovacion date, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  seguroLocal SEGURO_LOCAL%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_LOCAL(w_fecha_gasto, w_coste, w_fecha_renovacion);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA_RENOVACION  INTO seguroLocal FROM SEGURO_LOCAL WHERE cod_gasto = w_cod_gasto;
  IF (seguroLocal.FECHA_RENOVACION <> w_fecha_renovacion) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_renovacion (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_renovacion DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    seguroLocal SEGURO_LOCAL%ROWTYPE;
  BEGIN 
  UPDATE seguro_local SET  fecha_renovacion = w_fecha_renovacion WHERE cod_gasto = w_cod_gasto;
  
  SELECT *  INTO seguroLocal FROM seguro_local WHERE cod_gasto = w_cod_gasto;
  IF (seguroLocal.FECHA_RENOVACION <> w_fecha_renovacion) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_renovacion;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_seguro_local INTEGER;
  
  BEGIN 
  DELETE FROM SEGURO_LOCAL WHERE cod_gasto = w_cod_gasto;
      
  SELECT COUNT(*) INTO num_seguro_local FROM SEGURO_LOCAL WHERE cod_gasto = w_cod_gasto;
  IF (num_seguro_local <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_SEGURO_LOCAL;