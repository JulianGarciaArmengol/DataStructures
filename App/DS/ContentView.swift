//
//  ContentView.swift
//  DS
//
//  Created by julian.garcia on 17/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ArrayView()
                .tabItem {
                    Label("Array", systemImage: "list.number")
                }
            
            SetView()
                .tabItem {
                    Label("Set", systemImage: "list.bullet")
                }
            
            DicView()
                .tabItem {
                    Label("Diccionary", systemImage: "text.book.closed.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
