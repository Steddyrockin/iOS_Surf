//
//  Story.swift
//  Surf
//
//  Created by Liming on 19/01/2018.
//  Copyright © 2018 surf. All rights reserved.
//

import UIKit
import Contentful

class Story: EntryModellable {
    static var contentTypeId: String = "story"

    let id: String
    let localeCode: String
    let title: String?
    let slug: String?
    let date: String?
    let articleName: String?
    let authorName: String?
    let images: Array<Link>?
    let featureImage: Array<Link>?
    let summary: String?
    let body: String?
    let tag2: Array<String>?
    
    init(entry: Entry) {
        self.id         = entry.id
        self.localeCode = entry.localeCode
        
        self.title       = entry.fields["title"] as? String
        self.slug      = entry.fields["slug"] as? String
        self.date      = entry.fields["date"] as? String
        self.articleName      = entry.fields["articleName"] as? String
        self.authorName      = entry.fields["authorName"] as? String
        self.images      = entry.fields["images"] as? Array
        self.featureImage      = entry.fields["featureImage"] as? Array
        self.summary     = entry.fields["summary"] as? String
        self.body     = entry.fields["body"] as? String
        self.tag2      = entry.fields["tag2"] as? Array
    }
}
