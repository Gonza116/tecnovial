CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_COCHES AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM COCHES;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_matricula VARCHAR2, w_ULTIMA_ITV DATE, w_KMS INTEGER, w_ULTIMO_REPOSTAJE DATE, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  coche COCHES%ROWTYPE;
  w_num_coche INTEGER;
  BEGIN
  ANADIR_COCHE(w_matricula, w_ULTIMA_ITV, w_KMS, w_ULTIMO_REPOSTAJE);
  w_num_coche := num_coche.currval;

  SELECT NUM_COCHE, MATRICULA, ULTIMA_ITV, KMS,ULTIMO_REPOSTAJE  INTO coche FROM COCHES WHERE num_coche = w_num_coche;
  IF (coche.MATRICULA <> w_matricula) THEN
    salida := false;
  END IF;
    IF (COCHE.ULTIMA_ITV <> w_ULTIMA_ITV) THEN
    salida := false;
  END IF;
  IF (COCHE.KMS <> w_KMS) THEN
    salida := false;
  END IF;
  IF (COCHE.ULTIMO_REPOSTAJE <> w_ULTIMO_REPOSTAJE) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_ultimo_repostaje (nombre_prueba VARCHAR2, w_num_coche Integer, w_ultimo_repostaje VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    coche COCHES%ROWTYPE;
  BEGIN 
  UPDATE COCHES SET  ultimo_repostaje = w_ultimo_repostaje WHERE num_coche = w_num_coche;
  
  SELECT NUM_COCHE, MATRICULA, ULTIMA_ITV, KMS, ULTIMO_REPOSTAJE  INTO coche FROM COCHES WHERE num_coche = w_num_coche;
  IF (coche.ultimo_repostaje <> w_ultimo_repostaje) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_ultimo_repostaje;
 
PROCEDURE actualizar_matricula (nombre_prueba VARCHAR2, w_num_coche Integer, w_matricula VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    coche COCHES%ROWTYPE;
  BEGIN 
  UPDATE COCHES SET  matricula = w_matricula WHERE num_coche = w_num_coche;
  
  SELECT NUM_COCHE, MATRICULA, ULTIMA_ITV, KMS, ULTIMO_REPOSTAJE  INTO coche FROM COCHES WHERE num_coche = w_num_coche;
  IF (coche.MATRICULA <> w_matricula) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_matricula;
  
  PROCEDURE actualizar_ultima_itv (nombre_prueba VARCHAR2, w_num_coche Integer, w_ultima_itv VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    coche COCHES%ROWTYPE;
  BEGIN 
  UPDATE COCHES SET  ultima_itv = w_ultima_itv WHERE num_coche = w_num_coche;
  
  SELECT NUM_COCHE, MATRICULA, ULTIMA_ITV, KMS, ULTIMO_REPOSTAJE  INTO coche FROM COCHES WHERE num_coche = w_num_coche;
  IF (coche.ultima_itv <> w_ultima_itv) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_ultima_itv;
  
  PROCEDURE actualizar_kms (nombre_prueba VARCHAR2, w_num_coche Integer, w_kms VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    coche COCHES%ROWTYPE;
  BEGIN 
  UPDATE COCHES SET  kms = w_kms WHERE num_coche = w_num_coche;
  
  SELECT NUM_COCHE, MATRICULA, ULTIMA_ITV, KMS, ULTIMO_REPOSTAJE  INTO coche FROM COCHES WHERE num_coche = w_num_coche;
  IF (coche.kms <> w_kms) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_kms;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2,w_num_coche INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_coches INTEGER;
  
  BEGIN 
  DELETE FROM COCHES WHERE num_coche = w_num_coche;
      
  SELECT COUNT(*) INTO num_coches FROM COCHES WHERE num_coche = w_num_coche;
  IF (num_coches <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_COCHES;