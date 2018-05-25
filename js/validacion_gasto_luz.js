function validarFormulario() {
    var coste  = document.getElementById("coste").value;
    var costeOk = coste.replace(" ", "");
    var gasto_kwh = document.getElementById("gasto_kwh").value;
    var gasto_kwhOk = gasto_kwh.replace(" ", "");
    var res = true;
    var patron = /[a-zA-Z]/;
      
    if(costeOk == "") {
		document.getElementById("div_coste").innerHTML =" <p>El coste solo puede estar formado por números</p>"
		res = false;
    }else if(patron.test(coste)){
        document.getElementById("div_coste").innerHTML =" <p>El coste solo puede estar formado por números</p>"
		res = false;
    }
    
    if(gasto_kwhOk == "") {
		document.getElementById("div_gasto_kwh").innerHTML =" <p>El coste solo puede estar formado por números</p>"
        res = false;
    } else if(patron.test(gasto_kwh)) {
		document.getElementById("div_gasto_kwh").innerHTML =" <p>El gasto en KWh solo puede estar formado por números</p>"
        res = false;
    }
    return res;
} 