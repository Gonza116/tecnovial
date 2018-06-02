CREATE OR REPLACE
PACKAGE PRUEBAS_SEGURO_LOCAL AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_renovacion date, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_renovacion (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_renovacion DATE, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_SEGURO_LOCAL;