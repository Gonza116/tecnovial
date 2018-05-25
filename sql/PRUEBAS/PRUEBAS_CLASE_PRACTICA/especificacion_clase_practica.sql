CREATE OR REPLACE PACKAGE PRUEBAS_CLASE_PRACTICA AS

PROCEDURE inicializar;
PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_num_prof INTEGER, w_num_coche INTEGER, w_fecha DATE, w_valoracion INTEGER, w_kms_clase INTEGER, w_es_reciclaje CHAR, w_incidencia VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_num_clase Integer, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_num_prof (nombre_prueba VARCHAR2, w_num_clase Integer, w_num_prof integer, salidaEsperada BOOLEAN);
PROCEDURE actualizar_num_coche (nombre_prueba VARCHAR2, w_num_clase Integer, w_num_coche integer, salidaEsperada BOOLEAN);  
PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2,  w_num_clase Integer, w_fecha DATE, salidaEsperada BOOLEAN);   
PROCEDURE actualizar_valoracion (nombre_prueba VARCHAR2,  w_num_clase Integer, w_valoracion INTEGER, salidaEsperada BOOLEAN); 
PROCEDURE actualizar_kms_clase (nombre_prueba VARCHAR2,  w_num_clase Integer, w_kms_clase INTEGER, salidaEsperada BOOLEAN);
PROCEDURE actualizar_es_reciclaje (nombre_prueba VARCHAR2,  w_num_clase Integer, w_es_reciclaje CHAR, salidaEsperada BOOLEAN); 
PROCEDURE actualizar_incidencia (nombre_prueba VARCHAR2,  w_num_clase Integer, w_incidencia VARCHAR2, salidaEsperada BOOLEAN);  
PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_clase INTEGER, salidaEsperada BOOLEAN);
END PRUEBAS_CLASE_PRACTICA;