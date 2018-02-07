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
    
    static let CONTENTFUL_ID = "vlcgvik1xgpn"
    static let CONTENTFUL_TOKEN = "b642a5a6d0c9c7f1c4312310dfd6921c9e8012ad1bfba45571cbd26e3b398c37"
}
