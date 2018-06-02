CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_PROFESORES AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM PROFESORES;
END inicializar;

PROCEDURE insertar(nombre_prueba VARCHAR2, w_nombre VARCHAR2, w_apellidos VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  profesor PROFESORES%ROWTYPE;
  w_num_prof INTEGER;
  BEGIN
  ANADIR_PROFESOR(w_nombre, w_apellidos);
  w_num_prof := num_prof.currval;

  SELECT NUM_PROF, NOMBRE, APELLIDOS INTO profesor FROM PROFESORES WHERE num_prof = w_num_prof;
  IF (profesor.NOMBRE <> w_nombre) THEN
    salida := false;
  END IF;
    IF (profesor.APELLIDOS <> w_apellidos) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_nombre(nombre_prueba VARCHAR2, w_num_prof INTEGER, w_nombre VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    profesor PROFESORES%ROWTYPE;
  BEGIN 
  UPDATE PROFESORES SET  nombre = w_nombre WHERE num_prof = w_num_prof;
  
  SELECT NUM_PROF, NOMBRE, APELLIDOS INTO profesor FROM PROFESORES WHERE num_prof = w_num_prof;
  IF (profesor.NOMBRE <> w_nombre) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_nombre;
  
  PROCEDURE actualizar_apellidos(nombre_prueba VARCHAR2, w_num_prof INTEGER, w_apellidos VARCHAR2, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    profesor PROFESORES%ROWTYPE;
  BEGIN 
  UPDATE PROFESORES SET  apellidos = w_apellidos WHERE num_prof = w_num_prof;
  
  SELECT NUM_PROF, NOMBRE, APELLIDOS INTO profesor FROM PROFESORES WHERE num_prof = w_num_prof;
  IF (profesor.APELLIDOs <> w_apellidos) THEN
    salida := false;
  END IF;
 
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_apellidos;
  
  PROCEDURE eliminar(nombre_prueba VARCHAR2, w_num_prof INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_profesores INTEGER;
  
  BEGIN 
  DELETE FROM PROFESORES WHERE num_prof = w_num_prof;
      
  SELECT COUNT(*) INTO num_profesores FROM PROFESORES WHERE num_prof = w_num_prof;
  IF (num_profesores <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_PROFESORES;