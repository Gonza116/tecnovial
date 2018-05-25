function validarFormulario() {
    var matricula = document.getElementById("matricula").value;
    var matriculaOk = matricula.trim;
    var res = true;
    
    if (matriculaOk.length == 0) {
        document.getElementById("div_matricula").innerHTML =" <p>La matrícula no puede estar vacía</p>"
        res = false;
    }
    return res;
}