//
//  CustomFonts.swift
//  Schedular
//
//  Created by Kamaal Farah on 28/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit


extension UIFont {
    static func customFont(name: CustomFonts, size: CGFloat) -> UIFont {
        UIFont(name: name.rawValue, size: size) ?? .systemFont(ofSize: size, weight: .regular)
    }

    static func customFontItalic(name: CustomFontsItalic, size: CGFloat) -> UIFont {
        UIFont(name: name.rawValue, size: size) ?? .italicSystemFont(ofSize: size)
    }
}

public enum CustomFonts: String {

    // MARK: San Fransisco Pro Text

    case sfProTextBold = "SF-Pro-Text-Bold"
    case sfProTextLight = "SF-Pro-Text-Light"
    case sfProTextMedium = "SF-Pro-Text-Medium"
    case sfProTextRegular = "SF-Pro-Text-Regular"
    case sfProTextSemibold = "SF-Pro-Text-Semibold"
    case sfProTextThin = "SF-Pro-Text-Thin"

    // MARK: San Fransisco Pro Display

    case sfProDisplayBold = "SF-Pro-Display-Bold"
    case sfProDisplayLight = "SF-Pro-Display-Light"
    case sfProDisplayMedium = "SF-Pro-Display-Medium"
    case sfProDisplayRegular = "SF-Pro-Display-Regular"
    case sfProDisplaySemibold = "SF-Pro-Display-Semibold"
    case sfProDisplayThin = "SF-Pro-Display-Thin"

}

public enum CustomFontsItalic: String {

    // MARK: San Fransisco Pro Text Italic

    case sfProTextBoldItalic = "SF-Pro-Text-BoldItalic"
    case sfProTextLightItalic = "SF-Pro-Text-LightItalic"
    case sfProTextMediumItalic = "SF-Pro-Text-MediumItalic"
    case sfProTextRegularItalic = "SF-Pro-Text-RegularItalic"
    case sfProTextSemiboldItalic = "SF-Pro-Text-SemiboldItalic"
    case sfProTextThinItalic = "SF-Pro-Text-ThinItalic"

    // MARK: San Fransisco Pro Display Italic

    case sfProDisplayBoldItalic = "SF-Pro-Display-BoldItalic"
    case sfProDisplayLightItalic = "SF-Pro-Display-LightItalic"
    case sfProDisplayMediumItalic = "SF-Pro-Display-MediumItalic"
    case sfProDisplayRegularItalic = "SF-Pro-Display-RegularItalic"
    case sfProDisplaySemiboldItalic = "SF-Pro-Display-SemiboldItalic"
    case sfProDisplayThinItalic = "SF-Pro-Display-ThinItalic"

}
