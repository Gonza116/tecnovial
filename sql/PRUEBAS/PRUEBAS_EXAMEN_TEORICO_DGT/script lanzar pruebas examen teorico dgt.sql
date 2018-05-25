SET SERVEROUTPUT ON;

DECLARE
  w_num_ex_t integer;
  w_num_alum VARCHAR2(20);
  anyo CHAR(4);
BEGIN
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
end;
