//
//  BookGoogleApiSAL.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 24/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class BookGoogleApiSAL {
    
    private let url = "https://www.googleapis.com/books/v1/volumes"
    private let queryKey = "q"
    private let maxResultKey = "maxResult"
    private let maxResultValue = 1
    
    func getBookInformation(ean:String, completion:@escaping (BookJSONVolumeInfo?, Error?) -> Void) {
        let parameters = [
            queryKey : "isbn:" + ean,
            maxResultKey : maxResultValue
        ] as [String : Any]
        Alamofire.request(url, method: HTTPMethod.get, parameters: parameters).responseJSON { (response) in
            guard let data = response.data else {
                completion(nil, nil)
                return
            }
            let json = JSON(data: data)
            let book = BookJSONBase(json: json)
            completion(book.items?.first?.volumeInfo, nil)
        }
    }
}

