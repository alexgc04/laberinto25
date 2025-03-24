"
figura plana de cuatro lado. Posible implementacion de los contenedores
"
Class {
	#name : #Cuadrado,
	#superclass : #Forma,
	#instVars : [
		'norte',
		'sur',
		'este',
		'oeste'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
Cuadrado >> este [

	^ este
]

{ #category : #accessing }
Cuadrado >> este: anObject [

	este := anObject
]

{ #category : #movimiento }
Cuadrado >> irAlEste: alguien [
	self este entrar: alguien
]

{ #category : #movimiento }
Cuadrado >> irAlNorte: alguien [
	self norte entrar: alguien
]

{ #category : #movimiento }
Cuadrado >> irAlOeste: alguien [
	self oeste entrar: alguien
]

{ #category : #movimiento }
Cuadrado >> irAlSur: alguien [
	self sur entrar: alguien
]

{ #category : #accessing }
Cuadrado >> norte [

	^ norte
]

{ #category : #accessing }
Cuadrado >> norte: anObject [

	norte := anObject
]

{ #category : #accessing }
Cuadrado >> oeste [

	^ oeste
]

{ #category : #accessing }
Cuadrado >> oeste: anObject [

	oeste := anObject
]

{ #category : #accessing }
Cuadrado >> sur [

	^ sur
]

{ #category : #accessing }
Cuadrado >> sur: anObject [

	sur := anObject
]
