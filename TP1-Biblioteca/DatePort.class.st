"
clase que modela los tiempos
"
Class {
	#name : 'DatePort',
	#superclass : 'Object',
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
DatePort >> now [
^self subclassResponsibility.

]
