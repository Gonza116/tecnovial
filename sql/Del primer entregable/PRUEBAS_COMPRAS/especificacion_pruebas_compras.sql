CREATE OR REPLACE
PACKAGE PRUEBAS_COMPRAS AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_cod_prod integer, w_fecha_compra DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_cod_compra INTEGER, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_cod_prod (nombre_prueba VARCHAR2,  w_cod_compra INTEGER, w_cod_prod integer, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_compra (nombre_prueba VARCHAR2,  w_cod_compra INTEGER, w_fecha_compra DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_precio_prod_fact (nombre_prueba VARCHAR2,  w_cod_compra INTEGER, w_precio_prod_fact NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2,  w_cod_compra INTEGER, salidaEsperada BOOLEAN);
   END PRUEBAS_COMPRAS;
