//
//  ColorPallete.swift
//  Schedular
//
//  Created by Kamaal Farah on 23/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

/**
 * Colors in Assets.xcassets
 */
public enum ColorPallete: String {
    case backgroundColor = "BackgroundColor"
    case primaryTextColor = "PrimaryTextColor"
    case secondaryTextColor = "SecondaryTextColor"
    case tertiaryTextColor = "TertiaryTextColor"
    case quaternaryTextColor = "QuaternaryTextColor"
    case cardColor = "CardColor"
}

public extension UIColor {
    static let BackgroundColor = getColorFromTheme(color: .backgroundColor)
    static let PrimaryTextColor = getColorFromTheme(color: .primaryTextColor)
    static let SecondaryTextColor = getColorFromTheme(color: .secondaryTextColor)
    static let TertiaryTextColor = getColorFromTheme(color: .tertiaryTextColor)
    static let QuaternaryTextColor = getColorFromTheme(color: .quaternaryTextColor)
    static let AccentColor: UIColor = .systemTeal
    static let CardColor = getColorFromTheme(color: .cardColor)
}

private func getColorFromTheme(color: ColorPallete) -> UIColor {
    UIColor(named: color.rawValue) ?? UIColor.purple
}
