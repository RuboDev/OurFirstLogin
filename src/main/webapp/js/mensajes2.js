function Efectos(elementCorreo) {
    if (validarCorreo) {
        elementCorreo.classList.toggle("green");
    }
    else {
        elementCorreo.classList.toggle("red");
    }
}

function validarCorreo(elementCorreo) {
    // elementCorreo.innerText="";
    var valorInputCorreo = elementCorreo.value;
    if (/^[^@]+@[^@]+.[a-zA-Z]{2,}$/.test(valorInputCorreo)) {
        return true;
    }
    else {
        return false;
    }

}

function validarContraseña() {
    const elementContraseña = document.getElementById("contraseña");
    // elementContraseña.innerText=""
    const valorInputContraseña = elementContraseña.value;
    var numeroCaracteres = valorInputContraseña.length;
    return numeroCaracteres >= 8; // PONER IF ES REBUNDANTE
}

function ValidarCampos() {
    const elementCorreo = document.getElementById("correo");
    if (validarCorreo(elementCorreo) && validarContraseña()) {
        Efectos(elementCorreo)
        return true;

    }
    else {
        const elementMensajeErrorContraseña = document.getElementById("Mensaje2")
        elementMensajeErrorContraseña.innerText = "El correo y contraseña son invalidos";
        return false;
    }
}
