
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

function notificationPExams() {
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

function notificationITV() {
    var i;
        for (i = 0; i <= 3; i++) {
            
            var contador_i = document.getElementById("itv_id").value;
            var nombre_coche = document.getElementById("mat").value;
            console.info(contador_i);
            console.info(nombre_coche);
        }

    console.info(contador_i);
    console.info(nombre_coche);
    var fecha_actual = new Date();
    var mes = fecha_actual.getMonth() + 1;
    var fecha_itv = document.getElementById("itv").value.split("/");
    console.info(fecha_itv);
    if (mes < 10) {
        var mes = "0" + mes;
        }
    fecha_actual = fecha_actual.getDate() + "/" + mes + "/" + fecha_actual.getYear().toString().substr(-2);
    fecha_actual = fecha_actual.split("/");


    console.info(fecha_actual);
    console.info(fecha_itv);
    var error = "";
    
    fecha_itv = new Date(parseInt(fecha_itv[2]),parseInt(fecha_itv[1]-1),parseInt(fecha_itv[0]));
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