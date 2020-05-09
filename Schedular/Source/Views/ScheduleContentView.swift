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
    private var eventsVM = EventsViewModel()

    private let eventStore = EKEventStore()

    var body: some View {
        Form {
            Section(header: KText("Remdinders").gHeadline()) {
                ForEach(eventsVM.remindersItems, id: \.self) { reminder in
                    HStack {
                        KRadioCheckBox(checked: false, color: .accentColor, size: 32)
                        KText(self.eventsVM.remindersTitle(of: reminder))
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
        checkRemindersStatus()
    }

    private func remindersPermissionGranted() {
        /// - ToDo: Learn to predicate
        let predicate = eventStore.predicateForReminders(in: nil)
        eventStore.fetchReminders(matching: predicate) { reminders in
            print("Fetching reminders")
            guard let reminders = reminders else { return }
            let filteredReminders = reminders.filter {
                $0.completionDate == nil && (($0.dueDateComponents?.calendar?.isDateInToday(Date())) != nil)
            }
            DispatchQueue.main.async {
                self.eventsVM.setReminders(with: filteredReminders)
            }
        }
    }

    private func checkRemindersStatus() {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        switch status {
        case .authorized:
            remindersPermissionGranted()
            print("authorized")
        case .denied:
            print("denied")
        case .notDetermined:
            requestRemindersPermision()
        case .restricted:
            print("restricted")
        @unknown default:
            print("unknown")
        }
    }

    private func requestRemindersPermision() {
        eventStore.requestAccess(to: .reminder) { (granted, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if granted {
                    print("granted")
                    self.remindersPermissionGranted()
                } else {
                    print("denied")
                }
            }
        }
    }
}

class EventsViewModel: ObservableObject {
    @Published var remindersItems = [EKReminder]()
    @Published var recentlyCompletedRemindersItems = [String]()

    func remindersTitle(of reminder: EKReminder) -> String {
        "\(reminder.calendar.title): \(reminder.title ?? "")"
    }

    func setReminders(with reminders: [EKReminder]) {
        remindersItems = reminders
    }

    func completeRemindersItem(at index: Int) {
        let remindersId = remindersItems[index].calendarItemIdentifier
        if recentlyCompletedRemindersItems.contains(remindersId) {
            if let indexOfReminderId = recentlyCompletedRemindersItems.firstIndex(of: remindersId) {
                recentlyCompletedRemindersItems.remove(at: indexOfReminderId)
            }
        } else {
            recentlyCompletedRemindersItems.append(remindersItems[index].calendarItemIdentifier)
        }
    }

    func reminderIsCompleted(at index: Int) -> Bool {
        let reminderId = remindersItems[index].calendarItemIdentifier
        if recentlyCompletedRemindersItems.contains(reminderId) {
            return true
        } else {
            return false
        }
    }
}
