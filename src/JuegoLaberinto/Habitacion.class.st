Class {
	#name : #Habitacion,
	#superclass : #Contenedor,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Habitacion >> irAlEste:alguien [
	self este entrar: alguien
]

{ #category : #'as yet unclassified' }
Habitacion >> irAlNorte:alguien [
	self norte entrar: alguien
]

{ #category : #'as yet unclassified' }
Habitacion >> irAlOeste:alguien [
	self oeste entrar: alguien
]

{ #category : #'as yet unclassified' }
Habitacion >> irAlSur:alguien [
	self sur entrar: alguien
]

{ #category : #printing }
Habitacion >> printOn:aStream [
	aStream nextPutAll:'Hab' ; nextPutAll:self num asString
]
