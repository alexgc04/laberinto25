Class {
	#name : #Bicho,
	#superclass : #Ente,
	#instVars : [
		'modo'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Bicho >> actua [
	self modo actua:self
	
]

{ #category : #consulta }
Bicho >> esAgresivo [ 
	^self modo esAgresivo 
]

{ #category : #consulta }
Bicho >> esPerezoso [ 
	^self modo esPerezoso 
]

{ #category : #consulta }
Bicho >> estaVivo [
	^self vidas > 0 
]

{ #category : #initialization }
Bicho >> iniAgresivo [
	self modo:Agresivo new.
	self poder:10.
]

{ #category : #initialization }
Bicho >> iniPerezoso [
	self modo:Perezoso new. "cableando"
	self poder:1.
]

{ #category : #accessing }
Bicho >> modo [

	^ modo
]

{ #category : #accessing }
Bicho >> modo: anObject [

	modo := anObject
]

{ #category : #'as yet unclassified' }
Bicho >> obtenerOrientacion [
	^self posicion obtenerOrientacion
]
