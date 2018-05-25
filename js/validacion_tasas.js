function validarFormulario() {
   var coste = document.getElementById("coste_tasas").value;
   var costeOk = coste.replace(" ","");
   var patron = /[a-zA-Z]/;
    var res = true;
    
    if(costeOk == "") {
		res = false;
		document.getElementById("div_costeTasas").innerHTML =" <p>El coste no puede estar vacío</p>"
    } else if(patron.test(coste)) {
		res = false;
		document.getElementById("div_costeTasas").innerHTML =" <p>El coste se compone de números</p>"
    }
    return res;   
}