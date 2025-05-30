from Orientacion import Orientacion

class Suroeste(Orientacion):
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def caminar(self, unBicho):
        pos = unBicho.posicion
        pos.irAlSuroeste(unBicho)

    def ponerElemento(self, unEM, unContenedor):
        unContenedor.suroeste = unEM

    def obtenerElementoOrEn(self, unContenedor):
        return unContenedor.suroeste

    def recorrer(self, unBloque, unContenedor):
        unContenedor.suroeste.recorrer(unBloque)

    def calcularPosicionDesde(self, unaForma):
        unPunto = (unaForma.punto.x - 1, unaForma.punto.y + 1)
        unaForma.suroeste.calcularPosicionDesde(unaForma, unPunto)

    def __str__(self):
        return f"Suroeste"