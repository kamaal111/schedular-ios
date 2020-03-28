//
//  Localizer.swift
//  Schedular
//
//  Created by Kamaal Farah on 24/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

public struct Localizer {
    public static func getLocalizableString(of key: LocalizableKeys) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }
}


public enum LocalizableKeys: String {
    case SCHEDULE
    case TODAY
    case REMINDERS
}
