from Agresivo import Agresivo
from Perezoso import Perezoso
from Curativo import Curativo
from Acompañante import Acompañante
from Ente import Ente

class Bicho(Ente):

    def __init__(self):
        super().__init__()
        self.modo = Perezoso()

    def iniAgresivo(self):
        self.modo = Agresivo()
        self.poder = 10

    def iniPerezoso(self):
        self.modo = Perezoso()
        self.poder = 1

    def iniCurativo(self):
        self.modo = Curativo()
        self.poder = 0

    def iniAcompaniante(self):
        self.modo = Acompañante()
        self.poder = 2  # O el valor que quieras

    def obtenerOrientacion(self):
        return self.posicion.obtenerOrientacion()

    def actua(self):
        self.estadoEnte.actua(self)

    def esAgresivo(self):
        return self.modo.esAgresivo()

    def esPerezoso(self):
        return self.modo.esPerezoso()

    def esCurativo(self):
        return self.modo.esCurativo()

    def esAcompañante(self):
        return self.modo.esAcompañante()

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