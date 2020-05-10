//
//  ScheduleContentView.swift
//  Schedular
//
//  Created by Kamaal Farah on 08/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import SwiftUI
import EventKit
import KamaalUI

struct ScheduleContentView: View {
    @ObservedObject
    private var eventsVM = EventsViewModel(kowalskiAnalysis: true)

    var body: some View {
        Form {
            Section(header: KText("Remdinders").gHeadline()) {
                ForEach(eventsVM.remindersItems) { reminder in
//                    KButton(action: { self.eventsVM.completeRemindersItem(of: reminder) }) {
                        HStack {
//                             KRadioCheckBox(
//                                 checked: self.eventsVM.reminderIsCompleted(reminder),
//                                 color: .accentColor,
//                                 size: 24,
//                                 borderWidth: 4,
//                                 spacing: 8)
                             KText(self.eventsVM.remindersTitle(of: reminder))
                                 .gBodyText()
                                 .padding()
                         }
//                    }
                }
            }
            Section(header: KText("Calendar Events").gHeadline()) {
                ForEach(eventsVM.calendarEventsItems) { event in
                    HStack {
                        KText(event.title)
                             .gBodyText()
                             .padding()
                     }
                }
            }
        }
        .navigationBarTitle(Text(Localizer.getLocalizableString(of: .SCHEDULE)))
        .onAppear(perform: onScheduleContentViewAppear)
    }

    private func onScheduleContentViewAppear() {
        eventsVM.checkEventsStatusAndFetch()
    }
}
