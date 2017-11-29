//
//  UITextView+Alignment.swift
//  Lurear
//
//  Created by Yuriy Berdnikov on 11/8/17.
//  Copyright © 2017 lurear. All rights reserved.
//

import UIKit

extension UITextView {
    func alignContentCenterHorizontally() {
        var topOffset = (bounds.height - contentSize.height * zoomScale) / 2.0
        topOffset = topOffset < 0.0 ? 0.0 : topOffset
        
        contentInset.top = topOffset
    }
}
