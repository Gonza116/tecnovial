CREATE OR REPLACE
PACKAGE PRUEBAS_ALUMNOS
AS
  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_dni VARCHAR2, w_fecha_nac DATE, w_nombre VARCHAR2,
  w_apellidos VARCHAR2, w_fecha_matriculacion DATE, w_telefono CHAR, w_restricciones VARCHAR2, w_estudios VARCHAR2,
  w_domicilio VARCHAR2, w_oportunidades INTEGER, w_amigo VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_dni (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_dni VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_nac (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_nac DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_nombre (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_nombre VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_apellidos (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_apellidos VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_telefono (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_telefono CHAR, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_restricciones (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_restricciones VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_estudios (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_estudios VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_domicilio (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_domicilio VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_oportunidades (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_oportunidades VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);

END PRUEBAS_ALUMNOS;
