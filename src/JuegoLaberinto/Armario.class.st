"
armario es un contenedor
"
Class {
	#name : #Armario,
	#superclass : #Contenedor,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Armario >> esArmario [
	^true
]

{ #category : #'as yet unclassified' }
Armario >> visitarContenedor:unVisitor [
	unVisitor visitarArmario:self
]
