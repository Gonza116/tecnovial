
CREATE OR REPLACE PACKAGE BODY PRUEBAS_ALUMNOS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM alumnos;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_dni VARCHAR2, w_fecha_nac DATE, w_nombre VARCHAR2,
w_apellidos VARCHAR2, w_fecha_matriculacion DATE, w_telefono CHAR, w_restricciones VARCHAR2, w_estudios VARCHAR2,
w_domicilio VARCHAR2, w_oportunidades INTEGER, w_amigo VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%ROWTYPE;
  w_num_alum varchar(20);
  anyo char(4);
  BEGIN

ANADIR_ALUMNO(w_dni, w_fecha_nac, w_nombre, w_apellidos, w_fecha_matriculacion, w_telefono, w_restricciones, w_estudios, w_domicilio, w_oportunidades, w_amigo);  --LOS PROCEDIMIENTOS SE PONEN DIRECTAMENTE

  select extract(year from sysdate) into anyo from dual;
  w_num_alum := num_alum.currval || '/' || anyo;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  IF (alumno.dni <> w_dni) THEN
    salida := false;
  END IF;
  IF (alumno.fecha_nac <> w_fecha_nac) THEN
    salida := false;
  END IF;
  IF (alumno.nombre <> w_nombre) THEN
    salida := false;
  END IF;
  IF (alumno.apellidos <> w_apellidos) THEN
    salida := false;
  END IF;
  IF (alumno.fecha_matriculacion <> w_fecha_matriculacion) THEN
    salida := false;
  END IF;
  IF (alumno.telefono <> w_telefono) THEN
    salida := false;
  END IF;
  IF (alumno.restricciones <> w_restricciones) THEN
    salida := false;
  END IF;
  IF (alumno.estudios <> w_estudios) THEN
    salida := false;
  END IF;
  IF (alumno.domicilio <> w_domicilio) THEN
    salida := false;
  END IF;
   IF (alumno.oportunidades <> w_oportunidades) THEN
    salida := false;
  END IF;
   IF (alumno.amigo <> w_amigo) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_dni (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_dni VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET dni = w_dni WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.dni <> w_dni) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_dni;

PROCEDURE actualizar_fecha_nac (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_nac DATE, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET fecha_nac = w_fecha_nac WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.fecha_nac <> w_fecha_nac) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_fecha_nac;

PROCEDURE actualizar_nombre (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_nombre VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET nombre = w_nombre WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.nombre <> w_nombre) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_nombre;

PROCEDURE actualizar_apellidos (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_apellidos VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET apellidos = w_apellidos WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.apellidos <> w_apellidos) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_apellidos;

PROCEDURE actualizar_telefono (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_telefono CHAR, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET telefono = w_telefono WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.telefono <> w_telefono) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_telefono;

PROCEDURE actualizar_restricciones (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_restricciones VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET restricciones = w_restricciones WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.restricciones <> w_restricciones) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_restricciones;

PROCEDURE actualizar_estudios (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_estudios VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET estudios = w_estudios WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.estudios <> w_estudios) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_estudios;

PROCEDURE actualizar_domicilio (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_domicilio VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET domicilio = w_domicilio WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.domicilio <> w_domicilio) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_domicilio;

PROCEDURE actualizar_oportunidades (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_oportunidades VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  alumno alumnos%rowtype;
  BEGIN

  UPDATE alumnos SET oportunidades = w_oportunidades WHERE num_alum = w_num_alum;

  SELECT * INTO alumno FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (alumno.oportunidades <> w_oportunidades) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END actualizar_oportunidades;

PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  n_alumnos integer;
  BEGIN

  DELETE FROM alumnos WHERE num_alum = w_num_alum;

  SELECT COUNT(*) INTO n_alumnos FROM ALUMNOS WHERE num_alum = w_num_alum;
  IF (n_alumnos <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END eliminar;

END PRUEBAS_ALUMNOS;
