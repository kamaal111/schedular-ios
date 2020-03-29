//
//  ScheduleViewController.swift
//  Schedular
//
//  Created by Kamaal Farah on 22/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final class ScheduleViewController: UIViewController {

    // MARK: - Setting up view controller
    public init(barTagNumber: Int) {
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

    // MARK: - Components
    private lazy var currentTimeLabel: UILabel = {
        let label = Title1()
        label.text = Localizer.getLocalizableString(of: .TODAY)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var remindersCard: UIView = {
       RemindersCard()
    }()

    // MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .BackgroundColor
        title = Localizer.getLocalizableString(of: .SCHEDULE)
        let navigationBarTitleColor: [NSAttributedString.Key: UIColor] = [.foregroundColor: .PrimaryTextColor]
        navigationController?.navigationBar.titleTextAttributes = navigationBarTitleColor
        navigationController?.navigationBar.largeTitleTextAttributes = navigationBarTitleColor
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(currentTimeLabel)
        view.addSubview(remindersCard)
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            currentTimeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            currentTimeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
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
