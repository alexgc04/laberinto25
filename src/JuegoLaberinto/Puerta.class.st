Class {
	#name : #Puerta,
	#superclass : #ElementoMapa,
	#instVars : [
		'abierta',
		'lado1',
		'lado2'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
Puerta >> abierta [

	^ abierta
]

{ #category : #accessing }
Puerta >> abierta: anObject [

	abierta := anObject
]

{ #category : #'as yet unclassified' }
Puerta >> abrir [
	abierta:=true.
		
]

{ #category : #'as yet unclassified' }
Puerta >> cerrar [
	abierta:=false.
]

{ #category : #caminar }
Puerta >> entrar:alguien [
	self abierta 
	ifTrue:[ alguien posicion = self lado1 ifTrue:[self lado2 entrar:alguien] ifFalse:[self lado1 entrar:alguien] ]
	ifFalse:[ Transcript show: 'La puerta esta cerrada';cr].
]

{ #category : #'as yet unclassified' }
Puerta >> esPuerta [ 
	^true
]

{ #category : #initialization }
Puerta >> initialize [ 
	abierta:=false.
	"self abierta:false"
]

{ #category : #accessing }
Puerta >> lado1 [

	^ lado1
]

{ #category : #accessing }
Puerta >> lado1: anObject [

	lado1 := anObject
]

{ #category : #accessing }
Puerta >> lado2 [

	^ lado2
]

{ #category : #accessing }
Puerta >> lado2: anObject [

	lado2 := anObject
]

{ #category : #printing }
Puerta >> printOn:aStream [
	aStream nextPutAll:'Puerta-' ; nextPutAll:self lado1 num asString; nextPutAll:'-'; nextPutAll: self lado2 num asString.
	
]
