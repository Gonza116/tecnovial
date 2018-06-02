CREATE OR REPLACE
PACKAGE PRUEBAS_TEST_TEORICO
AS
  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha DATE, w_num_test INTEGER, w_num_fallos INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_test Integer, w_fecha DATE, salidaEsperada BOOLEAN); 
  PROCEDURE actualizar_num_test (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_test INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_num_fallos (nombre_prueba VARCHAR2, w_cod_test Integer,  w_num_fallos INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_test INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_TEST_TEORICO;