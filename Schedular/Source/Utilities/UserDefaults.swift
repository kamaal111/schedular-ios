//
//  UserDefaults.swift
//  Schedular
//
//  Created by Kamaal Farah on 09/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import Foundation

struct LocalStorageHelper {

    static func save(this data: Any?, from key: LocalStorageKeys, with storage: UserDefaults = UserDefaults.standard) {
        storage.set(data, forKey: key.rawValue)
    }

    static func getBool(from key: LocalStorageKeys, with storage: UserDefaults = UserDefaults.standard) -> Bool {
        storage.bool(forKey: key.rawValue)
    }

    static func getInt(from key: LocalStorageKeys, with storage: UserDefaults = UserDefaults.standard) -> Int {
        storage.integer(forKey: key.rawValue)
    }

    static func getString(from key: LocalStorageKeys, with storage: UserDefaults = UserDefaults.standard) -> String? {
        storage.string(forKey: key.rawValue)
    }

    static func getArray<T>(
        ofType type: T.Type,
        from key: LocalStorageKeys,
        with storage: UserDefaults = UserDefaults.standard) -> [T]? {
        storage.array(forKey: key.rawValue) as? [T]
    }

    static func getObject<T>(
        ofType type: T.Type,
        from key: LocalStorageKeys,
        with storage: UserDefaults = UserDefaults.standard) -> T? {
        storage.object(forKey: key.rawValue) as? T
    }

}

/// This is a enum of the possible local storage keys
enum LocalStorageKeys: String {
    case cacheReminders
    case cacheCalendarEvents
}
