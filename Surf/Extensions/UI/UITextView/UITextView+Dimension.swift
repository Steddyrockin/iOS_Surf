//
//  UITextView+Dimension.swift
//  Lurear
//
//  Created by Yuriy Berdnikov on 11/8/17.
//  Copyright © 2017 lurear. All rights reserved.
//

import Foundation

extension UITextView {
    func calculateHeight(minimumTextViewHeight: CGFloat,
                         maximumTextViewHeight: CGFloat) -> CGFloat {
        let height = ceil(sizeThatFits(frame.size).height)
        
        return max(min(height, maximumTextViewHeight), minimumTextViewHeight)
    }
}
