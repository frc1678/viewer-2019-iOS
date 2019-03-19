//
//  CargoShipPreload.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CargoShipPreload: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let leftFar = "leftFar"
    static let leftNear = "leftNear"
    static let rightNear = "rightNear"
    static let leftMid = "leftMid"
    static let rightFar = "rightFar"
    static let rightMid = "rightMid"
  }

  // MARK: Properties
  public var leftFar: String?
  public var leftNear: String?
  public var rightNear: String?
  public var leftMid: String?
  public var rightFar: String?
  public var rightMid: String?

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
    leftFar = json[SerializationKeys.leftFar].string
    leftNear = json[SerializationKeys.leftNear].string
    rightNear = json[SerializationKeys.rightNear].string
    leftMid = json[SerializationKeys.leftMid].string
    rightFar = json[SerializationKeys.rightFar].string
    rightMid = json[SerializationKeys.rightMid].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = leftFar { dictionary[SerializationKeys.leftFar] = value }
    if let value = leftNear { dictionary[SerializationKeys.leftNear] = value }
    if let value = rightNear { dictionary[SerializationKeys.rightNear] = value }
    if let value = leftMid { dictionary[SerializationKeys.leftMid] = value }
    if let value = rightFar { dictionary[SerializationKeys.rightFar] = value }
    if let value = rightMid { dictionary[SerializationKeys.rightMid] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.leftFar = aDecoder.decodeObject(forKey: SerializationKeys.leftFar) as? String
    self.leftNear = aDecoder.decodeObject(forKey: SerializationKeys.leftNear) as? String
    self.rightNear = aDecoder.decodeObject(forKey: SerializationKeys.rightNear) as? String
    self.leftMid = aDecoder.decodeObject(forKey: SerializationKeys.leftMid) as? String
    self.rightFar = aDecoder.decodeObject(forKey: SerializationKeys.rightFar) as? String
    self.rightMid = aDecoder.decodeObject(forKey: SerializationKeys.rightMid) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(leftFar, forKey: SerializationKeys.leftFar)
    aCoder.encode(leftNear, forKey: SerializationKeys.leftNear)
    aCoder.encode(rightNear, forKey: SerializationKeys.rightNear)
    aCoder.encode(leftMid, forKey: SerializationKeys.leftMid)
    aCoder.encode(rightFar, forKey: SerializationKeys.rightFar)
    aCoder.encode(rightMid, forKey: SerializationKeys.rightMid)
  }

}
