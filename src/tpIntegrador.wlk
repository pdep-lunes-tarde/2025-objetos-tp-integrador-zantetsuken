class Instrumento{
    var property fechaActual = new Date(day=7,month=10,year=2025) 
    method estaAfinado(){}
    method costo(){}
    method esValioso(){}
    method afinarInstrumento(){} 
    method familia(){}
    method esCopado(){}
}

class GuitarraFender inherits Instrumento{
    var property color
    override method estaAfinado()= true

    override method costo() {
        if(color == "negro"){
            return 15
        }else{
            return 10
        } 
    }
    override method esValioso()= true

    override method familia() {
      return "cuerdas"
    }

    override method esCopado() {return false
      
    }
}

class TrompetaJupiter inherits Instrumento{
    
    var costo = 30
    var property temperatura
    var property tieneSordina
    
    override method estaAfinado(){return temperatura>=20 && temperatura <=25
    }

    override method afinarInstrumento() {
        self.soplarTrompeta()
    }

    method soplarTrompeta() {
        temperatura+=1
    }

    override method costo() {
        if(tieneSordina == true){
            costo=costo+5
            return costo
        }else{
            return costo
        }
      
    }
    method ponerSordina() {
        tieneSordina = true
    }
    override method esValioso()=false

    override method familia() {
      return "viento"
    }

    override method esCopado(){return self.tieneSordina()}

}
class PianoBechstein inherits Instrumento{
    var ancho
    var largo
    var ultimaFechaRevision = new Date(day=24,month=11,year=2017)


    method tamanioHabitacion() {return ancho*largo}

    override method estaAfinado() {return self.tamanioHabitacion()>20}

    override method costo() {
        return 2*ancho
    }

    override method esValioso(){ return self.estaAfinado()}

    override method familia() {
      return "cuerdas"
    }
    override method esCopado(){
        return ancho>6 || largo>6
    }

}

class ViolinStagg inherits Instrumento{
    
    var property cantidadTremolos
    var property tipoPintura

    method hacerTremolo() { cantidadTremolos = cantidadTremolos + 1 }
  
  override method estaAfinado() {
    return self.cantidadTremolos() < 10
  }
  
  override method costo() {
    return (20 - self.cantidadTremolos()).max(15)
  }
  
  override method esValioso() {
    return self.tipoPintura() == "laca acrilica"
  }
  
  method logicaAfinacionEspecifica() {
    cantidadTremolos= 0 
  }
  override method familia() {
    return "cuerdas"
  }
  override method esCopado() {return false}

}

const trompetaDeJohann = new TrompetaJupiter(temperatura=25, tieneSordina=true)

const violinDeJohann = new ViolinStagg(cantidadTremolos=0, tipoPintura="latex satinado")
object johann{
    var property instrumentoJohann = trompetaDeJohann 
    method esFeliz() {

        return self.esCaro(instrumentoJohann)
      
    }
    method esCaro(instrumento_) {
        return instrumento_.costo()>20
      
    }

}
object wolfgang{
    var dependenciaEmocional = johann //lo pongo como variable por si cambia en algun momento

    method esFeliz() {
            return dependenciaEmocional.esFeliz()
    }
  
}
object antonio{
    var property instrumentoAntonio = new PianoBechstein(ancho=5,largo=5)

    method esFeliz(){
        return instrumentoAntonio.esValioso()
      
    }
}
const pianoBechsteinGiuseppe = new PianoBechstein(ancho=1,largo=1)
object giuseppe{
    var property instrumentoGiuseppe = new GuitarraFender(color="rojo")

    method esFeliz(){
        return instrumentoGiuseppe.estaAfinado()
    }
}

const violinMaddalena = new ViolinStagg(cantidadTremolos=0, tipoPintura="laca acrilica")
object maddalena{
    var instrumentoMaddalena = violinMaddalena

    method esFeliz(){
        return (instrumentoMaddalena.costo()%2)==0
      
    }
}

const listaMusicos = [johann,wolfgang,antonio,giuseppe,maddalena]
object asociacionMusical{
    var asociacion = listaMusicos


    method quienesSonFelices() {
      return asociacion.filter({feliz=>feliz.esFeliz()})
    }

}
class Musico{
    var instrumentoMusico
    var preferenciaDeFamilia
    
    method familiaDePreferencia() {
      
    }

    method esExperto() {
        return instrumentoMusico.familia()==preferenciaDeFamilia
    }
    method esFeliz(){

    }

}
class Orquesta{

    var cantidadDeMusicosMAX
    var integrantesOrquesta= #{} //debe ser una coleccion para respetar que no haya repetidos
    
    method agregarMusico(nuevoMusico_){

        if(integrantesOrquesta.size()<=cantidadDeMusicosMAX){
              integrantesOrquesta.add(nuevoMusico_)
        }
    }
    method estaBienConformada() {
      return integrantesOrquesta.all({musico=>musico.esFeliz()})
    }

}

class InstrumentoGenerico inherits Instrumento{
    var nombreFamilia
    var ultimaAfinacion
    var ultimaFechaRevision = new Date(day=24,month=9,year=2025)
    var valorAzar=1
    override method costo() {
        
        return nombreFamilia.size()*self.multiplicador()
      
    }
    method multiplicador(){
        if(valorAzar%2==0){
            return 2
        }else{
            return 3
        }
    }
    method configurarValor(nuevoValor){
        valorAzar=nuevoValor
    }

    override method familia() {
      return nombreFamilia
    }
    override method esValioso(){
        return false
    }

    override method estaAfinado() {
      return fechaActual.minusMonth(ultimaFechaRevision)
    }
}

class Revision{
    var property tecnico
    var property fecha

}
class Tecnico{
    var property nombreTecnico
    var property especialidad

    method esEspecialista(familiaInstrumento) {
      return especialidad == familiaInstrumento
    }
}
