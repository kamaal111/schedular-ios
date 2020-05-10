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
    @Published var calendarEventsItems = [CalendarEvent]()

    private let eventStore = EKEventStore()
    private let kowalskiAnalysis: Bool

    init(kowalskiAnalysis: Bool = false) {
        if let cachedCalendarEvents = LocalStorageHelper.getObject(ofType: Data.self, from: .cacheCalendarEvents),
            let decodedCachedCalendarEvents = try? PropertyListDecoder().decode(
                [CalendarEvent].self,
                from: cachedCalendarEvents) {
            calendarEventsItems = decodedCachedCalendarEvents
        }
        if let cachedReminders = LocalStorageHelper.getObject(ofType: Data.self, from: .cacheReminders),
            let decodedCachedReminder = try? PropertyListDecoder().decode(
                [Reminder].self,
                from: cachedReminders) {
            remindersItems = decodedCachedReminder
        }
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

    func checkEventsStatusAndFetch() {
        checkCalendarEventsStatusAndFetch()
        checkRemindersStatusAndFetch()
    }

    private func checkRemindersStatusAndFetch() {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        switch status {
        case .authorized:
            remindersPermissionGranted()
        case .denied:
            debugPrint("denied")
        case .notDetermined:
            requestPermision(ofType: .reminder)
        case .restricted:
            debugPrint("restricted")
        @unknown default:
            debugPrint("unknown")
        }
    }

    private func checkCalendarEventsStatusAndFetch() {
        let status = EKEventStore.authorizationStatus(for: .event)
        switch status {
        case .authorized:
            calendarEventsPermissionGranted()
        case .denied:
            debugPrint("denied")
        case .notDetermined:
            requestPermision(ofType: .event)
        case .restricted:
            debugPrint("restricted")
        @unknown default:
            debugPrint("unknown")
        }
    }

    private func remindersPermissionGranted() {
        DispatchQueue.reminders.async {
            self.debugPrint("Fetching reminders")
            /// - ToDo: Learn to predicate
            let predicate = self.eventStore.predicateForReminders(in: nil)
            self.eventStore.fetchReminders(matching: predicate) { [unowned self] reminders in
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
    }

    private func calendarEventsPermissionGranted() {
        DispatchQueue.calendarEvents.async {
            self.debugPrint("Fetching calendar events")
            let calendar = Calendar.current
            var oneDayAgoComponents = DateComponents()
            oneDayAgoComponents.day = -1
            let oneDayAgo = calendar.date(byAdding: oneDayAgoComponents, to: Date(), wrappingComponents: false)
            var oneYearFromNowComponents = DateComponents()
            oneYearFromNowComponents.year = 1
            let oneYearFromNow = calendar.date(byAdding: oneYearFromNowComponents, to: Date(), wrappingComponents: false)
            var predicate: NSPredicate? = nil
            if let anAgo = oneDayAgo, let aNow = oneYearFromNow {
                predicate = self.eventStore.predicateForEvents(withStart: anAgo, end: aNow, calendars: nil)
            }
            var events: [EKEvent]? = nil
            if let aPredicate = predicate {
                events = self.eventStore.events(matching: aPredicate)
            }
            var eventsToReturn = [CalendarEvent]()
            events?.forEach { event in
                let calendarEvent = CalendarEvent(
                    id: event.eventIdentifier,
                    title: event.title,
                    endDate: event.endDate,
                    startDate: event.startDate,
                    isAllDay: event.isAllDay)
                eventsToReturn.append(calendarEvent)
            }
            DispatchQueue.main.async {
                self.calendarEventsItems = eventsToReturn
            }
        }
    }

    private func requestPermision(ofType ekType: EKEntityType) {
        eventStore.requestAccess(to: ekType) { [unowned self] (granted, error) in
            if let error = error {
                self.debugPrint(error.localizedDescription)
            } else {
                if granted {
                    self.debugPrint("granted")
                    switch ekType {
                    case .event:
                        self.calendarEventsPermissionGranted()
                    case .reminder:
                        self.remindersPermissionGranted()
                    @unknown default:
                        self.debugPrint("unknown type")
                    }
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
