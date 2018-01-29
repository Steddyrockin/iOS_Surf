//
//  Event.swift
//  Surf
//
//  Created by Liming on 18/01/2018.
//  Copyright © 2018 surf. All rights reserved.
//

import UIKit
import Contentful

class Event: EntryModellable {
    static var contentTypeId: String = "event"
    
    let id: String
    let localeCode: String
    let eventName: String?
    let eventDescription: String?
    let eventLocation: String?
    let eventDate: String?
    let eventImage: URL?
    
    
    init(entry: Entry) {
        self.id         = entry.id
        self.localeCode = entry.localeCode
        
        self.eventName       = entry.fields["eventName"] as? String
        self.eventDescription      = entry.fields["eventDescription"] as? String
        self.eventLocation      = entry.fields["eventLocation"] as? String
        self.eventDate      = entry.fields["eventDate"] as? String
        
        let image     = entry.fields["eventImage"] as? Link
        self.eventImage = image?.asset?.url
    }

}
