SET SERVEROUTPUT ON;

DECLARE
    w_num_factura varchar2(50);
    w_num_alum varchar(20);
    anyo char(4);

BEGIN
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
END;