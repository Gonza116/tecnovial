CREATE OR REPLACE PACKAGE BODY PRUEBAS_TEST_TEORICO AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM test_teorico;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha DATE, w_num_test INTEGER, w_num_fallos INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  testTeorico test_teorico%ROWTYPE;
  w_cod_test integer;
  BEGIN
  
ANADIR_TEST_T(w_num_alum, w_fecha, w_num_test, w_num_fallos);  
 w_cod_test := cod_test.currval;
 
  SELECT cod_test, num_alum, fecha, num_test, num_fallos INTO testTeorico FROM TEST_TEORICO WHERE cod_test = w_cod_test;
  IF (testTeorico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  IF (testTeorico.fecha <> w_fecha) THEN
    salida := false;
  END IF;
  IF (testTeorico.num_test <> w_num_test) THEN
    salida := false;
  END IF;
  IF (testTeorico.num_fallos <> w_num_fallos) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_alum VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN 
  UPDATE test_teorico SET num_alum = w_num_alum WHERE cod_test = w_cod_test;
  
  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_alum;

PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_test Integer, w_fecha DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN 
  UPDATE test_teorico SET fecha = w_fecha WHERE cod_test = w_cod_test;
  
  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.fecha <> w_fecha) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha;
  
  PROCEDURE actualizar_num_test (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_test INTEGER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN 
  UPDATE test_teorico SET num_test = w_num_test WHERE cod_test = w_cod_test;
  
  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.num_test <> w_num_test) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_test;
  
  PROCEDURE actualizar_num_fallos (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_fallos INTEGER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN 
  UPDATE test_teorico SET num_fallos = w_num_fallos WHERE cod_test = w_cod_test;
  
  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.num_fallos <> w_num_fallos) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_fallos;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_test INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_test INTEGER;
  
  BEGIN 
  DELETE FROM TEST_TEORICO WHERE cod_test = w_cod_test;
      
  SELECT COUNT(*) INTO num_test FROM test_teorico WHERE cod_test = w_cod_test;
  IF (num_test <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
  
END PRUEBAS_TEST_TEORICO;