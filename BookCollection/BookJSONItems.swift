//
//  BookJSONItems.swift
//
//  Created by Benjamin Dumont on 23/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BookJSONItems: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let selfLink = "selfLink"
    static let kind = "kind"
    static let id = "id"
    static let searchInfo = "searchInfo"
    static let accessInfo = "accessInfo"
    static let saleInfo = "saleInfo"
    static let etag = "etag"
    static let volumeInfo = "volumeInfo"
  }

  // MARK: Properties
  public var selfLink: String?
  public var kind: String?
  public var id: String?
  public var searchInfo: BookJSONSearchInfo?
  public var accessInfo: BookJSONAccessInfo?
  public var saleInfo: BookJSONSaleInfo?
  public var etag: String?
  public var volumeInfo: BookJSONVolumeInfo?

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
    selfLink = json[SerializationKeys.selfLink].string
    kind = json[SerializationKeys.kind].string
    id = json[SerializationKeys.id].string
    searchInfo = BookJSONSearchInfo(json: json[SerializationKeys.searchInfo])
    accessInfo = BookJSONAccessInfo(json: json[SerializationKeys.accessInfo])
    saleInfo = BookJSONSaleInfo(json: json[SerializationKeys.saleInfo])
    etag = json[SerializationKeys.etag].string
    volumeInfo = BookJSONVolumeInfo(json: json[SerializationKeys.volumeInfo])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = selfLink { dictionary[SerializationKeys.selfLink] = value }
    if let value = kind { dictionary[SerializationKeys.kind] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = searchInfo { dictionary[SerializationKeys.searchInfo] = value.dictionaryRepresentation() }
    if let value = accessInfo { dictionary[SerializationKeys.accessInfo] = value.dictionaryRepresentation() }
    if let value = saleInfo { dictionary[SerializationKeys.saleInfo] = value.dictionaryRepresentation() }
    if let value = etag { dictionary[SerializationKeys.etag] = value }
    if let value = volumeInfo { dictionary[SerializationKeys.volumeInfo] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.selfLink = aDecoder.decodeObject(forKey: SerializationKeys.selfLink) as? String
    self.kind = aDecoder.decodeObject(forKey: SerializationKeys.kind) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.searchInfo = aDecoder.decodeObject(forKey: SerializationKeys.searchInfo) as? BookJSONSearchInfo
    self.accessInfo = aDecoder.decodeObject(forKey: SerializationKeys.accessInfo) as? BookJSONAccessInfo
    self.saleInfo = aDecoder.decodeObject(forKey: SerializationKeys.saleInfo) as? BookJSONSaleInfo
    self.etag = aDecoder.decodeObject(forKey: SerializationKeys.etag) as? String
    self.volumeInfo = aDecoder.decodeObject(forKey: SerializationKeys.volumeInfo) as? BookJSONVolumeInfo
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(selfLink, forKey: SerializationKeys.selfLink)
    aCoder.encode(kind, forKey: SerializationKeys.kind)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(searchInfo, forKey: SerializationKeys.searchInfo)
    aCoder.encode(accessInfo, forKey: SerializationKeys.accessInfo)
    aCoder.encode(saleInfo, forKey: SerializationKeys.saleInfo)
    aCoder.encode(etag, forKey: SerializationKeys.etag)
    aCoder.encode(volumeInfo, forKey: SerializationKeys.volumeInfo)
  }

}
