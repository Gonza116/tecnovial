SET SERVEROUTPUT ON;

DECLARE
    w_cod_gasto INTEGER;

BEGIN
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
END;