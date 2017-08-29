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
    
    public func toArray(delimiter: String = ",") -> [String] {
        var array : [String] = []
        for value in self.components(separatedBy: delimiter) {
            array.append(value.trim())
        }
        return array
    }
    
    public func toInt()->Int{
        guard !self.isEmpty() else {
            return 0
        }
        return Int(self) ?? 0
    }
    
    public func toURL()->URL? {
        return URL(string: self)
    }
}
