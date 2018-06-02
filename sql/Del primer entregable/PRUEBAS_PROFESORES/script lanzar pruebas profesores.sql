SET SERVEROUTPUT ON;

DECLARE
w_num_prof integer;

BEGIN
DBMS_OUTPUT.put_line('');
DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE PROFESORES');
DBMS_OUTPUT.put_line('================================');
PRUEBAS_PROFESORES.inicializar;
PRUEBAS_PROFESORES.insertar('Prueba 01 - Inserción correcta', 'Isidro', 'Garrido López', true);
w_num_prof := num_prof.currval;
PRUEBAS_PROFESORES.insertar('Prueba 02 - Inserción con nombre null', null, 'Garrido López', false);
PRUEBAS_PROFESORES.insertar('Prueba 03 - Inserción con apellidos null', 'Isidro', null, false);
PRUEBAS_PROFESORES.actualizar_nombre('Prueba 04 - Cambiar nombre', w_num_prof, 'Isidoro', true);
PRUEBAS_PROFESORES.actualizar_apellidos('Prueba 05 - Cambiar apellidos', w_num_prof, 'López de Gomara', true);
PRUEBAS_PROFESORES.eliminar('Prueba 06 - Eliminar profesor', w_num_prof, true);

END;