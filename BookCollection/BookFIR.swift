//
//  BookFIR.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 25/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation

class BookFIR {
    func saveBook(book: Book) {
        database.child(book.ean!).setValue(book.toAnyObject())
    }
}
