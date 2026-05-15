
object espadaDelDestino {
    var poder = 0
    var usosEnBatalla = 0

    method aplicarEfectosPorBatalla() { self.contabilizarUsoEnBatalla() }

    method contabilizarUsoEnBatalla() { usosEnBatalla += 1 }

    method poder(dueñoActual) {
        poder = dueñoActual.poderBase()
        if (usosEnBatalla >= 1) { 
            return poder / 2 
        }
        return poder
    }
}

object collarDivino {
    const poder = 3
    var usosEnBatalla = 0

    method aplicarEfectosPorBatalla() { self.contabilizarUsoEnBatalla() }

    method contabilizarUsoEnBatalla() { usosEnBatalla += 1 }

    method poder(dueñoActual) {
        if (dueñoActual.poderBase() > 6) { 
            return poder + usosEnBatalla 
        }
        return poder
    }    
}

object armaduraDeAceroValyrio {
    const poder = 6
    //var usosEnBatalla = 0

    method poder(dueñoActual) = poder

    method aplicarEfectosPorBatalla() {}
}

object libroDeHechizos {
    var hechizos = []

    method poder(dueñoActual) {
        if (hechizos.isEmpty()) {
            return 0
        }
        return hechizos.first().poder(dueñoActual)
    }

    method aplicarEfectosPorBatalla() {
        hechizos.remove(hechizos.first())
    }
}


// Hechizos
object bendicion {
    const poder = 4

    method poder(dueñoActual) = poder
}

object invisibilidad {

    method poder(dueñoActual) {
        return dueñoActual.poderBase()
    }  
}

object invocacion {

    method poder(dueñoActual) {
        return dueñoActual.artefactoMasPoderosoEnCastillo().poder(dueñoActual)
    }    
}