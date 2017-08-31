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
    private let bookFIRDatabase = BookFIRDatabase()
    private let bookFIRStorage = BookFIRStorage()

    
    
    func getBookInformation(ean: String, infotype: infotype = infotype.FromWS, completion: @escaping (Book?, Error?) -> Void) {
        
        //Get info from FIR
        bookFIRDatabase.getBook(ean: ean) { (book) in
            guard let book = book else {
                self.bookGoogleApiSAL.getBookInformation(ean: ean) { (bookJSON, error) in
                    guard let bookJSON = bookJSON else {
                        completion(nil, error )
                        return
                    }
                    let book = Book(book: bookJSON)
                    book.ean = ean
                    completion(book, error)
                }
                return
            }
            
            self.bookFIRStorage.getCover(book: book, completion: { (image, error) in
                completion(book, nil)
                return
            })
            
        }
    }
    
    func getBooks(completion: @escaping ([Book]) -> Void){
        bookFIRDatabase.getBooks { (books) in
            completion(books)
        }
    }
    
    func saveBook(book: Book) {
        bookFIRDatabase.saveBook(book: book) { (error) in
            guard error == nil else {
                return
            }
            self.bookFIRStorage.saveCover(book: book) { (metadata, error) in
                print("Error: \(String(describing: error))")
                print("sownloadUrl: \(String(describing: metadata?.downloadURLs?.first))")
                
            }
        }
    }
    
    func getCover(book: Book, completion:@escaping ()->Void) {
        bookFIRStorage.getCover(book: book) { (image, error) in
            completion()
        }
    }
}
