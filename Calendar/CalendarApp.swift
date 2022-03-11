//
//  CalendarApp.swift
//  Calendar
//
//  Created by ramy on 2022-03-06.
//

import SwiftUI

@main
struct CalendarApp: App {
    @StateObject var core = CoreDataService()
    @State private var showLaunchScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack {
                    if showLaunchScreen {
                        LaunchView(showLaunch: $showLaunchScreen)
                            .navigationBarHidden(true)
                            .transition(.move(edge: .leading))
                    } else {
                        LoginView()
                            .navigationBarHidden(true)
                            .environmentObject(core)
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
