function validarFormulario() {
   var coste = document.getElementById("coste").value;
   var costeOk = coste.replace(" ","");
   var patron = /[a-zA-Z]/;
    var res = true;
    
    if(costeOk == "") {
        res = false;
    } else if(patron.test(coste)) {
        res = false;
    } else {
        res = true;
    }
    return res;   
}