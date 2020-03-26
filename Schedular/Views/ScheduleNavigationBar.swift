//
//  ScheduleNavigationBar.swift
//  Schedular
//
//  Created by Kamaal Farah on 24/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final public class ScheduleNavigationBar: UINavigationBar {

    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    convenience init(navigationBarTitle: LocalizableKeys) {
        self.init(frame: .zero)
        let navigationItem = UINavigationItem(title: Localizer.getLocalizableString(of: navigationBarTitle))
        items = [navigationItem]
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Setting Views
    private func setupViews() {
        prefersLargeTitles = true
        titleTextAttributes = [.foregroundColor: UIColor.PrimaryTextColor]
    }

}
