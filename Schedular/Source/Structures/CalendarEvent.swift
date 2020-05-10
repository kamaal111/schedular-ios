//
//  CalendarEvent.swift
//  Schedular
//
//  Created by Kamaal Farah on 10/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

struct CalendarEvent: CalendarEventable, Identifiable, Hashable {
    var id: String
    var title: String
    var endDate: Date?
    var startDate: Date?
    var isAllDay: Bool
}
