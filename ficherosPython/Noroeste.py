from Orientacion import Orientacion

class Noreste(Orientacion):
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance    

    def caminar(self, unBicho):
        pos = unBicho.posicion
        pos.irAlNoreste(unBicho)

    def ponerElemento(self, unEM, unContenedor):
        unContenedor.noreste = unEM

    def obtenerElementoOrEn(self, unContenedor):
        return unContenedor.noreste

    def recorrer(self, unBloque, unContenedor):
        unContenedor.noreste.recorrer(unBloque)

    def calcularPosicionDesde(self, unaForma):
        unPunto = (unaForma.punto.x + 1, unaForma.punto.y - 1)
        unaForma.noreste.calcularPosicionDesde(unaForma, unPunto)

    def __str__(self):
        return f"Noreste"