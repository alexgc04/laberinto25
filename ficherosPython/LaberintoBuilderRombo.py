from LaberintoBuilder import LaberintoBuilder
from Rombo import Rombo


class LaberintoBuilderRombo(LaberintoBuilder):

    def __init__(self):
        super().__init__()

    def fabricarForma(self):
        forma = Rombo()
        forma.agregarOrientacion(self.fabricarNoreste())
        forma.agregarOrientacion(self.fabricarSureste())
        forma.agregarOrientacion(self.fabricarSuroeste())
        forma.agregarOrientacion(self.fabricarNoroeste())
        return forma