//
//  KText.swift
//  Schedular
//
//  Created by Kamaal Farah on 08/05/2020.
//  Copyright © 2020 Kamaal. All rights reserved.
//

import KamaalUI

extension KText {
    init(localizedText: LocalizableKeys) {
        self.init(text: Localizer.getLocalizableString(of: localizedText))
    }
}
