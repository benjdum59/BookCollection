//
//  Book.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 24/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation
import Firebase

class Book {
    var title : String?
    var authors : [String]?
    var description : String?
    var ean : [String]?
    var thumbnailStr : String?
    var smallThumbnailStr : String?
    var quantity : Int = 0
    
    init(book : BookJSONVolumeInfo) {
        self.title = book.title
        self.authors = book.authors
        self.description = book.descriptionValue
        self.ean = []
        for industry in (book.industryIdentifiers)! {
            self.ean?.append(industry.identifier!)
        }
        self.thumbnailStr = book.imageLinks?.thumbnail
        self.smallThumbnailStr = book.imageLinks?.smallThumbnail
    }

    
    func isValid() -> Bool {
        return title != nil
    }
    
    
}
