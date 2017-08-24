//
//  BookJSONEpub.swift
//
//  Created by Benjamin Dumont on 23/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BookJSONEpub: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let isAvailable = "isAvailable"
  }

  // MARK: Properties
  public var isAvailable: Bool? = false

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
    isAvailable = json[SerializationKeys.isAvailable].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.isAvailable] = isAvailable
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.isAvailable = aDecoder.decodeBool(forKey: SerializationKeys.isAvailable)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(isAvailable, forKey: SerializationKeys.isAvailable)
  }

}
