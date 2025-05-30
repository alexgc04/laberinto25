from Bicho import Bicho
from Bomba import Bomba
from Pared import Pared
from Puerta import Puerta
from Habitacion import Habitacion
from Laberinto import Laberinto
from Este import Este
from Oeste import Oeste
from Norte import Norte
from Sur import Sur
from Agresivo import Agresivo
from Perezoso import Perezoso


class Creator:

    def fabricarBichoAgresivo(self):
        bicho = Bicho()
        bicho.modo = Agresivo() 
        bicho.vidas = 5
        bicho.poder = 5
        return bicho
    
    def fabricarBichoAgresivoPos(self, posicion):
        bicho = Bicho()
        bicho.modo = Agresivo()
        bicho.vidas = 5
        bicho.poder = 5
        bicho.posicion = posicion
        return
    
    def fabricarBichoPerezoso(self):
        bicho = Bicho()
        bicho.modo = Perezoso() 
        bicho.vida = 1
        bicho.poder = 1
        return bicho
    
    def fabricarBichoPerezosoPos(self, posicion):
        bicho = Bicho()
        bicho.modo = Perezoso()
        bicho.vida = 1
        bicho.poder = 1
        bicho.posicion = posicion
        return
    
    def cambiarAModoAgresivo(self, bicho):
        bicho.modo = Agresivo()
        bicho.vida = 5
        bicho.poder = 10

    def cambiarAModoPerezoso(self, bicho):
        bicho.modo = Perezoso()
        bicho.vida = 1
        bicho.poder = 1

    def fabricarBomba(self):
        return Bomba()
    
    def fabricarEste(self):
        return Este()
    
    def fabricarOeste(self):
        return Oeste()
    
    def fabricarNorte(self):
        return Norte()
    
    def fabricarSur(self):
        return Sur()
    
    def fabricarHabitacion(self, unNum):
        hab = Habitacion()
        hab.num= unNum
        hab.agregarOrientacion(self.fabricarEste())
        hab.agregarOrientacion(self.fabricarOeste())
        hab.agregarOrientacion(self.fabricarNorte())
        hab.agregarOrientacion(self.fabricarSur())
        for each in hab.obtenerOrientaciones():
            hab.ponerEnOr( each, self.fabricarPared())
        return hab
    
    def fabricarPared(self):
        return Pared()
    
    def fabricarPuerta(self):
        return Puerta()
    
    def fabricarJuego(self):
        from Juego import Juego
        return Juego()
    
    def fabricarLaberinto(self):
        return Laberinto()