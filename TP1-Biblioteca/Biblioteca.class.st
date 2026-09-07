"
Gestor de todos las instancias y motor principal del sistema

"
Class {
	#name : 'Biblioteca',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'datePort',
		'catalogo',
		'lectores',
		'prestamos'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'instance creation' }
Biblioteca class >> nombre: unString datePort: unDatePort [
|unaBiblioteca|
unaBiblioteca := self new.
unaBiblioteca setNombre: unString setDatePort: unDatePort.
^ unaBiblioteca 
]

{ #category : 'initialization' }
Biblioteca >> initialize [ 
super initialize.
catalogo := OrderedCollection new.
lectores := OrderedCollection new.
prestamos := OrderedCollection new.
]

{ #category : 'initialization' }
Biblioteca >> setNombre: unNombre setDatePort: unDatePort [
nombre := unNombre .
datePort := unDatePort .
]
