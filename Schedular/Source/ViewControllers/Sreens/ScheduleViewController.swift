//
//  ScheduleViewController.swift
//  Schedular
//
//  Created by Kamaal Farah on 22/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final class ScheduleViewController: UITableViewController {

    private var eventsModel = EventsModel()

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(remindersDidUpdate(_:)),
            name: .didUpdateReminders,
            object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .didUpdateReminders, object: nil)
    }

    @objc func remindersDidUpdate(_ notification: Notification) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Setting Views
    private func setupViews() {
        title = Localizer.getLocalizableString(of: .SCHEDULE)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: remindersCellId)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
    }

}

extension ScheduleViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventsModel.reminders.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: remindersCellId, for: indexPath)
        let circle = CircleView(lineWidth: 4, lineColor: .AccentColor, spacingAwayFromView: 4)
        cell.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.text = eventsModel.reminders[indexPath.row]
        cell.textLabel?.font = .customFont(name: .sfProTextRegular, size: 17)
        NSLayoutConstraint.activate([
            circle.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 16),
            circle.heightAnchor.constraint(equalToConstant: 40),
            circle.widthAnchor.constraint(equalToConstant: 40),
            circle.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
        ])
        cell.textLabel?.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 8).isActive = true
        cell.textLabel?.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        return cell
    }
}
