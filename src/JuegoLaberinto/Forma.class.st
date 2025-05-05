"
representa la implementacion de un contenedor. Puede ser cuadrado...
"
Class {
	#name : #Forma,
	#superclass : #Object,
	#instVars : [
		'orientaciones',
		'punto',
		'extent',
		'num'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'gestion-orientaciones' }
Forma >> agregarOrientacion:unaOr [
	self orientaciones add:unaOr.
]

{ #category : #'as yet unclassified' }
Forma >> calcularPosicion [
	self orientaciones do:[:or |
		or calcularPosicionDesde:self ]
]

{ #category : #accessing }
Forma >> extent [

	^ extent
]

{ #category : #accessing }
Forma >> extent: anObject [

	extent := anObject
]

{ #category : #initialization }
Forma >> initialize [ 
	orientaciones:=OrderedCollection new.
]

{ #category : #movimiento }
Forma >> irAlNorte: alguien [
	self subclassResponsibility 
]

{ #category : #accessing }
Forma >> num [

	^ num
]

{ #category : #accessing }
Forma >> num: anObject [

	num := anObject
]

{ #category : #'gestion-orientaciones' }
Forma >> obtenerElementoOr:unaOr [
	^unaOr obtenerElementoOrEn:self.
]

{ #category : #'gestion-orientaciones' }
Forma >> obtenerOrientacion [ 
	|ind|
	ind :=(1 to:self orientaciones size) atRandom.
	^self orientaciones at:ind.
]

{ #category : #'gestion-orientaciones' }
Forma >> obtenerOrientaciones [ 
	^self orientaciones 
]

{ #category : #accessing }
Forma >> orientaciones [

	^ orientaciones
]

{ #category : #accessing }
Forma >> orientaciones: anObject [

	orientaciones := anObject
]

{ #category : #accessing }
Forma >> ponerEnOr:unaOr elemento:unEM [
	unaOr ponerElemento:unEM en:self.
]

{ #category : #accessing }
Forma >> punto [

	^ punto
]

{ #category : #accessing }
Forma >> punto: anObject [

	punto := anObject
]
