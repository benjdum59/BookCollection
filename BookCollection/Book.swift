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
    var imgUrlStr : String?
    var quantity : Int = 0
    var imageStored : Bool = false
    var imageData : UIImage?
    let ref: DatabaseReference?
    var key : String?

    
    init(book : BookJSONVolumeInfo) {
        self.title = book.title
        self.authors = book.authors
        self.description = book.descriptionValue
        self.imgUrlStr = book.imageLinks?.thumbnail
        self.ref = nil
        self.key = nil
    }
    
    init(title:String?, authors:[String]?, description: String?, ean: String?, thumbnail: String?, quantity: Int = 0, key: String? = nil, image: UIImage?) {
        self.title = title
        self.authors = authors
        self.description = description
        self.ean = ean
        self.imgUrlStr = thumbnail
        self.quantity = quantity
        self.ref = nil
        self.key = key
        self.imageData = image
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as? String
        authors = snapshotValue["authors"] as? [String]
        description = snapshotValue["description"] as? String
        ean = snapshotValue["ean"] as? String
        imgUrlStr = snapshotValue["thumbnail"] as? String
        quantity = snapshotValue["quantity"] as? Int ?? 0
        imageStored = snapshotValue["imageStored"] as? Bool ?? false
        ref = snapshot.ref
        
    }
    
    func toAnyObject() -> [AnyHashable:Any] {
        return [
            "title": title ?? "",
            "authors": authors ?? [],
            "description": description ?? "",
            "ean": ean ?? "",
            "thumbnail": imgUrlStr ?? "",
            "quantity" : quantity,
            "imageStored" : imageStored
        ]
    }

    
    func isValid() -> Bool {
        return title != nil && !title!.isEmpty && ean != nil && !ean!.isEmpty
    }
    
    
}
