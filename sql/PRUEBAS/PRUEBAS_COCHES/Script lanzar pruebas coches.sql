SET SERVEROUTPUT ON;

DECLARE
    w_num_coche INTEGER;

BEGIN
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE COCHES');
    DBMS_OUTPUT.put_line('================================');
    pruebas_coches.inicializar;
    pruebas_coches.insertar('Prueba 01 - Inserción correcta', '1234 ABC', sysdate, 12000, sysdate, true);
    w_num_coche := num_coche.currval;
    pruebas_coches.insertar('Prueba 02 - Inserción del mismo coche', '1234 ABC', sysdate, 12000, sysdate, false);
    pruebas_coches.insertar('Prueba 03 - Inserción con matrícula null', null, sysdate, 12000, sysdate, false);
    pruebas_coches.insertar('Prueba 04 - Inserción con ultima_itv null', '1235 ABC', null, 12000, sysdate, true);
    pruebas_coches.insertar('Prueba 05 - Inserción con kms null', '1236 ABC', sysdate, null, sysdate, false);
    pruebas_coches.insertar('Prueba 06 - Inserción con ultimo_repostaje null', '1237 ABC', sysdate, 12000, null, true);
    pruebas_coches.actualizar_kms('Prueba 07 - Actualizar kms', w_num_coche, 12116, true);
    pruebas_coches.actualizar_kms('Prueba 08 - Disminuir kms', w_num_coche, 11000, false);
    pruebas_coches.actualizar_ultima_itv('Prueba 09 - Actualizar última ITV', w_num_coche, '12/03/2018', true);
    pruebas_coches.actualizar_ultima_itv('Prueba 10 - Actualizar última ITV con una fecha anterior', w_num_coche, '01/01/2000', false);
    pruebas_coches.actualizar_ultimo_repostaje('Prueba 11 - Actualizar último repostaje', w_num_coche, '12/03/2018', true);
    pruebas_coches.actualizar_ultimo_repostaje('Prueba 12 - Actualizar último repostaje con una fecha anterior', w_num_coche, '01/01/2000', false);
    pruebas_coches.actualizar_matricula('Prueba 13 - Cambiar/actualizar matrícula', w_num_coche, 'SE 1234 BC', true);
    pruebas_coches.eliminar('Prueba 14 - Eliminar coche', w_num_coche, true);
    
END;