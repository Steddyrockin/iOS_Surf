//
//  UIView+Layer.swift
//  Lockop
//
//  Created by Yuriy Berdnikov on 10/3/17.
//  Copyright © 2017 Perpetio. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult func borderWidth(_ width: CGFloat) -> Self {
        layer.borderWidth = width
        layer.masksToBounds = true
        
        return self
    }
    
    @discardableResult func borderColor(_ color: UIColor = .black) -> Self {
        layer.borderColor = color.cgColor
        
        return self
    }
    
    @discardableResult func removeBorder() -> Self {
        return borderColor(.clear)
            .borderWidth(0)
    }
    
    @discardableResult func cornerRadius(_ radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        
        return self
    }
    
    @discardableResult func roundedCornerRadius() -> Self {
        return cornerRadius(bounds.height / 2.0)
    }
    
    @discardableResult func shadowColor(_ color: UIColor) -> Self {
        layer.shadowColor = color.cgColor
        
        return self
    }
    
    @discardableResult func shadowOffset(_ offset: CGSize) -> Self {
        layer.shadowOffset = offset
        
        return self
    }
    
    @discardableResult func shadowOpacity(_ opacity: Float) -> Self {
        layer.shadowOpacity = opacity
        
        return self
    }
    
    @discardableResult func shadowRadius(_ radius: CGFloat) -> Self {
        layer.shadowRadius = radius
        
        return self
    }
    
    @discardableResult func roundCorners(_ corners: UIRectCorner,
                                         radius: CGFloat) -> Self {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
        
        return self
    }
    
    @discardableResult func shadow(_ color: UIColor = .black,
                                   radius: CGFloat = 3,
                                   offset: CGSize = .zero,
                                   opacity: Float = 0.5) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = true
        
        return self
    }
}
