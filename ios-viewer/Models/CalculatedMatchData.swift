//
//  CalculatedMatchData.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedMatchData: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let redPredictedClimbPoints = "redPredictedClimbPoints"
    static let bluePredictedClimbPoints = "bluePredictedClimbPoints"
    static let blueChanceRocketRP = "blueChanceRocketRP"
    static let blueChanceWin = "blueChanceWin"
    static let redChanceClimbRP = "redChanceClimbRP"
    static let redChanceRocketRP = "redChanceRocketRP"
    static let redChanceWin = "redChanceWin"
    static let bluePredictedScore = "bluePredictedScore"
    static let blueChanceClimbRP = "blueChanceClimbRP"
    static let redPredictedScore = "redPredictedScore"
  }

  // MARK: Properties
  public var redPredictedClimbPoints: Int?
  public var bluePredictedClimbPoints: Int?
  public var blueChanceRocketRP: Int?
  public var blueChanceWin: Int?
  public var redChanceClimbRP: Int?
  public var redChanceRocketRP: Int?
  public var redChanceWin: Int?
  @objc public var bluePredictedScore: Int = -1
  public var blueChanceClimbRP: Int?
  @objc public var redPredictedScore: Int = -1

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
    redPredictedClimbPoints = json[SerializationKeys.redPredictedClimbPoints].int
    bluePredictedClimbPoints = json[SerializationKeys.bluePredictedClimbPoints].int
    blueChanceRocketRP = json[SerializationKeys.blueChanceRocketRP].int
    blueChanceWin = json[SerializationKeys.blueChanceWin].int
    redChanceClimbRP = json[SerializationKeys.redChanceClimbRP].int
    redChanceRocketRP = json[SerializationKeys.redChanceRocketRP].int
    redChanceWin = json[SerializationKeys.redChanceWin].int
    bluePredictedScore = json[SerializationKeys.bluePredictedScore].intValue
    blueChanceClimbRP = json[SerializationKeys.blueChanceClimbRP].int
    redPredictedScore = json[SerializationKeys.redPredictedScore].intValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = redPredictedClimbPoints { dictionary[SerializationKeys.redPredictedClimbPoints] = value }
    if let value = bluePredictedClimbPoints { dictionary[SerializationKeys.bluePredictedClimbPoints] = value }
    if let value = blueChanceRocketRP { dictionary[SerializationKeys.blueChanceRocketRP] = value }
    if let value = blueChanceWin { dictionary[SerializationKeys.blueChanceWin] = value }
    if let value = redChanceClimbRP { dictionary[SerializationKeys.redChanceClimbRP] = value }
    if let value = redChanceRocketRP { dictionary[SerializationKeys.redChanceRocketRP] = value }
    if let value = redChanceWin { dictionary[SerializationKeys.redChanceWin] = value }
    dictionary[SerializationKeys.bluePredictedScore] = bluePredictedScore
    if let value = blueChanceClimbRP { dictionary[SerializationKeys.blueChanceClimbRP] = value }
    dictionary[SerializationKeys.redPredictedScore] = redPredictedScore
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.redPredictedClimbPoints = aDecoder.decodeObject(forKey: SerializationKeys.redPredictedClimbPoints) as? Int
    self.bluePredictedClimbPoints = aDecoder.decodeObject(forKey: SerializationKeys.bluePredictedClimbPoints) as? Int
    self.blueChanceRocketRP = aDecoder.decodeObject(forKey: SerializationKeys.blueChanceRocketRP) as? Int
    self.blueChanceWin = aDecoder.decodeObject(forKey: SerializationKeys.blueChanceWin) as? Int
    self.redChanceClimbRP = aDecoder.decodeObject(forKey: SerializationKeys.redChanceClimbRP) as? Int
    self.redChanceRocketRP = aDecoder.decodeObject(forKey: SerializationKeys.redChanceRocketRP) as? Int
    self.redChanceWin = aDecoder.decodeObject(forKey: SerializationKeys.redChanceWin) as? Int
    self.bluePredictedScore = aDecoder.decodeInteger(forKey: SerializationKeys.bluePredictedScore)
    self.blueChanceClimbRP = aDecoder.decodeObject(forKey: SerializationKeys.blueChanceClimbRP) as? Int
    self.redPredictedScore = aDecoder.decodeInteger(forKey: SerializationKeys.redPredictedScore)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(redPredictedClimbPoints, forKey: SerializationKeys.redPredictedClimbPoints)
    aCoder.encode(bluePredictedClimbPoints, forKey: SerializationKeys.bluePredictedClimbPoints)
    aCoder.encode(blueChanceRocketRP, forKey: SerializationKeys.blueChanceRocketRP)
    aCoder.encode(blueChanceWin, forKey: SerializationKeys.blueChanceWin)
    aCoder.encode(redChanceClimbRP, forKey: SerializationKeys.redChanceClimbRP)
    aCoder.encode(redChanceRocketRP, forKey: SerializationKeys.redChanceRocketRP)
    aCoder.encode(redChanceWin, forKey: SerializationKeys.redChanceWin)
    aCoder.encode(bluePredictedScore, forKey: SerializationKeys.bluePredictedScore)
    aCoder.encode(blueChanceClimbRP, forKey: SerializationKeys.blueChanceClimbRP)
    aCoder.encode(redPredictedScore, forKey: SerializationKeys.redPredictedScore)
  }

}
