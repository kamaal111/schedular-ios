//
//  EventsViewModel.swift
//  Schedular
//
//  Created by Kamaal Farah on 29/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import EventKit

class EventsViewModel: ObservableObject {
    @Published var remindersItems = [EKReminder]()
    @Published var recentlyCompletedRemindersItems = [String]()

    private let eventStore = EKEventStore()
    private let kowalskiAnalysis: Bool

    init(kowalskiAnalysis: Bool = false) {
        self.kowalskiAnalysis = kowalskiAnalysis
    }

    func remindersTitle(of reminder: EKReminder) -> String {
        "\(reminder.calendar.title): \(reminder.title ?? "")"
    }

    func setReminders(with reminders: [EKReminder]) {
        remindersItems = reminders
    }

    func completeRemindersItem(of reminder: EKReminder) {
        let remindersId = reminder.calendarItemIdentifier
        if recentlyCompletedRemindersItems.contains(remindersId) {
            if let indexOfReminderId = recentlyCompletedRemindersItems.firstIndex(of: remindersId) {
                recentlyCompletedRemindersItems.remove(at: indexOfReminderId)
            }
        } else {
            recentlyCompletedRemindersItems.append(remindersId)
        }
    }

    func reminderIsCompleted(_ reminder: EKReminder) -> Bool {
        if recentlyCompletedRemindersItems.contains(reminder.calendarItemIdentifier) {
            return true
        } else {
            return false
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
            }
            DispatchQueue.main.async {
                self.setReminders(with: filteredReminders)
            }
        }
    }

    func checkRemindersStatusAndFetch() {
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

    private func debugPrint(_ message: String) {
        if kowalskiAnalysis {
            print(message)
        }
    }
}
