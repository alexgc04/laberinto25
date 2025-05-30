from Orientacion import Orientacion

class Sureste(Orientacion):
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def caminar(self, unBicho):
        pos = unBicho.posicion
        pos.irAlSureste(unBicho)

    def ponerElemento(self, unEM, unContenedor):
        unContenedor.sureste = unEM

    def obtenerElementoOrEn(self, unContenedor):
        return unContenedor.sureste

    def recorrer(self, unBloque, unContenedor):
        unContenedor.sureste.recorrer(unBloque)

    def calcularPosicionDesde(self, unaForma):
        unPunto = (unaForma.punto.x + 1, unaForma.punto.y + 1)
        unaForma.sureste.calcularPosicionDesde(unaForma, unPunto)

    def __str__(self):
        return f"Sureste"