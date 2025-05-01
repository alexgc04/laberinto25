class ElementoMapa:
    def __init__(self):
        pass

    def entrar(self):
        raise NotImplementedError("Método debe ser implementado en la subclase")

    def es_habitacion(self):
        return False
    
    def es_puerta(self):
        return False
    
    def es_pared(self):
        return False

class Decorador(ElementoMapa):
    def __init__(self, em):
        self.em = em
    
    def entrar(self):
        self.em.entrar()


class Pared(ElementoMapa):
    def __init__(self):
        super().__init__()

    def entrar(self):
        print("Te has chocado con la pared")


class ParedBomba(Pared):
    def __init__(self, activa=False):
        super().__init__()
        self.activa = activa

    def entrar(self):
        if self.activa:
            print("¡Bomba explotó!")
        else:
            print("Te has chocado con la pared bomba")


class Puerta(ElementoMapa):
    def __init__(self, lado1, lado2):
        super().__init__()
        self.abierta = False
        self.lado1 = lado1
        self.lado2 = lado2

    def es_puerta(self):
        return True

    def abrir(self):
        self.abierta = True

    def cerrar(self):
        self.abierta = False

    def entrar(self):
        if self.abierta:
            print("La puerta está abierta")
        else:
            print("La puerta está cerrada")


class Habitacion(ElementoMapa):
    def __init__(self, num):
        super().__init__()
        self.num = num
        self.norte = None
        self.sur = None
        self.este = None
        self.oeste = None

    def entrar(self):
        print(f"Estás en la habitación {self.num}")

    def es_habitacion(self):
        return True

    def conectar(self, direccion, elemento):
       
        setattr(self, direccion, elemento)
   
    def mostrar(self):
        # Muestra las conexiones (puertas y paredes) de la habitación
        print(f"Habitación {self.num}:")
        print(f"  Norte: {self.norte.__class__.__name__ if self.norte else 'Ninguno'}")
        print(f"  Sur: {self.sur.__class__.__name__ if self.sur else 'Ninguno'}")
        print(f"  Este: {self.este.__class__.__name__ if self.este else 'Ninguno'}")
        print(f"  Oeste: {self.oeste.__class__.__name__ if self.oeste else 'Ninguno'}")
        print("--------------------")    


class Laberinto(ElementoMapa):

    def __init__(self):
        super().__init__()
        self.habitaciones = []

    def agregar_habitacion(self, habitacion):
        self.habitaciones.append(habitacion)

    def obtener_habitacion(self, num):
        return next((hab for hab in self.habitaciones if hab.num == num), None)
    
    def entrar(self):
        
        pass
    def mostrar(self):
      
        for habitacion in self.habitaciones:
            habitacion.mostrar()    


class Modo:
    def actua(self, bicho):
        self.camina(bicho)

    def camina(self, bicho):
        raise NotImplementedError("Método debe ser implementado en la subclase")

    def es_agresivo(self):
        return False

    def es_perezoso(self):
        return False    


class Perezoso(Modo):
    def es_perezoso(self):
        return True


class Agresivo(Modo):
    def es_agresivo(self):
        return True


class Bicho:
    def __init__(self, vidas=5, poder=5, modo=None, posicion=None):
        self.vidas = vidas
        self.poder = poder
        self.modo = modo if modo else Perezoso()
        self.posicion = posicion

    def actua(self):
        # delega en el modo
        if self.modo:
            self.modo.actua(self)
    
    def ini_agresivo(self):
        self.modo = Agresivo()
        self.poder = 10
    
    def ini_perezoso(self):
        self.modo = Perezoso()
        self.poder = 1

    def es_agresivo(self):
        return self.modo is not None and self.modo.es_agresivo()
    
    def es_perezoso(self):
        return self.modo is not None and self.modo.es_perezoso()


class Bomba:
    def __init__(self, activa=False):
        self.activa = activa

    def entrar(self):
        if self.activa:
            print("¡Bomba explotó!")
        else:
            print("No pasó nada")


class Creator:

    def fabricar_habitacion(self, num):
        hab = Habitacion(num)
       
        hab.este = self.fabricar_pared()
        hab.oeste = self.fabricar_pared()
        hab.norte = self.fabricar_pared()
        hab.sur = self.fabricar_pared()
        return hab

    def fabricar_juego(self):
        return Juego()
    
    def fabricar_laberinto(self):
        return Laberinto()
    
    def fabricar_pared(self):
        return Pared()
    
    def fabricar_puerta(self, lado1, lado2):
        return Puerta(lado1, lado2)
    
   
    def fabricar_bomba(self):
       
        return Bomba(None)

   
    def fabricar_bicho_agresivo(self):
        bicho = Bicho()
        bicho.ini_agresivo()
        return bicho
    
    def fabricar_bicho_perezoso(self):
        bicho = Bicho()
        bicho.ini_perezoso()
        return bicho
    
    def cambiar_a_modo_agresivo(self, bicho):
        bicho.ini_agresivo()


class CreatorB(Creator):
   
    def fabricar_pared(self):
        return ParedBomba()


class Juego:
  
    def __init__(self):
        self.laberinto = Laberinto()
        self.bichos = []
    
    def agregar_bicho(self, bicho):
        self.bichos.append(bicho)
    
    def eliminar_bicho(self, bicho):
        if bicho in self.bichos:
            self.bichos.remove(bicho)
        else:
            print("No existe ese bicho")
    
    def obtener_habitacion(self, num):
      
        return self.laberinto.obtener_habitacion(num)



    def crear_laberinto_2_habitaciones(self):
       
        hab1 = Habitacion(1)
        hab2 = Habitacion(2)

        hab1.este = Pared()
        hab1.oeste = Pared()
        hab1.norte = Pared()

        hab2.sur = Pared()
        hab2.este = Pared()
        hab2.oeste = Pared()

        puerta = Puerta(hab1, hab2)
        hab1.sur = puerta
        hab2.norte = puerta

        self.laberinto = Laberinto()
        self.laberinto.agregar_habitacion(hab1)
        self.laberinto.agregar_habitacion(hab2)

        return self.laberinto

    def crear_laberinto_2_habitaciones_fm(self, creator):
      
        hab1 = creator.fabricar_habitacion(1)
        hab2 = creator.fabricar_habitacion(2)

      
        puerta = creator.fabricar_puerta(hab1, hab2)

       
        hab1.sur = puerta
        hab2.norte = puerta

        self.laberinto = creator.fabricar_laberinto()
        self.laberinto.agregar_habitacion(hab1)
        self.laberinto.agregar_habitacion(hab2)

        return self.laberinto

    def crear_laberinto_2_habitaciones_fmd(self, creator):
       
        hab1 = creator.fabricar_habitacion(1)
        hab2 = creator.fabricar_habitacion(2)

        # Creamos bombas y les asignamos una pared interna:
        bomba1 = creator.fabricar_bomba()
        bomba1.em = creator.fabricar_pared()
        hab1.este = bomba1

        bomba2 = creator.fabricar_bomba()
        bomba2.em = creator.fabricar_pared()
        hab2.este = bomba2

        # Creamos la puerta
        puerta = creator.fabricar_puerta(hab1, hab2)

        hab1.sur = puerta
        hab2.norte = puerta

        self.laberinto = creator.fabricar_laberinto()
        self.laberinto.agregar_habitacion(hab1)
        self.laberinto.agregar_habitacion(hab2)

        return self.laberinto

    def crear_laberinto_4_habitaciones(self):
      
        hab1 = Habitacion(1)
        hab2 = Habitacion(2)
        hab3 = Habitacion(3)
        hab4 = Habitacion(4)
        
        puerta1 = Puerta(hab1, hab2)
        puerta2 = Puerta(hab3, hab4)
        puerta3 = Puerta(hab1, hab3)
        puerta4 = Puerta(hab2, hab4)
        
        hab1.conectar("sur", puerta3)
        hab2.conectar("sur", puerta4)
        hab3.conectar("norte", puerta3)
        hab4.conectar("norte", puerta4)
        hab1.conectar("este", puerta1)
        hab2.conectar("oeste", puerta1)
        hab3.conectar("este", puerta2)
        hab4.conectar("oeste", puerta2)
        
        if hab1.norte is None:
          hab1.norte = Pared()
        if hab1.sur is None:
         hab1.sur = Pared()
        if hab1.este is None:
         hab1.este = Pared()
        if hab1.oeste is None:
         hab1.oeste = Pared()

        if hab2.norte is None:
         hab2.norte = Pared()
        if hab2.sur is None:
         hab2.sur = Pared()
        if hab2.este is None:
         hab2.este = Pared()
        if hab2.oeste is None:
         hab2.oeste = Pared()

        if hab3.norte is None:
         hab3.norte = Pared()
        if hab3.sur is None:
         hab3.sur = Pared()
        if hab3.este is None:
         hab3.este = Pared()
        if hab3.oeste is None:
         hab3.oeste = Pared()

        if hab4.norte is None:
         hab4.norte = Pared()
        if hab4.sur is None:
         hab4.sur = Pared()
        if hab4.este is None:
         hab4.este = Pared()
        if hab4.oeste is None:
         hab4.oeste = Pared()
        bicho_agresivo = Bicho()
        bicho_agresivo.ini_agresivo()
        bicho_agresivo.posicion = hab1.este
        hab1.este = bicho_agresivo
        
        
        bicho_agresivo2 = Bicho()
        bicho_agresivo2.ini_agresivo()
        bicho_agresivo2.posicion = hab2.norte  
        hab2.norte = bicho_agresivo2
      
        

        bicho_perezoso1 = Bicho()
        bicho_perezoso1.ini_perezoso()
        bicho_perezoso1.posicion = hab3.oeste
        hab3.oeste = bicho_perezoso1
      
        
        
        bicho_perezoso2 = Bicho()
        bicho_perezoso2.ini_perezoso()
        bicho_perezoso2.posicion = hab4.oeste
        hab4.sur = bicho_perezoso2
       
        
        
        self.laberinto.agregar_habitacion(hab1)
        self.laberinto.agregar_habitacion(hab2)
        self.laberinto.agregar_habitacion(hab3)
        self.laberinto.agregar_habitacion(hab4)
        
        self.agregar_bicho(bicho_agresivo)
        self.agregar_bicho(bicho_agresivo2)
        self.agregar_bicho(bicho_perezoso1)
        self.agregar_bicho(bicho_perezoso2)
     


   

        return self.laberinto
    def crear_laberinto_4_habitaciones_bichos_fm(self, creator):
    
     # Crear habitaciones
     hab1 = creator.fabricar_habitacion(1)
     hab2 = creator.fabricar_habitacion(2)
     hab3 = creator.fabricar_habitacion(3)
     hab4 = creator.fabricar_habitacion(4)
   
     # Crear puertas entre las habitaciones
     puerta1 = creator.fabricar_puerta(hab1, hab2)
     puerta2 = creator.fabricar_puerta(hab2, hab3)
     puerta3 = creator.fabricar_puerta(hab3, hab4)
     puerta4 = creator.fabricar_puerta(hab4, hab1)

     
     hab1.sur = puerta1
     hab2.norte = puerta1
     hab2.sur = puerta2
     hab3.norte = puerta2
     hab3.sur = puerta3
     hab4.norte = puerta3
     hab4.sur = puerta4
     hab1.norte = puerta4

   
     bicho_rojo1 = Bicho()
     bicho_rojo1.ini_agresivo()
     bicho_rojo1.posicion = hab1.este
     hab1.este = bicho_rojo1

     bicho_rojo2 = Bicho()
     bicho_rojo2.ini_agresivo()
     bicho_rojo2.posicion = hab2.norte
     hab2.norte = bicho_rojo2

     bicho_verde1 = Bicho()
     bicho_verde1.ini_perezoso()
     bicho_verde1.posicion = hab3.oeste
     hab3.oeste = bicho_verde1

     bicho_verde2 = Bicho()
     bicho_verde2.ini_perezoso()
     bicho_verde2.posicion = hab4.oeste
     hab4.oeste = bicho_verde2

     
     self.laberinto = creator.fabricar_laberinto()
     self.laberinto.agregar_habitacion(hab1)
     self.laberinto.agregar_habitacion(hab2)
     self.laberinto.agregar_habitacion(hab3)
     self.laberinto.agregar_habitacion(hab4)

     return self.laberinto

juego = Juego()
juego.jugar()
