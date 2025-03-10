"
es el usuario del juego
"
Class {
	#name : #Personaje,
	#superclass : #Ente,
	#instVars : [
		'nombre'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Personaje >> esAtacadoPor:unBicho [
	Transcript show:self printString ; nextPutAll: ' es atacado por ' ; nextPutAll: unBicho printString;cr.
	
	self vidas:(self vidas-unBicho poder).
	Transcript show: 'Vidas: ' ; nextPutAll: self vidas asString ; cr. "mensaje 13"
	
	self vidas < 0 ifTrue: [ self juego muerePersonaje. ]
]

{ #category : #'as yet unclassified' }
Personaje >> irAlEste [
	self posicion irAlEste:self
]

{ #category : #'as yet unclassified' }
Personaje >> irAlNorte [
	self posicion irAlNorte:self
]

{ #category : #'as yet unclassified' }
Personaje >> irAlOeste [
	self posicion irAlOeste:self
]

{ #category : #'as yet unclassified' }
Personaje >> irAlSur [
	self posicion irAlSur:self
]

{ #category : #accessing }
Personaje >> nombre [

	^ nombre
]

{ #category : #accessing }
Personaje >> nombre: anObject [

	nombre := anObject
]
