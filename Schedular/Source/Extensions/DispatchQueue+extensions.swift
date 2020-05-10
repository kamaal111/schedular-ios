//
//  DispatchQueue+extensions.swift
//  Schedular
//
//  Created by Kamaal Farah on 10/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

enum DispatchQueues: String {
    case calendarEvents
    case reminders
}

extension DispatchQueue {
    static let calendarEvents = DispatchQueue(label: DispatchQueues.calendarEvents.rawValue, qos: .utility)
    static let reminders = DispatchQueue(label: DispatchQueues.reminders.rawValue, qos: .utility)
}
