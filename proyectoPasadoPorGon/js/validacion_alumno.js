function validarFormulario() {
    
    var nombre = document.getElementById('alum_nombre').value;
    var apellidos = document.getElementById('alum_apellidos').value;
    var dni = document.getElementById('alum_DNI').value;
    var fechaNacimiento = document.getElementById('alum_fecha_nac').value;
    var telefono = document.getElementById('alum_telefono').value;
    var domicilio = document.getElementById("alum_domicilio").value;
    var res = true;
     
    var nombreOk = nombre.trim();
    var apellidosOk = apellidos.trim();
    var dniOk = dni.trim();
    var patronDni = /^\d{8}[a-zA-Z]$/;
//    var d = new Date(Date.now());
    var telefonoOk = telefono.trim();
    var patronNumTelefono = /^\d{9}$/;
    var domicilioOk = domicilio.trim();
    

    if (nombreOk.length == 0) {
        window.alert("El nombre no puede estar vacío");
        res = false;
    } else {
        res = true;
    }
    if (apellidosOk.length == 0) {
        window.alert("Los apellidos no pueden estar vacíos");
        res = false;
    } else {
        res = true;
    }
    if (dniOk.length == 0) {
        window.alert("El DNI no puede estar vacío");
        res = false;
    } else if (!(patronDni.test(dniOk))) {
        window.alert("El DNI debe contener 8 números y 1 letra");
        res = false;
    } else {
        res = true;
    }
//    if (d.getFullYear - fechaNacimiento.getFullYear < 18) {
//        window.alert("fechas");
//        res = false;
//    }else{
//        res = true;
//    }
    if (telefonoOk.length == 0) {
        window.alert("El teléfono no puede estar vacío");
        res = false;
    } else if (!(patronNumTelefono.test(telefonoOk))) {
        window.alert("El número de teléfono no contiene 9 números");
        res = false;
    } else {
        res = true;
    }
    return res;
}

function validarDNI() {
		var valid = true;
		var dni = document.getElementById("alum_DNI");
        var dni2 = dni.value;
        var dniOk = dni2.trim();
        var patronDni = /^\d{8}[A-Z]$/;
        valid = valid && !(dniOk.length == 0) && (patronDni.test(dniOk));
		if (!valid){
            var error = "El DNI ha de tener 8 números seguidos de 1 letra";
		} else {
         error = "";
		}
        dni.setCustomValidity(error);
        return error;
	}

function validarTelefono() {
		var valid = true;
		var telefono = document.getElementById("alum_telefono");
        var telefono2 = telefono.value;
        var telefonoOk = telefono2.trim();
        var patronTelefono = /^\d{9}$/;
        valid = valid && !(telefonoOk.length == 0) && (patronTelefono.test(telefonoOk));
		if (!valid){
            var error = "El teléfono se compone de 9 dígitos";
		} else {
         error = "";
		}
        telefono.setCustomValidity(error);
        return error;
	}