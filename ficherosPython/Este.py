from Orientacion import Orientacion

class Este(Orientacion):
    
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def caminar(self, unBicho):
        pos = unBicho.posicion
        pos.irAlEste(unBicho)

    def ponerElemento(self, unEM, unContenedor):
        unContenedor.este = unEM

    def obtenerElementoOrEn(self, unContenedor):
        return unContenedor.este
    
    def recorrer(self, unBloque, unContenedor):
        unContenedor.este.recorrer(unBloque)

    def __str__(self):
        return f"Este"
    
    def calcularPosicionDesde(self, unaForma):
        unPunto = (unaForma.punto.x + 1, unaForma.punto.y)
        unaForma.este.calcularPosicionDesde(unaForma, unPunto)