//
//  ScheduleViewController.swift
//  Schedular
//
//  Created by Kamaal Farah on 22/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    private let screenScreenSize = UIScreen.main.bounds

    // MARK: - Components
    lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .PrimaryTextColor
        return label
    }()

    lazy var navigationBar: UINavigationBar = {
        ScheduleNavigationBar(navigationBarTitle: "Schedule")
    }()

    // MARK: - Setting up view controller
    init(barTagNumber: Int) {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "archivebox"), tag: barTagNumber)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    // MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .BackgroundColor
        view.addSubview(navigationBar)
        view.addSubview(todayLabel)
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            navigationBar.widthAnchor.constraint(equalToConstant: screenScreenSize.width),
            navigationBar.heightAnchor.constraint(equalToConstant: 96)
        ])
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            todayLabel.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
            todayLabel.widthAnchor.constraint(equalToConstant: 104),
            todayLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
