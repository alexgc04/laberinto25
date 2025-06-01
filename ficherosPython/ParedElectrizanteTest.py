import unittest
from ParedElectrizante import ParedElectrizante

class DummyAtacante:
    def __init__(self):
        self.vidas = 10

class DummyPared:
    def __str__(self):
        return "Pared"

class ParedElectrizanteTest(unittest.TestCase):
    def test_recibir_ataque(self):
        pared = DummyPared()
        electrificada = ParedElectrizante(pared)
        atacante = DummyAtacante()
        electrificada.recibirAtaque(atacante)
        self.assertEqual(atacante.vidas, 5)

if __name__ == "__main__":
    unittest.main()