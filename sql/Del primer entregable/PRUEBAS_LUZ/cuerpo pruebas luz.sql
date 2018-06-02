CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_LUZ AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM LUZ;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_proximo_cobro date, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  pago_luz LUZ%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_LUZ(w_fecha_gasto, w_coste, w_proximo_cobro, w_gasto_kwh);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, PROXIMO_COBRO, GASTO_KWH INTO pago_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (pago_luz.PROXIMO_COBRO <> w_proximo_cobro) THEN
    salida := false;
  END IF;
  IF (pago_luz.GASTO_KWH <> w_gasto_kwh) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
  
END insertar;

PROCEDURE actualizar_proximo_cobro(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_proximo_cobro DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    pago_luz LUZ%ROWTYPE;
  BEGIN 
  UPDATE LUZ SET proximo_cobro = w_proximo_cobro WHERE cod_gasto = w_cod_gasto;
  
  SELECT COD_GASTO, PROXIMO_COBRO, GASTO_KWH INTO pago_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (pago_luz.proximo_cobro <> w_proximo_cobro) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    

  END actualizar_proximo_cobro;
  
  PROCEDURE actualizar_gasto_kwh(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    pago_luz LUZ%ROWTYPE;
  BEGIN 
  UPDATE LUZ SET gasto_kwh = w_gasto_kwh WHERE cod_gasto = w_cod_gasto;
  
   SELECT COD_GASTO, PROXIMO_COBRO, GASTO_KWH INTO pago_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (pago_luz.gasto_kwh <> w_gasto_kwh) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
   

  END actualizar_gasto_kwh;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_luz INTEGER;
  
  BEGIN 
  DELETE FROM LUZ WHERE cod_gasto = w_cod_gasto;
      
  SELECT COUNT(*) INTO num_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (num_luz <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
  

  END eliminar;
END PRUEBAS_LUZ;