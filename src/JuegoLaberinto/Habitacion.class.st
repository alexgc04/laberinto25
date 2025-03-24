Class {
	#name : #Habitacion,
	#superclass : #Contenedor,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #printing }
Habitacion >> printOn:aStream [
	aStream nextPutAll:'Hab' ; nextPutAll:self num asString
]
