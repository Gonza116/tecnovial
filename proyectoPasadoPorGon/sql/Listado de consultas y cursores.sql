--Alumnos que tienen clase una fecha concreta

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE listado_alumnos_fecha_concreta(w_fecha DATE)
IS
CURSOR c1 IS SELECT num_alum, nombre, apellidos FROM (alumnos NATURAL JOIN clase_practica) WHERE fecha = w_fecha;
w_num_alum alumnos.num_alum%type;
w_nombre alumnos.nombre%type;
w_apellidos alumnos.apellidos%type;
w_num integer;
BEGIN
SELECT COUNT(*) INTO w_num FROM (alumnos NATURAL JOIN clase_practica) WHERE fecha = w_fecha;
OPEN c1;
FETCH c1 into w_num_alum, w_nombre, w_apellidos;
    dbms_output.put_line('El día ' || w_fecha || ' los siguientes alumnos tienen clases');
    LOOP
    dbms_output.put_line(w_num_alum || ': ' || w_nombre || ' ' || w_apellidos);
    w_num := w_num -1;
    EXIT WHEN w_num = 0;
    END LOOP;
CLOSE c1;
END listado_alumnos_fecha_concreta;
/
--Alumnos que se presentan a examen práctico en una fecha concreta

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE listado_examen_practico(w_fecha DATE)
IS
CURSOR c1 IS SELECT num_alum, nombre, apellidos FROM (alumnos NATURAL JOIN examen_practico_dgt) WHERE fecha_ex = w_fecha;
w_num_alum alumnos.num_alum%type;
w_nombre alumnos.nombre%type;
w_apellidos alumnos.apellidos%type;
w_num integer;
BEGIN
SELECT COUNT(*) INTO w_num FROM (alumnos NATURAL JOIN examen_practico_dgt) WHERE fecha_ex = sysdate;
OPEN c1;
FETCH c1 into w_num_alum, w_nombre, w_apellidos;
    dbms_output.put_line('El día ' || w_fecha || ' los siguientes alumnos tienen examen practico:');
    LOOP
    dbms_output.put_line(w_num_alum || ': ' || w_nombre || ' ' || w_apellidos);
    w_num := w_num -1;
    EXIT WHEN w_num = 0;
    END LOOP;
CLOSE c1;
END listado_examen_practico;
/
--Alumnos que se presentan a examen teórico en una fecha concreta
CREATE OR REPLACE PROCEDURE listAlumnos_fecha_exT(w_fecha DATE)
IS
CURSOR c1 IS SELECT num_alum, nombre, apellidos FROM (alumnos NATURAL JOIN examen_teorico_dgt) WHERE fecha_ex = w_fecha;
w_num_alum alumnos.num_alum%type;
w_nombre alumnos.nombre%type;
w_apellidos alumnos.apellidos%type;
w_num integer;
BEGIN
SELECT COUNT(*) INTO w_num FROM (alumnos NATURAL JOIN examen_teorico_dgt) WHERE fecha_ex = w_fecha;
OPEN c1;
FETCH c1 into w_num_alum, w_nombre, w_apellidos;
    dbms_output.put_line('El día ' || w_fecha || ' los siguientes alumnos tienen examen teórico');
    LOOP
    dbms_output.put_line(w_num_alum || ': ' || w_nombre || ' ' || w_apellidos);
    w_num := w_num -1;
    EXIT WHEN w_num = 0;
    END LOOP;
CLOSE c1;
END listAlumnos_fecha_exT;
/
--Alumnos matriculados en un mes

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE numAlumnosMesConcreto(w_num_mes integer)
IS
w_num integer;
BEGIN
SELECT COUNT(num_alum)INTO w_num FROM alumnos WHERE (select extract(month from fecha_matriculacion) from dual) = w_num_mes;
dbms_output.put_line('En el mes ' || w_num_mes || 'se han matriculado ' || w_num || ' alumnos');
END numAlumnosMesConcreto;
/
--Alumnos matriculados en un año

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE numAlumAnoConcreto(w_num_ano Integer)
IS
w_num integer;
BEGIN
SELECT COUNT(num_alum) INTO w_num FROM alumnos WHERE (select extract(month from fecha_matriculacion) from dual) = w_num_ano;
dbms_output.put_line('El año ' || w_num_ano || ' se han matriculado' || w_num || 'alumnos'); 
END numAlumAnoConcreto;
/
--Ganancias totales
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ganancias_totales(w_ejecutar varchar2)
IS
w_ganancias number;
BEGIN
SELECT SUM(precio_prod_fact) into w_ganancias FROM COMPRAS;
dbms_output.put_line('Las ganancias totales de la autoescuela son ' || w_ganancias);
END GANANCIAS_TOTALES;
/
--Ganancias totales en un mes

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE gananciasMesConcreto(w_num_mes integer)
IS
w_num integer;
BEGIN
SELECT SUM(precio_prod_fact) INTO w_num FROM COMPRAS WHERE (select extract(month from fecha_compra) from dual) = w_num_mes;
dbms_output.put_line('En el mes ' || w_num_mes || 'las ganancias han sido ' || w_num );
END gananciasMesConcreto;
/
--Gastos totales

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE gastosTotales(w_ejecutar varchar2)
IS
w_num integer;
BEGIN
SELECT SUM(coste) INTO w_num FROM GASTOS;
dbms_output.put_line('Los gastos totales son ' || w_num); 
END gastosTotales;
/
--Gastos totales en un mes concreto

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE gastos_mes(w_mes integer)
IS
w_gastos NUMBER;
BEGIN
SELECT SUM(coste) into w_gastos FROM GASTOS WHERE (select extract(month from fecha) from dual) = w_mes;
dbms_output.put_line('Los gastos del mes ' || w_mes || ' son de ' || w_gastos);
END gastos_mes;
/
--Numero de coches registrados

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE cochesRegistrados(w_ejecutar varchar2)
IS
w_num integer;
BEGIN
SELECT COUNT(num_coche) INTO w_num FROM coches;
dbms_output.put_line('Existen ' || w_num || 'coches registrados');
END cochesRegistrados;
/
--Alumnos de un profesor
CREATE OR REPLACE PROCEDURE listado_alumnos_profesor(w_num_prof integer)
IS
CURSOR c1 IS SELECT num_alum, nombre, apellidos, nombre FROM (alumnos NATURAL JOIN profesores) WHERE num_prof = w_num_prof;
w_num_alum alumnos.num_alum%type;
w_nombre alumnos.nombre%type;
w_apellidos alumnos.apellidos%type;
w_nombre_prof profesores.nombre%type;
w_num integer;
BEGIN
SELECT COUNT(*) INTO w_num FROM (alumnos NATURAL JOIN profesores) WHERE num_prof = 1;
OPEN c1;
FETCH c1 into w_num_alum, w_nombre, w_apellidos, w_nombre_prof;
    dbms_output.put_line('El profesor ' || w_num_prof || ' da clase a:');
    LOOP
    dbms_output.put_line(w_num_alum || ': ' || w_nombre || ' ' || w_apellidos);
    w_num := w_num -1;
    EXIT WHEN w_num = 0;
    END LOOP;
CLOSE c1;
END listado_alumnos_profesor;
/
--Alumnos usando un coche

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE listaAlumnosDeUnCoche(w_num_coche Integer)
IS
CURSOR c1 IS SELECT num_alum, nombre, apellidos FROM (alumnos NATURAL JOIN coches) WHERE num_coche = w_num_coche;
w_num_alum alumnos.num_alum%type;
w_nombre alumnos.nombre%type;
w_apellidos alumnos.apellidos%type;
w_num integer;
BEGIN
SELECT COUNT(*) INTO w_num FROM (alumnos NATURAL JOIN coches) WHERE num_coche = w_num_coche;
OPEN c1;
FETCH c1 into w_num_alum, w_nombre, w_apellidos;
    dbms_output.put_line('Con el coche ' || w_num_coche || ' están registrados los siguientes alumnos: ');
    LOOP
    dbms_output.put_line(w_num_alum || ': ' || w_nombre || ' ' || w_apellidos);
    w_num := w_num -1;
    EXIT WHEN w_num = 0;
    END LOOP;
CLOSE c1;
END listaAlumnosDeUnCoche;
/
--Productos totales comprados por un alumno

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE listado_productos_alumno(w_num_alum VARCHAR2)
IS
CURSOR c1 IS SELECT producto FROM (productos NATURAL JOIN compras NATURAL JOIN alumnos) WHERE num_alum = w_num_alum;
w_producto productos.producto%type;
w_num integer;
BEGIN
SELECT COUNT(*) INTO w_num FROM (productos NATURAL JOIN compras NATURAL JOIN alumnos) WHERE num_alum = w_num_alum;
OPEN c1;
FETCH c1 into w_producto;
    dbms_output.put_line('El alumno ' || w_num_alum || ' ha comprado los siguientes productos:');
    LOOP
    dbms_output.put_line(w_producto);
    w_num := w_num -1;
    EXIT WHEN w_num = 0;
    END LOOP;
CLOSE c1;
END listado_productos_alumno;
/
--Beneficio total
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE beneficio_total(w_num_mes integer)
IS
   CURSOR c1 IS 
   SELECT SUM(PRECIO_PROD_FACT) AS w_precio_prod_fact FROM COMPRAS WHERE (select extract(month from fecha_compra) from dual) = (select extract(month from sysdate) from dual);
   w_precio_prod_fact compras.precio_prod_fact%type;
   CURSOR c2 IS SELECT SUM(COSTE) AS w_coste FROM GASTOS WHERE (select extract(month from fecha) from dual) = (select extract(month from sysdate) from dual);
   w_coste gastos.coste%type;
   w_num integer;
BEGIN
    OPEN c1;
    OPEN c2;
    FETCH c1 INTO w_precio_prod_fact;
    FETCH c2 INTO w_coste;
    w_num := (w_precio_prod_fact - w_coste);
    DBMS_OUTPUT.PUT_LINE('El beneficio total en la fecha es de ' || w_num);
    CLOSE c1;
    CLOSE c2;
END;
/
--Añadir clases gratis
CREATE OR REPLACE PROCEDURE anadir_clase_gratis(w_num_alum IN alumnos.num_alum%type)
IS
   CURSOR c1 IS SELECT amigo FROM alumnos WHERE amigo = w_num_alum;
   w_num_iter integer;
   w_num_clases_gratis integer;
   n integer;
BEGIN
   n := 0;
   SELECT COUNT(*) INTO w_num_clases_gratis FROM COMPRAS WHERE cod_prod = 0 and num_alum = w_num_alum;
   FOR C1REC IN C1 LOOP
   w_num_iter := c1%rowcount;
   LOOP
    n := n + 1;
    IF(n > w_num_clases_gratis) THEN
    anadir_compra(w_num_alum, 0, sysdate);
    END IF;
    w_num_iter := w_num_iter - 1;
    EXIT WHEN w_num_iter = 0;
    END LOOP;
    END LOOP;
END;