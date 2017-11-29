//
//  Double+Randomization.swift
//  LureAR
//
//  Created by Yuriy Berdnikov on 10/24/17.
//  Copyright © 2017 perpet.io. All rights reserved.
//

import Foundation

extension Double {
    static func random(min: Double, max: Double) -> Double {
        return Double(arc4random()) / 0xFFFFFFFF * (max - min) + min
    }
}
