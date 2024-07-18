//
//  Coworker.swift
//  DS
//
//  Created by julian.garcia on 17/07/24.
//

import Foundation

struct Coworker: Identifiable {
    let id: UUID = UUID()
    var name: String
    
    static var defaultValues: [Coworker] {
        let names = ["Carlos", "Carlos", "Viri", "Bob"]
        
        return names.map { Coworker(name: $0) }
    }
}

extension [Coworker] {
    mutating func deleteBy(id: UUID) {
        guard let index = self.firstIndex(where: { $0.id == id }) else { return }
        
        self.remove(at: index)
    }
    
    mutating func deleteBy(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        
        self.remove(at: index)
    }
}
