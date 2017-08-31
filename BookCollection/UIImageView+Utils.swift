//
//  UIImageView+utils.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 28/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
        
    func getDataFromUrl(url:URL) {
        Alamofire.request(url).responseImage { (response) in
            debugPrint(response.result)

            if let image = response.result.value {
                self.image = image
            }
        }
    }
    
    func getDataFromUrl(str:String?) {
        guard str != nil else  {
            return
        }
        guard let url = str!.toURL() else {
            return
        }
        getDataFromUrl(url: url)
    }
}


