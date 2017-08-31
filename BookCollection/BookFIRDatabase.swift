//
//  BookFIR.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 25/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation
import FirebaseDatabase

class BookFIRDatabase {
    
    let database = Database.database().reference(withPath: "books")

    
    func saveBook(book: Book, completion: @escaping(Error?) -> Void) {
        let ref : DatabaseReference
        if book.key == nil {
            ref = database.childByAutoId()
     } else {
            ref = database.child(book.key!)
        }
        book.imageStored = book.imageData != nil
        ref.setValue(book.toAnyObject()) { (error, reference) in
            book.key = reference.key 
            completion(error)
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
    
    func getBooks(completion:@escaping ([Book]) -> Void) {
        database.observe(.value, with: { (snapshot) in
            var books : [Book] = []
            for item in snapshot.children.allObjects {
                books.append(Book(snapshot: item as! DataSnapshot))
            }
            completion(books)
        })
    }
}
