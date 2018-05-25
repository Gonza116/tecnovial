/*Procedimiento encontrado en StackOverflow para el reinicio de secuencias
por Tom Kyte*/
create or replace
procedure reset_seq( p_seq_name in varchar2 )
is
    l_val number;
begin
    execute immediate
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;
    execute immediate
    'alter sequence ' || p_seq_name || ' increment by -' || l_val ||
                                                          ' minvalue 0';
    execute immediate
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;
    execute immediate
    'alter sequence ' || p_seq_name || ' increment by 1 minvalue 0';
end;
/
CREATE OR REPLACE PROCEDURE ANADIR_ALUMNO(
w_dni in alumnos.dni%type,
w_fecha_nac in alumnos.fecha_nac%type,
w_nombre in alumnos.nombre%type,
w_apellidos in alumnos.apellidos%type,
w_fecha_matriculacion in alumnos.fecha_matriculacion%type,
w_telefono in alumnos.telefono%type,
w_restricciones in alumnos.restricciones%type,
w_estudios in alumnos.estudios%type,
w_domicilio in alumnos.domicilio%type,
w_oportunidades in alumnos.oportunidades%type,
w_amigo in alumnos.amigo%type)
IS
w_num_alum varchar2(50);
anyoactual char(4);
anyoguardado char(4);
w_cad_tasas alumnos.cad_tasas%type;
ult_fecha_mat date;
BEGIN
SELECT EXTRACT(YEAR FROM sysdate) into anyoactual FROM dual;
SELECT max(fecha_matriculacion) into ult_fecha_mat FROM alumnos;
SELECT EXTRACT(YEAR FROM ult_fecha_mat) into anyoguardado FROM dual;
IF(anyoactual <> anyoguardado)
THEN reset_seq('num_alum');
END IF;
SELECT (w_fecha_matriculacion + 180) INTO w_cad_tasas FROM dual;
w_num_alum := num_alum.nextval || '/' || anyoactual;
INSERT INTO alumnos VALUES (w_num_alum, w_dni, w_fecha_nac, w_nombre,
w_apellidos, w_fecha_matriculacion, w_telefono, w_restricciones, w_estudios, w_domicilio,
w_oportunidades, w_cad_tasas, 'NO', w_amigo);

END ANADIR_ALUMNO;
/
CREATE OR REPLACE PROCEDURE ANADIR_EXAMEN_T(
w_num_alum in examen_teorico_dgt.num_alum%type,
w_fecha_ex in examen_teorico_dgt.fecha_ex%type,
w_apto in examen_teorico_dgt.apto%type)
IS

BEGIN
INSERT INTO examen_teorico_dgt VALUES
(num_ex_t.nextval, w_num_alum, w_fecha_ex, w_apto);

END ANADIR_EXAMEN_T;
/
CREATE OR REPLACE PROCEDURE APTO_EXAMEN_T(
w_num_examen in examen_teorico_dgt.num_ex_t%type,
w_num_alum in alumnos.num_alum%type,
w_apto in examen_teorico_dgt.apto%type)
IS
BEGIN
UPDATE examen_teorico_dgt SET apto=w_apto WHERE num_ex_t=w_num_examen;
IF w_apto='NO' THEN UPDATE alumnos SET oportunidades = oportunidades-1 WHERE num_alum=w_num_alum;
END IF;
END APTO_EXAMEN_T;
/
CREATE OR REPLACE PROCEDURE ANADIR_TEST_T(
w_num_alum in test_teorico.num_alum%type,
w_fecha in test_teorico.fecha%type,
w_num_test in test_teorico.num_test%type,
w_num_fallos in test_teorico.num_fallos%type)
IS
BEGIN
INSERT INTO test_teorico VALUES (cod_test.nextval, w_num_alum, w_fecha,
w_num_test, w_num_fallos);
END ANADIR_TEST_T;
/
CREATE OR REPLACE FUNCTION COMPROBAR_PREPARADO_T(
w_num_alum in test_teorico.num_alum%type)
RETURN VARCHAR2
IS
w_num_fallos integer;
resultado varchar2(50);
BEGIN
SELECT avg(min(num_fallos)) INTO w_num_fallos FROM(test_teorico) WHERE num_alum = w_num_alum GROUP BY num_test;
IF(w_num_fallos <= 3) THEN resultado := 'Alumno preparado';
ELSE resultado := 'Alumno no preparado';
END IF;
RETURN resultado;
END COMPROBAR_PREPARADO_T;
/
CREATE OR REPLACE FUNCTION COMPROBAR_PREPARADO_P(
w_num_alum in clase_practica.num_alum%type)
RETURN VARCHAR2
IS
resultado integer;
preparado varchar2(50);
BEGIN
SELECT sum(valoracion) into resultado from clase_practica where num_alum = w_num_alum;
IF(resultado IS NOT NULL) then preparado := 'Los puntos obtenidos por el alumno son ' || resultado;
END IF;
RETURN preparado;
END COMPROBAR_PREPARADO_P;
/
CREATE OR REPLACE PROCEDURE ANADIR_PROFESOR(
w_nombre in profesores.nombre%type,
w_apellidos in profesores.apellidos%type,
w_pass in profesores.pass%type)
IS
BEGIN
INSERT INTO profesores VALUES (num_prof.nextval, w_nombre, w_apellidos, w_pass);
END ANADIR_PROFESOR;
/
CREATE OR REPLACE PROCEDURE ANADIR_COCHE(
w_matricula in coches.matricula%type,
w_ultima_itv in coches.ultima_ITV%type,
w_kms in coches.kms%type,
w_ultimo_repostaje in coches.ultimo_repostaje%type)
IS
BEGIN
INSERT INTO coches VALUES (num_coche.nextval, w_matricula, w_ultima_itv, w_kms, w_ultimo_repostaje);
END ANADIR_COCHE;
/
CREATE OR REPLACE PROCEDURE ACTUALIZAR_REPOSTAJE(
w_num_coche in coches.num_coche%type,
w_ultimo_repostaje in coches.ultimo_repostaje%type)
IS
BEGIN
UPDATE coches SET ultimo_repostaje = w_ultimo_repostaje WHERE num_coche = w_num_coche;
END ACTUALIZAR_REPOSTAJE;
/
CREATE OR REPLACE PROCEDURE ACTUALIZAR_ITV(
w_num_coche in coches.num_coche%type,
w_ultima_itv in coches.ultima_itv%type)
IS
BEGIN
UPDATE coches SET ultima_itv = w_ultima_itv WHERE num_coche = w_num_coche;
END ACTUALIZAR_ITV;
/
CREATE OR REPLACE PROCEDURE ACTUALIZAR_KMS(
w_num_coche in coches.num_coche%type,
w_kms in coches.kms%type)
IS
BEGIN
UPDATE coches SET kms = w_kms WHERE num_coche = w_num_coche;
END ACTUALIZAR_KMS;
/
CREATE OR REPLACE PROCEDURE ANADIR_CLASE_PRACTICA(
w_num_alum in clase_practica.num_alum%type,
w_num_prof in clase_practica.num_prof%type,
w_num_coche in clase_practica.num_coche%type,
w_fecha in clase_practica.fecha%type,
w_es_reciclaje in clase_practica.es_reciclaje%type)
IS
BEGIN
INSERT INTO clase_practica VALUES (num_clase_p.nextval, w_num_alum, w_num_prof,
w_num_coche, w_fecha, null, null, w_es_reciclaje, null);
--A partir de aquí, se realiza la suma de los kilómetros más los kilómetros anteriores

--A partir de aquí, se realiza la suma de los puntos del alumno

--IF (puntos_totales = 20) THEN RAISE_APPLICATION_ERROR (-20610,' El alumno está preparado. (20 puntos conseguidos) ');
--END IF;

END ANADIR_CLASE_PRACTICA;
/
CREATE OR REPLACE PROCEDURE ANADIR_VALORACION(
w_num_alum in CLASE_PRACTICA.NUM_ALUM%type,
w_num_clase in clase_practica.num_clase%type,
w_valoracion in clase_practica.valoracion%type,
w_num_coche in clase_practica.num_coche%type,
w_kms_clase in clase_practica.kms_clase%type,
w_incidencia in clase_practica.incidencia%type)
IS
puntos_totales integer;
BEGIN
UPDATE clase_practica SET valoracion = w_valoracion WHERE num_clase = w_num_clase;
UPDATE clase_practica SET kms_clase = w_kms_clase WHERE num_clase = w_num_clase;
UPDATE clase_practica SET incidencia = w_incidencia WHERE num_clase = w_num_clase;
--SELECT sum(kms_clase) INTO kms_nuevos FROM clase_practica WHERE num_coche = w_num_coche;
UPDATE coches SET kms = w_kms_clase + kms WHERE num_coche = w_num_coche;
SELECT sum(valoracion) INTO puntos_totales FROM clase_practica WHERE num_alum = w_num_alum;
END ANADIR_VALORACION;
/
CREATE OR REPLACE PROCEDURE ANADIR_EXAMEN_P(
w_num_alum in examen_practico_dgt.num_alum%type,
w_fecha_ex in examen_practico_dgt.fecha_ex%type,
w_apto in examen_practico_dgt.apto%type)
IS
BEGIN
INSERT INTO examen_practico_dgt VALUES (num_ex_p.nextval, w_num_alum,
w_fecha_ex, w_apto);
END ANADIR_EXAMEN_P;
/
CREATE OR REPLACE PROCEDURE APTO_EXAMEN_P(
w_num_ex_p in examen_practico_dgt.num_ex_p%type,
w_num_alum in alumnos.num_alum%type,
w_apto in examen_practico_dgt.apto%type)
IS
BEGIN
UPDATE examen_practico_dgt SET apto = w_apto WHERE num_ex_p = w_num_ex_p;
IF w_apto = 'NO' THEN UPDATE alumnos SET oportunidades = oportunidades-1 WHERE num_alum=w_num_alum;
END IF;
END APTO_EXAMEN_P;
/
CREATE OR REPLACE PROCEDURE ANADIR_PRODUCTO(
w_producto in productos.producto%type,
w_precio_producto in productos.precio_producto%type)
IS
BEGIN
INSERT INTO productos VALUES (cod_prod.nextval, w_producto, w_precio_producto, 'NO');
END ANADIR_PRODUCTO;
/
CREATE OR REPLACE PROCEDURE ANADIR_COMPRA(
w_num_alum in alumnos.num_alum%type,
w_cod_prod in compras.cod_prod%type,
w_fecha_compra in compras.fecha_compra%type)
IS
w_precio_prod_fact compras.precio_prod_fact%type;
BEGIN
SELECT precio_producto INTO w_precio_prod_fact FROM productos WHERE cod_prod=w_cod_prod;
INSERT INTO compras VALUES (cod_compra.nextval, w_num_alum,
w_cod_prod, w_precio_prod_fact, w_fecha_compra);
END ANADIR_COMPRA;
/
/*CREATE OR REPLACE PROCEDURE ANADIR_FACTURA
(w_num_alum in alumnos.num_alum%TYPE)
IS
w_precio_total facturas.precio_total%type;
anyo char(4);
w_num_factura facturas.num_factura%type;
BEGIN
SELECT EXTRACT(YEAR FROM SYSDATE) INTO ANYO FROM DUAL;
w_num_factura := num_factura.nextval || '/' || anyo;
SELECT sum(precio_prod_fact) INTO w_precio_total FROM compras WHERE num_alum = w_num_alum;
INSERT INTO facturas VALUES (w_num_factura, w_num_alum, w_precio_total);
END ANADIR_FACTURA;*/
CREATE OR REPLACE PROCEDURE ANADIR_FACTURA
(w_num_alum in alumnos.num_alum%TYPE)
IS
w_precio_total facturas.precio_total%type;
anyo char(4);
w_num_factura facturas.num_factura%type;
BEGIN
SELECT EXTRACT(YEAR FROM SYSDATE) INTO ANYO FROM DUAL;
w_num_factura := num_factura.nextval || '/' || anyo;
SELECT sum(precio_prod_fact) INTO w_precio_total FROM compras WHERE num_alum = w_num_alum;
IF(w_precio_total IS NOT NULL) THEN
INSERT INTO facturas VALUES (w_num_factura, w_num_alum, w_precio_total);
ELSE INSERT INTO facturas VALUES (w_num_factura, w_num_alum, 0);
END IF;
END ANADIR_FACTURA;
/
CREATE OR REPLACE PROCEDURE GASTO_LUZ(
w_fecha in gastos.fecha%type,
w_coste in gastos.coste%type,
w_proximo_cobro in luz.proximo_cobro%type,
w_gasto_kwh in luz.gasto_kwh%type)
IS
w_cod_gasto gastos.cod_gasto%type;
BEGIN
w_cod_gasto := cod_gasto.nextval;
INSERT INTO gastos VALUES (w_cod_gasto, w_fecha,
w_coste);
INSERT INTO luz VALUES (w_cod_gasto, w_proximo_cobro,
w_gasto_kwh);
END GASTO_LUZ;
/
CREATE OR REPLACE PROCEDURE GASTO_LOCAL(
w_fecha in gastos.fecha%type,
w_coste in gastos.coste%type,
w_fecha_renovacion in seguro_local.fecha_renovacion%type)
IS
w_cod_gasto gastos.cod_gasto%type;
BEGIN
w_cod_gasto := cod_gasto.nextval;
INSERT INTO gastos VALUES (w_cod_gasto, w_fecha,
w_coste);
INSERT INTO seguro_local VALUES (w_cod_gasto, w_fecha_renovacion);
END GASTO_LOCAL;
/
CREATE OR REPLACE PROCEDURE GASTO_COCHE(
w_fecha in gastos.fecha%type,
w_coste in gastos.coste%type,
w_fecha_contratacion in seguro_coche.fecha_contratacion%type,
w_fecha_vencimiento in seguro_coche.fecha_vencimiento%type,
w_num_coche in seguro_coche.num_coche%type)
IS
w_cod_gasto gastos.cod_gasto%type;
BEGIN
w_cod_gasto := cod_gasto.nextval;
INSERT INTO gastos VALUES (w_cod_gasto, w_fecha,
w_coste);
INSERT INTO seguro_coche VALUES (w_cod_gasto, w_fecha_contratacion, w_fecha_vencimiento,
    w_num_coche);
END GASTO_COCHE;
/
CREATE OR REPLACE PROCEDURE GASTO_TASAS(
w_fecha in gastos.fecha%type,
w_coste in gastos.coste%type,
w_fecha_abono in tasas.fecha_abono%type,
w_num_alum in tasas.num_alum%type)
IS
w_cod_gasto gastos.cod_gasto%type;
nueva_caducidad date;
BEGIN
w_cod_gasto := cod_gasto.nextval;
INSERT INTO gastos VALUES (w_cod_gasto, w_fecha, w_coste);
INSERT INTO tasas VALUES (w_cod_gasto, w_fecha_abono, w_num_alum);
IF(w_fecha_abono IS NOT NULL) THEN
SELECT ADD_MONTHS(TO_DATE(w_fecha_abono,'DD/MM/YYYY'),6) INTO nueva_caducidad FROM DUAL;
UPDATE alumnos SET cad_tasas = nueva_caducidad, oportunidades = (oportunidades + 3) WHERE num_alum = w_num_alum;
END IF;
END GASTO_TASAS;
/
CREATE OR REPLACE PROCEDURE BAJA_ALUMNO(
w_alumno in alumnos.num_alum%type)
IS
BEGIN
UPDATE alumnos SET baja='SI' WHERE (num_alum=w_alumno);
END BAJA_ALUMNO;
/
CREATE OR REPLACE PROCEDURE PRODUCTO_OBSOLETO(
w_cod_prod in productos.cod_prod%type)
IS
BEGIN
UPDATE productos SET obsoleto='SI' WHERE (cod_prod=w_cod_prod);
END PRODUCTO_OBSOLETO;
