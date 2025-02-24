"
Clase definida
"
Class {
	#name : #Creator,
	#superclass : #Object,
	#category : #'JuegoLaberinto-FactoryMethod'
}

{ #category : #'fm-bichos' }
Creator >> cambiarModoAgresivo:unBicho [

	unBicho modo:Agresivo new.
	unBicho poder:10.
]

{ #category : #'fm-bichos' }
Creator >> fabricarBichoAgresivo [

	| bicho |
	bicho:= Bicho new.
	bicho modo: Agresivo new.
	bicho vidas:5.
	bicho poder:5.
	^bicho
]

{ #category : #'fm-bichos' }
Creator >> fabricarBichoAgresivo:unBicho [

	| bicho |
	bicho:= Bicho new.
	bicho modo: Agresivo new.
	bicho vidas:5.
	bicho poder:5.
	^bicho
]

{ #category : #'fm-bichos' }
Creator >> fabricarBichoPerezoso [
	| bicho |
	
	bicho:=Bicho new.
	bicho modo: Perezoso new.
	bicho poder:1.
	bicho vidas:1.
	"bicho poder:5."
	
	^bicho 
]

{ #category : #'fm-bichos' }
Creator >> fabricarBichoPerezoso:unBicho [
	| bicho |
	
	bicho:=Bicho new.
	bicho modo: Perezoso new.
	bicho poder:1.
	bicho vidas:1.
	"bicho poder:5."
	
	^bicho 
]

{ #category : #'factory method' }
Creator >> fabricarBomba [
	^Bomba new
]

{ #category : #'as yet unclassified' }
Creator >> fabricarEste [
	^Este new 
]

{ #category : #'factory method' }
Creator >> fabricarHabitacion [
	^Habitacion new
]

{ #category : #'factory method' }
Creator >> fabricarHabitacion:unNum [
	|hab|
	hab:=Habitacion new num:unNum.
	hab num:unNum.
	hab agregarOrientacion: self fabricarNorte; agregarOrientacion:self fabricarSur; agregarOrientacion:self fabricarEste; agregarOrientacion:self fabricarOeste.
	
	hab orientaciones do:[:each | hab ponerEnOr:each elemento:self fabricarPared].
	
	"hab este:self fabricarPared.
	hab oeste:self fabricarPared.
	hab norte:self fabricarPared.
	hab sur:self fabricarPared."
	^hab 
	
	
]

{ #category : #'factory method' }
Creator >> fabricarJuego [
	^Juego new
]

{ #category : #'factory method' }
Creator >> fabricarLaberinto [
	^Laberinto new
]

{ #category : #'fm-bichos' }
Creator >> fabricarModoAgresivo:unBicho [

	unBicho modo:Agresivo new.
	unBicho poder:10.
]

{ #category : #'as yet unclassified' }
Creator >> fabricarNorte [
	^Norte new 
]

{ #category : #'as yet unclassified' }
Creator >> fabricarOeste [
	^Oeste new 
]

{ #category : #'factory method' }
Creator >> fabricarPared [
	^Pared new
]

{ #category : #'factory method' }
Creator >> fabricarPuerta [
	^Puerta new
]

{ #category : #'as yet unclassified' }
Creator >> fabricarSur [
	^Sur new 
]
