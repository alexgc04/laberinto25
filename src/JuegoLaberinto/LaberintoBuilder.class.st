"
laberintobuilder construye un tipo de laberinto por orden del director
"
Class {
	#name : #LaberintoBuilder,
	#superclass : #Object,
	#instVars : [
		'juego',
		'laberinto'
	],
	#category : #'JuegoLaberinto-Builder'
}

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarBichoModo:unModo posicion:unNum [
	|hab bicho|
	hab:=self obtenerHabitacion: unNum.
	
	"crear el bicho, lo voy a copiar del creator"
	"agregar el bicho al juego"	


]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarEste [ 
	^Este default 
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarHabitacion:unNum [
	|hab|
	hab:=Habitacion new num:unNum.
	hab num:unNum.
	hab agregarOrientacion: self fabricarNorte; agregarOrientacion:self fabricarSur; agregarOrientacion:self fabricarEste; agregarOrientacion:self fabricarOeste.
	
	hab orientaciones do:[:each | hab ponerEnOr:each elemento:self fabricarPared].
	
	
	self laberinto agregarHabitacion: hab.
	
	^hab 
	
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarJuego [ 
	self juego:Juego new.
	self juego laberinto:self laberinto.
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarLaberinto [ 
	self laberinto: Laberinto new.
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarNorte [ 
	^Norte default 
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarOeste [ 
	^Oeste default 
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarPared [ 
	^Pared new 
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarPuertaL1:num1 or1:strOr1 L2:num2 or2:strOr2 [
	|hab1 hab2 obOr1 obOr2 pt|
	
	hab1:=self laberinto obtenerHabitacion: num1.
	hab2:=self laberinto obtenerHabitacion: num2.
	
	obOr1:=self perform:('fabricar',strOr1) asSymbol. "fabricar+Norte => fabricarNorte"
	obOr2:=self perform:('fabricar',strOr2) asSymbol.
	
	pt:= Puerta new.
	pt lado1: hab1.
	pt lado2: hab2.
	
	hab1 ponerEnOr: obOr1 elemento: pt.
	hab2 ponerEnOr: obOr2 elemento: pt.
		

]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarSur [ 
	^Sur default 
]

{ #category : #accessing }
LaberintoBuilder >> juego [

	^ juego
]

{ #category : #accessing }
LaberintoBuilder >> juego: anObject [

	juego := anObject
]

{ #category : #accessing }
LaberintoBuilder >> laberinto [

	^ laberinto
]

{ #category : #accessing }
LaberintoBuilder >> laberinto: anObject [

	laberinto := anObject
]
