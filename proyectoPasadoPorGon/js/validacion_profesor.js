function validarFormulario() {
    var nombre = document.getElementById("nuevoProfesor_nombre").value;
    var apellidos = document.getElementById("nuevoProfesor_apellidos").value;
    
    var nombreOk = nombre.trim();
    var apellidosOk = apellidos.trim();
    var res = true;

    if (nombreOk.length == 0) {
        window.alert("El nombre no puede estar vacío");
        res = false;
    }
    if (apellidosOk.length == 0) {
        window.alert("Los apellidos no pueden estar vacíos");
        res = false;
    }  
    return res;
}

function passwordValidation(){
		var valid = true;    
		// Accedemos al campo de contraseña y su valor
		var password = document.getElementById("nuevoProfesor_pass");
        var pwd = password.value;
		// Comprobamos la longitud de la contraseña
        valid = valid && (pwd.length>=8);
		// Comprobamos si contiene letras mayúsculas, minúsculas y números
		var exp1 = /[0-9]/;
        var exp2 = /[A-Z]/;
        var exp3 = /[a-z]/;
        
        valid = valid && (exp1.test(pwd)) && (exp2.test(pwd)) && (exp3.test(pwd));
		// Si no cumple las restricciones, devolvemos un mensaje de error
		if(!valid){
            var error = "La contraseña debe tener 8 caracteres, mayúsculas, números y minúsculas";
		}else{
            var error = "";
		}
        password.setCustomValidity(error);
        return error;
	}

function passwordConfirmation(){
    // Obtenemos el campo de password y su valor
        var password = document.getElementById("nuevoProfesor_pass");
    var pwd = password.value;
    // Obtenemos el campo de confirmación de password y su valor
    var passconfirm = document.getElementById("nuevoProfesor_passrep");
    var confirmation = passconfirm.value;

    // Los comparamos
    if (pwd != confirmation) {
      var error = "Las contraseñas han de coincidir!";
    }else{
      var error = "";
    }
    passconfirm.setCustomValidity(error);
    return error;
}