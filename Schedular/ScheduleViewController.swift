//
//  ScheduleViewController.swift
//  Schedular
//
//  Created by Kamaal Farah on 22/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    init(barTagNumber: Int) {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "archivebox"), tag: barTagNumber)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BackgroundColor
        let navigationBar = ScheduleNavigationBar(
            frame: CGRect(
                origin: CGPoint(x: 8, y: 20),
                size: CGSize(width: UIScreen.main.bounds.width, height: 96)),
            navigationBarTitle: "Schedule")
        view.addSubview(navigationBar)
    }

}

class ScheduleNavigationBar: UINavigationBar {

    init(frame: CGRect, navigationBarTitle: String) {
        super.init(frame: frame)
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

