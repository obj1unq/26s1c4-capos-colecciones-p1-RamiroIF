object castilloDePiedra {
    const property artefactosAlmacenados = #{}

    method almacenarArtefactos(artefactos) { artefactos.forEach({ nuevoArtefacto => artefactosAlmacenados.add(nuevoArtefacto) }) }
        // Puedo hacerlo con union pero tendria que reasignar el set actual por el nuevo que se genera con el union (metodo consulta)
        // Eso me obliga a hacerlo una variante en vez de una constante
        // artefactosAlmacenados = artefactosAlmacenados.union(artefactos)
 
        // Si no, tengo q hacer un recorrido forEach del argumento que llega y agregar artefacto por artefacto para modificar el ya existente sin reemplazarlo (metodo orden)

    method artefactoMasPoderoso(dueño) {
        if (artefactosAlmacenados.isEmpty()) {
            self.error("No hay ningun artefacto almacenado en el castillo")
        }
        return artefactosAlmacenados.max({ a => a.poder(dueño) })
    }

}

object fortalezaDeAcero {

}

object palacioDeMarmol {

}

object torreDeMarfil {

}
