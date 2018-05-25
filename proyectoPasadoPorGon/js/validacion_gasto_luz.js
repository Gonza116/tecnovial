function validarFormulario() {
    var coste  = document.getElementById("coste").value;
    var costeOk = coste.replace(" ", "");
    var gasto_kwh = document.getElementById("gasto_kwh").value;
    var gasto_kwhOk = gasto_kwh.replace(" ", "");
    var res = true;
    var patron = /[a-zA-Z]/;
      
    if(costeOk == "") {
        res = false;
    }else if(patron.test(coste)){
        res = false;
    } else {
        res = true;
    }
    
    if(gasto_kwhOk == "") {
        res = false;
    } else if(patron.test(gasto_kwh)) {
        res = false;
    } else {
        res = true;
    }
    return res;
} 