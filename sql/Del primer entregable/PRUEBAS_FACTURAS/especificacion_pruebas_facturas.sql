CREATE OR REPLACE PACKAGE PRUEBAS_FACTURAS AS

PROCEDURE inicializar;
PROCEDURE insertar(nombre_prueba VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_num_alum(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_precio_total(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_precio_total NUMBER, salidaEsperada BOOLEAN);
PROCEDURE eliminar(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, salidaEsperada BOOLEAN);
END PRUEBAS_FACTURAS;