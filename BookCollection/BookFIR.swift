//
//  BookFIR.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 25/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation
import FirebaseDatabase

class BookFIR {
    func saveBook(book: Book) {
        if book.key == nil {
            database.childByAutoId().setValue(book.toAnyObject())
        } else {
            database.child(book.key!).setValue(book.toAnyObject())
        }
    }
    
    func getBook(ean:String, completion:@escaping (Book?) -> Void) {
        database.queryOrdered(byChild: "ean").queryEqual(toValue: ean).queryLimited(toFirst: 1).observeSingleEvent(of:DataEventType.value, with: { (snapshot) in
            
            guard let book = snapshot.children.allObjects.first as? DataSnapshot else {
                completion(nil)
                return
            }
            
            completion(Book(snapshot: book))
        })
    }
}
