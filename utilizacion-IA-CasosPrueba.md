# Documentación: Uso de Inteligencia Artificial para Casos de Prueba

## 1. Introducción
Durante el proceso de desarrollo y pruebas (testing) de software, uno de los desafíos más comunes es contar con conjuntos de datos de prueba (*test datasets*) que sean realistas, homogéneos en su estructura, pero a la vez diversos en su contenido. La carga manual de datos suele derivar en sesgos (repetir nombres o formatos simples) y un consumo excesivo de tiempo.

Para solucionar esto, se utilizó Inteligencia Artificial Generativa como herramienta de soporte para la generación automatizada y sintética de datos de prueba en lotes (*batches*), adaptados a estructuras de colecciones específicas (listas tipadas/Smalltalk literal arrays).

---

## 2. Objetivos del Uso de IA
- **Mayor cobertura y variedad:** Evitar la repetición de datos genéricos (`test1`, `test2`, `foo`, `bar`), incorporando nombres, apellidos, títulos de obras, identificadores reales y organizaciones verosímiles.
- **Formato estricto y parsing inmediato:** Generar estructuras listas para importar o pegar directamente en el código de testing sin necesidad de post-procesamiento manual (por ejemplo, tuplas o arreglos literales `('elem1' 'elem2' ...)`).
- **Consistencia dimensional:** Asegurar que los vectores de prueba mantengan la misma cardinalidad ($N = 50$, $N = 100$, $N = 40$) para correlacionar atributos entre sí de forma posicional.
- **Validación de reglas sintácticas y de negocio:** Manejo de restricciones como exclusión de caracteres conflictivos (ej. comillas simples `'` dentro de cadenas) o encapsulación especial cuando existen colecciones anidadas (ej. `#('autor1' 'autor2')`).

---

## 3. Ejemplos de Peticiones y Casos de Uso del Chat

A continuación se detallan ejemplos tomados directamente de las iteraciones de este proyecto:

### 3.1. Generación de Entidades Básicas (Personas)
Se requirieron datos identitarios con formatos locales y validaciones estructurales:

* **Nombres y Apellidos:** Lotes de 50 elementos para nombres de pila y apellidos hispanos.
  > *Petición:* `dame una lista de 50 nombres, con el siguiente formato: ('nom1' 'nomb2' ... 'nom50')`
* **Formatos específicos de identificación (CUIL):** Datos numéricos estructurados bajo la máscara `XX-XXXXXXXX-X`.
  > *Petición:* `lo mismo pero ahora con cuilts. tienen el formato '27-30111222-5'`

### 3.2. Dominio Bibliográfico: Libros (Escala de 100 elementos)
Se aumentó la escala a 100 registros manteniendo correspondencia entre listas paralelas:
* **Identificadores normalizados:** Generación de códigos ISBN-13 válidos (`978-X-XXX-XXXXX-X`).
* **Títulos y Autores:** Obras de literatura clásica y contemporánea.
* **Control de restricciones de sintaxis:**
  > *Petición:* `no pueden incluir el ' dentro del nombre`  
  *Resultado:* Se ajustaron cadenas con apóstrofes (como *Lippincott's* a *Lippincotts*) para evitar errores de parseo en el lenguaje destino.
* **Métricas asociadas:** Años de publicación y cantidad de páginas de longitud variable.

### 3.3. Estructuras Complejas: Publicaciones Periódicas (Revistas/Journals)
Se requirieron 40 casos de revistas científicas respetando un esquema de atributos múltiples en listas independientes:
* **Esquema:** `issn`, `titulo`, `autores`, `editorial`, `anio`, `paginas`, `numero`, `mes`.
* **Manejo de colecciones anidadas:** Uso de arreglos literales para autores `#('Entidad')` y control de formato de ISSN (`XXXX-XXXX`).

---

## 4. Beneficios Obtenidos
1. **Reducción de Tiempo:** La generación de cientos de datos correlacionados tomó segundos en lugar de horas de búsqueda manual.
2. **Robustez en los Tests:** Las pruebas unitarias y de integración se ejecutan contra datos de longitud variable, tildes, caracteres especiales y números en distintos rangos.
3. **Mantenibilidad:** El proceso de generación es repetible ante nuevos requerimientos de dominio o cambios de formato.