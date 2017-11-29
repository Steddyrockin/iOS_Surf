//
//  String+Localization.swift
//  LureAR
//
//  Created by Yuriy Berdnikov on 10/25/17.
//  Copyright © 2017 perpet.io. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
