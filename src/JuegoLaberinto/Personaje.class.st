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
Personaje >> avisar [ 
	self juego muerePersonaje 
]

{ #category : #'as yet unclassified' }
Personaje >> crearNuevoLaberinto:unTunel [
	unTunel crearNuevoLaberinto: self.
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

{ #category : #ataques }
Personaje >> puedeAtacar [ 
	self juego buscarBicho. 
]
