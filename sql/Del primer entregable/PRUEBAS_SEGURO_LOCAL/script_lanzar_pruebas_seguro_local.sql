SET SERVEROUTPUT ON;

DECLARE
    w_cod_gasto INTEGER;
    
BEGIN
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
    