//
//  RemindersCard.swift
//  Schedular
//
//  Created by Kamaal Farah on 24/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit
import EventKit
import Combine

public enum Notifications {
    static let remindersChange = "remindersChange"
}

public extension Notification.Name {
    static let remindersChange = Notification.Name(Notifications.remindersChange)
}

final public class RemindersCardViewController: UIViewController {

    // MARK: - Initializing view
    var sortedReminders = EventsHelper.reminders

    private var sortedRemindersSubscriber: AnyCancellable?
    private let eventStore = EKEventStore()

    public override func viewDidLoad() {
        setupViews()
        setupConstraints()
        setupReminderCardsView()
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            view.layer.shadowColor = UIColor.PrimaryTextColor.cgColor
        }
    }

    // MARK: - Views
    private lazy var remindersTitle: UILabel = {
        let label = Title2()
        label.text = Localizer.getLocalizableString(of: .REMINDERS)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .CardColor
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.PrimaryTextColor.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(remindersTitle)
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        let reminders = sortedReminders
        let remindersCardHeight = 48 + (CGFloat(reminders.count < 1 ? 1 : reminders.count) * 52)
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: remindersCardHeight)
        ])
        NSLayoutConstraint.activate([
            remindersTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            remindersTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
    }

    // MARK: - Helper Functions
    private func setupReminderCardsView() {
        let reminders = sortedReminders
        if !reminders.isEmpty {
            let firstRemindersRow = RemindersRow(remindersText: reminders[0])
            view.addSubview(firstRemindersRow)
            NSLayoutConstraint.activate([
                firstRemindersRow.topAnchor.constraint(equalTo: remindersTitle.topAnchor, constant: 32),
                firstRemindersRow.leftAnchor.constraint(equalTo: view.leftAnchor),
                firstRemindersRow.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
            if reminders.count > 1 {
                for (index, reminder) in reminders[1..<reminders.count].enumerated() {
                    let reminderRow = RemindersRow(remindersText: reminder)
                    view.addSubview(reminderRow)
                    let remindersRowTopAnchorConstraint = 8 + (CGFloat(index) * 48)
                    NSLayoutConstraint.activate([
                        reminderRow.topAnchor.constraint(
                            equalTo: firstRemindersRow.bottomAnchor,
                            constant: remindersRowTopAnchorConstraint),
                        reminderRow.leftAnchor.constraint(equalTo: view.leftAnchor),
                        reminderRow.rightAnchor.constraint(equalTo: view.rightAnchor)
                    ])
                }
            }
        } else {
            let noReminders = BodyText()
            noReminders.text = "No Reminders 👍"
            noReminders.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(noReminders)
            NSLayoutConstraint.activate([
                noReminders.topAnchor.constraint(equalTo: remindersTitle.topAnchor, constant: 16),
                noReminders.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
            ])
        }
    }

}
