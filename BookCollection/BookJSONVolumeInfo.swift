//
//  BookJSONVolumeInfo.swift
//
//  Created by Benjamin Dumont on 23/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BookJSONVolumeInfo: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let maturityRating = "maturityRating"
    static let authors = "authors"
    static let imageLinks = "imageLinks"
    static let descriptionValue = "description"
    static let readingModes = "readingModes"
    static let language = "language"
    static let previewLink = "previewLink"
    static let industryIdentifiers = "industryIdentifiers"
    static let allowAnonLogging = "allowAnonLogging"
    static let infoLink = "infoLink"
    static let pageCount = "pageCount"
    static let publisher = "publisher"
    static let printType = "printType"
    static let canonicalVolumeLink = "canonicalVolumeLink"
    static let contentVersion = "contentVersion"
    static let title = "title"
    static let publishedDate = "publishedDate"
  }

  // MARK: Properties
  public var maturityRating: String?
  public var authors: [String]?
  public var imageLinks: BookJSONImageLinks?
  public var descriptionValue: String?
  public var readingModes: BookJSONReadingModes?
  public var language: String?
  public var previewLink: String?
  public var industryIdentifiers: [BookJSONIndustryIdentifiers]?
  public var allowAnonLogging: Bool? = false
  public var infoLink: String?
  public var pageCount: Int?
  public var publisher: String?
  public var printType: String?
  public var canonicalVolumeLink: String?
  public var contentVersion: String?
  public var title: String?
  public var publishedDate: String?

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
    maturityRating = json[SerializationKeys.maturityRating].string
    if let items = json[SerializationKeys.authors].array { authors = items.map { $0.stringValue } }
    imageLinks = BookJSONImageLinks(json: json[SerializationKeys.imageLinks])
    descriptionValue = json[SerializationKeys.descriptionValue].string
    readingModes = BookJSONReadingModes(json: json[SerializationKeys.readingModes])
    language = json[SerializationKeys.language].string
    previewLink = json[SerializationKeys.previewLink].string
    if let items = json[SerializationKeys.industryIdentifiers].array { industryIdentifiers = items.map { BookJSONIndustryIdentifiers(json: $0) } }
    allowAnonLogging = json[SerializationKeys.allowAnonLogging].boolValue
    infoLink = json[SerializationKeys.infoLink].string
    pageCount = json[SerializationKeys.pageCount].int
    publisher = json[SerializationKeys.publisher].string
    printType = json[SerializationKeys.printType].string
    canonicalVolumeLink = json[SerializationKeys.canonicalVolumeLink].string
    contentVersion = json[SerializationKeys.contentVersion].string
    title = json[SerializationKeys.title].string
    publishedDate = json[SerializationKeys.publishedDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = maturityRating { dictionary[SerializationKeys.maturityRating] = value }
    if let value = authors { dictionary[SerializationKeys.authors] = value }
    if let value = imageLinks { dictionary[SerializationKeys.imageLinks] = value.dictionaryRepresentation() }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = readingModes { dictionary[SerializationKeys.readingModes] = value.dictionaryRepresentation() }
    if let value = language { dictionary[SerializationKeys.language] = value }
    if let value = previewLink { dictionary[SerializationKeys.previewLink] = value }
    if let value = industryIdentifiers { dictionary[SerializationKeys.industryIdentifiers] = value.map { $0.dictionaryRepresentation() } }
    dictionary[SerializationKeys.allowAnonLogging] = allowAnonLogging
    if let value = infoLink { dictionary[SerializationKeys.infoLink] = value }
    if let value = pageCount { dictionary[SerializationKeys.pageCount] = value }
    if let value = publisher { dictionary[SerializationKeys.publisher] = value }
    if let value = printType { dictionary[SerializationKeys.printType] = value }
    if let value = canonicalVolumeLink { dictionary[SerializationKeys.canonicalVolumeLink] = value }
    if let value = contentVersion { dictionary[SerializationKeys.contentVersion] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = publishedDate { dictionary[SerializationKeys.publishedDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.maturityRating = aDecoder.decodeObject(forKey: SerializationKeys.maturityRating) as? String
    self.authors = aDecoder.decodeObject(forKey: SerializationKeys.authors) as? [String]
    self.imageLinks = aDecoder.decodeObject(forKey: SerializationKeys.imageLinks) as? BookJSONImageLinks
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.readingModes = aDecoder.decodeObject(forKey: SerializationKeys.readingModes) as? BookJSONReadingModes
    self.language = aDecoder.decodeObject(forKey: SerializationKeys.language) as? String
    self.previewLink = aDecoder.decodeObject(forKey: SerializationKeys.previewLink) as? String
    self.industryIdentifiers = aDecoder.decodeObject(forKey: SerializationKeys.industryIdentifiers) as? [BookJSONIndustryIdentifiers]
    self.allowAnonLogging = aDecoder.decodeBool(forKey: SerializationKeys.allowAnonLogging)
    self.infoLink = aDecoder.decodeObject(forKey: SerializationKeys.infoLink) as? String
    self.pageCount = aDecoder.decodeObject(forKey: SerializationKeys.pageCount) as? Int
    self.publisher = aDecoder.decodeObject(forKey: SerializationKeys.publisher) as? String
    self.printType = aDecoder.decodeObject(forKey: SerializationKeys.printType) as? String
    self.canonicalVolumeLink = aDecoder.decodeObject(forKey: SerializationKeys.canonicalVolumeLink) as? String
    self.contentVersion = aDecoder.decodeObject(forKey: SerializationKeys.contentVersion) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.publishedDate = aDecoder.decodeObject(forKey: SerializationKeys.publishedDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(maturityRating, forKey: SerializationKeys.maturityRating)
    aCoder.encode(authors, forKey: SerializationKeys.authors)
    aCoder.encode(imageLinks, forKey: SerializationKeys.imageLinks)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(readingModes, forKey: SerializationKeys.readingModes)
    aCoder.encode(language, forKey: SerializationKeys.language)
    aCoder.encode(previewLink, forKey: SerializationKeys.previewLink)
    aCoder.encode(industryIdentifiers, forKey: SerializationKeys.industryIdentifiers)
    aCoder.encode(allowAnonLogging, forKey: SerializationKeys.allowAnonLogging)
    aCoder.encode(infoLink, forKey: SerializationKeys.infoLink)
    aCoder.encode(pageCount, forKey: SerializationKeys.pageCount)
    aCoder.encode(publisher, forKey: SerializationKeys.publisher)
    aCoder.encode(printType, forKey: SerializationKeys.printType)
    aCoder.encode(canonicalVolumeLink, forKey: SerializationKeys.canonicalVolumeLink)
    aCoder.encode(contentVersion, forKey: SerializationKeys.contentVersion)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(publishedDate, forKey: SerializationKeys.publishedDate)
  }

}
