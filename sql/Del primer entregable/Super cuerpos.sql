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
/
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
/
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
/
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
/
create or replace PACKAGE PRUEBAS_EXAMEN_TEORICO_DGT
AS
  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_ex DATE, w_apto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_apto (nombre_prueba VARCHAR2, w_num_ex_t Integer, w_apto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_ex (nombre_prueba VARCHAR2, w_num_ex_t Integer, w_fecha_ex DATE, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_ex_t INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_EXAMEN_TEORICO_DGT;
/
CREATE OR REPLACE PACKAGE PRUEBAS_FACTURAS AS

PROCEDURE inicializar;
PROCEDURE insertar(nombre_prueba VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_num_alum(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_precio_total(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_precio_total NUMBER, salidaEsperada BOOLEAN);
PROCEDURE eliminar(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, salidaEsperada BOOLEAN);
END PRUEBAS_FACTURAS;
/
CREATE OR REPLACE
PACKAGE PRUEBAS_LUZ AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_proximo_cobro date, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_proximo_cobro (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_proximo_cobro DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_gasto_kwh (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_LUZ;
/
CREATE OR REPLACE
PACKAGE PRUEBAS_GASTOS AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha DATE, w_coste NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_gasto integer, w_fecha DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_coste (nombre_prueba VARCHAR2, w_cod_gasto integer, w_coste NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
END PRUEBAS_GASTOS;
/
CREATE OR REPLACE
PACKAGE PRUEBAS_PRODUCTOS AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_producto VARCHAR2, w_precio_producto NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_producto VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_precio_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_precio_producto NUMBER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_obsoleto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_obsoleto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_prod INTEGER, salidaEsperada BOOLEAN);

  END PRUEBAS_PRODUCTOS;
/
CREATE OR REPLACE PACKAGE PRUEBAS_PROFESORES AS

PROCEDURE inicializar;
PROCEDURE insertar(nombre_prueba VARCHAR2, w_nombre VARCHAR2, w_apellidos VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_nombre(nombre_prueba VARCHAR2, w_num_prof INTEGER, w_nombre VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE actualizar_apellidos(nombre_prueba VARCHAR2, w_num_prof INTEGER, w_apellidos VARCHAR2, salidaEsperada BOOLEAN);
PROCEDURE eliminar(nombre_prueba VARCHAR2, w_num_prof INTEGER, salidaEsperada BOOLEAN);
END PRUEBAS_PROFESORES;
/
CREATE OR REPLACE
PACKAGE PRUEBAS_SEGURO_COCHE AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_contratacion date, w_fecha_vencimiento DATE, w_num_coche INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_contratacion (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_contratacion DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_vencimiento (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_vencimiento DATE, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_SEGURO_COCHE;
/
CREATE OR REPLACE
PACKAGE PRUEBAS_SEGURO_LOCAL AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_renovacion date, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_renovacion (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_renovacion DATE, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_SEGURO_LOCAL;
/
CREATE OR REPLACE
PACKAGE PRUEBAS_TASAS AS

  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_FECHA_ABONO date, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_abono (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_abono DATE, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN);
  END PRUEBAS_TASAS;
/
CREATE OR REPLACE
PACKAGE PRUEBAS_TEST_TEORICO
AS
  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha DATE, w_num_test INTEGER, w_num_fallos INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_alum VARCHAR2, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_test Integer, w_fecha DATE, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_num_test (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_test INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_num_fallos (nombre_prueba VARCHAR2, w_cod_test Integer,  w_num_fallos INTEGER, salidaEsperada BOOLEAN);
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_test INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_TEST_TEORICO;
/
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

/
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
/
CREATE OR REPLACE
PACKAGE BODY PRUEBAS_COMPRAS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM COMPRAS;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_cod_prod integer, w_fecha_compra DATE, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  compra COMPRAS%ROWTYPE;
  w_cod_compra INTEGER;
  BEGIN
  ANADIR_COMPRA(w_num_alum, w_cod_prod, w_fecha_compra);
  w_cod_compra := cod_compra.currval;

  SELECT COD_COMPRA , NUM_ALUM ,COD_PROD ,PRECIO_PROD_FACT ,FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;
    IF (compra.COD_PROD <> w_cod_prod) THEN
    salida := false;
  END IF;
  IF (compra.FECHA_COMPRA <> w_fecha_compra) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_cod_compra INTEGER, w_num_alum VARCHAR2, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    compra COMPRAS%ROWTYPE;
  BEGIN
  UPDATE COMPRAS SET  num_alum = w_num_alum WHERE cod_compra = w_cod_compra;

   SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_alum;

 PROCEDURE  actualizar_cod_prod (nombre_prueba VARCHAR2,  w_cod_compra INTEGER, w_cod_prod integer, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
   compra COMPRAS%ROWTYPE;
  BEGIN
  UPDATE COMPRAS SET cod_prod = w_cod_prod WHERE cod_compra = w_cod_compra;

  SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.COD_PROD <> w_cod_prod) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_cod_prod;

   PROCEDURE actualizar_precio_prod_fact (nombre_prueba VARCHAR2, w_cod_compra INTEGER, w_precio_prod_fact NUMBER, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    compra COMPRAS%ROWTYPE;
  BEGIN
  UPDATE COMPRAS SET  precio_prod_fact = w_precio_prod_fact WHERE cod_compra = w_cod_compra;

  SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.precio_prod_fact <> w_precio_prod_fact) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_precio_prod_fact;

  PROCEDURE actualizar_fecha_compra (nombre_prueba VARCHAR2, w_cod_compra INTEGER, w_fecha_compra DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    compra COMPRAS%ROWTYPE;
  BEGIN
  UPDATE COMPRAS SET  fecha_compra = w_fecha_compra WHERE cod_compra = w_cod_compra;

  SELECT COD_COMPRA, NUM_ALUM, COD_PROD, PRECIO_PROD_FACT, FECHA_COMPRA  INTO compra FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (compra.fecha_compra <> w_fecha_compra) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_compra;

 PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_compra INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  num_compras INTEGER;

  BEGIN
  DELETE FROM COMPRAS WHERE cod_compra = w_cod_compra;

  SELECT COUNT(*) INTO num_compras FROM COMPRAS WHERE cod_compra = w_cod_compra;
  IF (num_compras <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_COMPRAS;
/
create or replace PACKAGE BODY PRUEBAS_EXAMEN_TEORICO_DGT AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM examen_teorico_dgt;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_ex DATE, w_apto CHAR, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  examenTeorico examen_teorico_dgt%ROWTYPE;
  w_num_ex_t integer;
  BEGIN

ANADIR_EXAMEN_T(w_num_alum, w_fecha_ex, w_apto);  --LOS PROCEDIMIENTOS SE PONEN DIRECTAMENTE
 w_num_ex_t := num_ex_t.currval;

  SELECT num_ex_t, num_alum, fecha_ex, apto INTO examenTeorico FROM EXAMEN_TEORICO_DGT WHERE num_ex_t = w_num_ex_t;
  IF (examenTeorico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  IF (examenTeorico.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;
  IF (examenTeorico.apto <> w_apto) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_ex (nombre_prueba VARCHAR2, w_num_ex_t Integer, w_fecha_ex DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    ex examen_teorico_dgt%ROWTYPE;
  BEGIN
  UPDATE examen_teorico_dgt SET  fecha_ex = w_fecha_ex WHERE num_ex_t = w_num_ex_t;

  SELECT NUM_EX_T, NUM_ALUM, FECHA_EX, APTO INTO ex FROM examen_teorico_dgt WHERE num_ex_t = w_num_ex_t;
  IF (ex.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_ex;

  PROCEDURE actualizar_apto (nombre_prueba VARCHAR2, w_num_ex_t Integer, w_apto CHAR, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    ex examen_teorico_dgt%ROWTYPE;
  BEGIN
  UPDATE examen_teorico_dgt SET  apto = w_apto WHERE num_ex_t = w_num_ex_t;

  SELECT NUM_EX_T, NUM_ALUM, FECHA_EX, APTO INTO ex FROM examen_teorico_dgt WHERE num_ex_t = w_num_ex_t;
  IF (ex.apto <> w_apto) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_apto;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_ex_t INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  num_ex INTEGER;

  BEGIN
  DELETE FROM EXAMEN_TEORICO_DGT WHERE num_ex_t = w_num_ex_t;

  SELECT COUNT(*) INTO num_ex FROM examen_teorico_dgt WHERE num_ex_t = w_num_ex_t;
  IF (num_ex <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;

END PRUEBAS_EXAMEN_TEORICO_DGT;
/
CREATE OR REPLACE
PACKAGE BODY PRUEBAS_FACTURAS AS

PROCEDURE inicializar AS
BEGIN
DELETE FROM FACTURAS;
END inicializar;

PROCEDURE insertar(nombre_prueba VARCHAR2, w_num_alum VARCHAR2,salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  factura FACTURAS%ROWTYPE;
  w_num_factura VARCHAR2(50);
  BEGIN
  ANADIR_FACTURA(w_num_alum);
  w_num_factura := num_factura.currval || '/' || 2018;

  SELECT NUM_FACTURA, NUM_ALUM, PRECIO_TOTAL  INTO factura FROM FACTURAS WHERE num_factura = w_num_factura;
  IF (factura.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));

END insertar;

PROCEDURE actualizar_num_alum(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_num_alum VARCHAR2, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    factura FACTURAS%ROWTYPE;
  BEGIN
  UPDATE FACTURAS SET  num_alum = w_num_alum WHERE num_factura = w_num_factura;

  SELECT NUM_FACTURA, NUM_ALUM, PRECIO_TOTAL  INTO factura FROM FACTURAS WHERE num_factura = w_num_factura;
  IF (factura.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));

  END actualizar_num_alum;

  PROCEDURE actualizar_precio_total(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, w_precio_total NUMBER, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    factura FACTURAS%ROWTYPE;
  BEGIN
  UPDATE FACTURAS SET precio_total = w_precio_total WHERE num_factura = w_num_factura;

  SELECT NUM_FACTURA, NUM_ALUM, PRECIO_TOTAL  INTO factura FROM FACTURAS WHERE num_factura = w_num_factura;
  IF (factura.PRECIO_TOTAL <> w_precio_total) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));


  END actualizar_precio_total;

  PROCEDURE  eliminar(nombre_prueba VARCHAR2, w_num_factura VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  num_facturas INTEGER;

  BEGIN
  DELETE FROM FACTURAS WHERE  num_factura = w_num_factura;

  SELECT COUNT(*) INTO num_facturas FROM FACTURAS WHERE  num_factura = w_num_factura;
  IF (num_facturas <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));


  END eliminar;
END PRUEBAS_FACTURAS;
/
CREATE OR REPLACE
PACKAGE BODY PRUEBAS_GASTOS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM GASTOS;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha DATE, w_coste NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  gasto GASTOS%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  INSERT INTO GASTOS VALUES(cod_gasto.nextval, w_fecha, w_coste);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA, COSTE INTO gasto FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (gasto.fecha <> w_fecha) THEN
    salida := false;
  END IF;
    IF (gasto.coste <> w_coste) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_gasto integer, w_fecha DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    gasto GASTOS%ROWTYPE;
  BEGIN
  UPDATE GASTOS SET  fecha = w_fecha WHERE cod_gasto = w_cod_gasto;

  SELECT COD_GASTO, FECHA, COSTE INTO gasto FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (gasto.fecha <> w_fecha) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha;

PROCEDURE actualizar_coste (nombre_prueba VARCHAR2, w_cod_gasto integer, w_coste NUMBER, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    gasto GASTOS%ROWTYPE;
  BEGIN
  UPDATE GASTOS SET  coste = w_coste WHERE cod_gasto = w_cod_gasto;

  SELECT COD_GASTO, FECHA, COSTE INTO gasto FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (gasto.coste <> w_coste) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_coste;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  cod_gastos INTEGER;

  BEGIN
  DELETE FROM GASTOS WHERE cod_gasto = w_cod_gasto;

  SELECT COUNT(*) INTO cod_gastos FROM GASTOS WHERE cod_gasto = w_cod_gasto;
  IF (cod_gastos <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_GASTOS;
/
CREATE OR REPLACE
PACKAGE BODY PRUEBAS_PRODUCTOS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM PRODUCTOS;
  INSERT INTO productos VALUES (0, 'Clase práctica gratis', 0, 'NO');
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_producto VARCHAR2, w_precio_producto NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  producto PRODUCTOS%ROWTYPE;
  w_cod_prod INTEGER;
  BEGIN
  ANADIR_PRODUCTO(w_producto, w_precio_producto);
  w_cod_prod := cod_prod.currval;

  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.producto <> w_producto) THEN
    salida := false;
  END IF;
    IF (producto.precio_producto <> w_precio_producto) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
    END insertar;



PROCEDURE actualizar_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_producto VARCHAR2, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    producto PRODUCTOS%ROWTYPE;
  BEGIN
  UPDATE PRODUCTOS SET  producto = w_producto WHERE cod_prod = w_cod_prod;

  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.producto <> w_producto) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_producto;

PROCEDURE actualizar_precio_producto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_precio_producto NUMBER, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    producto PRODUCTOS%ROWTYPE;
  BEGIN
  UPDATE PRODUCTOS SET  precio_producto = w_precio_producto WHERE cod_prod = w_cod_prod;

  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.precio_producto <> w_precio_producto) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_precio_producto;

PROCEDURE actualizar_obsoleto (nombre_prueba VARCHAR2, w_cod_prod Integer, w_obsoleto CHAR, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    producto PRODUCTOS%ROWTYPE;
  BEGIN
  UPDATE PRODUCTOS SET  obsoleto = w_obsoleto WHERE cod_prod = w_cod_prod;

  SELECT COD_PROD, PRODUCTO, PRECIO_PRODUCTO, OBSOLETO INTO producto FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (producto.obsoleto <> w_obsoleto) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_obsoleto;


  PROCEDURE eliminar (nombre_prueba VARCHAR2,w_cod_prod INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  cod_prods INTEGER;

  BEGIN
  DELETE FROM PRODUCTOS WHERE cod_prod = w_cod_prod;

  SELECT COUNT(*) INTO cod_prods FROM PRODUCTOS WHERE cod_prod = w_cod_prod;
  IF (cod_prods <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ':' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END eliminar;

END PRUEBAS_PRODUCTOS;
/
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
/
CREATE OR REPLACE
PACKAGE BODY PRUEBAS_SEGURO_COCHE AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM SEGURO_COCHE;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_contratacion date, w_fecha_vencimiento DATE, w_num_coche INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  seguroCoche SEGURO_COCHE%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_COCHE(w_fecha_gasto, w_coste, w_fecha_contratacion, w_fecha_vencimiento, w_num_coche);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA_CONTRATACION, FECHA_VENCIMIENTO, NUM_COCHE INTO seguroCoche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (seguroCoche.FECHA_CONTRATACION <> w_fecha_contratacion) THEN
    salida := false;
  END IF;
  IF (seguroCoche.FECHA_VENCIMIENTO <> w_fecha_vencimiento) THEN
    salida := false;
  END IF;
    IF (seguroCoche.NUM_COCHE <> w_num_coche) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_contratacion(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_contratacion DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    seguroCoche SEGURO_COCHE%ROWTYPE;
  BEGIN
  UPDATE SEGURO_COCHE SET fecha_contratacion = w_fecha_contratacion WHERE cod_gasto = w_cod_gasto;

  SELECT COD_GASTO, FECHA_CONTRATACION, FECHA_VENCIMIENTO, NUM_COCHE INTO seguroCoche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (seguroCoche.fecha_contratacion <> w_fecha_contratacion) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_contratacion;

  PROCEDURE actualizar_fecha_vencimiento(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_vencimiento DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    seguroCoche SEGURO_COCHE%ROWTYPE;
  BEGIN
  UPDATE SEGURO_COCHE SET fecha_vencimiento = w_fecha_vencimiento WHERE cod_gasto = w_cod_gasto;

  SELECT COD_GASTO, FECHA_CONTRATACION, FECHA_VENCIMIENTO, NUM_COCHE INTO seguroCoche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (seguroCoche.fecha_vencimiento <> w_fecha_vencimiento) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_vencimiento;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  num_seguro_coche INTEGER;

  BEGIN
  DELETE FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;

  SELECT COUNT(*) INTO num_seguro_coche FROM SEGURO_COCHE WHERE cod_gasto = w_cod_gasto;
  IF (num_seguro_coche <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_SEGURO_COCHE;
/
CREATE OR REPLACE
PACKAGE BODY PRUEBAS_SEGURO_LOCAL AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM SEGURO_LOCAL;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_fecha_renovacion date, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  seguroLocal SEGURO_LOCAL%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_LOCAL(w_fecha_gasto, w_coste, w_fecha_renovacion);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA_RENOVACION  INTO seguroLocal FROM SEGURO_LOCAL WHERE cod_gasto = w_cod_gasto;
  IF (seguroLocal.FECHA_RENOVACION <> w_fecha_renovacion) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_renovacion (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_renovacion DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    seguroLocal SEGURO_LOCAL%ROWTYPE;
  BEGIN
  UPDATE seguro_local SET  fecha_renovacion = w_fecha_renovacion WHERE cod_gasto = w_cod_gasto;

  SELECT *  INTO seguroLocal FROM seguro_local WHERE cod_gasto = w_cod_gasto;
  IF (seguroLocal.FECHA_RENOVACION <> w_fecha_renovacion) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_renovacion;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  num_seguro_local INTEGER;

  BEGIN
  DELETE FROM SEGURO_LOCAL WHERE cod_gasto = w_cod_gasto;

  SELECT COUNT(*) INTO num_seguro_local FROM SEGURO_LOCAL WHERE cod_gasto = w_cod_gasto;
  IF (num_seguro_local <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_SEGURO_LOCAL;
/
CREATE OR REPLACE
PACKAGE BODY PRUEBAS_TASAS AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM TASAS;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_FECHA_ABONO date, w_num_alum VARCHAR2, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  tasa TASAS%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_TASAS(w_fecha_gasto, w_coste, w_fecha_abono, w_num_alum);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, FECHA_ABONO, NUM_ALUM  INTO tasa FROM TASAS WHERE cod_gasto = w_cod_gasto;
  IF (tasa.FECHA_ABONO <> w_fecha_abono) THEN
    salida := false;
  END IF;
    IF (tasa.NUM_ALUM <> w_num_alum) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_abono (nombre_prueba VARCHAR2, w_cod_gasto Integer, w_fecha_abono DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    tasa tasas%ROWTYPE;
  BEGIN
  UPDATE tasas SET  fecha_abono = w_fecha_abono WHERE cod_gasto = w_cod_gasto;

  SELECT *  INTO tasa FROM tasas WHERE cod_gasto = w_cod_gasto;
  IF (tasa.fecha_abono <> w_fecha_abono) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_abono;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  num_tasas INTEGER;

  BEGIN
  DELETE FROM TASAS WHERE cod_gasto = w_cod_gasto;

  SELECT COUNT(*) INTO num_tasas FROM TASAS WHERE cod_gasto = w_cod_gasto;
  IF (num_tasas <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
END PRUEBAS_TASAS;
/
CREATE OR REPLACE PACKAGE BODY PRUEBAS_TEST_TEORICO AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM test_teorico;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha DATE, w_num_test INTEGER, w_num_fallos INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  testTeorico test_teorico%ROWTYPE;
  w_cod_test integer;
  BEGIN

ANADIR_TEST_T(w_num_alum, w_fecha, w_num_test, w_num_fallos);
 w_cod_test := cod_test.currval;

  SELECT cod_test, num_alum, fecha, num_test, num_fallos INTO testTeorico FROM TEST_TEORICO WHERE cod_test = w_cod_test;
  IF (testTeorico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  IF (testTeorico.fecha <> w_fecha) THEN
    salida := false;
  END IF;
  IF (testTeorico.num_test <> w_num_test) THEN
    salida := false;
  END IF;
  IF (testTeorico.num_fallos <> w_num_fallos) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_num_alum (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_alum VARCHAR2, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN
  UPDATE test_teorico SET num_alum = w_num_alum WHERE cod_test = w_cod_test;

  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_alum;

PROCEDURE actualizar_fecha (nombre_prueba VARCHAR2, w_cod_test Integer, w_fecha DATE, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN
  UPDATE test_teorico SET fecha = w_fecha WHERE cod_test = w_cod_test;

  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.fecha <> w_fecha) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha;

  PROCEDURE actualizar_num_test (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_test INTEGER, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN
  UPDATE test_teorico SET num_test = w_num_test WHERE cod_test = w_cod_test;

  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.num_test <> w_num_test) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_test;

  PROCEDURE actualizar_num_fallos (nombre_prueba VARCHAR2, w_cod_test Integer, w_num_fallos INTEGER, salidaEsperada BOOLEAN)
  AS
    salida BOOLEAN := true;
    testTeorico test_teorico%ROWTYPE;
  BEGIN
  UPDATE test_teorico SET num_fallos = w_num_fallos WHERE cod_test = w_cod_test;

  SELECT COD_TEST ,NUM_ALUM ,FECHA ,NUM_TEST ,NUM_FALLOS   INTO testTeorico FROM test_teorico WHERE cod_test = w_cod_test;
  IF (testTeorico.num_fallos <> w_num_fallos) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_num_fallos;

  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_test INTEGER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  num_test INTEGER;

  BEGIN
  DELETE FROM TEST_TEORICO WHERE cod_test = w_cod_test;

  SELECT COUNT(*) INTO num_test FROM test_teorico WHERE cod_test = w_cod_test;
  IF (num_test <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));

  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;

END PRUEBAS_TEST_TEORICO;
/
CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_LUZ AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM LUZ;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_gasto DATE, w_coste NUMBER, w_proximo_cobro date, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  pago_luz LUZ%ROWTYPE;
  w_cod_gasto INTEGER;
  BEGIN
  GASTO_LUZ(w_fecha_gasto, w_coste, w_proximo_cobro, w_gasto_kwh);
  w_cod_gasto := cod_gasto.currval;

  SELECT COD_GASTO, PROXIMO_COBRO, GASTO_KWH INTO pago_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (pago_luz.PROXIMO_COBRO <> w_proximo_cobro) THEN
    salida := false;
  END IF;
  IF (pago_luz.GASTO_KWH <> w_gasto_kwh) THEN
    salida := false;
  END IF;

  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
  
END insertar;

PROCEDURE actualizar_proximo_cobro(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_proximo_cobro DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    pago_luz LUZ%ROWTYPE;
  BEGIN 
  UPDATE LUZ SET proximo_cobro = w_proximo_cobro WHERE cod_gasto = w_cod_gasto;
  
  SELECT COD_GASTO, PROXIMO_COBRO, GASTO_KWH INTO pago_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (pago_luz.proximo_cobro <> w_proximo_cobro) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    

  END actualizar_proximo_cobro;
  
  PROCEDURE actualizar_gasto_kwh(nombre_prueba VARCHAR2, w_cod_gasto Integer, w_gasto_kwh NUMBER, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    pago_luz LUZ%ROWTYPE;
  BEGIN 
  UPDATE LUZ SET gasto_kwh = w_gasto_kwh WHERE cod_gasto = w_cod_gasto;
  
   SELECT COD_GASTO, PROXIMO_COBRO, GASTO_KWH INTO pago_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (pago_luz.gasto_kwh <> w_gasto_kwh) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
   

  END actualizar_gasto_kwh;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_cod_gasto INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_luz INTEGER;
  
  BEGIN 
  DELETE FROM LUZ WHERE cod_gasto = w_cod_gasto;
      
  SELECT COUNT(*) INTO num_luz FROM LUZ WHERE cod_gasto = w_cod_gasto;
  IF (num_luz <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
  

  END eliminar;
END PRUEBAS_LUZ;
/
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
/
CREATE OR REPLACE
PACKAGE PRUEBAS_EXAMEN_PRACTICO_DGT 
AS
  PROCEDURE inicializar;
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_ex DATE, w_apto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_apto (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_apto CHAR, salidaEsperada BOOLEAN);
  PROCEDURE actualizar_fecha_ex (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_fecha_ex DATE, salidaEsperada BOOLEAN); 
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_ex_p INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_EXAMEN_PRACTICO_DGT;
/
CREATE OR REPLACE PACKAGE BODY PRUEBAS_EXAMEN_PRACTICO_DGT AS

PROCEDURE inicializar AS
BEGIN
  DELETE FROM examen_practico_dgt;
END inicializar;

PROCEDURE insertar (nombre_prueba VARCHAR2, w_num_alum VARCHAR2, w_fecha_ex DATE, w_apto CHAR, salidaEsperada BOOLEAN) AS
  salida BOOLEAN := true;
  examenPractico examen_practico_dgt%ROWTYPE;
  w_num_ex_p integer;
  BEGIN
  
ANADIR_EXAMEN_P(w_num_alum, w_fecha_ex, w_apto);  --LOS PROCEDIMIENTOS SE PONEN DIRECTAMENTE
 w_num_ex_p := num_ex_p.currval;
 
  SELECT num_ex_p, num_alum, fecha_ex, apto INTO examenPractico FROM EXAMEN_PRACTICO_DGT WHERE num_ex_p = w_num_ex_p;
  IF (examenPractico.num_alum <> w_num_alum) THEN
    salida := false;
  END IF;
  IF (examenPractico.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;
  IF (examenPractico.apto <> w_apto) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;
END insertar;

PROCEDURE actualizar_fecha_ex (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_fecha_ex DATE, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    ex examen_practico_dgt%ROWTYPE;
  BEGIN 
  UPDATE examen_practico_dgt SET  fecha_ex = w_fecha_ex WHERE num_ex_p = w_num_ex_p;
  
  SELECT *  INTO ex FROM examen_practico_dgt WHERE num_ex_p = w_num_ex_p;
  IF (ex.fecha_ex <> w_fecha_ex) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_fecha_ex;
  
  PROCEDURE actualizar_apto (nombre_prueba VARCHAR2, w_num_ex_p Integer, w_apto CHAR, salidaEsperada BOOLEAN) 
  AS 
    salida BOOLEAN := true;
    ex examen_practico_dgt%ROWTYPE;
  BEGIN 
  UPDATE examen_practico_dgt SET  apto = w_apto WHERE num_ex_p = w_num_ex_p;
  
  SELECT *  INTO ex FROM examen_practico_dgt WHERE num_ex_p = w_num_ex_p;
  IF (ex.apto <> w_apto) THEN
    salida := false;
  END IF;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END actualizar_apto;
  
  PROCEDURE eliminar (nombre_prueba VARCHAR2, w_num_ex_p INTEGER, salidaEsperada BOOLEAN) AS 
  salida BOOLEAN := true;
  num_ex INTEGER;
  
  BEGIN 
  DELETE FROM EXAMEN_PRACTICO_DGT WHERE num_ex_p = w_num_ex_p;
      
  SELECT COUNT(*) INTO num_ex FROM examen_practico_dgt WHERE num_ex_p = w_num_ex_p;
  IF (num_ex <> 0) THEN
    salida := false;
  END IF;
  COMMIT WORK;
  
  DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (salida, salidaEsperada));
  
  EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line (nombre_prueba || ': ' || ASSERT_EQUALS (false, salidaEsperada));
    ROLLBACK;

  END eliminar;
  
END PRUEBAS_EXAMEN_PRACTICO_DGT;
/