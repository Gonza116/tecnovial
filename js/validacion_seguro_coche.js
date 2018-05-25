function validarFormulario() {
   var coste = document.getElementById("costeSeguroLocal").value;
   var costeOk = coste.replace(" ","");
   var patron = /[a-zA-Z]/;
    var res = true;
    
    if(costeOk == "") {
		document.getElementById("div_coste").innerHTML =" <p>El coste no puede estar vacío</p>"
        res = false;
    } else if(patron.test(coste)) {
		document.getElementById("div_coste").innerHTML =" <p>El coste se compone de números</p>"
        res = false;
    }
    return res;   
}