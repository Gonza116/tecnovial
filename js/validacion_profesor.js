function validarFormulario() {
    var nombre = document.getElementById("nuevoProfesor_nombre").value;
    var apellidos = document.getElementById("nuevoProfesor_apellidos").value;
    
    var nombreOk = nombre.trim();
    var apellidosOk = apellidos.trim();
    var res = true;

    if (nombreOk.length == 0) {
		document.getElementById("div_nombre").innerHTML =" <p>El nombre no puede estar vacío</p>"
        res = false;
    }
    if (apellidosOk.length == 0) {
		document.getElementById("div_apellidos").innerHTML =" <p>Los apellidos no pueden estar vacíos</p>"
        res = false;
    }  
    return res;
}

function passwordValidation(){
		var valid = true;    
		var password = document.getElementById("nuevoProfesor_pass");
        var pwd = password.value;
        valid = valid && (pwd.length>=8);
		var exp1 = /[0-9]/;
        var exp2 = /[A-Z]/;
        var exp3 = /[a-z]/;
        
        valid = valid && (exp1.test(pwd)) && (exp2.test(pwd)) && (exp3.test(pwd));
		if(!valid){
            var error = "La contraseña debe tener 8 caracteres, mayúsculas, números y minúsculas";
		}else{
            var error = "";
		}
        password.setCustomValidity(error);
        return error;
	}

function passwordConfirmation(){
        var password = document.getElementById("nuevoProfesor_pass");
    var pwd = password.value;
    var passconfirm = document.getElementById("nuevoProfesor_passrep");
    var confirmation = passconfirm.value;

    if (pwd != confirmation) {
      var error = "Las contraseñas han de coincidir!";
    }else{
      var error = "";
    }
    passconfirm.setCustomValidity(error);
    return error;
}