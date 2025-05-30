from Agresivo import Agresivo
from Perezoso import Perezoso
from Ente import Ente

class Bicho(Ente):

    def __init__(self):
        super().__init__()
        self.modo = Perezoso()

    def iniAgresivo(self):
        self.modo = Agresivo()
        self.poder=10

    def iniPerezoso(self):
        self.modo = Perezoso()
        self.poder=1

    def obtenerOrientacion(self):
        return self.posicion.obtenerOrientacion()

    def actua(self):
        self.estadoEnte.actua(self)

    def esAgresivo(self):
        return self.modo.esAgresivo()

    def esPerezoso(self):
        return self.modo.esPerezoso()

    def __str__(self):
        return f"Bicho {self.modo}"
    
    def avisar(self):
        self.juego.terminarBicho(self)

    def buscarTunel(self):
        self.modo.buscarTunelBicho(self)
        
    def puedeActuar(self):
        self.modo.actua(self)

    def puedeAtacar(self):
        self.juego.buscarPersonaje(self)