"
Contenedor es el composite del laberinto. Es un EM que tiene hijos
"
Class {
	#name : #Contenedor,
	#superclass : #ElementoMapa,
	#instVars : [
		'hijos',
		'forma',
		'num'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'gestion-hijos' }
Contenedor >> agregarHijo:unEM [
	unEM padre:self.
	self hijos add:unEM
	
]

{ #category : #'gestionar-orientaciones' }
Contenedor >> agregarOrientacion:unaOr [
	self forma agregarOrientacion: unaOr.
]

{ #category : #'as yet unclassified' }
Contenedor >> eliminarHijo:unEM [
	self hijos remove:unEM ifAbsent:["no existe ese objeto"]
]

{ #category : #caminar }
Contenedor >> entrar:alguien [
	Transcript show:alguien printString ; nextPutAll:'esta en ' ; nextPutAll:self printString ; cr.
	alguien posicion:self.
	
	alguien buscarTunel.
	
]

{ #category : #accessing }
Contenedor >> forma [

	^ forma
]

{ #category : #accessing }
Contenedor >> forma: anObject [

	forma := anObject
]

{ #category : #accessing }
Contenedor >> hijos [

	^ hijos
]

{ #category : #accessing }
Contenedor >> hijos: anObject [

	hijos := anObject
]

{ #category : #initialization }
Contenedor >> initialize [ 
	hijos:=OrderedCollection new.
	
]

{ #category : #movimiento }
Contenedor >> irAlEste:alguien [
	self forma irAlEste: alguien 
]

{ #category : #movimiento }
Contenedor >> irAlNorte:alguien [
	self forma irAlNorte: alguien 
]

{ #category : #movimiento }
Contenedor >> irAlOeste:alguien [
	self forma irAlOeste: alguien 
]

{ #category : #movimiento }
Contenedor >> irAlSur:alguien [
	self forma irAlSur: alguien 
]

{ #category : #accessing }
Contenedor >> num [

	^ num
]

{ #category : #accessing }
Contenedor >> num: anObject [

	num := anObject
]

{ #category : #'gestionar-orientaciones' }
Contenedor >> obtenerElementoOr:unaOr [
	"^unaOr obtenerElementoOrEn:self."
	^self forma obtenerElementoOr: unaOr.
]

{ #category : #'gestionar-orientaciones' }
Contenedor >> obtenerOrientacion [ 
	"obtener orientacion aleatoria"
	"|ind|
	ind :=(1 to:self orientaciones size) atRandom.
	^self orientaciones at:ind."
	^self forma obtenerOrientacion 
]

{ #category : #'gestionar-orientaciones' }
Contenedor >> obtenerOrientaciones [
	^self forma obtenerOrientaciones
]

{ #category : #accessing }
Contenedor >> ponerEnOr:unaOr elemento:unEM [
	"unaOr ponerElemento:unEM en:self."
	self forma ponerEnOr:unaOr elemento:unEM 
]

{ #category : #recorrido }
Contenedor >> recorrer:unBloque [
	unBloque value:self.
	self hijos do:[:each | each recorrer:unBloque].
	"tengo que recorrer las orientaciones"
	self obtenerOrientaciones do:[:each | each recorrer:unBloque contenedor:self].
]
