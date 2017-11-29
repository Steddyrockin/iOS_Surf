//
//  UIViewController+DependencyContainer.swift
//  Lurear
//
//  Created by Yuriy Berdnikov on 11/1/17.
//  Copyright © 2017 lurear. All rights reserved.
//

import UIKit
import Dip

extension UIViewController {
    var dependencyContainer: DependencyContainer {
        return AppDependencies.shared.container
    }
}
