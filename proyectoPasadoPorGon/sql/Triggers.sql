CREATE OR REPLACE TRIGGER anadirAlumnos
BEFORE
    INSERT ON ALUMNOS
    FOR EACH ROW
    DECLARE
    CURSOR c1 IS SELECT nombre, apellidos, dni from alumnos WHERE (nombre = :new.nombre and apellidos = :new.apellidos and dni = :new.dni);
    resultado INTEGER;
BEGIN
    resultado := 0;
    FOR l IN c1 LOOP
        resultado := 1;
    END LOOP;
    IF (resultado = 1)
        THEN RAISE_APPLICATION_ERROR
        (-20600,' El alumno ya esta en la base de datos');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER dniValido
BEFORE
    INSERT OR UPDATE ON alumnos
    FOR EACH ROW
    DECLARE
BEGIN
    if(length(:new.dni) <> 9)
    then RAISE_APPLICATION_ERROR
        (-20601,' El DNI es inválido');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER mayorDeEdad
BEFORE
    INSERT ON examen_practico_dgt
    FOR EACH ROW
    DECLARE
    edad integer;
    w_fecha_nac date;
    w_fecha_ex date;
    anyonac char(4);
    anyoex char(4);
BEGIN
    SELECT fecha_nac INTO w_fecha_nac FROM alumnos WHERE num_alum=:new.num_alum;
    w_fecha_ex := :new.fecha_ex;
    SELECT EXTRACT (year from w_fecha_nac) into anyonac from dual;
    SELECT EXTRACT (year from w_fecha_ex) into anyoex from dual;
    edad := anyoex - anyonac;
    if(edad < 18) then RAISE_APPLICATION_ERROR(-20602, ' El alumno es menor en la fecha del examen');
    end if;
END;
/
/*CREATE OR REPLACE TRIGGER tasasCaducadasPractico
BEFORE
    INSERT ON examen_practico_dgt
    FOR EACH ROW
    DECLARE
    meses integer;
    w_cad_tasas date;
    w_fecha_ex date;
BEGIN
    SELECT cad_tasas INTO w_cad_tasas FROM alumnos WHERE num_alum=:new.num_alum;
    w_fecha_ex := :new.fecha_ex;
    meses := months_between(w_cad_tasas, w_fecha_ex);
    if(meses < 0) then RAISE_APPLICATION_ERROR(-20603, ' El alumno tiene las tasas caducadas');
    end if;
END;*/
/
/*CREATE OR REPLACE TRIGGER tasasCaducadasTeorico
BEFORE
    INSERT ON examen_teorico_dgt
    FOR EACH ROW
    DECLARE
    meses integer;
    w_cad_tasas date;
    w_fecha_ex date;
BEGIN
    SELECT cad_tasas INTO w_cad_tasas FROM alumnos WHERE num_alum=:new.num_alum;
    w_fecha_ex := :new.fecha_ex;
    meses := months_between(w_cad_tasas, w_fecha_ex);
    if(meses < 0) then RAISE_APPLICATION_ERROR(-20604, ' El alumno tiene las tasas caducadas');
    end if;
END;*/
/
--CREATE OR REPLACE TRIGGER claseGratis
--AFTER INSERT OR UPDATE ON alumnos
--FOR EACH ROW
--BEGIN
--  if(:new.trae_amigos = 'SI') then INSERT INTO COMPRAS VALUES (cod_compra.nextval, :old.num_alum, 0, 0, SYSDATE);
--  end if;
--END;
/
CREATE OR REPLACE TRIGGER alumnoAprobado
AFTER
    UPDATE ON examen_practico_dgt
    FOR EACH ROW
    DECLARE
    w_apto CHAR(2);
BEGIN
    w_apto := :new.apto;
    IF(w_apto = 'SI') then UPDATE alumnos SET baja = 'SI' WHERE num_alum = :new.num_alum;
    END IF;
END;
/
/*CREATE OR REPLACE TRIGGER itvCaducada
AFTER
    INSERT OR UPDATE ON coches
    FOR EACH ROW
    DECLARE
    caducidad integer;
    w_ultima_ITV date;
BEGIN
    w_ultima_ITV := :new.ultima_ITV;
    caducidad := months_between(sysdate, w_ultima_ITV);
    if(caducidad > 5 and caducidad < 6) then RAISE_APPLICATION_ERROR(-20605, ' AVISO IMPORTANTE: Falta un mes para que caduque la ITV');
    end if;
END;*/
/
/*CREATE OR REPLACE TRIGGER tasasCaducadas
AFTER
    INSERT OR UPDATE ON alumnos
    FOR EACH ROW
    DECLARE
    caducidad integer;
    w_cad_tasas date;
BEGIN
    w_cad_tasas := :new.cad_tasas;
    caducidad := months_between(sysdate, w_cad_tasas);
    if(caducidad > 5 and caducidad < 6) then RAISE_APPLICATION_ERROR(-20605, ' AVISO IMPORTANTE: Falta un mes para que caduquen las tasas');
    end if;
END;*/
/
/*CREATE OR REPLACE TRIGGER cambioDeAceite
AFTER
    UPDATE ON coches
    FOR EACH ROW
    DECLARE
    w_kms integer;
BEGIN
    w_kms := :new.kms;
    if(w_kms > 20000) then RAISE_APPLICATION_ERROR(-20606, ' AVISO IMPORTANTE: 20.000 kms recorridos, hay que cambiar el aceite');
    end if;
END;*/
/
/*CREATE OR REPLACE TRIGGER seguroCocheCita --Basado en un documento compartido por Nick Krasnov de la página web de StackOverflow
AFTER
    UPDATE ON seguro_coche
    FOR EACH ROW
    DECLARE
    caducidad date;
    w_fecha_vencimiento varchar2(11);
BEGIN
    w_fecha_vencimiento := :new.fecha_vencimiento;
    --caducidad := to_date(w_fecha_vencimiento, 'DD-MON-RR') - 15;
    caducidad := to_date(w_fecha_vencimiento, 'DD-MM-YY') - 15; --Quita 15 días a la fecha de vencimiento.
    if (caducidad = sysdate) then RAISE_APPLICATION_ERROR(-20607, ' AVISO IMPORTANTE: Faltan 15 días para renovar el seguro del coche');
    end if;
end;*/
/
CREATE OR REPLACE TRIGGER anadirCoche
BEFORE
    INSERT ON COCHES
    FOR EACH ROW
    DECLARE
    CURSOR c1 IS SELECT matricula from coches WHERE (matricula = :new.matricula);
    resultado INTEGER;
BEGIN
    resultado := 0;
    FOR l IN c1 LOOP
        resultado := 1;
    END LOOP;
    IF (resultado = 1)
        THEN RAISE_APPLICATION_ERROR
        (-20608,' El coche ya esta en la base de datos');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER restriccionKms
BEFORE
    UPDATE ON coches
    FOR EACH ROW
BEGIN
    if (:new.kms < :old.kms) then RAISE_APPLICATION_ERROR (-20609,' No pueden substraerse kilómetros de la cuenta total');
    end if;
end;
/
CREATE OR REPLACE TRIGGER restriccionITV
BEFORE
    UPDATE ON coches
    FOR EACH ROW
BEGIN
    if (:new.ultima_itv < :old.ultima_itv) then RAISE_APPLICATION_ERROR (-20610,' La última itv no puede haber sido antes que la anterior');
    end if;
end;
/
CREATE OR REPLACE TRIGGER restriccionRepostaje
BEFORE
    UPDATE ON coches
    FOR EACH ROW
BEGIN
    if (:new.ultimo_repostaje < :old.ultimo_repostaje) then RAISE_APPLICATION_ERROR (-20611,' El último repostaje no puede haber sido antes que el anterior');
    end if;
end;
/