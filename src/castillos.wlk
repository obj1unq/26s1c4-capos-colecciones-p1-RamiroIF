object castilloDePiedra {
    const artefactosAlmacenados = #{}

    method almacenarArtefactos(artefactos) {
        artefactosAlmacenados.union(artefactos)
    }

    method artefactosAlmacenados() = artefactosAlmacenados
}