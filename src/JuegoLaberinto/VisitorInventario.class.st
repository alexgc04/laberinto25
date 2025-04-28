Class {
	#name : #VisitorInventario,
	#superclass : #Visitor,
	#category : #'JuegoLaberinto-Visitor'
}

{ #category : #'as yet unclassified' }
VisitorInventario >> visitarArmario:unArmario [
	Transcript show:unArmario printString;cr.
]

{ #category : #'as yet unclassified' }
VisitorInventario >> visitarBomba:unaBomba [
	Transcript show:unaBomba printString;cr.
]

{ #category : #'as yet unclassified' }
VisitorInventario >> visitarHabitacion:unaHab [
	Transcript show:unaHab printString;cr.
]

{ #category : #'as yet unclassified' }
VisitorInventario >> visitarPared:unaPared [
	Transcript show:unaPared printString;cr.
]

{ #category : #'as yet unclassified' }
VisitorInventario >> visitarPuerta:unaPuerta [
	Transcript show:unaPuerta printString;cr.
]

{ #category : #'as yet unclassified' }
VisitorInventario >> visitarTunel:unTunel [
	Transcript show:unTunel printString;cr.
]
