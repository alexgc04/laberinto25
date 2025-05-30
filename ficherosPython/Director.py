import json
from LaberintoBuilder import LaberintoBuilder
#from LaberintoBuilderHexagono import LaberintoBuilderHexagono
#from LaberintoBuilderOctogono import LaberintoBuilderOctogono
from LaberintoBuilderRombo import LaberintoBuilderRombo


class Director:

    def __init__(self):
        self.builder = None
        self.dict = None

    def fabricarBichos(self):
        bichos = self.dict.get('bichos', None)
        if bichos is None:
            return  

        for each in bichos:
            self.builder.fabricarBichoModo(
                each.get('modo'),  # Modo del bicho
                each.get('posicion')  # Posición del bicho
            )

    def fabricarJuego(self):
        self.builder.fabricarJuego()

    def fabricarLaberinto(self):
        self.builder.fabricarLaberinto()
        laberinto = self.dict.get('laberinto', [])
        for each in laberinto:
          self.fabricarLaberintoRecursivo(each, 'root')
        puertas = self.dict.get('puertas', [])
        for each in puertas:
            self.builder.fabricarPuertaL1(
                each[0],  # Número de la primera habitación
                each[1],  # Orientación de la primera habitación
                each[2],  # Número de la segunda habitación
                each[3]   # Orientación de la segunda habitación
            )

    def fabricarLaberintoRecursivo(self, unDic, padre):
    
        if unDic.get('tipo') == 'habitacion':
            con = self.builder.fabricarHabitacion(unDic.get('num'))
        elif unDic.get('tipo') == 'armario':
            con = self.builder.fabricarArmario(unDic.get('num'), padre)

        if unDic.get('tipo') == 'bomba':
            self.builder.fabricarBombaEn(padre)
        elif unDic.get('tipo') == 'tunel':
            self.builder.fabricarTunelEn(padre)

        hijos = unDic.get('hijos', None)
        if hijos is not None:
            for each in hijos:
                self.fabricarLaberintoRecursivo(each, con)

    def iniBuilder(self):

        if self.dict.get('forma') == 'cuadrado':
            self.builder = LaberintoBuilder()
        elif self.dict.get('forma') == 'rombo':
            self.builder = LaberintoBuilderRombo()
        #elif self.dict.get('forma') == 'hexagono':
        #    self.builder = LaberintoBuilderHexagono()
        #elif self.dict.get('forma') == 'octogono':
        #    self.builder = LaberintoBuilderOctogono()

    def leerArchivo(self, unArchivoJSON):
    
        with open(unArchivoJSON, 'r') as readStream:
            self.dict = json.load(readStream)

    def obtenerJuego(self):
        return self.builder.obtenerJuego()
    
    def procesar(self, unArchivoJSON):
        self.leerArchivo(unArchivoJSON)
        self.iniBuilder()
        self.fabricarLaberinto()
        self.fabricarJuego()
        self.fabricarBichos()