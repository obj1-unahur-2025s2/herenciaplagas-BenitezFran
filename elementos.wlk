import plagas.*

// ==================== HOGAR ====================
class Hogar{

var  nivelDeMugre
const confort

  method nivelDeMugre() {
    return nivelDeMugre
  }
  method esBueno() {
    return 
      (self.nivelDeMugre() / 2) >= confort  
  }
  method recibirAtaque(unaPlaga) {
    nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDanio()
  } 
}
// ==================== HUERTA ====================
class Huerta {
  
var produccion

  method produccion() {
    return produccion
  }
  method esBueno() = produccion > nivelMinimoDeProduccion.valor()
  method recibirAtaque(unaPlaga){
    produccion = (produccion - unaPlaga.nivelDeDanio() * 0.1 
    - if(unaPlaga.transmiteEnfermedades()) 10 else 0).max(0)
  }
}

object nivelMinimoDeProduccion {
  var property valor = 10 
}

// ==================== MASCOTA ====================
class Mascota{

var salud  

  method esBueno() = salud > 250 
  method recibirAtaque(unaPlaga){
    return
      if(unaPlaga.transmiteEnfermedades()){
        salud = (salud - unaPlaga.nivelDeDanio()).max(0)
      }
  }
  method salud() = salud
  
}


// ==================== BARRIO ====================
class Barrio {
  
const property elementos = []

  method agregar(elemento) {
    elementos.add(elemento)
  }
  method quitar(elemento) {
    elementos.remove(elemento)
  }
  method esCopado(){
    return self.cantidadElementosBuenos() > self.cantidadElementosNoBuenos()
  }

  method cantidadElementosBuenos() = elementos.count({e => e.esBueno()})
  method cantidadElementosNoBuenos() = elementos.count({e => !e.esBueno()})
}
