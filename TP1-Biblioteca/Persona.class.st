"
clase generica para modelar a una persona

"
Class {
	#name : 'Persona',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'apellido',
		'cuit'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
Persona >> apellido [
^ apellido 
]

{ #category : 'accessing' }
Persona >> cuit [
^cuit
]

{ #category : 'accessing' }
Persona >> nombre [
^ nombre
]
