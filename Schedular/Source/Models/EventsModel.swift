//
//  EventsModel.swift
//  Schedular
//
//  Created by Kamaal Farah on 29/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import EventKit

class EventsModel {
    private var reminders = Reminders(items: [], recentlyCompletedItems: [])

    func reminderTitle(at index: Int) -> String {
        let remindersItem = reminders.items[index]
        return "\(remindersItem.calendar.title): \(remindersItem.title ?? "")"
    }

    var remindersCount: Int {
        reminders.items.count
    }

    func setReminders(with reminders: [EKReminder]) {
        self.reminders.items = reminders
    }

    func completeRemindersItem(at index: Int) {
        let reminderId = reminders.items[index].calendarItemIdentifier
        if reminders.recentlyCompletedItems.contains(reminderId) {
//            print(reminders.recentlyCompletedItems.firstIndex(of: reminderId))
            if let indexOfReminderId = reminders.recentlyCompletedItems.firstIndex(of: reminderId) {
                reminders.recentlyCompletedItems.remove(at: indexOfReminderId)
            }
        } else {
            reminders.recentlyCompletedItems.append(reminders.items[index].calendarItemIdentifier)
        }
//        print(reminders.recentlyCompletedItems)
    }

    func reminderIsCompleted(at index: Int) -> Bool {
        let reminderId = reminders.items[index].calendarItemIdentifier
        if reminders.recentlyCompletedItems.contains(reminderId) {
            return true
        } else {
            return false
        }
    }
}

struct Reminders {
    var items: [EKReminder]
    var recentlyCompletedItems: [String]
}
