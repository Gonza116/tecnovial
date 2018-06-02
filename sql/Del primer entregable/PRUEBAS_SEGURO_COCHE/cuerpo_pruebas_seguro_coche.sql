CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_SEGURO_COCHE AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM SEGURO_COCHE;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_contratacion date, w_fecha_vencimiento DATE, w_num_coche INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  seguroCoche SEGURO_COCHE%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_COCHE(w_fecha_gasto, w_coste, w_fecha_contratacion, w_fecha_vencimiento, w_num_coche);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA_CONTRATACION, FECHA_VENCIMIENTO, NUM_COCHE INTO seguroCoche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (seguroCoche.FECHA_CONTRATACION <> w_fecha_contratacion) THEN
    salida := false;
  END IF;
  IF (seguroCoche.FECHA_VENCIMIENTO <> w_fecha_vencimiento) THEN
    salida := false;
  END IF;
    IF (seguroCoche.NUM_COCHE <> w_num_coche) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_contratacion(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_contratacion DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    seguroCoche SEGURO_COCHE%ROWTYPE;
  BEGIN 
  UPDATE SEGURO_COCHE SET fecha_contratacion = w_fecha_contratacion WHERE cod_gasto = w_cod_gasto;
  
  SELECT COD_GASTO, FECHA_CONTRATACION, FECHA_VENCIMIENTO, NUM_COCHE INTO seguroCoche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (seguroCoche.fecha_contratacion <> w_fecha_contratacion) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_contratacion;
  
  PROCEDURE actualizar_fecha_vencimiento(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_vencimiento DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    seguroCoche SEGURO_COCHE%ROWTYPE;
  BEGIN 
  UPDATE SEGURO_COCHE SET fecha_vencimiento = w_fecha_vencimiento WHERE cod_gasto = w_cod_gasto;
  
  SELECT COD_GASTO, FECHA_CONTRATACION, FECHA_VENCIMIENTO, NUM_COCHE INTO seguroCoche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (seguroCoche.fecha_vencimiento <> w_fecha_vencimiento) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_vencimiento;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_seguro_coche INTEGER;
  
  BEGIN 
  DELETE FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
      
  SELECT COUNT(*) INTO num_seguro_coche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (num_seguro_coche <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_SEGURO_COCHE;