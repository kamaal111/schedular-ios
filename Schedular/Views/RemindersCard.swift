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
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            layer.shadowColor = UIColor.PrimaryTextColor.cgColor
        }
    }

    // MARK: - Components
    private lazy var remindersTitle: UILabel = {
       let label = UILabel()
        label.text = Localizer.getLocalizableString(of: .REMINDERS)
        label.textColor = .PrimaryTextColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstRemindersRow: UIView = {
        RemindersRow(remindersText: "Walk the dog")
    }()

    private lazy var secondRemindersRow: UIView = {
        RemindersRow(remindersText: "Do groceries")
    }()

    private lazy var thirdRemindersRow: UIView = {
        RemindersRow(remindersText: "Go to the gym")
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
        addSubview(firstRemindersRow)
        addSubview(secondRemindersRow)
        addSubview(thirdRemindersRow)
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            remindersTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            remindersTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            firstRemindersRow.topAnchor.constraint(equalTo: remindersTitle.bottomAnchor),
            firstRemindersRow.leftAnchor.constraint(equalTo: leftAnchor),
            firstRemindersRow.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        NSLayoutConstraint.activate([
            secondRemindersRow.topAnchor.constraint(equalTo: firstRemindersRow.bottomAnchor, constant: 8),
            secondRemindersRow.leftAnchor.constraint(equalTo: leftAnchor),
            secondRemindersRow.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        NSLayoutConstraint.activate([
            thirdRemindersRow.topAnchor.constraint(equalTo: secondRemindersRow.bottomAnchor, constant: 8),
            thirdRemindersRow.leftAnchor.constraint(equalTo: leftAnchor),
            thirdRemindersRow.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

}
