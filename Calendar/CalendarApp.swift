//
//  CalendarApp.swift
//  Calendar
//
//  Created by ramy on 2022-03-06.
//

import SwiftUI

@main
struct CalendarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
