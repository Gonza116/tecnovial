SET SERVEROUTPUT ON;

DECLARE
    w_num_coche INTEGER;

BEGIN
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE COCHES');
    DBMS_OUTPUT.put_line('================================');
    pruebas_coches.inicializar;
    pruebas_coches.insertar('Prueba 01 - Inserci�n correcta', '1234 ABC', sysdate, 12000, sysdate, true);
    w_num_coche := num_coche.currval;
    pruebas_coches.insertar('Prueba 02 - Inserci�n del mismo coche', '1234 ABC', sysdate, 12000, sysdate, false);
    pruebas_coches.insertar('Prueba 03 - Inserci�n con matr�cula null', null, sysdate, 12000, sysdate, false);
    pruebas_coches.insertar('Prueba 04 - Inserci�n con ultima_itv null', '1235 ABC', null, 12000, sysdate, true);
    pruebas_coches.insertar('Prueba 05 - Inserci�n con kms null', '1236 ABC', sysdate, null, sysdate, false);
    pruebas_coches.insertar('Prueba 06 - Inserci�n con ultimo_repostaje null', '1237 ABC', sysdate, 12000, null, true);
    pruebas_coches.actualizar_kms('Prueba 07 - Actualizar kms', w_num_coche, 12116, true);
    pruebas_coches.actualizar_kms('Prueba 08 - Disminuir kms', w_num_coche, 11000, false);
    pruebas_coches.actualizar_ultima_itv('Prueba 09 - Actualizar �ltima ITV', w_num_coche, '12/03/2018', true);
    pruebas_coches.actualizar_ultima_itv('Prueba 10 - Actualizar �ltima ITV con una fecha anterior', w_num_coche, '01/01/2000', false);
    pruebas_coches.actualizar_ultimo_repostaje('Prueba 11 - Actualizar �ltimo repostaje', w_num_coche, '12/03/2018', true);
    pruebas_coches.actualizar_ultimo_repostaje('Prueba 12 - Actualizar �ltimo repostaje con una fecha anterior', w_num_coche, '01/01/2000', false);
    pruebas_coches.actualizar_matricula('Prueba 13 - Cambiar/actualizar matr�cula', w_num_coche, 'SE 1234 BC', true);
    pruebas_coches.eliminar('Prueba 14 - Eliminar coche', w_num_coche, true);
    
END;