//
//  RemindersCard.swift
//  Schedular
//
//  Created by Kamaal Farah on 24/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final public class RemindersCard: UIView {

    // MARK: - Initializing view
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    public convenience init() {
        self.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            layer.shadowColor = UIColor.PrimaryTextColor.cgColor
        }
    }

    // MARK: - Components
    private lazy var remindersTitle: UILabel = {
       let label = Title2()
        label.text = Localizer.getLocalizableString(of: .REMINDERS)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Setting Views
    private func setupViews() {
        backgroundColor = .CardColor
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.PrimaryTextColor.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(remindersTitle)
        setupRemindersViewContent()
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        let reminders = EventsHelper.reminders
        let remindersCardHeight = 48 + (CGFloat(reminders.count < 1 ? 1 : reminders.count) * 52)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: remindersCardHeight)
        ])
        NSLayoutConstraint.activate([
            remindersTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            remindersTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }

    private func setupRemindersViewContent() {
        let reminders = EventsHelper.reminders
        if !reminders.isEmpty {
            let firstRemindersRow = RemindersRow(remindersText: reminders[0])
            addSubview(firstRemindersRow)
            NSLayoutConstraint.activate([
                firstRemindersRow.topAnchor.constraint(equalTo: remindersTitle.bottomAnchor),
                firstRemindersRow.leftAnchor.constraint(equalTo: leftAnchor),
                firstRemindersRow.rightAnchor.constraint(equalTo: rightAnchor)
            ])
            if reminders.count > 1 {
                for (index, reminder) in reminders[1..<reminders.count].enumerated() {
                    let reminderRow = RemindersRow(remindersText: reminder)
                    addSubview(reminderRow)
                    let remindersRowTopAnchorConstraint = 8 + (CGFloat(index) * 48)
                    NSLayoutConstraint.activate([
                        reminderRow.topAnchor.constraint(
                            equalTo: firstRemindersRow.bottomAnchor,
                            constant: remindersRowTopAnchorConstraint),
                        reminderRow.leftAnchor.constraint(equalTo: leftAnchor),
                        reminderRow.rightAnchor.constraint(equalTo: rightAnchor)
                    ])
                }
            }
        } else {
            let noReminders = BodyText()
            noReminders.text = "No Reminders 👍"
            noReminders.translatesAutoresizingMaskIntoConstraints = false
            addSubview(noReminders)
            NSLayoutConstraint.activate([
                noReminders.topAnchor.constraint(equalTo: remindersTitle.bottomAnchor, constant: 16),
                noReminders.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
            ])
        }
    }

}
