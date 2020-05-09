//
//  EventsViewModel.swift
//  Schedular
//
//  Created by Kamaal Farah on 29/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import EventKit

class EventsViewModel: ObservableObject {
    @Published var remindersItems = [Reminder]()
    @Published var recentlyCompletedRemindersItems = [String]()

    private let eventStore = EKEventStore()
    private let kowalskiAnalysis: Bool

    init(kowalskiAnalysis: Bool = false) {
        self.kowalskiAnalysis = kowalskiAnalysis
    }

    func remindersTitle(of reminder: Remindable) -> String {
        "\(reminder.listTitle): \(reminder.title)"
    }

    func completeRemindersItem(of reminder: Remindable) {
        let remindersId = reminder.id
        if recentlyCompletedRemindersItems.contains(remindersId) {
            if let indexOfReminderId = recentlyCompletedRemindersItems.firstIndex(of: remindersId) {
                recentlyCompletedRemindersItems.remove(at: indexOfReminderId)
            }
        } else {
            recentlyCompletedRemindersItems.append(remindersId)
        }
    }

    func reminderIsCompleted(_ reminder: Remindable) -> Bool {
        if recentlyCompletedRemindersItems.contains(reminder.id) {
            return true
        } else {
            return false
        }
    }

    func checkRemindersStatusAndFetch() {
        if let cachedReminders = LocalStorageHelper.getObject(ofType: Data.self, from: .cacheReminders),
            let decodedCachedReminder = try? PropertyListDecoder().decode([Reminder].self, from: cachedReminders) {
            remindersItems = decodedCachedReminder
        }
        let status = EKEventStore.authorizationStatus(for: .reminder)
        switch status {
        case .authorized:
            remindersPermissionGranted()
            debugPrint("authorized")
        case .denied:
            debugPrint("denied")
        case .notDetermined:
            requestRemindersPermision()
        case .restricted:
            debugPrint("restricted")
        @unknown default:
            debugPrint("unknown")
        }
    }

    private func remindersPermissionGranted() {
        /// - ToDo: Learn to predicate
        let predicate = eventStore.predicateForReminders(in: nil)
        eventStore.fetchReminders(matching: predicate) { reminders in
            self.debugPrint("Fetching reminders")
            guard let reminders = reminders else { return }
            let filteredReminders = reminders.filter {
                $0.completionDate == nil && (($0.dueDateComponents?.calendar?.isDateInToday(Date())) != nil)
            }.map {
                Reminder(id: $0.calendarItemIdentifier, title: $0.title, listTitle: $0.calendar.title)
            }
            DispatchQueue.main.async {
                self.remindersItems = filteredReminders
            }
            do {
                let encodedReminders = try PropertyListEncoder().encode(filteredReminders)
                LocalStorageHelper.save(this: encodedReminders, from: .cacheReminders)
            } catch {
                self.debugPrint(error)
            }
        }
    }

    private func requestRemindersPermision() {
        eventStore.requestAccess(to: .reminder) { (granted, error) in
            if let error = error {
                self.debugPrint(error.localizedDescription)
            } else {
                if granted {
                    self.debugPrint("granted")
                    self.remindersPermissionGranted()
                } else {
                    self.debugPrint("denied")
                }
            }
        }
    }

    private func debugPrint(_ message: Any) {
        if kowalskiAnalysis {
            print("\(message)")
        }
    }
}
