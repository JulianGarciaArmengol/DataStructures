//
//  ContentView.swift
//  DS
//
//  Created by julian.garcia on 17/07/24.
//

import SwiftUI

struct ArrayView: View {
    @State private var coworkers: [Coworker] = Coworker.defaultValues
    
    @State private var showingAdd = false

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(coworkers) { coworker in
                    Text(coworker.name)
                        
                }.onDelete(perform: { indexSet in
                    coworkers.deleteBy(indexSet: indexSet)
                })
            }
            .navigationTitle("Names")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: add, label: {
                        Text("Add Carlos")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        showingAdd = true
                    }
                }
            }
            .sheet(isPresented: $showingAdd, content: {
                SheetView(onAdd: {name in
                    self.coworkers.append(.init(name: name))
                })
                    .presentationDetents([.medium])
            })
        }
    }
    
    func add() {
        withAnimation {
            coworkers.append(Coworker(name: "Carlos"))
        }
    }
    
}

#Preview {
    ArrayView()
}

