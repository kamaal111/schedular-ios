//
//  ScheduleViewController.swift
//  Schedular
//
//  Created by Kamaal Farah on 22/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    // MARK: - Components
    lazy var currentTimeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localizer.getLocalizableString(of: .TODAY)
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .PrimaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var navigationBar: UINavigationBar = {
        ScheduleNavigationBar(navigationBarTitle: .SCHEDULE)
    }()

    lazy var remindersCard: UIView = {
       RemindersCard()
    }()

    // MARK: - Setting up view controller
    init(barTagNumber: Int) {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(
            title: Localizer.getLocalizableString(of: .SCHEDULE),
            image: UIImage(systemName: "archivebox"),
            tag: barTagNumber)
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
        view.addSubview(currentTimeLabel)
        view.addSubview(remindersCard)
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 96),
            navigationBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            currentTimeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            currentTimeLabel.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
            currentTimeLabel.widthAnchor.constraint(equalToConstant: 104),
            currentTimeLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            remindersCard.topAnchor.constraint(equalTo: currentTimeLabel.bottomAnchor, constant: 16),
            remindersCard.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            remindersCard.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

}
