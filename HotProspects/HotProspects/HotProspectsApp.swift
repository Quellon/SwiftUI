//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Quellon Naicker on 11/27/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
