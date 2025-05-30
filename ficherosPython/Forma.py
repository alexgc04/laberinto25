import random


class Forma:

    def __init__(self):
        self.orientaciones = []

    def agregarOrientacion(self, unaOr):
        self.orientaciones.append(unaOr)

    def __init__(self):
        self.orientaciones = []

    def irAlEste(self, alguien):
        pass

    def irAlOeste(self, alguien):
        pass

    def irAlNorte(self, alguien):
        pass

    def irAlSur(self, alguien):
        pass

    def obtenerElementoOr(self, unaOr):
        return unaOr.obtenerElementoOrEn(self)
    
    def obtenerOrientacion(self):
        ind = random.randint(0, len(self.orientaciones)-1)
        return self.orientaciones[ind]
    
    def obtenerOrientaciones(self):
        return self.orientaciones
    
    def ponerEnOr(self, unaOr, unEM):
        unaOr.ponerElemento(unEM, self)
    
    def __str__(self):
        return "Forma"
    
    def calcularPosicion(self):
        for or_ in self.orientaciones:
            or_.calcularPosicionDesde(self)

    