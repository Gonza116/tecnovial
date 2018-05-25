SET SERVEROUTPUT ON;

DECLARE
  w_cod_test integer;
  w_num_alum VARCHAR2(20);
  anyo char(4);
BEGIN
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
end;