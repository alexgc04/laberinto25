from Cerrada import Cerrada
from ElementoMapa import ElementoMapa

class Puerta(ElementoMapa):

    def abrir(self):
        self.estado.abrir(self)
        print(f"{self} ha sido abierta.")

    def cerrar(self):
        self.estado.cerrar(self)
        print(f"{self} ha sido cerrada.")

    def entrar(self, alguien):
        self.estado.entrar(alguien,self)

    def esPuerta(self):
        return True

    def __init__(self):
        super().__init__()
        self.estado = Cerrada()
        self.visitada = False

    def estaAbierta(self):
        return self.estado.estaAbierta()
    
    def calcularPosicionDesde(self, unCont, unPunto):
        if getattr(self, 'visitada', False):
            return self
        self.visitada = True

        if unCont.num == self.lado1.num:
            self.lado2.punto = unPunto
            self.lado2.calcularPosicion()
        else:
            self.lado1.punto = unPunto
            self.lado1.calcularPosicion()

    def puedeEntrar(self, alguien):
        if alguien.posicion == self.lado1:
            self.lado2.entrar(alguien)
        else:
            self.lado1.entrar(alguien)
    
    def __str__(self):
        return f"Puerta - {self.lado1.num} - {self.lado2.num} - {self.estado}"