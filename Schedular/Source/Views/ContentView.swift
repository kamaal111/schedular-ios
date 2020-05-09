//
//  ContentView.swift
//  Schedular
//
//  Created by Kamaal Farah on 08/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import SwiftUI
import KamaalUI

struct ContentView: View {
    @State private var tabSelection = 0
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView {
                ScheduleContentView()
            }
            .tabItem {
                Image(systemName: "archivebox")
                KText(localizedText: .SCHEDULE)
            }
            .tag(0)
            NavigationView {
                KText("dkjnkn")
            }
            .tabItem {
                Image(systemName: "calendar")
                KText("Calendar")
            }
            .tag(1)
            NavigationView {
                KText("dkjnkn")
            }
            .tabItem {
                Image(systemName: "slider.horizontal.3")
                KText("Settings")
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
