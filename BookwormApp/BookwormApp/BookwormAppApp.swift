//
//  BookwormAppApp.swift
//  BookwormApp
//
//  Created by Quellon Naicker on 10/30/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
