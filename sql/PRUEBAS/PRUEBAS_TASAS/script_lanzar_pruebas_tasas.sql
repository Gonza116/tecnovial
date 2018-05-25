SET SERVEROUTPUT ON;

DECLARE
    w_cod_gasto INTEGER;
    w_num_alum VARCHAR2(20);
    anyo CHAR(4);
BEGIN
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
    END;
   
  