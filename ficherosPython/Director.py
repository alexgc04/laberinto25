import json
from LaberintoBuilder import LaberintoBuilder
#from LaberintoBuilderHexagono import LaberintoBuilderHexagono
#from LaberintoBuilderOctogono import LaberintoBuilderOctogono
from LaberintoBuilderRombo import LaberintoBuilderRombo
from LaberintoBuilderL import LaberintoBuilderL


class Director:

    def __init__(self):
        self.builder = None
        self.dict = None

    def fabricarBichos(self):
        for bicho in self.dict.get("bichos", []):
            if "modo" in bicho:
                self.builder.fabricarBichoModo(
                    bicho.get("modo"),
                    bicho.get("posicion")
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
            if isinstance(each, list):
                # Puerta normal
                self.builder.fabricarPuertaL1(
                    each[0],  # Número de la primera habitación
                    each[1],  # Orientación de la primera habitación
                    each[2],  # Número de la segunda habitación
                    each[3]   # Orientación de la segunda habitación
                )
            elif isinstance(each, dict) and each.get("tipo") == "PuertaMagica":
                # Aquí deberías crear la puerta mágica según tu lógica
                # Por ejemplo, podrías llamar a un método fabricarPuertaMagica
                # self.builder.fabricarPuertaMagica(destino=each["destino"])
                print("Puerta mágica detectada en el JSON")

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
        if self.dict.get("forma") == "L":
            self.builder = LaberintoBuilderL()

    def leerArchivo(self, unArchivoJSON):
        with open(unArchivoJSON, 'r', encoding='utf-8') as readStream:
            self.dict = json.load(readStream)

    def obtenerJuego(self):
        return self.builder.obtenerJuego()
    
    def procesar(self, unArchivoJSON):
        self.leerArchivo(unArchivoJSON)
        self.iniBuilder()
        self.builder.fabricarLaberinto()  # Inicializa self.laberinto
        self.fabricarLaberinto()          # Ahora puedes fabricar habitaciones
        self.fabricarJuego()
        self.fabricarBichos()