//
//  CircleView.swift
//  Schedular
//
//  Created by Kamaal Farah on 25/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final public class CircleView: UIButton {

    public var lineWidth: CGFloat = 4
    public var lineColor: UIColor = .AccentColor
    public var spacingAwayFromView: Double = 4
    public var fill = false

    private override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public convenience init(lineWidth: CGFloat, lineColor: UIColor, spacingAwayFromView: Double) {
        self.init(frame: .zero)
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        self.spacingAwayFromView = spacingAwayFromView
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    lazy var button: UIButton = {
        UIButton(frame: .zero)
    }()

    public override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        lineColor.setStroke()
        path.lineWidth = lineWidth

        let radius: Double = Double(rect.width) / 2 - spacingAwayFromView
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y))

        for iteration in stride(from: 0, to: 361.0, by: 1) {
            let radians = iteration * Double.pi / 180
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            path.addLine(to: CGPoint(x: x, y: y))
        }

        path.stroke()

        let innerPath = UIBezierPath()
        lineColor.setStroke()
        lineColor.setFill()

        let innerRadius: Double = Double(rect.width) / 2 - spacingAwayFromView - 6

        innerPath.move(to: CGPoint(x: center.x + CGFloat(innerRadius), y: center.y))

        for iteration in stride(from: 0, to: 361.0, by: 1) {
            let radians = iteration * Double.pi / 180
            let x = Double(center.x) + innerRadius * cos(radians)
            let y = Double(center.y) + innerRadius * sin(radians)
            innerPath.addLine(to: CGPoint(x: x, y: y))
        }

        if fill {
            innerPath.fill()
        }
    }

    private func setupViews() {
        addSubview(button)
    }

    private func setupConstrints() {
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: heightAnchor),
            button.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

}
