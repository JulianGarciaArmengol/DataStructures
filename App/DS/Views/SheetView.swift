//
//  SwiftUIView.swift
//  DS
//
//  Created by julian.garcia on 17/07/24.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    
    var onAdd: (String) -> Void
    
    var body: some View {
        Form {
            Section {
                TextField("Name Here", text: $name)
                Button("Add") {
                    onAdd(name)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
            } header: {
                Text("Datos")
            }
            
            Section {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
                .frame(maxWidth: .infinity)
            }
            
        }
    }
}

#Preview {
    SheetView { _ in }
}
