CREATE OR REPLACE
PACKAGE PRUEBAS_COCHES AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_matricula VARCHAR2, w_ULTIMA_ITV DATE, w_KMS INTEGER, w_ULTIMO_REPOSTAJE DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_ultimo_repostaje (nombre_prueba VARCHAR2, w_num_coche Integer, w_ultimo_repostaje VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_matricula (nombre_prueba VARCHAR2, w_num_coche Integer, w_matricula VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_ultima_itv (nombre_prueba VARCHAR2, w_num_coche Integer, w_ultima_itv VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_kms (nombre_prueba VARCHAR2, w_num_coche Integer, w_kms VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_coche INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_COCHES;
