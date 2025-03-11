Class {
	#name : #Agresivo,
	#superclass : #Modo,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Agresivo >> dormir:unBicho [
	Transcript show:unBicho printString ; nextPutAll: ' duerme';cr.
   (Delay forSeconds: 1) wait.

]

{ #category : #consulta }
Agresivo >> esAgresivo [ 
	^true
]

{ #category : #printing }
Agresivo >> printOn:aStream [
	aStream nextPutAll:'Agresivo'
]
