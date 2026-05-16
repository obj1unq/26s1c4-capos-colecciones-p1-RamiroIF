import moradas.*
import enemigos.*

object rolando {
    const morada = castilloDePiedra
    const mochila = #{}
    const artefactosEncontrados = []
    const enemigos = #{caterina, archibaldo, astra}
    var capacidadMaxMochila = 2
    var poderBase = 5

    method aumentarCapacidadMochila() { capacidadMaxMochila += 1 }

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

    method moradasConquistables() = self.enemigosVencibles().map({ enemigo => enemigo.morada() })
    
    method esPoderoso() = self.enemigosVencibles() == enemigos
}





