DROP TABLE CLASE_PRACTICA;
DROP TABLE EXAMEN_PRACTICO_DGT;
DROP TABLE EXAMEN_TEORICO_DGT;
DROP TABLE FACTURAS;
DROP TABLE LUZ;
DROP TABLE PROFESORES;
DROP TABLE SEGURO_COCHE;
DROP TABLE SEGURO_LOCAL;
DROP TABLE TEST_TEORICO;
DROP TABLE COMPRAS;
DROP TABLE PRODUCTOS;
DROP TABLE COCHES;
DROP TABLE TASAS;
DROP TABLE GASTOS;
DROP TABLE ALUMNOS;

DROP SEQUENCE COD_COMPRA;
DROP SEQUENCE COD_GASTO;
DROP SEQUENCE COD_PROD;
DROP SEQUENCE COD_TEST;
DROP SEQUENCE NUM_CLASE_P;
DROP SEQUENCE NUM_COCHE;
DROP SEQUENCE NUM_EX_P;
DROP SEQUENCE NUM_EX_T;
DROP SEQUENCE NUM_PROF;
DROP SEQUENCE NUM_ALUM;
DROP SEQUENCE NUM_FACTURA;

DROP PROCEDURE ACTUALIZAR_KMS;
DROP PROCEDURE ACTUALIZAR_REPOSTAJE;
DROP PROCEDURE ANADIR_ALUMNO;
DROP PROCEDURE ANADIR_CLASE_GRATIS;
DROP PROCEDURE ANADIR_CLASE_PRACTICA;
DROP PROCEDURE ANADIR_COCHE;
DROP PROCEDURE ANADIR_COMPRA;
DROP PROCEDURE ANADIR_EXAMEN_P;
DROP PROCEDURE ANADIR_EXAMEN_T;
DROP PROCEDURE ANADIR_FACTURA;
DROP PROCEDURE ANADIR_PRODUCTO;
DROP PROCEDURE ANADIR_PROFESOR;
DROP PROCEDURE ANADIR_TEST_T;
DROP PROCEDURE ANADIR_VALORACION;
DROP PROCEDURE APTO_EXAMEN_P;
DROP PROCEDURE APTO_EXAMEN_T;
DROP PROCEDURE BAJA_ALUMNO;
DROP PROCEDURE BENEFICIO_TOTAL;
DROP PROCEDURE COCHESREGISTRADOS;
DROP PROCEDURE GANANCIAS_TOTALES;
DROP PROCEDURE GANANCIASMESCONCRETO;
DROP PROCEDURE GASTO_COCHE;
DROP PROCEDURE GASTO_LOCAL;
DROP PROCEDURE GASTO_LUZ;
DROP PROCEDURE GASTO_TASAS;
DROP PROCEDURE GASTOS_MES;
DROP PROCEDURE GASTOSTOTALES;
DROP PROCEDURE LISTAALUMNOSDEUNCOCHE;
DROP PROCEDURE LISTADO_ALUMNOS_FECHA_CONCRETA;
DROP PROCEDURE LISTADO_ALUMNOS_PROFESOR;
DROP PROCEDURE LISTADO_EXAMEN_PRACTICO;
DROP PROCEDURE LISTADO_PRODUCTOS_ALUMNO;
DROP PROCEDURE LISTALUMNOS_FECHA_EXT;
DROP PROCEDURE NUMALUMANOCONCRETO;
DROP PROCEDURE NUMALUMNOSMESCONCRETO;
DROP PROCEDURE PRODUCTO_OBSOLETO;
DROP PROCEDURE RESET_SEQ;

DROP FUNCTION ASSERT_EQUALS;
DROP FUNCTION COMPROBAR_PREPARADO_P;
DROP FUNCTION COMPROBAR_PREPARADO_T;


DROP PACKAGE PRUEBAS_ALUMNOS;
DROP PACKAGE PRUEBAS_CLASE_PRACTICA;
DROP PACKAGE PRUEBAS_COCHES;
DROP PACKAGE PRUEBAS_COMPRAS;
DROP PACKAGE PRUEBAS_EXAMEN_PRACTICO_DGT;
DROP PACKAGE PRUEBAS_EXAMEN_TEORICO_DGT;
DROP PACKAGE PRUEBAS_FACTURAS;
DROP PACKAGE PRUEBAS_GASTOS;
DROP PACKAGE PRUEBAS_LUZ;
DROP PACKAGE PRUEBAS_PRODUCTOS;
DROP PACKAGE PRUEBAS_PROFESORES;
DROP PACKAGE PRUEBAS_SEGURO_COCHE;
DROP PACKAGE PRUEBAS_SEGURO_LOCAL;
DROP PACKAGE PRUEBAS_TASAS;
DROP PACKAGE PRUEBAS_TEST_TEORICO;

CREATE TABLE alumnos(
num_alum varchar2(20) PRIMARY KEY NOT NULL,
dni varchar2(9) NOT NULL,
fecha_nac date NOT NULL,
nombre varchar2(50) NOT NULL,
apellidos varchar2(100) NOT NULL,
fecha_matriculacion date default sysdate not null,
telefono char(20) default NULL,
restricciones varchar2(150) default NULL,
estudios varchar2(50) CHECK (estudios IN('BASICOS', 'SECUNDARIOS', 'FORMACION PROFESIONAL', 'UNIVERSITARIOS')) not null ,
domicilio varchar2(100) NOT NULL,
oportunidades integer CHECK (oportunidades >=0 and oportunidades <= 3) NOT NULL,
cad_tasas date NOT NULL,
baja char(2) default 'NO' check(baja in ('SI', 'NO')) not null,
amigo varchar2(20),
FOREIGN KEY (amigo) REFERENCES alumnos(num_alum)
);

CREATE SEQUENCE num_alum;

CREATE TABLE examen_teorico_dgt(
num_ex_t integer NOT NULL PRIMARY KEY,
num_alum varchar2(20) NOT NULL,
fecha_ex date DEFAULT SYSDATE NOT NULL,
apto char(2) DEFAULT NULL check(apto in ('SI', 'NO')),
FOREIGN KEY (num_alum) REFERENCES alumnos(num_alum) ON DELETE CASCADE
);

CREATE SEQUENCE num_ex_t;

--carne CHAR(2) NOT NULL,
--tipoexamen varchar(20)

CREATE TABLE test_teorico(
cod_test integer NOT NULL PRIMARY KEY, --Donde cada cod_test, realmente, es un intento
num_alum varchar2(20) NOT NULL,
fecha date DEFAULT SYSDATE NOT NULL,
num_test integer CHECK(num_test > 0 and num_test < 90) NOT NULL,
num_fallos integer NOT NULL, --En ese intento cod_test
FOREIGN KEY (num_alum) REFERENCES alumnos(num_alum) ON DELETE CASCADE
);

CREATE SEQUENCE cod_test;

CREATE TABLE profesores(
num_prof integer NOT NULL PRIMARY KEY,
nombre varchar2(50) NOT NULL,
apellidos varchar2(100) NOT NULL,
pass varchar2(50) NOT NULL
);

CREATE SEQUENCE num_prof;

CREATE TABLE coches(
num_coche integer NOT NULL PRIMARY KEY,
matricula varchar2(10) NOT NULL,
ultima_ITV date DEFAULT NULL,
kms integer DEFAULT 0 NOT NULL,
ultimo_repostaje date DEFAULT NULL
);

CREATE SEQUENCE num_coche;

CREATE TABLE clase_practica(
num_clase integer NOT NULL PRIMARY KEY,
num_alum varchar2(20) NOT NULL,
num_prof integer NOT NULL,
num_coche integer NOT NULL,
fecha date DEFAULT SYSDATE NOT NULL,
valoracion integer CHECK (valoracion in (-1, 0, 1)),
kms_clase integer DEFAULT 0,
es_reciclaje char(2) DEFAULT 'NO' NOT NULL CHECK (es_reciclaje in ('SI', 'NO')),
incidencia varchar2(100) DEFAULT NULL,
FOREIGN KEY (num_alum) REFERENCES alumnos(num_alum) ON DELETE CASCADE,
FOREIGN KEY (num_prof) REFERENCES profesores(num_prof) ON DELETE CASCADE,
FOREIGN KEY (num_coche) REFERENCES coches(num_coche) ON DELETE CASCADE
);

CREATE SEQUENCE num_clase_p;

CREATE TABLE examen_practico_dgt(
num_ex_p integer NOT NULL PRIMARY KEY,
num_alum varchar2(20) NOT NULL,
fecha_ex date DEFAULT SYSDATE NOT NULL,
apto char(2) DEFAULT NULL CHECK (apto in ('SI', 'NO')),
FOREIGN KEY (num_alum) REFERENCES alumnos(num_alum) ON DELETE CASCADE
);

CREATE SEQUENCE num_ex_p;

CREATE TABLE productos(
cod_prod integer NOT NULL PRIMARY KEY,
producto varchar2(50) NOT NULL,
precio_producto number NOT NULL,
obsoleto char(2) DEFAULT 'NO' check(obsoleto in ('SI', 'NO'))
);

CREATE SEQUENCE cod_prod;

INSERT INTO productos VALUES (0, 'Clase pr�ctica gratis', 0, 'NO'); --Por defecto usamos esto para referenciar la clase gratis

CREATE TABLE compras (
cod_compra integer NOT NULL PRIMARY KEY,
num_alum varchar2(20) NOT NULL,
cod_prod integer NOT NULL,
precio_prod_fact number NOT NULL, --precio en el momento que se compra, no necesariamente el actual
fecha_compra date DEFAULT SYSDATE NOT NULL,
FOREIGN KEY (cod_prod) REFERENCES productos(cod_prod) ON DELETE CASCADE,
FOREIGN KEY (num_alum) REFERENCES alumnos(num_alum) ON DELETE CASCADE
);

CREATE SEQUENCE cod_compra;

CREATE TABLE facturas(
num_factura varchar2(50) NOT NULL PRIMARY KEY,
num_alum varchar2(20) NOT NULL,
precio_total number NOT NULL,
FOREIGN KEY (num_alum) REFERENCES alumnos(num_alum) ON DELETE CASCADE
);

CREATE SEQUENCE num_factura;

--Aqui tenemos una jerarquia que vamos a implementar usando una relacion para cada clase de la jerarquia

CREATE TABLE gastos(
cod_gasto integer NOT NULL PRIMARY KEY,
fecha date NOT NULL,
coste number NOT NULL);

CREATE SEQUENCE cod_gasto;

CREATE TABLE luz(
cod_gasto integer NOT NULL PRIMARY KEY,
proximo_cobro date NOT NULL,
gasto_kwh number NOT NULL,
FOREIGN KEY (cod_gasto) REFERENCES gastos(cod_gasto) ON DELETE CASCADE
);

CREATE TABLE seguro_local(
cod_gasto integer NOT NULL PRIMARY KEY,
fecha_renovacion date NOT NULL,
FOREIGN KEY (cod_gasto) REFERENCES gastos(cod_gasto)  ON DELETE CASCADE
);

CREATE TABLE seguro_coche(
cod_gasto integer NOT NULL PRIMARY KEY,
fecha_contratacion date NOT NULL,
fecha_vencimiento date NOT NULL,
num_coche integer NOT NULL,
FOREIGN KEY (cod_gasto) REFERENCES gastos(cod_gasto) ON DELETE CASCADE,
FOREIGN KEY (num_coche) REFERENCES coches(num_coche) ON DELETE CASCADE
);

CREATE TABLE TASAS(
cod_gasto integer NOT NULL PRIMARY KEY,
fecha_abono date default null,
num_alum varchar2(20) NOT NULL,
FOREIGN KEY (cod_gasto) REFERENCES gastos(cod_gasto) ON DELETE CASCADE,
FOREIGN KEY (num_alum) REFERENCES alumnos(num_alum) ON DELETE CASCADE
);

CREATE OR REPLACE
FUNCTION ASSERT_EQUALS (salida BOOLEAN, salida_esperada BOOLEAN) RETURN VARCHAR2 AS
BEGIN
  IF (salida = salida_esperada) THEN
    RETURN 'EXITO';
  ELSE
    RETURN 'FALLO';
  END IF;

END ASSERT_EQUALS;
