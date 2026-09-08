"
Clase que modela el comportamiento de los libros

"
Class {
	#name : 'Libro',
	#superclass : 'MaterialCatalogado',
	#instVars : [
		'isbn'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'initialization' }
Libro class >> isbn: unIsbn titulo: unTitulo autores: unAutor editorial: unaEditorial anio: unAnio paginas: cantPaginas [
|nuevo|
nuevo := self new.
nuevo setIsbn: unIsbn setTitulo: unTitulo setAutores: unAutor setEditorial: unaEditorial setAnio: unAnio setPaginas: cantPaginas.
^ nuevo. 
]

{ #category : 'as yet unclassified' }
Libro >> codigo [ ^isbn.
]

{ #category : 'accessing' }
Libro >> isbn [

	^ isbn
]

{ #category : 'accessing' }
Libro >> isbn: unIsbn [

	isbn := unIsbn.
]

{ #category : 'accessing' }
Libro >> plazoEnDias [
^ 15 asInteger.
]

{ #category : 'initialization' }
Libro >> setIsbn: unIsbn setTitulo: unTitulo setAutores: unAutor setEditorial: unaEditorial setAnio: unAnio setPaginas: cantPaginas [
isbn := unIsbn .
titulo := unTitulo .
autores := unAutor .
editorial := unaEditorial .
anioDeEdicion := unAnio .
paginas := cantPaginas .

]

{ #category : 'as yet unclassified' }
Libro >> tipo [ 
^ 'libro'.
]

{ #category : 'as yet unclassified' }
Libro >> tipoDeIdentificador [ 
^'ISBN'.

]
