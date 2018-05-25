CREATE OR REPLACE
PACKAGE PRUEBAS_TASAS AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_FECHA_ABONO date, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_abono (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_abono DATE, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_TASAS;
