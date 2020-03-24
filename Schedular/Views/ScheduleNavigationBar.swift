//
//  ScheduleNavigationBar.swift
//  Schedular
//
//  Created by Kamaal Farah on 24/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class ScheduleNavigationBar: UINavigationBar {

    init(navigationBarTitle: String) {
        super.init(frame: CGRect())
        let navigationItem = UINavigationItem(title: navigationBarTitle)
//        let leftButton = UIBarButtonItem(
//            image: UIImage(systemName: "plus"),
//            style: .plain,
//            target: self,
//            action: #selector(addTapped))
//        leftButton.imageInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
//        navigationItem.leftBarButtonItem = leftButton
        prefersLargeTitles = true
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.PrimaryTextColor]
        items = [navigationItem]
    }
    
    @objc
    func addTapped() {
        print("add")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
