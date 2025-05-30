from Cuadrado import Cuadrado
from ElementoMapa import ElementoMapa

class Contenedor(ElementoMapa):

    def __init__(self):
        super().__init__()
        self.hijos = []


    def getextent(self):
        return self.forma.extent
    
    def setextent(self, unPunto):
        self.forma.extent = unPunto

    def getpunto(self):
        return self.forma.punto
    
    def setpunto(self, unPunto):
        self.forma.punto = unPunto

    def agregarHijo(self, unEM):
        unEM.padre = self
        self.hijos.append(unEM)

    def agregarOrientacion(self, unaOr):
        self.forma.agregarOrientacion(unaOr)

    def eliminarHijo(self, unEM):
        try:
            self.hijos.remove(unEM)

        except ValueError:
            print(f"No existe ese objeto hijo")

    def entrar(self,alguien):
        alguien.posicion = self
        print(f"{alguien} ha entrado en {self}")
        alguien.buscarTunel()
    
    def irAlEste(self,alguien):
        self.forma.irAlEste(alguien)

    def irAlOeste(self,alguien):
        self.forma.irAlOeste(alguien)

    def irAlNorte(self,alguien):
        self.forma.irAlNorte(alguien)

    def irAlSur(self,alguien):
        self.forma.irAlSur(alguien)

    def irAlNoroeste(self, alguien):
        self.forma.irAlNoroeste(alguien)

    def irAlNoreste(self, alguien):
        self.forma.irAlNoreste(alguien)

    def irAlSuroeste(self, alguien):
        self.forma.irAlSuroeste(alguien)

    def irAlSureste(self, alguien):
        self.forma.irAlSureste(alguien)

    def obtenerElementoOr(self,unaOr):
        return self.forma.obtenerElementoOr(unaOr)
    
    def obtenerOrientacion(self):
        return self.forma.obtenerOrientacion()
    
    def obtenerOrientaciones(self):
        return self.forma.obtenerOrientaciones()

    def ponerEnOr(self, unaOr, unEM):
        self.forma.ponerEnOr(unaOr, unEM)

    def recorrer(self, unBloque):
        unBloque(self)

        for each in self.hijos:
            each.recorrer(unBloque)

        for each in self.obtenerOrientaciones():
            each.recorrer(unBloque, self.forma)

    def __str__(self):
        return "Contenedor"
    
    def aceptar(self, unVisitor):
        self.visitarContenedor(unVisitor)
        for each in self.hijos:
            each.aceptar(unVisitor)

    def calcularPosicion(self):
        self.forma.calcularPosicion()

    def visitarContenedor(self, unVisitor):
        pass