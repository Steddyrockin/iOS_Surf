//
//  UIView+Shadow.swift
//  Lockop
//
//  Created by Yuriy Berdnikov on 10/2/17.
//  Copyright © 2017 Perpetio. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(with color: UIColor = .darkGray,
                   offset: CGSize = CGSize(width: 3, height: 3),
                   radius: CGFloat = 5,
                   opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
}
