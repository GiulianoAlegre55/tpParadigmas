# TP1 – Programación Orientada a Objetos: Sistema de Biblioteca

**Materia:** Paradigmas de Programación — UTN Santa Fe
**Cuatrimestre:** 2do Cuatrimestre 2026
**Lenguaje:** Pharo Smalltalk

## Introducción

Este trabajo práctico consiste en modelar e implementar un sistema de préstamos
de una biblioteca. El sistema permite gestionar un **catálogo** de materiales
(libros y revistas), un **padrón de lectores**, y el ciclo completo de
**préstamos y devoluciones**, incluyendo el control de morosidad de los socios.

El diseño sigue el patrón de **puerto y adaptador** para el manejo del tiempo:
todas las operaciones se sellan con una fecha y hora que se obtiene de un
`DatePort`, lo que permite testear el sistema con un reloj simulado
(`FakeDateAdapter`) sin depender del reloj real de la máquina.

La clase `Biblioteca` funciona como **fachada**: es el único punto de entrada
al sistema, y coordina el catálogo, el padrón de lectores y el registro de
préstamos.

### Estructura del repositorio

```
├── diagrama.pdf              # Diagrama de clases conceptual
├── TP1-Biblioteca.st         # Fuentes del modelo (fileOut)
├── TP1-Biblioteca-Tests.st   # Paquete de tests SUnit (si corresponde)
├── casos-de-prueba.txt       # Casos de prueba en Playground (si corresponde)
├── utilizacion-IA.md         # Registro de uso de herramientas de IA
└── README.md                 # Este archivo
```

### Integrantes

- [ ] Nombre y apellido 1
- [ ] Nombre y apellido 2
- [ ] Nombre y apellido 3
- [ ] Nombre y apellido 4

---

## Checklist de desarrollo

> Marcar cada clase cuando esté implementada, y cada método cuando esté
> codeado **y** probado.

### `Biblioteca`

- ✅ Clase creada en el paquete `TP1-Biblioteca`

**Creación**
- ✅ `nombre: unString datePort: unDatePort` (método de clase)

**Padrón de lectores**
- [ ] `agregarLector: unLector`
- [ ] `lectorNumero: unNumero`
- [ ] `lectores`

**Catálogo**
- [ ] `catalogar: unMaterial`
- [ ] `materialCodigo: unCodigo`
- [ ] `catalogo`
- [ ] `materialesDe: unAutor`

**Préstamo y devolución**
- [ ] `prestar: unCodigo a: unNumero`
- [ ] `devolver: unCodigo`

**Disponibilidad**
- [ ] `estaPrestado: unCodigo`

**Registro de préstamos**
- [ ] `prestamoVigenteDe: unCodigo`
- [ ] `cantidadDePrestamosDe: unNumero`
- [ ] `prestamos`
- [ ] `prestamosDelMaterial: unCodigo`
- [ ] `prestamosVigentes`
- [ ] `prestamosDe: unNumero`
- [ ] `prestamosVigentesDe: unNumero`
- [ ] `prestamosVencidos`

**Morosidad**
- [ ] `esMoroso: unNumero`
- [ ] `lectoresMorosos`
- [ ] `rehabilitar: unNumero`

**Mostrador**
- [ ] `identificarSocio: unNumero`
- [ ] `identificarCuit: unCuit`
- [ ] `buscarLectoresPorApellido: unTexto`

---

### `MaterialCatalogado` (abstracta)

- ✅ Clase creada

**Datos bibliográficos**
- ✅ `titulo`
- ✅ `autores`
- ✅ `autorPrincipal`
- ✅ `esDeAutor: unNombre`
- ✅ `editorial`
- ✅ `anioDeEdicion`
- ✅ `paginas`
- ✅ `descripcion`

**Abstractos (subclassResponsibility)**
- ✅ `codigo`
- ✅ `plazoEnDias`
- ✅ `tipo`
- ✅ `tipoDeIdentificador`

---

### `Libro`

- ✅ Clase creada, hereda de `MaterialCatalogado`
- ✅ `isbn: unIsbn titulo: unTitulo autores: unaColeccionDeAutores editorial: unaEditorial anio: unAnio paginas: numPaginas` (método de clase)
- ✅ `isbn`
- ✅ `codigo` (redefinido)
- ✅ `plazoEnDias` (redefinido → 15)
- ✅ `tipo` (redefinido → `'libro'`)
- ✅ `tipoDeIdentificador` (redefinido → `'ISBN'`)

---

### `Revista`

- ✅ Clase creada, hereda de `MaterialCatalogado`
- ✅ `issn: unIssn titulo: unTitulo autores: unaColeccionDeAutores editorial: unaEditorial anio: unAnio paginas: numPags numero: unNumero mes: unMes` (método de clase)
- ✅ `issn`
- ✅ `numero`
- ✅ `mesDeEdicion`
- ✅ `codigo` (redefinido)
- ✅ `plazoEnDias` (redefinido → 7)
- ✅ `tipo` (redefinido → `'revista'`)
- ✅ `tipoDeIdentificador` (redefinido → `'ISSN'`)

---

### `Persona` (abstracta)

- ✅ Clase creada
- ✅ `nombre`
- ✅ `apellido`
- ✅ `cuit`

---

### `Lector`

- ✅ Clase creada, hereda de `Persona`
- ✅ `numero: unNumero cuit: unCuit nombre: unNombre apellido: unApellido` (método de clase)
- ✅ `numero`
- ✅ `cuit`
- ✅ `nombre`
- ✅ `apellido`
- ✅ `nombreCompleto`
- ✅ `apellidoContiene: unTexto`
- ✅ `esMoroso`
- ✅ `puedeLlevar`
- ✅ `motivoDeRechazo`
- ✅ `marcarMoroso`
- ✅ `rehabilitar`

---

### `Prestamo`

- ✅ Clase creada
- ✅ `material: unMaterial lector: unLector instante: unInstante` (método de clase)
- ✅ `material`
- ✅ `lector`
- ✅ `inicio`
- ✅ `vencimiento`
- ✅ `devolucion`
- ✅ `plazoEnDias`
- ✅ `registrarDevolucion: unInstante`
- ✅ `estaVigente`
- ✅ `estaCerrado`
- ✅ `dias`
- ✅ `diasTranscurridosHasta: unInstante`
- ✅ `estaVencidoA: unInstante`
- ✅ `excedioPlazo`
- ✅ `descripcion`

---

### `DatePort` (abstracta)

- ✅ Clase creada
- ✅ `now` (abstracto)

---

### `SystemDateAdapter`

- ✅ Clase creada, hereda de `DatePort`
- ✅ `now`

---

### `FakeDateAdapter`

- ✅ Clase creada, hereda de `DatePort`
- ✅ `en: unDateAndTime` (método de clase)
- ✅ `enDia: unDia mes: unMes anio: unAnio` (método de clase)
- ✅ `now`
- ✅ `forzarFecha: unDateAndTime`
- ✅ `forzarDia: unDia mes: unMes anio: unAnio`
- ✅ `forzarDia: unDia mes: unMes anio: unAnio hora: unaHora minuto: unMin`
- ✅ `avanzarDias: unaCantidad`
- ✅ `avanzarHoras: unaCantidadHoras`

---

### `FichaDeLector` (DTO)

- [ ] Clase creada
- [ ] `deLector: unLector conPrestamosVigentes: unaColeccionDePrestamos` (método de clase)
- [ ] `numero`
- [ ] `cuit`
- [ ] `nombreCompleto`
- [ ] `esMoroso`
- [ ] `puedeLlevar`
- [ ] `motivoDeRechazo`
- [ ] `codigosEnPoder`
- [ ] `cantidadEnPoder`

---

## Checklist de entrega final

- [ ] Diagrama de clases exportado como `diagrama.pdf`
- [ ] Paquete `TP1-Biblioteca` con `#fileOut` a `TP1-Biblioteca.st`
- [ ] Casos de prueba (Playground o `TP1-Biblioteca-Tests`)
- [ ] Al menos 2 casos de uso propios, uno de mayor complejidad
- [ ] `utilizacion-IA.md` con herramientas usadas y conclusiones
- [ ] Archivo comprimido nombrado según el formato pedido (`TP1-Apellido1-Apellido2-...zip`)
