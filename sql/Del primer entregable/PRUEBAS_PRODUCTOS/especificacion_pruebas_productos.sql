CREATE OR REPLACE
PACKAGE PRUEBAS_PRODUCTOS AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_producto VARCHAR2, w_precio_producto NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_producto VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_precio_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_precio_producto NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_obsoleto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_obsoleto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_prod INTEGER, salidaEsperada BOOLEAN);

  END PRUEBAS_PRODUCTOS;