CREATE OR REPLACE
PACKAGE PRUEBAS_EXAMEN_PRACTICO_DGT 
AS
  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_ex DATE, w_apto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_apto (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_apto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_ex (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_fecha_ex DATE, salidaEsperada BOOLEAN); 
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_ex_p INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_EXAMEN_PRACTICO_DGT;
