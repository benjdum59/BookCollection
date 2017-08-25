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
    
    
    func getBookInformation(ean: String, infotype: infotype = infotype.FromWS, completion: @escaping (Book?, Error?) -> Void) {
        bookGoogleApiSAL.getBookInformation(ean: ean) { (bookJSON, error) in
            completion(Book(book: bookJSON!), nil)
        }
    }
}
