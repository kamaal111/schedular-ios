//
//  ScheduleViewController.swift
//  Schedular
//
//  Created by Kamaal Farah on 22/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final class ScheduleViewController: UITableViewController {

    private let remindersCellId = "Reminders"

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

    // MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .BackgroundColor
        title = Localizer.getLocalizableString(of: .SCHEDULE)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: remindersCellId)
        let navigationBarTitleColor: [NSAttributedString.Key: UIColor] = [.foregroundColor: .PrimaryTextColor]
        navigationController?.navigationBar.titleTextAttributes = navigationBarTitleColor
        navigationController?.navigationBar.largeTitleTextAttributes = navigationBarTitleColor
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        EventsHelper.reminders.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: remindersCellId, for: indexPath)
        cell.textLabel?.text = EventsHelper.reminders[indexPath.row]
        cell.textLabel?.font = .customFont(name: .sfProTextRegular, size: 17)
        return cell
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
    }

}
