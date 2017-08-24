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

    
    func isValid() -> Bool {
        return title != nil
    }
    
//    init(snapshot: FIRDataSnapshot) {
//        key = snapshot.key
//        let snapshotValue = snapshot.value as! [String: AnyObject]
//        name = snapshotValue["name"] as! String
//        addedByUser = snapshotValue["addedByUser"] as! String
//        completed = snapshotValue["completed"] as! Bool
//        ref = snapshot.ref
//    }
}
