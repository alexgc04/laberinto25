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
	
	self dormir:unBicho.
	self caminar:unBicho.
	self atacar:unBicho
]

{ #category : #'as yet unclassified' }
Modo >> atacar:unBicho [
	unBicho atacar
]

{ #category : #'as yet unclassified' }
Modo >> buscarTunelBicho:unBicho [
	"self subclassResponsibility"
	"predeterminado (no hace nada / loquesea)"
	
]

{ #category : #'as yet unclassified' }
Modo >> caminar:unBicho [
	|or|
	"obtener la posicion"
	"elegir una orientacion aleatoria"
	or:=unBicho obtenerOrientacion.
	"caminar hacia esa orientacion"
	or caminar:unBicho

]

{ #category : #'as yet unclassified' }
Modo >> dormir:unBicho [
	self subclassResponsibility 
]

{ #category : #consulta }
Modo >> esAgresivo [
	^false
]

{ #category : #consulta }
Modo >> esPerezoso [
	^false
]
