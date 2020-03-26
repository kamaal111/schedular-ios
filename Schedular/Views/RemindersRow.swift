//
//  RemindersRow.swift
//  Schedular
//
//  Created by Kamaal Farah on 26/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final public class RemindersRow: UIView {

    // MARK: - Initializing view
    public var remindersText: String?

    private override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public convenience init(remindersText: String) {
        self.init(frame: .zero)
        self.remindersText = remindersText
        setupViews()
        setupConstraints()
    }

    // MARK: - Components
    private lazy var circleView: UIView = {
        let circle = CircleView(lineWidth: 4, lineColor: .AccentColor, spacingAwayFromView: 4)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()

    private lazy var remindersLabel: UILabel = {
        let label = RemindersLabel(text: remindersText ?? "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Setting Views
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleView)
        addSubview(remindersLabel)
    }

    // MARK: - Setting Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            circleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            circleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            circleView.heightAnchor.constraint(equalToConstant: 40),
            circleView.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            remindersLabel.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 16),
            remindersLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18)
        ])
    }

}