CREATE OR REPLACE PACKAGE BODY PRUEBAS_CLASE_PRACTICA AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM CLASE_PRACTICA;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_num_prof INTEGER, w_num_coche INTEGER, w_fecha DATE, w_valoracion INTEGER, w_kms_clase INTEGER, w_es_reciclaje CHAR, w_incidencia VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  clase clase_practica%ROWTYPE;
  w_num_clase INTEGER;
  BEGIN
  ANADIR_CLASE_PRACTICA(w_num_alum, w_num_prof, w_num_coche, w_fecha, w_valoracion, w_kms_clase, w_es_reciclaje, w_incidencia);
  w_num_clase := num_clase_p.currval;

  SELECT * INTO clase FROM CLASE_PRACTICA WHERE num_clase = w_num_clase;
  IF (clase.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  IF (clase.num_prof <> w_num_prof) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  IF (clase.num_coche <> w_num_coche) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  IF (clase.fecha <> w_fecha) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  IF (clase.valoracion <> w_valoracion) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  IF (clase.kms_clase <> w_kms_clase) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  IF (clase.es_reciclaje <> w_es_reciclaje) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  IF (clase.incidencia <> w_incidencia) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_num_clase Integer, w_num_alum VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  num_alum = w_num_alum WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_alum;

PROCEDURE actualizar_num_prof (nombre_prueba VARCHAR2, w_num_clase Integer, w_num_prof integer, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  num_prof = w_num_prof WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.num_prof <> w_num_prof) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_prof;
 
PROCEDURE actualizar_num_coche (nombre_prueba VARCHAR2, w_num_clase Integer, w_num_coche integer, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  num_coche = w_num_coche WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.num_coche <> w_num_coche) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_coche;
  
  PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2,  w_num_clase Integer, w_fecha DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  fecha = w_fecha WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.fecha <> w_fecha) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha;
  
PROCEDURE actualizar_valoracion (nombre_prueba VARCHAR2,  w_num_clase Integer, w_valoracion INTEGER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  valoracion = w_valoracion WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.valoracion <> w_valoracion) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_valoracion;
  
PROCEDURE actualizar_kms_clase (nombre_prueba VARCHAR2,  w_num_clase Integer, w_kms_clase INTEGER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  kms_clase = w_kms_clase WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.kms_clase <> w_kms_clase) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_kms_clase;
  
  PROCEDURE actualizar_es_reciclaje (nombre_prueba VARCHAR2,  w_num_clase Integer, w_es_reciclaje CHAR, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  es_reciclaje = w_es_reciclaje WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.es_reciclaje <> w_es_reciclaje) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_es_reciclaje;
  
PROCEDURE actualizar_incidencia (nombre_prueba VARCHAR2,  w_num_clase Integer, w_incidencia VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    clase clase_practica%ROWTYPE;
  BEGIN 
  UPDATE clase_practica SET  incidencia = w_incidencia WHERE num_clase = w_num_clase;
  
  SELECT *  INTO clase FROM clase_practica WHERE num_clase = w_num_clase;
  IF (clase.incidencia <> w_incidencia) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_incidencia;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_clase INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_clase_cont INTEGER;
  
  BEGIN 
  DELETE FROM clase_practica WHERE num_clase = w_num_clase;
      
  SELECT COUNT(*) INTO num_clase_cont FROM clase_practica WHERE num_clase = w_num_clase;
  IF (num_clase_cont <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_CLASE_PRACTICA;