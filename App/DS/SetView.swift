//
//  SetView.swift
//  DS
//
//  Created by julian.garcia on 17/07/24.
//

import SwiftUI

struct Event: Identifiable, Equatable {
    var id: UUID = UUID()
    let name: String
    var participants: Set<String> = []
}


struct SetView: View {
    @State private var events: [Event] = []
    @State private var filteredParticipants: [String] = []
    
    @StateObject private var filters = Filters()
    
    var body: some View {
        NavigationStack {
            List {
                Section("All events") {
                    ForEach(events) { event in
                        NavigationLink {
                            List {
                                Section("Participantes") {
                                    ForEach(Array(event.participants), id: \.self) { participant in
                                        Text(participant)
                                    }
                                }
                            }
                            .navigationTitle(event.name)
                        } label: {
                            EventRowView(title: event.name, toggle: $filters.array[events.firstIndex(where: { $0 == event})!])
                        }
                    }
                }
                Section("Filtered Participants") {
                    ForEach(filteredParticipants, id: \.self) {filteredParticipant in
                        Text(filteredParticipant)
                    }
                }
                
            }
            .navigationTitle("Events Participants")
            .onAppear {
                events = createEvents()
                events.forEach { _ in self.filters.array.append(false) }
                filterParticipants()
            }
            .onChange(of: filters.array) {
                filterParticipants()
            }
        }
        
    }
    
    struct EventRowView: View {
        var title: String
        @Binding var toggle: Bool
        
        var body: some View {
            Toggle(title, isOn: $toggle)
        }
    }
    
    class Filters: ObservableObject {
        @Published var array = [Bool]()
    }
    
    func createEvents() -> [Event] {
        let alice = "Alice"
        let bob = "Bob"
        let carlos = "Carlos"
        let david = "David"
        let eve = "Eve"
        
        let event1 = Event(name: "Swift Workshop", participants: [alice, bob, carlos])
        let event2 = Event(name: "IOS Meetup", participants: [bob, david, eve, carlos])
        let event3 = Event(name: "Tech Conference", participants: [alice, eve, carlos])
        
        let events = [event1, event2, event3]
        
        return events
    }
    
    func filterParticipants() {
        let participants = events.map { $0.participants }
        let filters = filters.array
        
        var aux = Set<String>()
        
        for (index, eventParticipants) in participants.enumerated() {
            
            if filters[index] == true {
                aux = aux.isEmpty ?
                    aux.union(eventParticipants) :
                    aux.intersection(eventParticipants)
            }
        }
        
        
        withAnimation {
            filteredParticipants = Array(aux)
        }
    }
}



#Preview {
    SetView()
}
