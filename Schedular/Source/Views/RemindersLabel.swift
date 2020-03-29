//
//  RemindersLabel.swift
//  Schedular
//
//  Created by Kamaal Farah on 26/03/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import UIKit

final public class RemindersLabel: BodyText {

    private override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }

}
