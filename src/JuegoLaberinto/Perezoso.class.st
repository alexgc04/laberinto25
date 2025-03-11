Class {
	#name : #Perezoso,
	#superclass : #Modo,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Perezoso >> dormir:unBicho [
	Transcript show:unBicho printString ; nextPutAll: ' duerme';cr.
   (Delay forSeconds: 3) wait.
]

{ #category : #consulta }
Perezoso >> esPerezoso [ 
	^true
]

{ #category : #printing }
Perezoso >> printOn:aStream [
	aStream nextPutAll:'Perezoso'
]
