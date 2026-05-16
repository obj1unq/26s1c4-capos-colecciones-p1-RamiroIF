import moradas.*
import enemigos.*

object rolando {
    const morada = castilloDePiedra
    const mochila = #{}
    const artefactosEncontrados = []
    const enemigos = #{caterina, archibaldo, astra}
    var capacidadMaxMochila = 2
    var poderBase = 5

    method poderBase(_poderBase) { poderBase = _poderBase } // Unicamente para poder hacer los test de 2.5 Artefacto Fatal y subirte el poder base a conveniencia.
    // Se que podria ser una property y solucionado, pero quiero dejarlo separado para mantener la aclaracion de arriba.

    method poderBase() = poderBase

    method poderDePelea() = poderBase + self.poderDeArtefactosEnMochila()

    method poderDeArtefactosEnMochila() = mochila.sum { artefacto => artefacto.poder(self) }

    method encontrarArtefacto(artefacto) {
        artefactosEncontrados.add(artefacto)

        if (not self.hayEspacioEnMochila()) self.error("No hay espacio en la mochila")
        self.guardarArtefacto(artefacto)
    }

    method historialArtefactosEncontrados() = artefactosEncontrados

    method guardarArtefacto(artefacto) { mochila.add(artefacto) }

    method hayEspacioEnMochila() = self.cantArtefactosEnMochila() < capacidadMaxMochila 

    method aumentarCapacidadMochila() { capacidadMaxMochila += 1 } // Unicamente para utilizar en tests.

    method cantArtefactosEnMochila() = mochila.size()

    method artefactosEnMochila() = mochila

    method artefactosEnCastillo() = morada.artefactosAlmacenados()

    method artefactosEnPosesion() = mochila.union(self.artefactosEnCastillo())

    method llegarAlCastillo() { 
        self.almacenarArtefactos()
        self.vaciarMochila()
    }

    method almacenarArtefactos() { morada.almacenarArtefactos(self.artefactosEnMochila()) }

    method vaciarMochila() { mochila.clear() }

    method poseeElArtefacto(artefacto) = self.artefactosEnPosesion().contains(artefacto)

    method participarEnBatalla() {
        poderBase += 1
        mochila.forEach { artefacto => artefacto.aplicarEfectosPorBatalla() }
    }

    method artefactoMasPoderosoEnCastillo() = morada.artefactoMasPoderoso(self)

    method enemigosVencibles() = enemigos.filter({ enemigo => enemigo.poder() < self.poderDePelea() })

    method moradasConquistables() = self.enemigosVencibles().map({ enemigo => enemigo.morada() }).asSet()
    
    method esPoderoso() = self.enemigosVencibles() == enemigos

    method artefactoFatal(enemigo) {
        if (not self.poseeArtefactoFatal(enemigo)) {
            self.error("No posee un artefacto fatal para enfrentar a " + enemigo)
        }
        return self.artefactoMasPoderoso()
    }

    method poseeArtefactoFatal(enemigo) = (poderBase + self.artefactoMasPoderoso().poder()) > enemigo.poder()

    method artefactoMasPoderoso() {
        if (mochila.isEmpty()) {
            self.error("Rolando no posee ningun artefacto")
        }
        return mochila.max({ artefacto => artefacto.poder(self) })
    }
}





