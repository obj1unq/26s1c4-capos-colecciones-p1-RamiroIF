import castillos.*

object rolando {
    const castillo = castilloDePiedra
    const mochila = #{}
    const artefactosEncontrados = []
    var capacidadMaxMochila = 2
    var poderBase = 5

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

    method artefactosEnCastillo() = castillo.artefactosAlmacenados()

    method artefactosEnPosesion() = mochila.union(self.artefactosEnCastillo())

    method llegarAlCastillo() { 
        self.almacenarArtefactos()
        self.vaciarMochila()
    }

    method almacenarArtefactos() { castillo.almacenarArtefactos(self.artefactosEnMochila()) }

    method vaciarMochila() { mochila.clear() }

    method poseeElArtefacto(artefacto) = self.artefactosEnPosesion().contains(artefacto)

    method participarEnBatalla() {
        poderBase += 1
        mochila.forEach { artefacto => artefacto.aplicarEfectosPorBatalla() }
    }

    method artefactoMasPoderosoEnCastillo() = castillo.artefactoMasPoderoso(self)
    
}





