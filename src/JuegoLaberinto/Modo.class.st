"
Modo es la interfaz de la estrategia de los bichos

"
Class {
	#name : #Modo,
	#superclass : #Object,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Modo >> actua:unBicho [
	"Template Method"
	"self duerme."
	self camina:unBicho.
	"self ataca."
]

{ #category : #'as yet unclassified' }
Modo >> camina:unBicho [
	"self subclassResponsibility"
	""	
	"definir un caminar predeterminado"


]

{ #category : #consulta }
Modo >> esAgresivo [
	^false
]

{ #category : #consulta }
Modo >> esPerezoso [
	^false
]
