//
//  UIStoryboard+Name.swift
//  LureAR
//
//  Created by Yuriy Berdnikov on 10/24/17.
//  Copyright © 2017 perpet.io. All rights reserved.
//

import Foundation
import ViewControllerDescribable

extension UIStoryboard {
    enum Name: String, StoryboardNameDescribable {
        case main = "Main",
        launchScreen = "LaunchScreen",
        offer = "Offer",
        popups = "Popups",
        checkIn = "CheckIn",
        chat = "Chat"
    }
}
