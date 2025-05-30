from EstadoEnte import EstadoEnte

class Vivo(EstadoEnte):
    def actua(self,unBicho):
        unBicho.puedeActuar()

    def atacar(self, alguien):
        alguien.puedeAtacar()