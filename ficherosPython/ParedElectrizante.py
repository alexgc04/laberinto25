class ParedElectrizante:
    def __init__(self, pared):
        self.pared = pared
    def recibirAtaque(self, atacante):
        print("¡Te has electrocutado!")
        atacante.vidas -= 5
    def __str__(self):
        return f"ParedElectrizante({self.pared})"