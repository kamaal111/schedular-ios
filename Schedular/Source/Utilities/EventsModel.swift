//
//  EventsModel.swift
//  Schedular
//
//  Created by Kamaal Farah on 29/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import EventKit

class EventsModel {
    var reminders = [String]()

    private let eventStore = EKEventStore()

    init() {
        checkRemindersStatus()
    }

    private func remindersPermissionGranted() {
        /// - ToDo: Learn to predicate
        let predicate = eventStore.predicateForReminders(in: nil)
        eventStore.fetchReminders(matching: predicate) { reminders in
            guard let reminders = reminders else { return  }
            let filteredReminders = reminders.filter {
                $0.completionDate == nil && (($0.dueDateComponents?.calendar?.isDateInToday(Date())) != nil)
            }
            filteredReminders.forEach {
                self.reminders.append($0.title as String)
            }
            NotificationCenter.default.post(name: .didUpdateReminders, object: nil, userInfo: nil)
        }
    }


    func checkRemindersStatus() {
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
