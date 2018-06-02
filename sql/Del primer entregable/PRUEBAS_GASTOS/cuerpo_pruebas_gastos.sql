CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_GASTOS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM GASTOS;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha DATE, w_coste NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  gasto GASTOS%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  INSERT INTO GASTOS VALUES(cod_gasto.nextval, w_fecha, w_coste);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA, COSTE INTO gasto FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (gasto.fecha <> w_fecha) THEN
    salida := false;
  END IF;
    IF (gasto.coste <> w_coste) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_gasto integer, w_fecha DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    gasto GASTOS%ROWTYPE;
  BEGIN 
  UPDATE GASTOS SET  fecha = w_fecha WHERE cod_gasto = w_cod_gasto;
  
  SELECT COD_GASTO, FECHA, COSTE INTO gasto FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (gasto.fecha <> w_fecha) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha;
 
PROCEDURE actualizar_coste (nombre_prueba VARCHAR2, w_cod_gasto integer, w_coste NUMBER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    gasto GASTOS%ROWTYPE;
  BEGIN 
  UPDATE GASTOS SET  coste = w_coste WHERE cod_gasto = w_cod_gasto;
  
  SELECT COD_GASTO, FECHA, COSTE INTO gasto FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (gasto.coste <> w_coste) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_coste;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  cod_gastos INTEGER;
  
  BEGIN 
  DELETE FROM GASTOS WHERE cod_gasto = w_cod_gasto;
      
  SELECT COUNT(*) INTO cod_gastos FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (cod_gastos <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_GASTOS;