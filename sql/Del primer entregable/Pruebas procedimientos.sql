/*****************************************************
**Este es el script de prueba de procedimientos.    **
**Dado que todos los "anadir_xxxx" se prueban con   **
**las otras pruebas, aquí vamos a comprobar los     **
**procedimientos que no sean operaciones de insertar**
*****************************************************/

SET SERVEROUTPUT ON;

/*****************************************************
**Primero, necesitamos llenar de valores las tablas **
*****************************************************/

EXECUTE ANADIR_ALUMNO('12345678A', '12/4/1990', 'Persona', 'Humana', sysdate, '987654321', null, 'FORMACION PROFESIONAL', 'Su casa', 3, null);
EXECUTE ANADIR_PRODUCTO('Paquete de prueba', '12,0');
EXECUTE ANADIR_PROFESOR('Profesor', 'De Autoescuela');
EXECUTE ANADIR_COCHE('1235ABC', sysdate, 11000, sysdate);
EXECUTE ANADIR_CLASE_PRACTICA(num_alum.currval||'/'||2018, num_prof.currval, num_coche.currval, '24/12/2017', +1, 12, 'NO', null);
EXECUTE ANADIR_CLASE_PRACTICA(num_alum.currval||'/'||2018, num_prof.currval, num_coche.currval, '25/12/2017', 0, 34, 'NO', null);
EXECUTE ANADIR_CLASE_PRACTICA(num_alum.currval||'/'||2018, num_prof.currval, num_coche.currval, '26/12/2017', +1, 12, 'NO', null);
EXECUTE ANADIR_CLASE_PRACTICA(num_alum.currval||'/'||2018, num_prof.currval, num_coche.currval, '27/12/2017', -1, 22, 'NO', null);
EXECUTE ANADIR_COMPRA(num_alum.currval||'/'||2018, cod_prod.currval, sysdate);
EXECUTE ANADIR_EXAMEN_P(num_alum.currval||'/'||2018, '28/01/2018', null);
EXECUTE ANADIR_EXAMEN_T(num_alum.currval||'/'||2018, sysdate, null);
EXECUTE ANADIR_FACTURA(num_alum.currval||'/'||2018);
EXECUTE ANADIR_TEST_T(num_alum.currval||'/'||2018, '12/12/2017', 84, 3);
EXECUTE ANADIR_TEST_T(num_alum.currval||'/'||2018, '12/12/2017', 24, 10);
EXECUTE ANADIR_TEST_T(num_alum.currval||'/'||2018, '12/12/2017', 24, 3);
EXECUTE ANADIR_TEST_T(num_alum.currval||'/'||2018, '12/12/2017', 54, 5);
EXECUTE ANADIR_TEST_T(num_alum.currval||'/'||2018, '12/12/2017', 82, 2);
EXECUTE ANADIR_TEST_T(num_alum.currval||'/'||2018, '12/12/2017', 81, 1);
EXECUTE ANADIR_TEST_T(num_alum.currval||'/'||2018, '12/12/2017', 76, 8);
EXECUTE GASTO_COCHE(sysdate, '120,0', '01/01/2018', '31/12/2018', num_coche.currval);
EXECUTE GASTO_LOCAL(sysdate, '50,0', '27/12/2018');
EXECUTE GASTO_LUZ(sysdate, '60,5', '20/03/2018', 125);
EXECUTE GASTO_TASAS('23/12/2017', '148,0', sysdate, num_alum.currval||'/'||2018);
INSERT INTO ALUMNOS VALUES('1000/2018', '12111111A', '23/01/1990', 'Mejor', 'Amigo', sysdate, null, null, 'UNIVERSITARIOS', 'La luna', 3, sysdate+180, 'NO', null);
INSERT INTO ALUMNOS VALUES('1001/2018', '12111111B', '23/01/1990', 'Amigo', 'Uno', sysdate, null, null, 'UNIVERSITARIOS', 'La luna', 3, sysdate+180, 'NO', '1000/2018');
INSERT INTO ALUMNOS VALUES('1002/2018', '12111111C', '23/01/1990', 'Amigo', 'Dos', sysdate, null, null, 'UNIVERSITARIOS', 'La luna', 3, sysdate+180, 'NO', '1000/2018');
DECLARE
w_num_coche integer;
w_num_clase integer;
w_num_examen integer;
w_num_alum varchar2(20);
w_cod_prod integer;
w_kms integer;
w_fecha_repostaje date;
w_valoracion integer;
w_apto char(2);
w_num_fallos integer;
w_comprobar_preparado_p varchar2(50);
w_comprobar_preparado_t varchar2(50);
w_baja char(2);
w_obsoleto char(2);
w_clases_gratis integer;
w_coste number;
w_precio_prod_fact number;
BEGIN
dbms_output.put_line('');
w_num_coche := num_coche.currval;
w_num_clase := num_clase_p.currval;
w_num_examen := num_ex_t.currval;
w_num_alum := num_alum.currval || '/' || 2018;
w_cod_prod := cod_prod.currval;

ACTUALIZAR_KMS(w_num_coche, 12500);
SELECT kms INTO w_kms FROM coches WHERE num_coche = w_num_coche;
IF(w_kms <> 12500) THEN dbms_output.put_line('Prueba de actualizar_kms: FALLO');
ELSE dbms_output.put_line('Prueba de actualizar_kms: EXITO');
END IF;

ACTUALIZAR_REPOSTAJE(w_num_coche, '18/01/2018');
SELECT ultimo_repostaje INTO w_fecha_repostaje FROM coches WHERE num_coche = w_num_coche; 
IF(w_fecha_repostaje <> '18/01/2018') THEN dbms_output.put_line('Prueba de actualizar_repostaje: FALLO');
ELSE dbms_output.put_line('Prueba de actualizar_repostaje: EXITO');
END IF;

ANADIR_VALORACION(w_num_clase, +1);
SELECT valoracion INTO w_valoracion FROM clase_practica WHERE num_clase = w_num_clase; 
IF(w_valoracion <> +1) THEN dbms_output.put_line('Prueba de anadir_valoracion: FALLO');
ELSE dbms_output.put_line('Prueba de anadir_valoracion: EXITO');
END IF;

APTO_EXAMEN_T(w_num_examen, 'NO');
SELECT apto INTO w_apto FROM examen_teorico_dgt WHERE num_ex_t = w_num_examen; 
IF(w_apto <> 'NO') THEN dbms_output.put_line('Prueba de apto_examen_t: FALLO');
ELSE dbms_output.put_line('Prueba de apto_examen_t: EXITO');
END IF;

APTO_EXAMEN_P(w_num_examen, 'SI');
SELECT apto INTO w_apto FROM examen_practico_dgt WHERE num_ex_p = w_num_examen; 
IF(w_apto <> 'SI') THEN dbms_output.put_line('Prueba de apto_examen_t: FALLO');
ELSE dbms_output.put_line('Prueba de apto_examen_t: EXITO');
END IF;

/*Los procedimientos para comprobar si un alumno está preparado son los más
difíciles de probar. Por los datos que tenemos sabemos que, en la práctica, 
tiene que tener 2 puntos, y que en la teoría, su media de fallos es de 3.6, así
que no está preparado. Veamos si esto se cumple*/

w_comprobar_preparado_t := comprobar_preparado_t(w_num_alum);
IF(w_comprobar_preparado_t <> 'Alumno no preparado') THEN dbms_output.put_line('Prueba de comprobar_preparado_t: FALLO');
ELSE dbms_output.put_line('Prueba de comprobar_preparado_t: EXITO');
END IF;

w_comprobar_preparado_p := comprobar_preparado_p(w_num_alum);
IF(w_comprobar_preparado_p <> 'Los puntos obtenidos por el alumno son 3') THEN dbms_output.put_line('Prueba de comprobar_preparado_p: FALLO');
ELSE dbms_output.put_line('Prueba de comprobar_preparado_p: EXITO');
END IF;

baja_alumno(w_num_alum);
SELECT baja INTO w_baja FROM alumnos WHERE num_alum = w_num_alum; 
IF(w_baja <> 'SI') THEN dbms_output.put_line('Prueba de baja_alumno: FALLO');
ELSE dbms_output.put_line('Prueba de baja_alumno: EXITO');
END IF;

producto_obsoleto(w_cod_prod);
SELECT obsoleto INTO w_obsoleto FROM productos WHERE cod_prod = w_cod_prod; 
IF(w_obsoleto <> 'SI') THEN dbms_output.put_line('Prueba de producto_obsoleto: FALLO');
ELSE dbms_output.put_line('Prueba de producto_obsoleto: EXITO');
END IF;

--Aquí estamos usando unos insert controlados en los que sabemos que el resultado debe ser 3
anadir_clase_gratis('1000/2018');
SELECT COUNT(*) INTO w_clases_gratis FROM COMPRAS WHERE cod_prod = 0 and num_alum = '1000/2018';
IF(w_clases_gratis <> 3) THEN dbms_output.put_line('Prueba de anadir_clase_gratis: FALLO');
ELSE dbms_output.put_line('Prueba de anadir_clase_gratis: EXITO');
END IF;

--Aquí estamos usando un insert que sabemos que debe dar 3
anadir_compra('1/2018', 1, '12/02/2018');
gasto_luz('25/02/2018', 9, '28/05/2018', 9);
SELECT SUM(PRECIO_PROD_FACT) INTO w_precio_prod_fact FROM COMPRAS WHERE (select extract(month from fecha_compra) from dual) = 2;
SELECT SUM(COSTE) INTO w_coste FROM GASTOS WHERE (select extract(month from fecha) from dual) = 2;
IF((w_precio_prod_fact - w_coste) <> 3) THEN dbms_output.put_line('Prueba de calcular el beneficio total: FALLO');
ELSE dbms_output.put_line('Prueba de calcular el beneficio total: EXITO');
END IF;
END;