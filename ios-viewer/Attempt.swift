//
//  Attempt.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Attempt: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let layer = "layer"
    static let endTime = "endTime"
    static let startTime = "startTime"
    static let didSucceed = "didSucceed"
  }

  // MARK: Properties
  public var status: String?
  public var layer: Int?
  public var endTime: Int?
  public var startTime: Int?
  public var didSucceed: Bool? = false

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
    status = json[SerializationKeys.status].string
    layer = json[SerializationKeys.layer].int
    endTime = json[SerializationKeys.endTime].int
    startTime = json[SerializationKeys.startTime].int
    didSucceed = json[SerializationKeys.didSucceed].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = layer { dictionary[SerializationKeys.layer] = value }
    if let value = endTime { dictionary[SerializationKeys.endTime] = value }
    if let value = startTime { dictionary[SerializationKeys.startTime] = value }
    dictionary[SerializationKeys.didSucceed] = didSucceed
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.layer = aDecoder.decodeObject(forKey: SerializationKeys.layer) as? Int
    self.endTime = aDecoder.decodeObject(forKey: SerializationKeys.endTime) as? Int
    self.startTime = aDecoder.decodeObject(forKey: SerializationKeys.startTime) as? Int
    self.didSucceed = aDecoder.decodeBool(forKey: SerializationKeys.didSucceed)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(layer, forKey: SerializationKeys.layer)
    aCoder.encode(endTime, forKey: SerializationKeys.endTime)
    aCoder.encode(startTime, forKey: SerializationKeys.startTime)
    aCoder.encode(didSucceed, forKey: SerializationKeys.didSucceed)
  }

}
