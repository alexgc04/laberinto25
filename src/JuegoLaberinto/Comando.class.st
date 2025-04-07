"
comando es la interfaz de los comandos del laberinto
"
Class {
	#name : #Comando,
	#superclass : #Object,
	#instVars : [
		'receptor'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
Comando >> receptor [

	^ receptor
]

{ #category : #accessing }
Comando >> receptor: anObject [

	receptor := anObject
]
