//
//  Gallery.swift
//  Surf
//
//  Created by Liming on 19/01/2018.
//  Copyright © 2018 surf. All rights reserved.
//

import UIKit
import Contentful

class Gallery: EntryModellable {
    static var contentTypeId: String = "gallery"

    let id: String
    let localeCode: String
    let title: String?
    let author: String?
    let date: String?
    let images: Array<Link>?
    let summary: String?
    
    init(entry: Entry) {
        self.id         = entry.id
        self.localeCode = entry.localeCode
        
        self.title       = entry.fields["title"] as? String
        self.author      = entry.fields["author"] as? String
        self.date      = entry.fields["date"] as? String
        self.images      = entry.fields["images"] as? Array
        self.summary     = entry.fields["summary"] as? String
    }
}
