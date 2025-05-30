from Muerto import Muerto
from Vivo import Vivo


class Ente:

    def __init__(self):
        self.vidas = None
        self.poder = None
        self.estadoEnte = Vivo()

    def esAtacadoPor(self,alguien):
        print(f"{self} es atacado por {alguien}")
        self.vidas -= alguien.poder
        print(f"Vidas: {self.vidas}")
        if self.vidas <= 0:
            self.heMuerto()

    def estaVivo(self):
        return self.vidas > 0
    
    def heMuerto(self):
        self.estadoEnte = Muerto()
        self.avisar()

    def __str__(self):
        return "Ente"
    
    def atacar(self):
        self.estadoEnte.atacar(self)

    def avisar(self):
        pass

    def buscarTunel(self):
        pass

    def crearNuevoLaberinto(self):
        pass

    def juegoClonaLaberinto(self):
        return self.juego.clonarLaberinto()
    
    def puedeAtacar(self):
        pass

    