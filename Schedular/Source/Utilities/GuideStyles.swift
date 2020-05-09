//
//  GuideStyles.swift
//  Schedular
//
//  Created by Kamaal Farah on 28/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import KamaalUI
import SwiftUI

extension KText {
    func gLargeTitle() -> some View { modifier(LargeTitle()) }
    func gTitle1() -> some View { modifier(Title1()) }
    func gTitle2() -> some View { modifier(Title2()) }
    func gTitle3() -> some View { modifier(Title3()) }
    func gHeadline() -> some View { modifier(Headline()) }
    func gBodyText() -> some View { modifier(BodyText()) }
    func gActionText() -> some View { modifier(ActionText()) }
    func gFootnote() -> some View { modifier(Footnote()) }
}

private struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProDisplayBold, size: 34))
            .foregroundColor(.primary)
    }
}

private struct Title1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProDisplayBold, size: 28))
            .foregroundColor(.primary)
    }
}

private struct Title2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProDisplayBold, size: 22))
            .foregroundColor(.primary)
    }
}

private struct Title3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProDisplayBold, size: 20))
            .foregroundColor(.primary)
    }
}

private struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProTextSemibold, size: 17))
            .foregroundColor(.secondary)
    }
}

private struct BodyText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProTextRegular, size: 17))
            .foregroundColor(.primary)
    }
}

private struct ActionText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProTextRegular, size: 17))
            .foregroundColor(.accentColor)
    }
}

private struct Footnote: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.customFont(name: .sfProTextRegular, size: 13))
            .foregroundColor(.secondary)
    }
}
