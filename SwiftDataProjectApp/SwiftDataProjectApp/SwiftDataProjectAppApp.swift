//
//  SwiftDataProjectAppApp.swift
//  SwiftDataProjectApp
//
//  Created by Quellon Naicker on 11/1/24.
//

import SwiftUI

@main
struct SwiftDataProjectAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
