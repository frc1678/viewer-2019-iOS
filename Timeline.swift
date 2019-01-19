//
//  Timeline.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Timeline: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let location = "location"
    static let didSucceed = "didSucceed"
    static let cause = "cause"
    static let side = "side"
    static let piece = "piece"
    static let actual = "actual"
    static let attempted = "attempted"
    static let level = "level"
    static let type = "type"
    static let structure = "structure"
    static let time = "time"
    static let wasDefended = "wasDefended"
  }

  // MARK: Properties
  public var location: String?
  public var didSucceed: Bool? = false
  public var cause: String?
  public var side: String?
  public var piece: String?
    public var actual: [String:Int]?
    public var attempted: [String:Int]?
  public var level: Int?
  public var type: String?
  public var structure: String?
  public var time: String?
  public var wasDefended: Bool? = false

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
    location = json[SerializationKeys.location].string
    didSucceed = json[SerializationKeys.didSucceed].boolValue
    cause = json[SerializationKeys.cause].string
    side = json[SerializationKeys.side].string
    piece = json[SerializationKeys.piece].string
    actual = (json[SerializationKeys.actual].dictionaryObject as! [String : Int])
    attempted = (json[SerializationKeys.attempted].dictionaryObject as! [String : Int])
    level = json[SerializationKeys.level].int
    type = json[SerializationKeys.type].string
    structure = json[SerializationKeys.structure].string
    time = json[SerializationKeys.time].string
    wasDefended = json[SerializationKeys.wasDefended].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = location { dictionary[SerializationKeys.location] = value }
    dictionary[SerializationKeys.didSucceed] = didSucceed
    if let value = cause { dictionary[SerializationKeys.cause] = value }
    if let value = side { dictionary[SerializationKeys.side] = value }
    if let value = piece { dictionary[SerializationKeys.piece] = value }
    if let value = actual { dictionary[SerializationKeys.actual] = value }
    if let value = attempted { dictionary[SerializationKeys.attempted] = value }
    if let value = level { dictionary[SerializationKeys.level] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = structure { dictionary[SerializationKeys.structure] = value }
    if let value = time { dictionary[SerializationKeys.time] = value }
    dictionary[SerializationKeys.wasDefended] = wasDefended
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.location = aDecoder.decodeObject(forKey: SerializationKeys.location) as? String
    self.didSucceed = aDecoder.decodeBool(forKey: SerializationKeys.didSucceed)
    self.cause = aDecoder.decodeObject(forKey: SerializationKeys.cause) as? String
    self.side = aDecoder.decodeObject(forKey: SerializationKeys.side) as? String
    self.piece = aDecoder.decodeObject(forKey: SerializationKeys.piece) as? String
    self.actual = aDecoder.decodeObject(forKey: SerializationKeys.actual) as? [String:Int]
    self.attempted = aDecoder.decodeObject(forKey: SerializationKeys.attempted) as? [String:Int]
    self.level = aDecoder.decodeObject(forKey: SerializationKeys.level) as? Int
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.structure = aDecoder.decodeObject(forKey: SerializationKeys.structure) as? String
    self.time = aDecoder.decodeObject(forKey: SerializationKeys.time) as? String
    self.wasDefended = aDecoder.decodeBool(forKey: SerializationKeys.wasDefended)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(location, forKey: SerializationKeys.location)
    aCoder.encode(didSucceed, forKey: SerializationKeys.didSucceed)
    aCoder.encode(cause, forKey: SerializationKeys.cause)
    aCoder.encode(side, forKey: SerializationKeys.side)
    aCoder.encode(piece, forKey: SerializationKeys.piece)
    aCoder.encode(actual, forKey: SerializationKeys.actual)
    aCoder.encode(attempted, forKey: SerializationKeys.attempted)
    aCoder.encode(level, forKey: SerializationKeys.level)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(structure, forKey: SerializationKeys.structure)
    aCoder.encode(time, forKey: SerializationKeys.time)
    aCoder.encode(wasDefended, forKey: SerializationKeys.wasDefended)
  }

}
