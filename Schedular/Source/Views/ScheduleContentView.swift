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
                                .padding(.horizontal, 4)
                         }
//                    }
                }
            }
            Section(header: KText("Calendar Events").gHeadline()) {
                ForEach(eventsVM.paginatedCalendarEvents) { event in
                    HStack {
                        VStack {
                            KText(self.eventsVM.dateFormatter(date: event.startDate))
                                .gBodyText()
                            KText(self.eventsVM.dateFormatter(date: event.endDate))
                                .gBodyText()
                        }
                        KText(event.title)
                            .gBodyText()
                            .padding(.horizontal, 4)
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
