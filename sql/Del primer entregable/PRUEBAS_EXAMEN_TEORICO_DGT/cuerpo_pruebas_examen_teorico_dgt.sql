create or replace PACKAGE BODY PRUEBAS_EXAMEN_TEORICO_DGT AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM examen_teorico_dgt;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_ex DATE, w_apto CHAR, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  examenTeorico examen_teorico_dgt%ROWTYPE;
  w_num_ex_t integer;
  BEGIN

ANADIR_EXAMEN_T(w_num_alum, w_fecha_ex, w_apto);  --LOS PROCEDIMIENTOS SE PONEN DIRECTAMENTE
 w_num_ex_t := num_ex_t.currval;

  SELECT num_ex_t, num_alum, fecha_ex, apto INTO examenTeorico FROM EXAMEN_TEORICO_DGT WHERE num_ex_t = w_num_ex_t;
  IF (examenTeorico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  IF (examenTeorico.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;
  IF (examenTeorico.apto <> w_apto) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_ex (nombre_prueba VARCHAR2, w_num_ex_t Integer, w_fecha_ex DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    ex examen_teorico_dgt%ROWTYPE;
  BEGIN 
  UPDATE examen_teorico_dgt SET  fecha_ex = w_fecha_ex WHERE num_ex_t = w_num_ex_t;

  SELECT NUM_EX_T, NUM_ALUM, FECHA_EX, APTO INTO ex FROM examen_teorico_dgt WHERE num_ex_t = w_num_ex_t;
  IF (ex.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_ex;

  PROCEDURE actualizar_apto (nombre_prueba VARCHAR2, w_num_ex_t Integer, w_apto CHAR, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    ex examen_teorico_dgt%ROWTYPE;
  BEGIN 
  UPDATE examen_teorico_dgt SET  apto = w_apto WHERE num_ex_t = w_num_ex_t;

  SELECT NUM_EX_T, NUM_ALUM, FECHA_EX, APTO INTO ex FROM examen_teorico_dgt WHERE num_ex_t = w_num_ex_t;
  IF (ex.apto <> w_apto) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_apto;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_ex_t INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_ex INTEGER;

  BEGIN 
  DELETE FROM EXAMEN_TEORICO_DGT WHERE num_ex_t = w_num_ex_t;

  SELECT COUNT(*) INTO num_ex FROM examen_teorico_dgt WHERE num_ex_t = w_num_ex_t;
  IF (num_ex <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;

END PRUEBAS_EXAMEN_TEORICO_DGT;