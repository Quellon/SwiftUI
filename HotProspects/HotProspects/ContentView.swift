//
//  ContentView.swift
//  HotProspects
//
//  Created by Quellon Naicker on 11/27/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    
    
    var body: some View {
        TabView{
            ProspectView(filter: .none)
                .tabItem{
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectView(filter: .contacted)
                .tabItem{
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectView(filter:.uncontacted)
                .tabItem{
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem{
                    Label("Me", systemImage: "person.crop.circle")
                }
        }
        
    }
}
    
    #Preview {
        ContentView()
    }

