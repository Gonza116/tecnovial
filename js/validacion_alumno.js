function validarFormulario() {
    
    var nombre = document.getElementById('alum_nombre').value;
    var apellidos = document.getElementById('alum_apellidos').value;
    var domicilio = document.getElementById("alum_domicilio").value;
    var res = true;
     
    var nombreOk = nombre.trim();
    var apellidosOk = apellidos.trim();
    var domicilioOk = domicilio.trim();
    

    if (nombreOk.length == 0) {
	 document.getElementById("div_nombre").innerHTML = "<p>El nombre no puede estar vacío</p>"
        res = false;
    }
    
    if (apellidosOk.length == 0) {
		document.getElementById("div_apellidos").innerHTML = "<p>Los apellidos no pueden estar vacíos</p>"
        res = false;
    }
    
    if (domicilioOk.length == 0) {
	document.getElementById("div_domicilio").innerHTML = "<p>El domicilio no puede estar vacío</p>"     
	 res = false;
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