import unittest
from PuertaMagica import PuertaMagica

class DummyPuerta:
    def abrir(self):
        self.abierta = True

class DummyPersonaje:
    def __init__(self):
        self.posicion = 1
    def __str__(self):
        return "Personaje"

class PuertaMagicaTest(unittest.TestCase):
    def test_abrir_teletransporta(self):
        puerta = DummyPuerta()
        magica = PuertaMagica(puerta, destino=3)
        personaje = DummyPersonaje()
        magica.abrir(personaje)
        self.assertEqual(personaje.posicion, 3)

if __name__ == "__main__":
    unittest.main()