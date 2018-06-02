SET SERVEROUTPUT ON;

DECLARE
    w_cod_prod INTEGER;

BEGIN
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
  
   
END;