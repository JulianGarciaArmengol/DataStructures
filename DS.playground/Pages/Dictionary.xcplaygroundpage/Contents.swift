/*: [Previous](@previous)
 # Dictionary
 
 Un diccionario es una colección no ordenada de pares _clave-valor_. Las claves en un diccionario deben de ser únicas, y cada clave está asociada con exactamente un valor.
 
 ### Creacion y uso de arrays
 */

let paises = ["MX": "Mexico", "US":"Estados Unidos", "CA": "Canadá"]

var edades = ["Alice": 30, "Bob": 25, "Charlie": 35]

//: * Acceso a elementos
let edaadDeAlice = edades["Alice"]

//: * Modificacion de elementos
edades["Bob"] = 26
edades["David"] = 28
edades["Carlos", default: 0] += 25
edades.removeValue(forKey: "Alice")

//: [Next](@next)
