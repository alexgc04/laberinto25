import unittest
from Curativo import Curativo

class DummyPerson:
    def __init__(self):
        self.posicion = "A"
        self.vidas = 50

class DummyBicho:
    def __init__(self):
        self.posicion = "A"
        self.juego = None

class DummyJuego:
    def __init__(self):
        self.person = DummyPerson()

class CurativoTest(unittest.TestCase):
    def test_curativo_actua_cura(self):
        juego = DummyJuego()
        bicho = DummyBicho()
        bicho.juego = juego
        Curativo().actua(bicho)
        self.assertEqual(juego.person.vidas, 60)

    def test_curativo_actua_no_cura(self):
        juego = DummyJuego()
        bicho = DummyBicho()
        bicho.juego = juego
        bicho.posicion = "B"
        Curativo().actua(bicho)
        self.assertEqual(juego.person.vidas, 50)

if __name__ == "__main__":
    unittest.main()