CREATE OR REPLACE PACKAGE PRUEBAS_PROFESORES AS

PROCEDURE inicializar;
PROCEDURE insertar(nombre_prueba VARCHAR2, w_nombre VARCHAR2, w_apellidos VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_nombre(nombre_prueba VARCHAR2, w_num_prof INTEGER, w_nombre VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_apellidos(nombre_prueba VARCHAR2, w_num_prof INTEGER, w_apellidos VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE eliminar(nombre_prueba VARCHAR2, w_num_prof INTEGER, salidaEsperada BOOLEAN);
END PRUEBAS_PROFESORES;