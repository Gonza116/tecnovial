CREATE OR REPLACE
PACKAGE PRUEBAS_LUZ AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_proximo_cobro date, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_proximo_cobro (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_proximo_cobro DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_gasto_kwh (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_LUZ;