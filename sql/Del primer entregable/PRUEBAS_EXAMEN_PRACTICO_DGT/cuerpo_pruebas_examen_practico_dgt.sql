CREATE OR REPLACE PACKAGE BODY PRUEBAS_EXAMEN_PRACTICO_DGT AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM examen_practico_dgt;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_ex DATE, w_apto CHAR, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  examenPractico examen_practico_dgt%ROWTYPE;
  w_num_ex_p integer;
  BEGIN
  
ANADIR_EXAMEN_P(w_num_alum, w_fecha_ex, w_apto);  --LOS PROCEDIMIENTOS SE PONEN DIRECTAMENTE
 w_num_ex_p := num_ex_p.currval;
 
  SELECT num_ex_p, num_alum, fecha_ex, apto INTO examenPractico FROM EXAMEN_PRACTICO_DGT WHERE num_ex_p = w_num_ex_p;
  IF (examenPractico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  IF (examenPractico.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;
  IF (examenPractico.apto <> w_apto) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_ex (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_fecha_ex DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    ex examen_practico_dgt%ROWTYPE;
  BEGIN 
  UPDATE examen_practico_dgt SET  fecha_ex = w_fecha_ex WHERE num_ex_p = w_num_ex_p;
  
  SELECT *  INTO ex FROM examen_practico_dgt WHERE num_ex_p = w_num_ex_p;
  IF (ex.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_ex;
  
  PROCEDURE actualizar_apto (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_apto CHAR, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    ex examen_practico_dgt%ROWTYPE;
  BEGIN 
  UPDATE examen_practico_dgt SET  apto = w_apto WHERE num_ex_p = w_num_ex_p;
  
  SELECT *  INTO ex FROM examen_practico_dgt WHERE num_ex_p = w_num_ex_p;
  IF (ex.apto <> w_apto) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_apto;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_ex_p INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_ex INTEGER;
  
  BEGIN 
  DELETE FROM EXAMEN_PRACTICO_DGT WHERE num_ex_p = w_num_ex_p;
      
  SELECT COUNT(*) INTO num_ex FROM examen_practico_dgt WHERE num_ex_p = w_num_ex_p;
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
  
END PRUEBAS_EXAMEN_PRACTICO_DGT;