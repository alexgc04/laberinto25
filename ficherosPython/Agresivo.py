import time
from Modo import Modo

class Agresivo(Modo):

    def buscarTunelBicho(self, unBicho):
        pos = unBicho.posicion
        tunel = next((each for each in pos.hijos if each.esTunel()), None)
        if tunel is not None:
            tunel.entrar(unBicho)

    def dormir(self, unBicho):
        print(f"{unBicho} duerme")
        time.sleep(1)

    def __init__(self):
        super().__init__()

    def esAgresivo(self):
        return True
    
    def __str__(self):
        return "Agresivo"