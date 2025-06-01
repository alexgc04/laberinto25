from Agresivo import Agresivo
from Bicho import Bicho
from Bomba import Bomba
from Cuadrado import Cuadrado
from Este import Este
from Habitacion import Habitacion
from Juego import Juego
from Laberinto import Laberinto
from Norte import Norte
from Oeste import Oeste
from Perezoso import Perezoso
from Pared import Pared
from Puerta import Puerta
from Sur import Sur
from Tunel import Tunel



class LaberintoBuilder:

    def __init__(self):
        self.laberinto = None
        self.juego = None

    def fabricarArmario(self, unNum, unContenedor):
        self.laberinto = Laberinto()  # Asegúrate de que el laberinto esté inicializado
    
        from Armario import Armario  # Importa aquí para evitar dependencias circulares si las hay

        arm = Armario()
        arm.num = unNum
        arm.forma = self.fabricarForma()

        for each in arm.obtenerOrientaciones():
            arm.ponerEnOr(each, self.fabricarPared())

        unContenedor.agregarHijo(arm)
        return arm

    def fabricarBichoAgresivo(self):
        bicho = Bicho()
        bicho.modo = Agresivo()
        bicho.vidas = 5
        bicho.poder = 5
        return bicho
    
    def fabricarBichoAgresivoPos(self, unaHab):
        bicho = Bicho()
        bicho.modo = Agresivo()
        bicho.posicion = unaHab
        bicho.vidas = 5
        bicho.poder = 5
        return bicho
    
    def fabricarBichoPerezoso(self):
        bicho = Bicho()
        bicho.modo = Perezoso()
        bicho.vidas = 5
        bicho.poder = 1
        return bicho
    
    def fabricarBichoPerezosoPos(self, unaHab):
        bicho = Bicho()
        bicho.modo = Perezoso()
        bicho.posicion = unaHab
        bicho.vidas = 5
        bicho.poder = 1
        return bicho
    
    def fabricarBichoModo(self, strModo, unNum):
        if not strModo:
            raise ValueError("El modo del bicho no puede ser None o vacío. Revisa el JSON.")
        hab = self.juego.obtenerHabitacion(unNum)
        metodo = f"fabricarBicho{strModo.capitalize()}"
        if not hasattr(self, metodo):
            raise AttributeError(f"No existe el método {metodo} en LaberintoBuilder. Revisa el modo en el JSON.")
        bicho = getattr(self, metodo)()
        hab.entrar(bicho)
        self.juego.agregarBicho(bicho)


    def fabricarBombaEn(self, unContenedor):
        bmb = Bomba()
        unContenedor.agregarHijo(bmb)

    def fabricarEste(self):
        return Este()
    
    def fabricarNorte(self):
        return Norte()
    
    def fabricarOeste(self):
        return Oeste()
    
    def fabricarSur(self):
        return Sur()
    
    
    def fabricarForma(self):
        forma = Cuadrado()
        forma.agregarOrientacion(self.fabricarNorte())
        forma.agregarOrientacion(self.fabricarEste())
        forma.agregarOrientacion(self.fabricarSur())
        forma.agregarOrientacion(self.fabricarOeste())
        return forma
    
    def fabricarHabitacion(self, unNum):
    
        hab = Habitacion()
        hab.num = unNum

        hab.forma = self.fabricarForma()

        for each in hab.obtenerOrientaciones():
            hab.ponerEnOr(each, self.fabricarPared())

        self.laberinto.agregarHabitacion(hab)

        return hab
    
    def fabricarJuego(self):
        self.juego= Juego()
        self.juego.prototipo = self.laberinto
        self.juego.laberinto= self.juego.clonarLaberinto()

    def fabricarLaberinto(self):
        self.laberinto = Laberinto()

    def fabricarPuertaL1(self, num1, strOr1, num2, strOr2):
    
        hab1 = self.laberinto.obtenerHabitacion(num1)
        hab2 = self.laberinto.obtenerHabitacion(num2)

        objOr1 = getattr(self, f"fabricar{strOr1.capitalize()}")()  # Ejemplo: fabricarNorte
        objOr2 = getattr(self, f"fabricar{strOr2.capitalize()}")()

        pt = Puerta()
        pt.lado1 = hab1
        pt.lado2 = hab2

        hab1.ponerEnOr(objOr1, pt)
        hab2.ponerEnOr(objOr2, pt)

    def fabricarPared(self):
        return Pared()

    def fabricarTunelEn(self, unContenedor):
        from Entrar import Entrar  # Importa aquí para evitar dependencias circulares si las hay
        tunel = Tunel()
        tunel.agregarComando(Entrar(receptor=tunel))
        unContenedor.agregarHijo(tunel)

    def obtenerJuego(self):
        return self.juego
