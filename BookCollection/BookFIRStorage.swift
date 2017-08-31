//
//  BookFIRStorage.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 30/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import UIKit
import FirebaseStorage


class BookFIRStorage {
    private let storage = Storage.storage().reference()
    private let defaultFolder = "images"
    
    func saveCover(book: Book, completion:@escaping ((StorageMetadata?, Error?) -> Swift.Void)) {
        
        guard book.imageStored && book.imageData != nil else {
            let error = NSError(domain: "No data", code: -1, userInfo: nil)
            completion(nil, error)
            return
        }
        guard let data = UIImagePNGRepresentation(book.imageData!) else {
            let error = NSError(domain: "Bad format for image", code: -1, userInfo: nil)
            completion(nil, error)
            return
        }
        
        // Create a reference to the file you want to upload
        let ref = storage.child("\(defaultFolder)/\(book.key!)")
        
        // Upload the file to the path "images/rivers.jpg"
        ref.putData(data, metadata: nil) { (metadata, error) in
            completion(metadata, error)
        }
    }
    
    func getCover(book:Book, completion: @escaping(UIImage?, Error?)->Void) {
        guard book.imageStored else {
            completion(nil, NSError(domain: "Cover not stored", code: -1, userInfo: nil))
            return
        }
        let ref = storage.child("\(defaultFolder)/\(book.key!)")
        
        ref.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "Cover not found", code: -1, userInfo: nil))
                return
            }
            book.imageData = UIImage(data: data)
            completion(book.imageData, nil)
        }
    }
}
