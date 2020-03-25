//
//  CircleView.swift
//  Schedular
//
//  Created by Kamaal Farah on 25/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var lineWidth: CGFloat = 4
    var lineColor: UIColor = .AccentColor
    var spacingAwayFromView: Double = 4

    private override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .CardColor
    }

    convenience init(lineWidth: CGFloat, lineColor: UIColor, spacingAwayFromView: Double) {
        self.init(frame: .zero)
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        self.spacingAwayFromView = spacingAwayFromView
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()

        let radius: Double = Double(rect.width) / 2 - spacingAwayFromView
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y))

        for iteration in stride(from: 0, to: 361.0, by: 1) {
            let radians = iteration * Double.pi / 180
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            path.addLine(to: CGPoint(x: x, y: y))
        }

        lineColor.setStroke()
        path.lineWidth = lineWidth
        path.stroke()
    }

}
