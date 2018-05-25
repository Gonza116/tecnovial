
function notificationOil() {
    var kms_antes = document.getElementById("kms_anteriores").value;
    var kms_actual = document.getElementById("kms").value;
    var error = "";
    
    if(kms_antes + kms_actual >= 20000) {
        error = window.alert("Es recomendable cambiar el aceite, 20000 kms superados");
    }
    return error;
}


function notificationTExams() {
    var nombre_alumno = document.getElementById("nombre_alumno").value;
    var fecha_examen_t = document.getElementById("fecha_ex_t").value.split("-");
    var cad_tasas = document.getElementById("cad_tasas").value.split("/");
    
    cad_tasas = new Date(parseInt(cad_tasas[2]),parseInt(cad_tasas[1]-1),parseInt(cad_tasas[0]));
    fecha_examen_t = new Date(parseInt(fecha_examen_t[0]),parseInt(fecha_examen_t[1]-1),parseInt(fecha_examen_t[2]));
    console.info(cad_tasas.getFullYear().toString().substr(-2));
    console.info(fecha_examen_t.getFullYear().toString().substr(-2));
    var error = "";
    
 if(cad_tasas.getFullYear().toString().substr(-2) < fecha_examen_t.getFullYear().toString().substr(-2)) {
        window.confirm('¡Las tasas de ' + nombre_alumno + ' están caducadas!');
    } else if (cad_tasas.getFullYear().toString().substr(-2) == fecha_examen_t.getFullYear().toString().substr(-2)) {
        if(cad_tasas.getMonth() == fecha_examen_t.getMonth()) {
            if(cad_tasas.getDate() <= fecha_examen_t.getDate()) {
                window.alert('¡Las tasas de ' + nombre_alumno + ' están caducadas!');
            }
        } else if (cad_tasas.getMonth() < fecha_examen_t.getMonth()) {
            window.alert('¡Las tasas de ' + nombre_alumno + ' están caducadas!');
        }
    }
    return error;
}

function notificationTasasP() {
    var nombre_alumno = document.getElementById("nombre_alumno").value;
    var fecha_examen_p = document.getElementById("fecha_ex_p").value.split("-");
    var cad_tasas = document.getElementById("cad_tasas").value.split("/");
    
    cad_tasas = new Date(parseInt(cad_tasas[2]),parseInt(cad_tasas[1]-1),parseInt(cad_tasas[0]));
    fecha_examen_p = new Date(parseInt(fecha_examen_p[0]),parseInt(fecha_examen_p[1]-1),parseInt(fecha_examen_p[2]));
    console.info(cad_tasas.getFullYear().toString().substr(-2));
    console.info(fecha_examen_p.getFullYear().toString().substr(-2));
    var error = "";
    
 if(cad_tasas.getFullYear().toString().substr(-2) < fecha_examen_p.getFullYear().toString().substr(-2)) {
        window.confirm('¡Las tasas de ' + nombre_alumno + ' están caducadas!');
    } else if (cad_tasas.getFullYear().toString().substr(-2) == fecha_examen_p.getFullYear().toString().substr(-2)) {
        if(cad_tasas.getMonth() == fecha_examen_p.getMonth()) {
            if(cad_tasas.getDate() <= fecha_examen_p.getDate()) {
                window.alert('¡Las tasas de ' + nombre_alumno + ' están caducadas!');
            }
        } else if (cad_tasas.getMonth() < fecha_examen_p.getMonth()) {
            window.alert('¡Las tasas de ' + nombre_alumno + ' están caducadas!');
        }
    }
    return error;
}

function notificationMenorEdad() {
    var nombre_alumno = document.getElementById("nombre_alumno").value;
    var fecha_examen_p = document.getElementById("fecha_ex_p").value.split("-");
    var fecha_nac = document.getElementById("fecha_nac").value.split("/");
    
    fecha_nac = new Date(parseInt(fecha_nac[2]),parseInt(fecha_nac[1]-1),parseInt(fecha_nac[0]));
    fecha_examen_p = new Date(parseInt(fecha_examen_p[0]),parseInt(fecha_examen_p[1]-1),parseInt(fecha_examen_p[2]));
    var error = "";
    console.info(fecha_examen_p);
    console.info(fecha_nac);
    
    var edad = fecha_examen_p.getFullYear() - (fecha_nac.getFullYear() + 100);
    var m = fecha_examen_p.getMonth() - fecha_nac.getMonth();
    console.info(edad);
    
     if(m < 0 || (m == 0 && fecha_examen_p.getDate() < fecha_nac.getDate())) {
        edad = edad - 1;
    } else if (edad < 18) {
        error = window.alert('El alumno ' + nombre_alumno + ' es menor en la fecha del examen práctico.')
    }
    return error;
    
}

function notificationPExams() {
    notificationTasasP();
    notificationMenorEdad();
}

function notificationITV() {
    var fecha_actual = new Date();
    var fecha_itv = document.getElementById("ult_itv").value.split("/");
    
    var error = "";
    
    fecha_itv = new Date(parseInt(fecha_itv[2]),parseInt(fecha_itv[1]-1),parseInt(fecha_itv[0]));
    var mes = fecha_actual.getMonth() + 1;
    if (mes < 10) {
        var mes = "0" + mes;
        }
    fecha_actual = fecha_actual.getDate() + "/" + mes + "/" + fecha_actual.getYear().toString().substr(-2);
    fecha_actual = fecha_actual.split("/");
    fecha_actual = new Date(parseInt(fecha_actual[2]),parseInt(fecha_actual[1]-1),parseInt(fecha_actual[0]));
    
    console.info(fecha_actual);
    console.info(fecha_itv);
    
        if(fecha_itv.getFullYear() == fecha_actual.getFullYear()) {
            if(fecha_itv.getDate() == fecha_actual.getDate()) {
                if (fecha_itv.getMonth() - 1 == fecha_actual.getMonth()){
                    error = window.alert('¡La ITV caduca en un mes!');
            } else if (fecha_itv.getMonth() == 1 && fecha_actual.getMonth() == 12) {
            error = window.alert('¡La ITV caduca en un mes!');
            }
        }
    }   
    return error;
   
}

function notificationTasas() {
    var nombre_alumno = document.getElementById("nombre_alumno").value;
    var cad_tasas = document.getElementById("cad_tasas").value.split("/");
    var fecha_actual = new Date();
    
    cad_tasas = new Date(parseInt(cad_tasas[2]),parseInt(cad_tasas[1]-1),parseInt(cad_tasas[0]));
    var mes = fecha_actual.getMonth() + 1;
    if (mes < 10) {
        var mes = "0" + mes;
        }
    fecha_actual = fecha_actual.getDate() + "/" + mes + "/" + fecha_actual.getYear().toString().substr(-2);
    fecha_actual = fecha_actual.split("/");
    fecha_actual = new Date(parseInt(fecha_actual[2]),parseInt(fecha_actual[1]-1),parseInt(fecha_actual[0]));
    
    var error = "";
    
    if(cad_tasas.getFullYear() == fecha_actual.getFullYear()) {
            if(cad_tasas.getDate() == fecha_actual.getDate()) {
                if (cad_tasas.getMonth() - 1 == fecha_actual.getMonth()){
                    error = window.alert('¡Las tasas de ' + nombre_alumno + ' caducan en un mes!');
            } else if (cad_tasas.getMonth() == 1 && fecha_actual.getMonth() == 12) {
            error = window.alert('¡Las tasas de ' + nombre_alumno + ' caducan en un mes!');
            }
        }
    }   
    
    return error;

}

function notificationITVAnterior() {
    var fecha_itv = document.getElementById("ult_itv").value.split("/");
    var fecha_nueva_itv = document.getElementById("fecha_nueva_itv").value.split("-");
    var res = true;
    
    fecha_itv = new Date(parseInt(fecha_itv[2]),parseInt(fecha_itv[1]-1),parseInt(fecha_itv[0]));
    fecha_nueva_itv = new Date(parseInt(fecha_nueva_itv[0]),parseInt(fecha_nueva_itv[1]-1),parseInt(fecha_nueva_itv[2]));
    
    fecha_itv.setFullYear(fecha_itv.getFullYear() + 100);
    fecha_itv.setDate(fecha_itv.getDate() + 1);
    
    if(fecha_itv.getFullYear() == fecha_nueva_itv.getFullYear()) {
            if(fecha_itv.getMonth() == fecha_nueva_itv.getMonth()) {
                if (fecha_itv.getDate() > fecha_nueva_itv.getDate()){
                    document.getElementById("div_fecha_nueva_itv").innerHTML = '<p>¡La ITV actualizada no puede ser menor que la anterior!</p>'
                    res = false;
            }
        } else if (fecha_itv.getMonth() > fecha_nueva_itv.getMonth()) {
            document.getElementById("div_fecha_nueva_itv").innerHTML = '<p>¡La ITV actualizada no puede ser menor que la anterior!</p>'
            res = false;
        }
    } else if (fecha_itv.getFullYear() > fecha_nueva_itv.getFullYear()) {
        document.getElementById("div_fecha_nueva_itv").innerHTML = '<p>¡La ITV actualizada no puede ser menor que la anterior!</p>'
        res = false;
    }
    return res;
}

function notificationRepAnterior() {
    var fecha_rep = document.getElementById("ult_rep").value.split("/");
    var fecha_nuevo_rep = document.getElementById("fecha_nuevo_repostaje").value.split("-");
    var res = true;
    
    fecha_rep = new Date(parseInt(fecha_rep[2]),parseInt(fecha_rep[1]-1),parseInt(fecha_rep[0]));
    fecha_nuevo_rep = new Date(parseInt(fecha_nuevo_rep[0]),parseInt(fecha_nuevo_rep[1]-1),parseInt(fecha_nuevo_rep[2]));
    
    fecha_rep.setFullYear(fecha_rep.getFullYear() + 100);
    fecha_rep.setDate(fecha_rep.getDate() + 1);
                 
    if(fecha_rep.getFullYear() == fecha_nuevo_rep.getFullYear()) {
            if(fecha_rep.getMonth() == fecha_nuevo_rep.getMonth()) {
                if (fecha_rep.getDate() > fecha_nuevo_rep.getDate()){
                    document.getElementById("div_fecha_nuevo_rep").innerHTML = '<p>¡La fecha del repostaje actualizada no puede ser menor que la anterior!</p>'
                    res = false;
            }
        } else if (fecha_rep.getMonth() > fecha_nuevo_rep.getMonth()) {
                    document.getElementById("div_fecha_nuevo_rep").innerHTML = '<p>¡La fecha del repostaje actualizada no puede ser menor que la anterior!</p>'
                    res = false;
        }
    } else if (fecha_rep.getFullYear() > fecha_nuevo_rep.getFullYear()) {
                    document.getElementById("div_fecha_nuevo_rep").innerHTML = '<p>¡La fecha del repostaje actualizada no puede ser menor que la anterior!</p>'
                    res = false;
    }
    return res;
}