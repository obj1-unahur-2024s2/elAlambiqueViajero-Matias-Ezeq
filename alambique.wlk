object luke {
    var autoActual = alambiqueVeloz
    const lugaresVisitados = []
    var recuerdoUltimoViaje = null

    method viajarA(lugar){
        if(lugar.puedeViajar(autoActual)){
            autoActual.irA(lugar)
            recuerdoUltimoViaje = lugar.recuerdo()
            lugaresVisitados.append(lugar)
        }
    }

    method cantidadDeLugaresVisitados() = lugaresVisitados.lenght()
    method recuerdoUltimoViaje() = recuerdoUltimoViaje

    method cambiarAuto(nuevoAuto){
        autoActual = nuevoAuto
    }
}

object alambiqueVeloz {
    var combustible = 0

    method velocidadMaxima() = 80

    method eficiencia() = 0.25 //tiene un kilometraje por litro de 4KM/L

    method cargarCombustible(){
        combustible += 100
    }

    method irA(lugar){
        combustible = 0.max(combustible - lugar.distancia() * self.eficiencia())
    }
}

object paris {
    method recuerdo() = "Llavero de la torre eiffel"

    method PuedeViajar(auto) = auto.combustible() >= self.distancia() * auto.eficiencia()

    method distancia() = 400
}

object buenosAires {
    var presidenteActual = null

    method asumirPresidente(nuevoPresidente){
        presidenteActual = nuevoPresidente
    }

    method recuerdo(){
        if (presidenteActual.esAgarrado()){
            return "Mate (sin yerba)"
        }
        else return "Mate (con yerba)"
    }

    method puedeViajar(auto) = auto.velocidadMaxima() >= 120
}

object bagdad {
    const recuerdos = ["bidón con petróleo crudo","arma de destrucción masiva perdida","réplica de los jardines colgantes de babilonia","casco estadounidense de la guerra de Irak"]

    method agregarRecuerdo(nuevoRecuerdo){
        recuerdos.add(nuevoRecuerdo)
    }

    method recuerdo() = recuerdos.randomize().first()

    method puedeViajar(auto) = true
}

object lasVegas {
    var lugarConmemorado = null

    method conmemorar(nuevoLugar){
        lugarConmemorado = nuevoLugar
    }

    method recuerdo() = lugarConmemorado.recuerdo()

    method puedeViajar(auto) = lugarConmemorado.puedeViajar(auto)
}