
object espadaDelDestino {
    var usosEnBatalla = 0

    method contabilizarUsoEnBatalla() { usosEnBatalla += 1 }

    method poderDePelea(dueñoActual) {
        const poderBaseDueño = dueñoActual.poderBase()
        if (usosEnBatalla >= 1) { 
            return poderBaseDueño / 2 
        }
        return poderBaseDueño
    }
}

object collarDivino {
    var usosEnBatalla = 0

    method contabilizarUsoEnBatalla() { usosEnBatalla += 1 }

    method poderDePelea(dueñoActual) {
        const poder = 3
        if (dueñoActual.poderBase() > 6) { 
            return poder + usosEnBatalla 
        }
        return poder
    }    
}

object armaduraDeAceroValyrio {
    var usosEnBatalla = 0

    method contabilizarUsoEnBatalla() { usosEnBatalla += 1 }

    method poderDePelea(dueñoActual) {
        const poder = 6 // agregue la constante para darle un nombre al 6 y no hardcodear el 6 en el return, esta bien que este aca y no como atributo de la armadura?
        return poder
    }
}

object libroDeHechizos {
    
}