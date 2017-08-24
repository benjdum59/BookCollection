//
//  BookJSONSaleInfo.swift
//
//  Created by Benjamin Dumont on 23/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BookJSONSaleInfo: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let saleability = "saleability"
    static let isEbook = "isEbook"
    static let country = "country"
  }

  // MARK: Properties
  public var saleability: String?
  public var isEbook: Bool? = false
  public var country: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    saleability = json[SerializationKeys.saleability].string
    isEbook = json[SerializationKeys.isEbook].boolValue
    country = json[SerializationKeys.country].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = saleability { dictionary[SerializationKeys.saleability] = value }
    dictionary[SerializationKeys.isEbook] = isEbook
    if let value = country { dictionary[SerializationKeys.country] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.saleability = aDecoder.decodeObject(forKey: SerializationKeys.saleability) as? String
    self.isEbook = aDecoder.decodeBool(forKey: SerializationKeys.isEbook)
    self.country = aDecoder.decodeObject(forKey: SerializationKeys.country) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(saleability, forKey: SerializationKeys.saleability)
    aCoder.encode(isEbook, forKey: SerializationKeys.isEbook)
    aCoder.encode(country, forKey: SerializationKeys.country)
  }

}
