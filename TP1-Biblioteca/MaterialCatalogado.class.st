"
Clase Abstracta que modela las funciones comunes a los distintos tipos de materiales que puede tener la biblioteca
"
Class {
	#name : 'MaterialCatalogado',
	#superclass : 'Object',
	#instVars : [
		'titulo',
		'autores',
		'editorial',
		'anioDeEdicion',
		'paginas'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
MaterialCatalogado >> anioDeEdicion [

	^ anioDeEdicion
]

{ #category : 'accessing' }
MaterialCatalogado >> anioDeEdicion: unAnio [

	anioDeEdicion := unAnio
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> autorPrincipal [
autores isEmpty ifTrue:[^nil].
^autores first.
]

{ #category : 'accessing' }
MaterialCatalogado >> autores [

	^ autores
]

{ #category : 'accessing' }
MaterialCatalogado >> autores: unosAutores [

	autores := unosAutores 
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> codigo [
^self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> descripcion [
^titulo,'(', self tipo,')'.
]

{ #category : 'accessing' }
MaterialCatalogado >> editorial [

	^ editorial
]

{ #category : 'accessing' }
MaterialCatalogado >> editorial: unaEditorial [

	editorial := unaEditorial
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> esDeAutor: nombre [
^autores includes:nombre.


]

{ #category : 'accessing' }
MaterialCatalogado >> paginas [

	^ paginas
]

{ #category : 'accessing' }
MaterialCatalogado >> paginas: unaPagina [

	paginas := unaPagina
]

{ #category : 'accessing' }
MaterialCatalogado >> plazoEnDias [
^ SubclassResponsibility 
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> tipo [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> tipoDeIdentificador [
^ self subclassResponsibility 
]

{ #category : 'accessing' }
MaterialCatalogado >> titulo [

	^ titulo
]

{ #category : 'accessing' }
MaterialCatalogado >> titulo: unTitulo [

	titulo := unTitulo
]
