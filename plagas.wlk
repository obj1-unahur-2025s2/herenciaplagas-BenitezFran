// HERENCIA
// super clase a sub clase , hereda metodos y atributos
class Plaga {

var poblacion

    method transmiteEnfermedades() = poblacion >= 10

    method atacarA(unElemento){
        unElemento.recibirAtaque(self)
        self.efectoDeAtacar()
    }

    method efectoDeAtacar(){
        poblacion *= 1.1 // sumaria el 10% al valor original
    }
    method poblacion() = poblacion


}
// ==================== CUCARACHAS ====================
class Cucarachas inherits Plaga {

var pesoPromedio

  method nivelDeDanio() = poblacion * 0.5
  // modificacion del metodo padre, para añadir condiciones extras en las clases hijas || cualquier otra cosa que requiramos
  override method transmiteEnfermedades() {
    return super() && pesoPromedio >= 10
  }
  override method efectoDeAtacar(){
    super()
    pesoPromedio +=2
  }

}

// ==================== PULGAS ====================
class Pulgas inherits Plaga{

  method nivelDeDanio() = poblacion * 2

}
// ==================== GARRAPATAS ====================
class Garrapatas inherits Pulgas{

    override method efectoDeAtacar(){
        poblacion *= 1.2
    }
}
// ==================== MOSQUITOS ====================
class Mosquitos inherits Plaga{

  method nivelDeDanio() = poblacion
  override method transmiteEnfermedades(){
    return
        super() && poblacion % 3 == 0
  }
}