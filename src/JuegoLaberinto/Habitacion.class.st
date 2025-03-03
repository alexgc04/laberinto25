Class {
	#name : #Habitacion,
	#superclass : #Contenedor,
	#instVars : [
		'num',
		'norte',
		'sur',
		'este',
		'oeste'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #caminar }
Habitacion >> entrar:alguien [
	Transcript show:alguien printString ; nextPutAll:'esta en ' ; nextPutAll:self printString ; cr.
	alguien posicion:self.
]

{ #category : #accessing }
Habitacion >> este [

	^ este
]

{ #category : #accessing }
Habitacion >> este: anObject [

	este := anObject
]

{ #category : #accessing }
Habitacion >> norte [

	^ norte
]

{ #category : #accessing }
Habitacion >> norte: anObject [

	norte := anObject
]

{ #category : #accessing }
Habitacion >> num [

	^ num
]

{ #category : #accessing }
Habitacion >> num: anObject [

	num := anObject
]

{ #category : #accessing }
Habitacion >> oeste [

	^ oeste
]

{ #category : #accessing }
Habitacion >> oeste: anObject [

	oeste := anObject
]

{ #category : #printing }
Habitacion >> printOn:aStream [
	aStream nextPutAll:'Hab' ; nextPutAll:self num asString
]

{ #category : #accessing }
Habitacion >> sur [

	^ sur
]

{ #category : #accessing }
Habitacion >> sur: anObject [

	sur := anObject
]
