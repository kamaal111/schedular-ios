//
//  Reminder.swift
//  Schedular
//
//  Created by Kamaal Farah on 09/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

struct Reminder: Remindable, Identifiable, Encodable, Decodable, Hashable {
    var id: String
    var title: String
    var listTitle: String
}
