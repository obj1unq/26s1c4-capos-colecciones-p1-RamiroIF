import castillos.*

object rolando {
    const castillo = castilloDePiedra
    const mochila = #{}
    const artefactosEncontrados = []
    var capacidadMaxMochila = 2

    method encontrarArtefacto(artefacto) {
        artefactosEncontrados.add(artefacto)

        if (self.hayEspacioEnMochila()) self.guardarArtefacto(artefacto)
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

    
}





