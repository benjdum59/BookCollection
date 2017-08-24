//
//  String+Utils.swift
//  BookCollection
//
//  Created by Benjamin Dumont on 24/08/2017.
//  Copyright © 2017 BCFactory. All rights reserved.
//

import Foundation

extension String {
    public func isEmpty()->Bool {
        return self.trim() == ""
    }
    
    public func trim()->String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
