"
representa la implementacion de un contenedor. Puede ser cuadrado...
"
Class {
	#name : #Forma,
	#superclass : #Object,
	#instVars : [
		'orientaciones'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'gestion-orientaciones' }
Forma >> agregarOrientacion:unaOr [
	self orientaciones add:unaOr.
]

{ #category : #initialization }
Forma >> initialize [ 
	orientaciones:=OrderedCollection new.
]

{ #category : #movimiento }
Forma >> irAlNorte: alguien [
	self subclassResponsibility 
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
