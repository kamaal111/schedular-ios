//
//  TabBarController.swift
//  Schedular
//
//  Created by Kamaal Farah on 23/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scheduleVC = ScheduleViewController(barTagNumber: 0)
        let calendarVC = CalendarViewController(barTagNumber: 1)
        let settingsVC = SettingsViewController(barTagNumber: 2)

        viewControllers = [
            scheduleVC,
            calendarVC,
            settingsVC
        ]
    }

}
