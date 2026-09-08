"
Clase Abstracta que modela las funciones comunes a los distintos tipos de materiales que puede tener la biblioteca
"
Class {
	#name : 'MaterialCatalogado',
	#superclass : 'Object',
	#instVars : [
		'titulo',
		'autor',
		'editorial',
		'anioDeEdicion',
		'paginas'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
MaterialCatalogado >> plazoEnDias [
^ SubclassResponsibility 
]
