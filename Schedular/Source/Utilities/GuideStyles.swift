//
//  GuideStyles.swift
//  Schedular
//
//  Created by Kamaal Farah on 28/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

public class LargeTitle: RegularText {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProDisplayBold, size: 34)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Title1: RegularText {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProDisplayBold, size: 28)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Title2: RegularText {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProDisplayBold, size: 22)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Title3: RegularText {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProDisplayBold, size: 20)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Headline: RegularText {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProTextSemibold, size: 17)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class BodyText: RegularText {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProTextRegular, size: 17)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Callout: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProTextRegular, size: 16)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Subhead: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProTextRegular, size: 15)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Footnote: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProTextRegular, size: 13)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Caption1: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProTextRegular, size: 12)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class Caption2: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        font = .customFont(name: .sfProTextRegular, size: 11)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class RegularText: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

public class ActionText: UILabel {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        /// - ToDo: Define this globally
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        let windowTintColor = sceneDelegate?.window?.tintColor
        textColor = windowTintColor
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
