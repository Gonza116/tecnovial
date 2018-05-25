SET SERVEROUTPUT ON;

DECLARE
    w_cod_gasto INTEGER;
    w_num_coche INTEGER;
BEGIN
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
    END;