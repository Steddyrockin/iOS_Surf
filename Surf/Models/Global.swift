//
//  Global.swift
//  Surf
//
//  Created by Liming on 09/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit

class Global: NSObject {

    static var sharedInstance = Global()
    
    var videoPlayed : Bool!
    var preIndex : Int!
}
