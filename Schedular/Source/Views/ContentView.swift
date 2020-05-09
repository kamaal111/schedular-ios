//
//  ContentView.swift
//  Schedular
//
//  Created by Kamaal Farah on 08/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 0
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView {
                ScheduleContentView()
            }
            .tabItem {
                Image(systemName: "archivebox")
                Text(Localizer.getLocalizableString(of: .SCHEDULE))
            }
            .tag(0)
            NavigationView {
                Text("dkjnkn")
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }
            .tag(1)
            NavigationView {
                Text("dkjnkn")
            }
            .tabItem {
                Image(systemName: "slider.horizontal.3")
                Text("Settings")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
