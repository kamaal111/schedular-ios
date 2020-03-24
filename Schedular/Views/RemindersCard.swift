//
//  RemindersCard.swift
//  Schedular
//
//  Created by Kamaal Farah on 24/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class RemindersCard: UIView {

    // MARK: - Components
    lazy var remindersTitle: UILabel = {
       let label = UILabel()
        label.text = Localizer.getLocalizableString(of: .REMINDERS)
        label.textColor = .PrimaryTextColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    // MARK: - Initializing view
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    convenience init() {
        self.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Setting Views
    private func setupViews() {
        backgroundColor = .CardColor
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        addSubview(remindersTitle)
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 104)
        ])
        remindersTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            remindersTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            remindersTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }

}
