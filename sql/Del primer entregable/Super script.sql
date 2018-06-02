SET SERVEROUTPUT ON;

DECLARE
   w_num_alum varchar2(20);
  anyo CHAR(4);
  w_amigo varchar2(20);
  w_cod_prod INTEGER;
  w_num_coche INTEGER;
  w_cod_gasto INTEGER;
  w_num_ex_p integer;
  w_num_clase integer;
    w_num_alum1 varchar(20);
    w_num_alum2 varchar(20);
    w_num_prof1 integer;
    w_num_prof2 integer;
    w_num_coche1 integer;
    w_num_coche2 integer;
  w_cod_compra integer;
  w_num_factura varchar2(50);
  w_num_prof integer;
  w_cod_test integer;
  w_num_ex_t integer; 
BEGIN
    /*****************************************************
    **                 PRUEBAS DE ALUMNO                **
    *****************************************************/
    SELECT EXTRACT(year FROM sysdate) INTO anyo FROM dual;
ANADIR_ALUMNO('11211139Y', '01/01/1970', 'Dummy12', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
w_amigo := num_alum.currval || '/' || anyo;
DBMS_OUTPUT.put_line(' ');
DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE ALUMNOS');
DBMS_OUTPUT.put_line('===========================================');
PRUEBAS_ALUMNOS.INICIALIZAR;
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 01 - Inserción correcta', '12345678A', '30/12/1998', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, null, true);
w_num_alum := num_alum.currval || '/' || anyo;
--En estas pruebas vamos cambiando el DNI para que no salte el fallo de que dos elementos son iguales
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 02 - Inserción con dni null', null, '30/12/1998', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 03 - Inserción con dni incorrecto', '1234567A', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 04 - Inserción con fecha de nacimiento null', '12345678G', null, 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 05 - Inserción con nombre null', '12345678B', '12/05/2017', null, 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 06 - Inserción con apellidos null', '12345678C', '12/05/2017', 'Ángeles', null, sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 07 - Inserción con fecha de matriculacion null', '12345678D', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', null, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 08 - Inserción con telefono null', '12345678E', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, null, 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 09 - Inserción con restricciones null', '12345678G', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', null, 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 10 - Inserción con estudios null', '12345678F', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', null,'San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 10 - Inserción con estudios incorrectos', '12345678G', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'Estudios','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 11 - Inserción con domicilio null', '12345678H', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITATIOS', null, 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 12 - Inserción con oportunidades null', '12345678I', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITATIOS', 'San José', null, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 13 - Inserción con amigo null', '12345678J', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITATIOS', 'San José', 2, null, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 14 - Inserción de un alumno que ya está', '12345678A', '30/12/1998', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.ACTUALIZAR_DNI ('Prueba 15 - Cambiar dni de un alumno', w_num_alum, '53349888P', true);
PRUEBAS_ALUMNOS.ACTUALIZAR_DNI ('Prueba 16 - Cambiar dni de un alumno a uno erróneo', w_num_alum, '1', false);
PRUEBAS_ALUMNOS.ACTUALIZAR_FECHA_NAC('Prueba 17 - Cambiar fecha de nacimiento de un alumno', w_num_alum, '10/05/1998', true);
pruebas_alumnos.actualizar_nombre ('Prueba 18 - Cambiar el nombre de un alumno', w_num_alum, 'Angeles', true);
pruebas_alumnos.actualizar_apellidos ('Prueba 19 - Cambiar los apellidos de un alumno', w_num_alum, 'Mohamed Fadel Lián', true);
pruebas_alumnos.actualizar_telefono ('Prueba 20 - Cambiar teléfono de un alumno', w_num_alum, '+34 675318973', true);
pruebas_alumnos.actualizar_restricciones ('Prueba 21 - Añadir restricciones a un alumno', w_num_alum, 'Necesita gafas', true);
pruebas_alumnos.actualizar_estudios ('Prueba 22 - Cambiar estudios', w_num_alum, 'FORMACION PROFESIONAL', true);
pruebas_alumnos.actualizar_estudios ('Prueba 23 - Cambiar estudios a unos incorrectos', w_num_alum, 'Estudios', false);
pruebas_alumnos.actualizar_domicilio ('Prueba 24 - Cambiar domicilio', w_num_alum, 'La Rinconada', true);
pruebas_alumnos.actualizar_oportunidades ('Prueba 25 - Actualizar oportunidades', w_num_alum, 1, true);
pruebas_alumnos.actualizar_oportunidades ('Prueba 26 - Actualizar oportunidades fuera del rango', w_num_alum, 10, false);
pruebas_alumnos.eliminar ('Prueba 27 - Eliminar alumno', w_num_alum, true);
    /*****************************************************
    **                 PRUEBAS DE PRODUCTO              **
    *****************************************************/
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE PRODUCTOS');
    DBMS_OUTPUT.put_line('================================');
    pruebas_productos.inicializar;
    pruebas_productos.insertar('Prueba 01 - Inserción correcta', '2x1', 20, true);
    w_cod_prod := cod_prod.currval;
    pruebas_productos.insertar('Prueba 02 - Inserción con producto null', null, 20, false);
    pruebas_productos.insertar('Prueba 03 - Inserción con precio_producto null', '2x1', null, false);
    pruebas_productos.actualizar_producto('Prueba 04 - Actualizar producto', w_cod_prod, 'Oferta navidad', true);
    pruebas_productos.actualizar_precio_producto('Prueba 05 - Actualizar precio producto', w_cod_prod, 18, true);
    pruebas_productos.actualizar_obsoleto('Prueba 06 - Actualizar último obsoleto', w_cod_prod, 'SI', true);
    pruebas_productos.eliminar('Prueba 07 - Eliminar producto', w_cod_prod, true);
    /*****************************************************
    **                 PRUEBAS DE COCHE                 **
    *****************************************************/
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE COCHES');
    DBMS_OUTPUT.put_line('================================');
    pruebas_coches.inicializar;
    pruebas_coches.insertar('Prueba 01 - Inserción correcta', '1234 ABC', sysdate, 12000, sysdate, true);
    w_num_coche := num_coche.currval;
    pruebas_coches.insertar('Prueba 02 - Inserción del mismo coche', '1234 ABC', sysdate, 12000, sysdate, false);
    pruebas_coches.insertar('Prueba 03 - Inserción con matrícula null', null, sysdate, 12000, sysdate, false);
    pruebas_coches.insertar('Prueba 04 - Inserción con ultima_itv null', '1235 ABC', null, 12000, sysdate, true);
    pruebas_coches.insertar('Prueba 05 - Inserción con kms null', '1236 ABC', sysdate, null, sysdate, false);
    pruebas_coches.insertar('Prueba 06 - Inserción con ultimo_repostaje null', '1237 ABC', sysdate, 12000, null, true);
    pruebas_coches.actualizar_kms('Prueba 07 - Actualizar kms', w_num_coche, 12116, true);
    pruebas_coches.actualizar_kms('Prueba 08 - Disminuir kms', w_num_coche, 11000, false);
    pruebas_coches.actualizar_ultima_itv('Prueba 09 - Actualizar última ITV', w_num_coche, '12/03/2018', true);
    pruebas_coches.actualizar_ultima_itv('Prueba 10 - Actualizar última ITV con una fecha anterior', w_num_coche, '01/01/2000', false);
    pruebas_coches.actualizar_ultimo_repostaje('Prueba 11 - Actualizar último repostaje', w_num_coche, '12/03/2018', true);
    pruebas_coches.actualizar_ultimo_repostaje('Prueba 12 - Actualizar último repostaje con una fecha anterior', w_num_coche, '01/01/2000', false);
    pruebas_coches.actualizar_matricula('Prueba 13 - Cambiar/actualizar matrícula', w_num_coche, 'SE 1234 BC', true);
    pruebas_coches.eliminar('Prueba 14 - Eliminar coche', w_num_coche, true);
    /*****************************************************
    **                 PRUEBAS DE GASTOS                **
    *****************************************************/
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE GASTOS');
    DBMS_OUTPUT.put_line('================================');
    PRUEBAS_GASTOS.INICIALIZAR;
    PRUEBAS_GASTOS.INSERTAR('Prueba 01 - Inserción correcta', '20/05/2017', 23, true);
    w_cod_gasto := cod_gasto.currval;
    PRUEBAS_GASTOS.INSERTAR('Prueba 02 - Inserción con fecha null', null, 23, false);
    PRUEBAS_GASTOS.INSERTAR('Prueba 03 - Inserción con coste null','20/05/2017', null, false);
    PRUEBAS_GASTOS.ACTUALIZAR_FECHA('Prueba 04 - Actualizar fecha', w_cod_gasto, '25/05/2017', true);
    PRUEBAS_GASTOS.ACTUALIZAR_COSTE('Prueba 05 - Actualizar coste', w_cod_gasto, 50, true);
    PRUEBAS_GASTOS.ELIMINAR('Prueba 06 - Eliminar gasto', w_cod_gasto, true);
    /*****************************************************
    **                 PRUEBAS DE TASAS                 **
    *****************************************************/
    ANADIR_ALUMNO('12345678Q', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, null);
    SELECT EXTRACT(YEAR FROM SYSDATE) INTO anyo FROM dual;
    w_num_alum := num_alum.currval || '/' || anyo;
    --Con esto lo que conseguimos es un alumno de prueba
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE TASAS');
    DBMS_OUTPUT.put_line('================================');
    pruebas_tasas.inicializar;
    pruebas_tasas.insertar('Prueba 01 - Inserción correcta', '26/12/2017', 120.0, sysdate, w_num_alum, true);
    w_cod_gasto := cod_gasto.currval;
    pruebas_tasas.insertar('Prueba 02 - Inserción con fecha_gasto null', null, 120.0, sysdate, w_num_alum, false);
    pruebas_tasas.insertar('Prueba 03 - Inserción con coste null', '26/12/2017', null, sysdate, w_num_alum, false);
    pruebas_tasas.insertar('Prueba 04 - Inserción con fecha_abono null', '26/12/2017', 120.0, null, w_num_alum, true);
    pruebas_tasas.insertar('Prueba 05 - Inserción con num_alum null', '26/12/2017', 120.0, sysdate, null, false);
    pruebas_tasas.actualizar_fecha_abono('Prueba 06 - Actualizar fecha_abono', w_cod_gasto, '07/01/2018', true);
    pruebas_tasas.eliminar('Prueba 07 - Eliminar tasa', w_cod_gasto, true);
    /*****************************************************
    **                 PRUEBAS DE EXAMEN PRACTICO DGT   **
    *****************************************************/
     ANADIR_ALUMNO('11111111D', '01/01/1970', 'Dummy', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
    SELECT EXTRACT(YEAR FROM SYSDATE) INTO anyo FROM dual;
    w_num_alum := num_alum.currval || '/' || anyo;
    DBMS_OUTPUT.put_line(' ');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE EXAMEN PRACTICO DGT');
    DBMS_OUTPUT.put_line('===========================================');
    PRUEBAS_EXAMEN_PRACTICO_DGT.INICIALIZAR;
    PRUEBAS_EXAMEN_PRACTICO_DGT.INSERTAR ('Prueba 01 - Inserción correcta', w_num_alum, '03/01/2018', 'SI', true);
    w_num_ex_p := num_ex_p.currval;
    PRUEBAS_EXAMEN_PRACTICO_DGT.INSERTAR('Prueba 02 - Inserción con num_alum null', null, '03/01/2018', 'SI', false);
    PRUEBAS_EXAMEN_PRACTICO_DGT.INSERTAR('Prueba 03 - Inserción con fecha_ex null', w_num_alum, null, 'SI', false);
    PRUEBAS_EXAMEN_PRACTICO_DGT.INSERTAR('Prueba 04 - Inserción con apto null', w_num_alum, '03/01/2018', null, true);
    PRUEBAS_EXAMEN_PRACTICO_DGT.ACTUALIZAR_APTO('Prueba 05 - Actualizar apto', w_num_ex_p, 'NO', true);
    PRUEBAS_EXAMEN_PRACTICO_DGT.ACTUALIZAR_FECHA_EX('Prueba 06 - Actualizar fecha_ex', w_num_ex_p, sysdate, true);
    PRUEBAS_EXAMEN_PRACTICO_DGT.ELIMINAR('Prueba 07 - Eliminar examen', w_num_ex_p, true);
    /*****************************************************
    **                 PRUEBAS DE CLASE PRACTICA        **
    *****************************************************/
     SELECT EXTRACT(YEAR FROM SYSDATE) INTO anyo FROM dual;
    ANADIR_ALUMNO('11111139Y', '01/01/1970', 'Dummy12', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
    w_num_alum1 := num_alum.currval || '/' || anyo;
    ANADIR_ALUMNO('11111138Y', '01/01/1970', 'Dummya12', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
    w_num_alum2 := num_alum.currval || '/' || anyo;
    ANADIR_PROFESOR('Profesoor', 'Unoo');
    w_num_prof1 := num_prof.currval;
    ANADIR_PROFESOR('Professor', 'Doos');
    w_num_prof2 := num_prof.currval;
    ANADIR_COCHE('1239 OWO', sysdate, 10000, sysdate);
    w_num_coche1 := num_coche.currval;
    ANADIR_COCHE('1238 UWU', sysdate, 10000, sysdate);
    w_num_coche2 := num_coche.currval;
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE CLASE PRACTICA');
    DBMS_OUTPUT.put_line('=====================================');
    PRUEBAS_CLASE_PRACTICA.INICIALIZAR;
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 01 - Inserción correcta', w_num_alum1, w_num_prof1, w_num_coche1, sysdate, 1, 32, 'NO', 'Ninguna', true);
    w_num_clase := num_clase_p.currval;
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 02 - Inserción con num_alum null', null, w_num_prof1, w_num_coche1, sysdate, 1, 32, 'NO', 'Ninguna', false);
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 03 - Inserción con num_prof null', w_num_alum1, null, w_num_coche1, sysdate, 1, 32, 'NO', 'Ninguna', false);
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 04 - Inserción con num_coche null', w_num_alum1, w_num_prof1, null, sysdate, 1, 32, 'NO', 'Ninguna', false);
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 05 - Inserción con fecha de la clase null', w_num_alum1, w_num_prof1, w_num_coche1, null, 1, 32, 'NO', 'Ninguna', false);
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 06 - Inserción con valoracion null', w_num_alum1, w_num_prof1, w_num_coche1, sysdate, null, 32, 'NO', 'Ninguna', false);
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 07 - Inserción con kms_clase null', w_num_alum1, w_num_prof1, w_num_coche1, sysdate, 1, null, 'NO', 'Ninguna', false);
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 08 - Inserción con es_reciclaje null', w_num_alum1, w_num_prof1, w_num_coche1, sysdate, 1, 32, null, 'Ninguna', false);
    PRUEBAS_CLASE_PRACTICA.INSERTAR('Prueba 09 - Inserción con incidencia null', w_num_alum1, w_num_prof1, w_num_coche1, sysdate, 1, 32, 'NO', null, true);
    PRUEBAS_CLASE_PRACTICA.actualizar_num_alum ('Prueba 10 - Cambiar num_alum', w_num_clase, w_num_alum2, true);
    PRUEBAS_CLASE_PRACTICA.actualizar_num_prof ('Prueba 11 - Cambiar num_prof', w_num_clase, w_num_prof2, true);
    PRUEBAS_CLASE_PRACTICA.actualizar_num_coche ('Prueba 12 - Cambiar num_coche', w_num_clase, w_num_coche2, true);
    PRUEBAS_CLASE_PRACTICA.actualizar_fecha ('Prueba 13 - Cambiar fecha',  w_num_clase, '12/02/2018', true);
    PRUEBAS_CLASE_PRACTICA.actualizar_valoracion ('Prueba 14 - Cambiar valoracion',  w_num_clase, -1, true); 
    PRUEBAS_CLASE_PRACTICA.actualizar_kms_clase ('Prueba 15 - Cambiar kms_clase',  w_num_clase, 45, true);
    PRUEBAS_CLASE_PRACTICA.actualizar_es_reciclaje ('Prueba 16 - Cambiar es_reciclaje',  w_num_clase, 'SI', true);
    PRUEBAS_CLASE_PRACTICA.actualizar_incidencia ('Prueba 17 - Cambiar incidencias',  w_num_clase, 'Se comio una farola', true);
    PRUEBAS_CLASE_PRACTICA.eliminar ('Prueba 18 - Eliminar clase', w_num_clase, true);
    /*****************************************************
    **                 PRUEBAS DE COMPRA                **
    *****************************************************/
    ANADIR_ALUMNO('11111112G', '01/01/1970', 'Dummy', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
    SELECT EXTRACT(YEAR FROM SYSDATE) INTO anyo FROM dual;
    w_num_alum := num_alum.currval || '/' || anyo;
    ANADIR_ALUMNO('11111113G', '01/01/1970', 'Dummya', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
    w_num_alum2:= num_alum.currval || '/' || anyo;
    ANADIR_PRODUCTO('Producto prueba', '18,0');
    w_cod_prod := cod_prod.currval;
    DBMS_OUTPUT.put_line(' ');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE COMPRAS');
    DBMS_OUTPUT.put_line('===========================================');
    PRUEBAS_COMPRAS.INICIALIZAR;
    PRUEBAS_COMPRAS.INSERTAR('Prueba 01 - Inserción correcta', w_num_alum, w_cod_prod, sysdate, true);
    w_cod_compra := cod_compra.currval;
    PRUEBAS_COMPRAS.INSERTAR('Prueba 02 - Inserción con num_alum null', null, w_cod_prod, sysdate, false);
    PRUEBAS_COMPRAS.INSERTAR('Prueba 03 - Inserción con cod_prod null', w_num_alum, null, sysdate, false);
    PRUEBAS_COMPRAS.INSERTAR('Prueba 04 - Inserción con fecha_compra null', w_num_alum, w_cod_prod, null, false);
    PRUEBAS_COMPRAS.ACTUALIZAR_NUM_ALUM('Prueba 05 - Cambiar num_alum', w_cod_compra, w_num_alum2, true);
    PRUEBAS_COMPRAS.ACTUALIZAR_COD_PROD('Prueba 06 - Cambiar cod_prod', w_cod_compra, 0, true);
    PRUEBAS_COMPRAS.ACTUALIZAR_FECHA_COMPRA('Prueba 07 - Cambiar fecha_compra', w_cod_compra, '25/01/2018', true);
    PRUEBAS_COMPRAS.ELIMINAR('Prueba 08 - Eliminar compra', w_cod_compra, true);
    /*****************************************************
    **                 PRUEBAS DE FACTURAS              **
    *****************************************************/
    SELECT EXTRACT(YEAR FROM SYSDATE) INTO anyo FROM dual;
    ANADIR_ALUMNO('13513128Y', '01/01/1970', 'Dummy', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
    w_num_alum := num_alum.currval || '/' || anyo;
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE FACTURAS');
    DBMS_OUTPUT.put_line('================================');
    PRUEBAS_FACTURAS.INICIALIZAR;
    PRUEBAS_FACTURAS.INSERTAR('Prueba 01 - Inserción correcta', w_num_alum, true);
    w_num_factura := num_factura.currval || '/' || anyo;
    PRUEBAS_FACTURAS.INSERTAR('Prueba 02 - Inserción con num_alum null', null, false);
    PRUEBAS_FACTURAS.ACTUALIZAR_NUM_ALUM('Prueba 02 - Actualizar num_alum', w_num_factura,  w_num_alum, true);
    PRUEBAS_FACTURAS.ACTUALIZAR_PRECIO_TOTAL('Prueba 03 - Actualizar precio', w_num_factura, '150,5', true);
    PRUEBAS_FACTURAS.ELIMINAR('Prueba 04 - Eliminar factura', w_num_factura, true);
    /*****************************************************
    **                 PRUEBAS DE LUZ                   **
    *****************************************************/
   DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE LUZ');
    DBMS_OUTPUT.put_line('================================');
    pruebas_luz.inicializar;
    pruebas_luz.insertar('Prueba 01 - Inserción correcta', '26/12/2017', 120, '28/01/2018', 500, true);
    w_cod_gasto := cod_gasto.currval;
    pruebas_luz.insertar('Prueba 02 - Inserción con fecha_gasto null', null, 120, '28/01/2018', 500, false);
    pruebas_luz.insertar('Prueba 03 - Inserción con coste null', '26/12/2017', null, '28/01/2018', 500, false);
    pruebas_luz.insertar('Prueba 04 - Inserción con proximo_cobro null', '26/12/2017', 120, null, 500, false);
    pruebas_luz.insertar('Prueba 05 - Inserción con gasto_kwh null', '26/12/2017', 120, '28/01/2018', null, false);
    pruebas_luz.actualizar_proximo_cobro('Prueba 06 - Actualizar proximo_cobro', w_cod_gasto, '07/03/2018', true);
    pruebas_luz.actualizar_gasto_kwh('Prueba 07 - Actualizar gasto_kwh', w_cod_gasto, 700, true);
    pruebas_luz.eliminar('Prueba 08 - Eliminar luz', w_cod_gasto, true);
    /*****************************************************
    **                 PRUEBAS DE PROFESORES            **
    *****************************************************/
DBMS_OUTPUT.put_line('');
DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE PROFESORES');
DBMS_OUTPUT.put_line('================================');
PRUEBAS_PROFESORES.inicializar;
PRUEBAS_PROFESORES.insertar('Prueba 01 - Inserción correcta', 'Isidro', 'Garrido López', true);
w_num_prof := num_prof.currval;
PRUEBAS_PROFESORES.insertar('Prueba 02 - Inserción con nombre null', null, 'Garrido López', false);
PRUEBAS_PROFESORES.insertar('Prueba 03 - Inserción con apellidos null', 'Isidro', null, false);
PRUEBAS_PROFESORES.actualizar_nombre('Prueba 04 - Cambiar nombre', w_num_prof, 'Isidoro', true);
PRUEBAS_PROFESORES.actualizar_apellidos('Prueba 05 - Cambiar apellidos', w_num_prof, 'López de Gomara', true);
PRUEBAS_PROFESORES.eliminar('Prueba 06 - Eliminar profesor', w_num_prof, true);
    /*****************************************************
    **                 PRUEBAS DE TEST TEORICO          **
    *****************************************************/
     ANADIR_ALUMNO('11111111D', '01/01/1970', 'Dummy4', 'Try', sysdate, '954118111', 'No existe', 'BASICOS','Dummyland', 3, null);
    SELECT EXTRACT(YEAR FROM SYSDATE) INTO anyo FROM dual;
    w_num_alum := num_alum.currval || '/' || anyo;
    DBMS_OUTPUT.put_line(' ');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE TEST TEORICO');
    DBMS_OUTPUT.put_line('===========================================');
    PRUEBAS_TEST_TEORICO.INICIALIZAR;
    PRUEBAS_TEST_TEORICO.INSERTAR ('Prueba 01 - Inserción correcta', w_num_alum, '03/01/2018', 50, 2, true);
    w_cod_test := cod_test.currval;
    PRUEBAS_TEST_TEORICO.INSERTAR('Prueba 02 - Inserción con num_alum null', null, '03/01/2018', 50, 2, false);
    PRUEBAS_TEST_TEORICO.INSERTAR('Prueba 03 - Inserción con fecha null', w_num_alum, null, 50, 2, false);
    PRUEBAS_TEST_TEORICO.INSERTAR('Prueba 04 - Inserción con num_test null', w_num_alum, '03/01/2018', null, 2, false);
    PRUEBAS_TEST_TEORICO.INSERTAR('Prueba 05 - Inserción con num_fallos null', w_num_alum, '03/01/2018', 50, null, false);
    PRUEBAS_TEST_TEORICO.ACTUALIZAR_NUM_ALUM('Prueba 05 - Actualizar num_alum', w_cod_test, w_num_alum, true);
    PRUEBAS_TEST_TEORICO.ACTUALIZAR_FECHA('Prueba 06 - Actualizar fecha', w_cod_test, sysdate, true);
    PRUEBAS_TEST_TEORICO.ACTUALIZAR_NUM_TEST('Prueba 06 - Actualizar num_test', w_cod_test, 57, true);
    PRUEBAS_TEST_TEORICO.ACTUALIZAR_NUM_FALLOS('Prueba 06 - Actualizar num_fallos', w_cod_test, 1, true);
    PRUEBAS_TEST_TEORICO.ELIMINAR('Prueba 07 - Eliminar examen', w_cod_test, true);
    /*****************************************************
    **                 PRUEBAS DE EXAMEN TEORICO        **
    *****************************************************/
    ANADIR_ALUMNO('12345678A', '01/01/1990', 'Dummy', 'Try', sysdate, '954123456', 'No existe', 'BASICOS','Dummyland', 3, null);
    SELECT EXTRACT(YEAR FROM SYSDATE) INTO anyo FROM dual;
    w_num_alum := num_alum.currval || '/' || anyo;
    DBMS_OUTPUT.put_line(' ');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE EXAMEN TEORICO DGT');
    DBMS_OUTPUT.put_line('===========================================');
    PRUEBAS_EXAMEN_TEORICO_DGT.INICIALIZAR;
    PRUEBAS_EXAMEN_TEORICO_DGT.INSERTAR ('Prueba 01 - Inserción correcta', w_num_alum, '03/01/2018', 'SI', true);
    w_num_ex_t := num_ex_t.currval;
    PRUEBAS_EXAMEN_TEORICO_DGT.INSERTAR('Prueba 02 - Inserción con num_alum null', null, '03/01/2018', 'SI', false);
    PRUEBAS_EXAMEN_TEORICO_DGT.INSERTAR('Prueba 03 - Inserción con fecha_ex null', w_num_alum, null, 'SI', false);
    PRUEBAS_EXAMEN_TEORICO_DGT.INSERTAR('Prueba 04 - Inserción con apto null', w_num_alum, '03/01/2018', null, true);
    PRUEBAS_EXAMEN_TEORICO_DGT.ACTUALIZAR_APTO('Prueba 05 - Actualizar apto', w_num_ex_t, 'NO', true);
    PRUEBAS_EXAMEN_TEORICO_DGT.ACTUALIZAR_FECHA_EX('Prueba 06 - Actualizar fecha_ex', w_num_ex_t, sysdate, true);
    PRUEBAS_EXAMEN_TEORICO_DGT.ELIMINAR('Prueba 07 - Eliminar examen', w_num_ex_t, true);
    /*****************************************************
    **                 PRUEBAS DE SEGURO COCHE          **
    *****************************************************/
    ANADIR_COCHE('1234 ABZ', '28/11/2017', 10000, sysdate);
    w_num_coche := num_coche.currval;
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE SEGURO_COCHE');
    DBMS_OUTPUT.put_line('================================');
    pruebas_seguro_coche.inicializar;
    pruebas_seguro_coche.insertar('Prueba 01 - Inserción correcta', '26/12/2017', 120, '30/12/2017', '30/05/2017', w_num_coche, true);
    w_cod_gasto := cod_gasto.currval;
    pruebas_seguro_coche.insertar('Prueba 02 - Inserción con fecha_gasto null', null, 120, '30/12/2017', '30/05/2017', w_num_coche, false);
    pruebas_seguro_coche.insertar('Prueba 03 - Inserción con coste null', '26/12/2017', null, '30/12/2017', '30/05/2017', w_num_coche, false);
    pruebas_seguro_coche.insertar('Prueba 04 - Inserción con fecha_contratacion null', '26/12/2017', 120, null, '30/05/2017', w_num_coche, false);
    pruebas_seguro_coche.insertar('Prueba 05 - Inserción con fecha_vencimiento null', '26/12/2017', 120, '30/12/2017', null, w_num_coche, false);
    pruebas_seguro_coche.actualizar_fecha_contratacion('Prueba 06 - Actualizar fecha_contratacion', w_cod_gasto, '07/01/2018', true);
    pruebas_seguro_coche.actualizar_fecha_vencimiento('Prueba 07 - Actualizar fecha_vencimiento', w_cod_gasto, '07/08/2018', true);
    pruebas_seguro_coche.eliminar('Prueba 08 - Eliminar seguro_coche', w_cod_gasto, true);
    /*****************************************************
    **                 PRUEBAS DE SEGURO LOCAL          **
    *****************************************************/
   DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE SEGURO LOCAL');
    DBMS_OUTPUT.put_line('================================');
    pruebas_seguro_local.inicializar;
    pruebas_seguro_local.insertar('Prueba 01 - Inserción correcta', '26/12/2017', 120, sysdate, true);
    w_cod_gasto := cod_gasto.currval;
    pruebas_seguro_local.insertar('Prueba 02 - Inserción con fecha_gasto null', null, 120, sysdate, false);
    pruebas_seguro_local.insertar('Prueba 03 - Inserción con coste null', '26/12/2017', null, sysdate, false);
    pruebas_seguro_local.insertar('Prueba 04 - Inserción con fecha_renovacion null', '26/12/2017', 120, null, false);
    pruebas_seguro_local.actualizar_fecha_renovacion('Prueba 06 - Actualizar fecha_renovacion', w_cod_gasto, '07/01/2018', true);
    pruebas_seguro_local.eliminar('Prueba 07 - Eliminar tasa', w_cod_gasto, true);
END;
