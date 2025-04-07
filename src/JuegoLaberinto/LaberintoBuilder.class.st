"
laberintobuilder construye un tipo de laberinto por orden del director
"
Class {
	#name : #LaberintoBuilder,
	#superclass : #Object,
	#instVars : [
		'juego',
		'director'
	],
	#category : #'JuegoLaberinto-Builder'
}

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarArmario:unNum en:unContenedor [
	|arm|
	arm:=Armario new num:unNum.
	arm num:unNum.
	"arm agregarOrientacion: self fabricarNorte; agregarOrientacion:self fabricarSur; agregarOrientacion:self fabricarEste; agregarOrientacion:self fabricarOeste."
	
	arm obtenerOrientaciones do:[:each | arm ponerEnOr:each elemento:self fabricarPared].
	
	
	unContenedor agregarHijo: arm.
	
	^arm
	
]

{ #category : #'fm-bichos' }
LaberintoBuilder >> fabricarBichoAgresivo [

	| bicho |
	bicho:= Bicho new.
	bicho modo: Agresivo new.
	bicho vidas:5.
	bicho poder:5.
	^bicho
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarBichoModo:unModo posicion:unNum [
	|hab bicho|
	hab:=self juego laberinto obtenerHabitacion: unNum.
	
	"strModo='Agresivo' ifTrue:[bicho:=self fabricarBichoAgresivo:hab]" 
	
	bicho:= self perform:('fabricarBicho',unModo) asSymbol.
	hab entrar:bicho.
	
	self juego agregarBicho: bicho.
	"agregar el bicho al juego"	


]

{ #category : #'fm-bichos' }
LaberintoBuilder >> fabricarBichoPerezoso [ 

	| bicho |
	bicho:= Bicho new.
	bicho modo: Perezoso new.
	bicho vidas:1.
	bicho poder:1.
	
	^bicho
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarBombaEn:unContenedor [
	|bmb|
	bmb:= Bomba new.
	unContenedor agregarHijo: bmb.
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarEste [ 
	^Este default 
]

{ #category : #'as yet unclassified' }
LaberintoBuilder >> fabricarForma [
	|forma|
	forma:=Cuadrado new.
	forma agregarOrientacion: self fabricarNorte; agregarOrientacion:self fabricarSur; agregarOrientacion:self fabricarEste; agregarOrientacion:self fabricarOeste.
	^forma
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarHabitacion:unNum [
	|hab|
	hab:=Habitacion new.
	hab num:unNum.
	hab forma:self fabricarForma.
	"hab agregarOrientacion: self fabricarNorte; agregarOrientacion:self fabricarSur; agregarOrientacion:self fabricarEste; agregarOrientacion:self fabricarOeste."
	
	hab obtenerOrientaciones do:[:each | hab ponerEnOr:each elemento:self fabricarPared].
	
	
	self laberinto agregarHabitacion: hab.
	
	^hab 
	
]

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarJuego [ 
	self juego:Juego new.
	self juego prototipo:self laberinto.
	self juego laberinto:self juego clonarLaberinto "self juego clonarLaberinto"
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

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> fabricarTunelEn:unContenedor [
	|tunel|
	tunel:= Tunel new.
	tunel agregarComando:(Entrar new receptor:tunel).
	unContenedor agregarHijo: tunel.
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

{ #category : #'metodos fabricacion' }
LaberintoBuilder >> obtenerJuego [ 
	^self juego
]
