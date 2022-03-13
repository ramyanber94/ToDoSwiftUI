//
//  MainView.swift
//  Calendar
//
//  Created by ramy on 2022-03-13.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("AccentColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    @State var isOne = false
    
    var body: some View {
        TabView(){
            ToDoView().tabItem {
                Label("ToDo", systemImage: "checkmark.circle.fill")
            }.tag(1)
            CalendarView().tabItem {
                Label("Calendar", systemImage: "calendar")
            }.tag(2)
        }.accentColor(.red)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
