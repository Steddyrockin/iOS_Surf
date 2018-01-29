//
//  Channel.swift
//  Surf
//
//  Created by Liming on 19/01/2018.
//  Copyright © 2018 surf. All rights reserved.
//

import UIKit
import Contentful

class Channel: EntryModellable {
    static var contentTypeId: String = "channel"

    let id: String
    let localeCode: String
    let channelName: String?
    let channelFeatureImage: Link?
    let genre: Array<String>?
    let vimeoChannelId: String?
    let photos: Array<Link>?
    let biography: String?
    let events: Array<Link>?
    let stories: Array<Link>?
    let uid: String?
    
    init(entry: Entry) {
        self.id         = entry.id
        self.localeCode = entry.localeCode
        
        self.channelName       = entry.fields["channelName"] as? String
        self.channelFeatureImage      = entry.fields["channelFeatureImage"] as? Link
        self.genre      = entry.fields["genre"] as? Array
        self.vimeoChannelId      = entry.fields["vimeoChannelId"] as? String
        self.photos      = entry.fields["photos"] as? Array
        
        self.biography     = entry.fields["biography"] as? String
        self.events      = entry.fields["events"] as? Array
        self.stories      = entry.fields["stories"] as? Array
        self.uid     = entry.fields["uid"] as? String
    }
}
