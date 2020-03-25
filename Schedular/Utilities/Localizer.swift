//
//  Localizer.swift
//  Schedular
//
//  Created by Kamaal Farah on 24/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

struct Localizer {

    static func getLocalizableString(of key: LocalizableKeys) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }

}


enum LocalizableKeys: String {
    case SCHEDULE
    case TODAY
    case REMINDERS
}
