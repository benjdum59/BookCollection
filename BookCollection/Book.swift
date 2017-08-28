//
//  Book.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 24/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class Book {
    var title : String?
    var authors : [String]?
    var description : String?
    var ean : String?
    var thumbnailStr : String?
    var smallThumbnailStr : String?
    var quantity : Int = 0
    let ref: DatabaseReference?

    
    init(book : BookJSONVolumeInfo) {
        self.title = book.title
        self.authors = book.authors
        self.description = book.descriptionValue
        self.thumbnailStr = book.imageLinks?.thumbnail
        self.smallThumbnailStr = book.imageLinks?.smallThumbnail
        self.ref = nil
    }
    
    init(title:String?, authors:[String]?, description: String?, ean: String?, thumbnail: String?, smallThumbnail: String?, quantity: Int = 0) {
        self.title = title
        self.authors = authors
        self.description = description
        self.ean = ean
        self.thumbnailStr = thumbnail
        self.smallThumbnailStr = smallThumbnail
        self.quantity = quantity
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as? String
        authors = snapshotValue["authors"] as? [String]
        description = snapshotValue["description"] as? String
        ean = snapshotValue["ean"] as? String
        thumbnailStr = snapshotValue["thumbnail"] as? String
        smallThumbnailStr = snapshotValue["smallThumbnail"] as? String
        quantity = snapshotValue["quantity"] as! Int
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "title": title ?? "",
            "authors": authors ?? [],
            "description": description ?? "",
            "ean": ean ?? "",
            "thumbnail": thumbnailStr ?? "",
            "smallThumbnail" : smallThumbnailStr ?? "",
            "quantity" : quantity
        ]
    }

    
    func isValid() -> Bool {
        return title != nil
    }
    
    
}
