//
//  Notification+extensions.swift
//  Schedular
//
//  Created by Kamaal Farah on 04/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

enum Notifications {
    static let didUpdateReminders = "didUpdateReminders"
}

extension Notification.Name {
    static let didUpdateReminders = Notification.Name(Notifications.didUpdateReminders)
}
