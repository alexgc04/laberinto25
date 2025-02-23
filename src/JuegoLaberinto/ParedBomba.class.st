"
subclase pared que tiene variable de instancia que se llama activa

"
Class {
	#name : #ParedBomba,
	#superclass : #Pared,
	#instVars : [
		'activa'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
ParedBomba >> activa [

	^ activa
]

{ #category : #accessing }
ParedBomba >> activa: anObject [

	activa := anObject
]

{ #category : #caminar }
ParedBomba >> entrar [ 
	Transcript show:'Te has chocado con la pared bomba';cr.
]

{ #category : #initialization }
ParedBomba >> initialize [ 
	activa:=false
]
