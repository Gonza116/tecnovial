SET SERVEROUTPUT ON;

DECLARE
    w_cod_gasto INTEGER;
BEGIN
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
    END;