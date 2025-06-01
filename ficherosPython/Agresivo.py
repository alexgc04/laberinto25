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

    def actua(self, unBicho):
        # Ataca al personaje si están en la misma habitación
        if unBicho.posicion == unBicho.juego.person.posicion and unBicho.estaVivo():
            unBicho.juego.person.vidas -= unBicho.poder
            print(f"{unBicho} ataca a {unBicho.juego.person}. Vidas del personaje: {unBicho.juego.person.vidas}")
        else:
            self.dormir(unBicho)

    def __init__(self):
        super().__init__()

    def esAgresivo(self):
        return True
    
    def __str__(self):
        return "Agresivo"