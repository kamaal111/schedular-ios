//
//  CustomFonts.swift
//  Schedular
//
//  Created by Kamaal Farah on 28/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

enum CustomFonts: String {

    // MARK: San Fransisco Pro Text

    case sfProTextBlack = "SF-Pro-Text-Black"
    case sfProTextBlackItalic = "SF-Pro-Text-BlackItalic"
    case sfProTextBold = "SF-Pro-Text-Bold"
    case sfProTextBoldItalic = "SF-Pro-Text-BoldItalic"
    case sfProTextHeavy = "SF-Pro-Text-Heavy"
    case sfProTextHeavyItalic = "SF-Pro-Text-HeavyItalic"
    case sfProTextLight = "SF-Pro-Text-Light"
    case sfProTextLightItalic = "SF-Pro-Text-LightItalic"
    case sfProTextMedium = "SF-Pro-Text-Medium"
    case sfProTextMediumItalic = "SF-Pro-Text-MediumItalic"
    case sfProTextRegular = "SF-Pro-Text-Regular"
    case sfProTextRegularItalic = "SF-Pro-Text-RegularItalic"
    case sfProTextSemibold = "SF-Pro-Text-Semibold"
    case sfProTextSemiboldItalic = "SF-Pro-Text-SemiboldItalic"
    case sfProTextThin = "SF-Pro-Text-Thin"
    case sfProTextThinItalic = "SF-Pro-Text-ThinItalic"
    case sfProTextUltralight = "SF-Pro-Text-Ultralight"
    case sfProTextUltralightItalic = "SF-Pro-Text-UltralightItalic"

    // MARK: San Fransisco Pro Display

    case sfProDisplayBlack = "SF-Pro-Display-Black"
    case sfProDisplayBlackItalic = "SF-Pro-Display-BlackItalic"
    case sfProDisplayBold = "SF-Pro-Display-Bold"
    case sfProDisplayBoldItalic = "SF-Pro-Display-BoldItalic"
    case sfProDisplayHeavy = "SF-Pro-Display-Heavy"
    case sfProDisplayHeavyItalic = "SF-Pro-Display-HeavyItalic"
    case sfProDisplayLight = "SF-Pro-Display-Light"
    case sfProDisplayLightItalic = "SF-Pro-Display-LightItalic"
    case sfProDisplayMedium = "SF-Pro-Display-Medium"
    case sfProDisplayMediumItalic = "SF-Pro-Display-MediumItalic"
    case sfProDisplayRegular = "SF-Pro-Display-Regular"
    case sfProDisplayRegularItalic = "SF-Pro-Display-RegularItalic"
    case sfProDisplaySemibold = "SF-Pro-Display-Semibold"
    case sfProDisplaySemiboldItalic = "SF-Pro-Display-SemiboldItalic"
    case sfProDisplayThin = "SF-Pro-Display-Thin"
    case sfProDisplayThinItalic = "SF-Pro-Display-ThinItalic"
    case sfProDisplayUltralight = "SF-Pro-Display-Ultralight"
    case sfProDisplayUltralightItalic = "SF-Pro-Display-UltralightItalic"

}

func getCustomFont(of font: CustomFonts) -> String {
    font.rawValue
}
