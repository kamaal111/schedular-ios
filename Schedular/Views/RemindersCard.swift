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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var circleView: UIView = {
        let circle = CircleView(lineWidth: 4, lineColor: .AccentColor, spacingAwayFromView: 4)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()

    lazy var circleView2: UIView = {
        let circle = CircleView(lineWidth: 4, lineColor: .AccentColor, spacingAwayFromView: 4)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()

    lazy var circleView3: UIView = {
        let circle = CircleView(lineWidth: 4, lineColor: .AccentColor, spacingAwayFromView: 4)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()

    lazy var remindersLabel: UILabel = {
        let label = UILabel()
        label.text = "Walk the dog"
        label.textColor = .PrimaryTextColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var remindersLabel2: UILabel = {
        let label = UILabel()
        label.text = "Do groceries"
        label.textColor = .PrimaryTextColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var remindersLabel3: UILabel = {
        let label = UILabel()
        label.text = "Go to the gym"
        label.textColor = .PrimaryTextColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(remindersTitle)
        addSubview(circleView)
        addSubview(remindersLabel)
        addSubview(circleView2)
        addSubview(remindersLabel2)
        addSubview(circleView3)
        addSubview(remindersLabel3)
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
            circleView.topAnchor.constraint(equalTo: remindersTitle.bottomAnchor, constant: 8),
            circleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            circleView.heightAnchor.constraint(equalToConstant: 40),
            circleView.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            remindersLabel.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 16),
            remindersLabel.topAnchor.constraint(equalTo: remindersTitle.bottomAnchor, constant: 8),
            remindersLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            circleView2.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 8),
            circleView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            circleView2.heightAnchor.constraint(equalToConstant: 40),
            circleView2.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            remindersLabel2.leftAnchor.constraint(equalTo: circleView2.rightAnchor, constant: 16),
            remindersLabel2.topAnchor.constraint(equalTo: remindersLabel.bottomAnchor, constant: 8),
            remindersLabel2.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            circleView3.topAnchor.constraint(equalTo: circleView2.bottomAnchor, constant: 8),
            circleView3.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            circleView3.heightAnchor.constraint(equalToConstant: 40),
            circleView3.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            remindersLabel3.leftAnchor.constraint(equalTo: circleView3.rightAnchor, constant: 16),
            remindersLabel3.topAnchor.constraint(equalTo: remindersLabel2.bottomAnchor, constant: 8),
            remindersLabel3.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
