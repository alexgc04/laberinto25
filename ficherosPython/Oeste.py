from Orientacion import Orientacion

class Oeste(Orientacion):
    
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def caminar(self, unBicho):
        pos = unBicho.posicion
        pos.irAlOeste(unBicho)

    def ponerElemento(self, unEM, unContenedor):
        unContenedor.oeste = unEM

    def obtenerElementoOrEn(self, unContenedor):
        return unContenedor.oeste
    
    def recorrer(self, unBloque, unContenedor):
        unContenedor.oeste.recorrer(unBloque)

    def calcularPosicionDesde(self, unaForma):
        unPunto = (unaForma.punto.x - 1, unaForma.punto.y)
        unaForma.oeste.calcularPosicionDesde(unaForma, unPunto)

    def __str__(self):
        return f"Oeste"