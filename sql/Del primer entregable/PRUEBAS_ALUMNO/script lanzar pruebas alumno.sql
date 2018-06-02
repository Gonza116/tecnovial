SET SERVEROUTPUT ON;

DECLARE
  w_num_alum varchar2(20);
  anyo CHAR(4);
  w_amigo varchar2(20);
BEGIN
SELECT EXTRACT(year FROM sysdate) INTO anyo FROM dual;
ANADIR_ALUMNO('11211139Y', '01/01/1970', 'Dummy12', 'Try', sysdate, '954111111', 'No existe', 'BASICOS','Dummyland', 3, null);
w_amigo := num_alum.currval || '/' || anyo;
DBMS_OUTPUT.put_line(' ');
DBMS_OUTPUT.put_line('PRUEBAS EN LA TABLA DE ALUMNOS');
DBMS_OUTPUT.put_line('===========================================');
PRUEBAS_ALUMNOS.INICIALIZAR;
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 01 - Inserción correcta', '12345678A', '30/12/1998', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, null, true);
w_num_alum := num_alum.currval || '/' || anyo;
--En estas pruebas vamos cambiando el DNI para que no salte el fallo de que dos elementos son iguales
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 02 - Inserción con dni null', null, '30/12/1998', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 03 - Inserción con dni incorrecto', '1234567A', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 04 - Inserción con fecha de nacimiento null', '12345678G', null, 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 05 - Inserción con nombre null', '12345678B', '12/05/2017', null, 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 06 - Inserción con apellidos null', '12345678C', '12/05/2017', 'Ángeles', null, sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 07 - Inserción con fecha de matriculacion null', '12345678D', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', null, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 08 - Inserción con telefono null', '12345678E', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, null, 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 09 - Inserción con restricciones null', '12345678G', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', null, 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 10 - Inserción con estudios null', '12345678F', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', null,'San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 10 - Inserción con estudios incorrectos', '12345678G', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'Estudios','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 11 - Inserción con domicilio null', '12345678H', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITATIOS', null, 2, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 12 - Inserción con oportunidades null', '12345678I', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITATIOS', 'San José', null, w_amigo, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 13 - Inserción con amigo null', '12345678J', '12/05/2017', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITATIOS', 'San José', 2, null, false);
PRUEBAS_ALUMNOS.INSERTAR ('Prueba 14 - Inserción de un alumno que ya está', '12345678A', '30/12/1998', 'Ángeles', 'Mohamed-Fadel Liñán', sysdate, '736372734', 'Ninguna', 'UNIVERSITARIOS','San José', 2, w_amigo, false);
PRUEBAS_ALUMNOS.ACTUALIZAR_DNI ('Prueba 15 - Cambiar dni de un alumno', w_num_alum, '53349888P', true);
PRUEBAS_ALUMNOS.ACTUALIZAR_DNI ('Prueba 16 - Cambiar dni de un alumno a uno erróneo', w_num_alum, '1', false);
PRUEBAS_ALUMNOS.ACTUALIZAR_FECHA_NAC('Prueba 17 - Cambiar fecha de nacimiento de un alumno', w_num_alum, '10/05/1998', true);
pruebas_alumnos.actualizar_nombre ('Prueba 18 - Cambiar el nombre de un alumno', w_num_alum, 'Angeles', true);
pruebas_alumnos.actualizar_apellidos ('Prueba 19 - Cambiar los apellidos de un alumno', w_num_alum, 'Mohamed Fadel Lián', true);
pruebas_alumnos.actualizar_telefono ('Prueba 20 - Cambiar teléfono de un alumno', w_num_alum, '+34 675318973', true);
pruebas_alumnos.actualizar_restricciones ('Prueba 21 - Añadir restricciones a un alumno', w_num_alum, 'Necesita gafas', true);
pruebas_alumnos.actualizar_estudios ('Prueba 22 - Cambiar estudios', w_num_alum, 'FORMACION PROFESIONAL', true);
pruebas_alumnos.actualizar_estudios ('Prueba 23 - Cambiar estudios a unos incorrectos', w_num_alum, 'Estudios', false);
pruebas_alumnos.actualizar_domicilio ('Prueba 24 - Cambiar domicilio', w_num_alum, 'La Rinconada', true);
pruebas_alumnos.actualizar_oportunidades ('Prueba 25 - Actualizar oportunidades', w_num_alum, 1, true);
pruebas_alumnos.actualizar_oportunidades ('Prueba 26 - Actualizar oportunidades fuera del rango', w_num_alum, 10, false);
pruebas_alumnos.eliminar ('Prueba 27 - Eliminar alumno', w_num_alum, true);

end;
