//
//  CalendarEventable.swift
//  Schedular
//
//  Created by Kamaal Farah on 10/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

protocol CalendarEventable {
    var id: String { get }
    var title: String { get set }
    var startDate: Date? { get set }
    var endDate: Date? { get set }
    var isAllDay: Bool { get set }
}
