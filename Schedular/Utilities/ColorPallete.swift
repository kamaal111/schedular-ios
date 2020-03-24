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
enum ColorPallete: String {
    case backgroundColor = "BackgroundColor"
    case primaryTextColor = "PrimaryTextColor"
    case accentColor = "AccentColor"
    case cardColor = "CardColor"
}

extension UIColor {
    static let BackgroundColor = getColorFromTheme(color: .backgroundColor)
    static let PrimaryTextColor = getColorFromTheme(color: .primaryTextColor)
    static let AccentColor = getColorFromTheme(color: .accentColor)
    static let CardColor = getColorFromTheme(color: .cardColor)
}

private func getColorFromTheme(color: ColorPallete) -> UIColor {
    UIColor(named: color.rawValue) ?? UIColor.purple
}
