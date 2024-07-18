//: [Previous](@previous)
/*:
 # Set
 
 Un *_Set_* es una colección no ordenada de elementos únicos. Los sets en Swift no permiten duplicados. Son útiles cuando se necesita comprobar rápidamente si un elemento está presente en la colección.
 
 ### Creacion y uso de Sets
 
 */
let numeros: Set = [1, 2, 3, 4, 5]
var nombres: Set = ["Alice", "Bob", "Charlie", "Carlos", "Carlos"]

struct Movies: Hashable { }
let movies = Set<Movies>()
let movies2 : Set<Movies> = []

//: Acceso a elementos
nombres.contains("Bob")

for nombre in nombres {
    print(nombre)
}

nombres.forEach {
    print($0)
}

//: Modificacion de elementos
nombres.insert("Juan")
nombres.remove("Bob")
nombres.removeAll()

/*: 
 
 Operaciones
 
 ![imagen Set](setDiagram.png width="453" height="372")
*/


//: [Next](@next)
