import unittest
from LaberintoBuilderL import LaberintoBuilderL

class LaberintoBuilderLTest(unittest.TestCase):
    def test_fabricar_laberinto_L(self):
        builder = LaberintoBuilderL()
        builder.fabricarLaberinto()
        self.assertIsNotNone(builder.laberinto)
        print("Laberinto en L creado correctamente.")

if __name__ == "__main__":
    unittest.main()