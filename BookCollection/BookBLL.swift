//
//  BookBLL.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 24/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation

class BookBLL {
    enum infotype : String{
        case FromWS
        case FromFIR
    }
    
    private let bookGoogleApiSAL = BookGoogleApiSAL()
    private let bookFIR = BookFIR()

    
    
    func getBookInformation(ean: String, infotype: infotype = infotype.FromWS, completion: @escaping (Book?, Error?) -> Void) {
        
        //Get info from FIR
        bookFIR.getBook(ean: ean) { (bookFIR) in
            if bookFIR != nil {
                completion(bookFIR, nil)
                return
            }
            self.bookGoogleApiSAL.getBookInformation(ean: ean) { (bookJSON, error) in
                guard let bookJSON = bookJSON else {
                    completion(nil, error )
                    return
                }
                let book = Book(book: bookJSON)
                book.ean = ean
                completion(book, error)
            }
        }
    }
    
    func saveBook(book: Book) {
        bookFIR.saveBook(book: book)
    }
}
