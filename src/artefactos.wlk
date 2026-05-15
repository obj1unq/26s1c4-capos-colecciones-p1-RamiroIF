
object espadaDelDestino {
    var usosEnBatalla = 0

    method efectosPorBatalla(dueñoActual) {
        usosEnBatalla += 1
    }

    method poderDePelea(dueñoActual) {
        const poderBaseDueño = dueñoActual.poderBase()
        if (usosEnBatalla >= 1) poderBaseDueño / 2 else poderBaseDueño
    }
}

object collarDivino {
    var usosEnBatalla = 0

    method efectosPorBatalla(dueñoActual) {
        usosEnBatalla += 1
    }

    method poderDePelea(dueñoActual) {
        const poder = 3
        if (dueñoActual.poderBase() > 6) poder + usosEnBatalla else poder
    }    
}

object armaduraDeAceroValyrio {
    var usosEnBatalla = 0

    method efectosPorBatalla(dueñoActual) {
        usosEnBatalla += 1
    }

    method poderDePelea(dueñoActual) {
        const poder = 6 // agregue la constante para darle un nombre al 6 y no hardcodear el 6 en el return, esta bien que este aca y no como atributo de la armadura?
        return poder
    }
}

object libroDeHechizos {
    
}