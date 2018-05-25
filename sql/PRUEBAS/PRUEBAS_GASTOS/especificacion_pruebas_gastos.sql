CREATE OR REPLACE
PACKAGE PRUEBAS_GASTOS AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha DATE, w_coste NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_gasto integer, w_fecha DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_coste (nombre_prueba VARCHAR2, w_cod_gasto integer, w_coste NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
END PRUEBAS_GASTOS;
