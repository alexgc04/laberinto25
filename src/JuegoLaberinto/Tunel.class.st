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

{ #category : #caminar }
Tunel >> entrar:alguien [
	"el personaje crea un nuevo laberinto y entra en el"	


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
