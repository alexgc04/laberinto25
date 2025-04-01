"
tunel es un proxy virtual
"
Class {
	#name : #Tunel,
	#superclass : #Hoja,
	#instVars : [
		'laberinto'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Tunel >> crearNuevoLaberinto:alguien [
	Transcript show:alguien printString ; nextPutAll:' crea un nuevo laberinto';cr.
	self laberinto: alguien juegoClonaLaberinto "juego prototipo deepCopy".
]

{ #category : #caminar }
Tunel >> entrar: alguien [

	self laberinto
		ifNil: [ alguien crearNuevoLaberinto: self ]
		ifNotNil: [
			Transcript
				show: alguien printString;
				nextPutAll: ' entra en un nuevo laberinto';
				cr.
			self laberinto entrar: alguien ]
]

{ #category : #'as yet unclassified' }
Tunel >> esTunel [ 
	^true
]

{ #category : #accessing }
Tunel >> laberinto [

	^ laberinto
]

{ #category : #accessing }
Tunel >> laberinto: anObject [

	laberinto := anObject
]
