//: [Previous](@previous)
/*:
 # Array
 
 Los *_array_* es una colección ordenada de elementos del mismo tipo.
 
 ### Creacion y uso de arrays
 */

let numeros = [1, 2, 3, 4, 5]
var nombres = ["Alice", "Bob", "Charlie"]


struct Movies { }
let movies = Array<Movies>()
let movies2 : [Movies] = []
let movies3 = [Movies]()

//: * Acceso a elementos

let primerNombre = nombres[0]
let primerNombre2 = nombres.first!
let ultimoNombre  = nombres.last!
let segundoNombre = nombres[1]

let isEmpty = nombres.isEmpty
let ranNombre = nombres.randomElement()!
let contieneBob = nombres.contains("Bob")

for nombre in nombres {
    print(nombre)
}

nombres.forEach {
    print($0)
}

//: * Modificacion de elementos
nombres.append("Carlos")
nombres.insert("Carlos", at: 1)
nombres.popLast()
nombres.remove(at: 1)
nombres.removeAll()
nombres.removeAll { nombre in
    nombre == "Bob"
}
nombres.sort()
nombres.reverse()

//: [Next](@next)
