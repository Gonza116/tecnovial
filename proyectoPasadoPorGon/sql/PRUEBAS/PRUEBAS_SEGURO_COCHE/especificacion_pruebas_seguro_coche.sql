CREATE OR REPLACE
PACKAGE PRUEBAS_SEGURO_COCHE AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_contratacion date, w_fecha_vencimiento DATE, w_num_coche INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_contratacion (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_contratacion DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_vencimiento (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_vencimiento DATE, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_SEGURO_COCHE;