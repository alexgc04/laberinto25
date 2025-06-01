import unittest
from Acompañante import Acompañante

class DummyModo:
    def esAcompañante(self): return False
    def esCurativo(self): return False

class DummyBicho:
    def __init__(self):
        self.vidas = 5
        self.posicion = "A"
        self.modo = DummyModo()
        self.juego = None

    def estaVivo(self):
        return self.vidas > 0

class DummyPerson:
    def __init__(self):
        self.posicion = "A"
        self.vidas = 100

class DummyJuego:
    def __init__(self):
        self.person = DummyPerson()
        self.bichos = []

class AcompañanteTest(unittest.TestCase):
    def test_acompañante_actua(self):
        juego = DummyJuego()
        bicho = DummyBicho()
        bicho.modo = Acompañante()
        bicho.juego = juego
        enemigo = DummyBicho()
        enemigo.modo = DummyModo()
        enemigo.vidas = 5
        enemigo.posicion = "A"
        juego.bichos = [bicho, enemigo]
        Acompañante().actua(bicho)
        self.assertEqual(enemigo.vidas, 3)

if __name__ == "__main__":
    unittest.main()