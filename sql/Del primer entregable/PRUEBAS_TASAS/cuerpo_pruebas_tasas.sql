CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_TASAS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM TASAS;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_FECHA_ABONO date, w_num_alum VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  tasa TASAS%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_TASAS(w_fecha_gasto, w_coste, w_fecha_abono, w_num_alum);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA_ABONO, NUM_ALUM  INTO tasa FROM TASAS WHERE cod_gasto = w_cod_gasto;
  IF (tasa.FECHA_ABONO <> w_fecha_abono) THEN
    salida := false;
  END IF;
    IF (tasa.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_abono (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_abono DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    tasa tasas%ROWTYPE;
  BEGIN 
  UPDATE tasas SET  fecha_abono = w_fecha_abono WHERE cod_gasto = w_cod_gasto;
  
  SELECT *  INTO tasa FROM tasas WHERE cod_gasto = w_cod_gasto;
  IF (tasa.fecha_abono <> w_fecha_abono) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_abono;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_tasas INTEGER;
  
  BEGIN 
  DELETE FROM TASAS WHERE cod_gasto = w_cod_gasto;
      
  SELECT COUNT(*) INTO num_tasas FROM TASAS WHERE cod_gasto = w_cod_gasto;
  IF (num_tasas <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_TASAS;