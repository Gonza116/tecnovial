SET SERVEROUTPUT ON;

DECLARE
  w_num_alum VARCHAR2(20);
  w_num_alum2 VARCHAR2(20);
  anyo CHAR(4);
  w_cod_prod integer;
  w_cod_compra integer;
BEGIN
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
end;
