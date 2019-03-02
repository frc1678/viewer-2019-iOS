//
//  CalculatedTeamInMatchData.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedTeamInMatchData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let lemonSuccessUndefended = "lemonSuccessUndefended"
    static let orangesScored = "orangesScored"
    static let orangeSuccessDefended = "orangeSuccessDefended"
    static let orangeSuccessL2 = "orangeSuccessL2"
    static let timeIncap = "timeIncap"
    static let lemonCycleAll = "lemonCycleAll"
    static let lemonsScored = "lemonsScored"
    static let lemonCycleL2 = "lemonCycleL2"
    static let orangeSuccessL3 = "orangeSuccessL3"
    static let orangeCycleL1 = "orangeCycleL1"
    static let orangeCycleL3 = "orangeCycleL3"
    static let lemonCycleL3 = "lemonCycleL3"
    static let lemonSuccessL2 = "lemonSuccessL2"
    static let lemonSuccessL3 = "lemonSuccessL3"
    static let lemonSuccessAll = "lemonSuccessAll"
    static let lemonCycleL1 = "lemonCycleL1"
    static let timeClimbing = "timeClimbing"
    static let orangeSuccessAll = "orangeSuccessAll"
    static let orangeCycleL2 = "orangeCycleL2"
    static let lemonSuccessL1 = "lemonSuccessL1"
    static let timeImpaired = "timeImpaired"
    static let orangeCycleAll = "orangeCycleAll"
    static let lemonLoadSuccess = "lemonLoadSuccess"
    static let lemonSuccessDefended = "lemonSuccessDefended"
    static let orangeSuccessL1 = "orangeSuccessL1"
    static let orangeSuccessUndefended = "orangeSuccessUndefended"
    static let lemonsSpilled = "lemonsSpilled"
  }

  // MARK: Properties
  public var lemonSuccessUndefended: Int?
  public var orangesScored: Int?
  public var orangeSuccessDefended: Int?
  public var orangeSuccessL2: Int?
  public var timeIncap: Int?
  public var lemonCycleAll: Int?
  public var lemonsScored: Int?
  public var lemonCycleL2: Int?
  public var orangeSuccessL3: Int?
  public var orangeCycleL1: Int?
  public var orangeCycleL3: Int?
  public var lemonCycleL3: Int?
  public var lemonSuccessL2: Int?
  public var lemonSuccessL3: Int?
  public var lemonSuccessAll: Int?
  public var lemonCycleL1: Int?
  public var timeClimbing: Int?
  public var orangeSuccessAll: Int?
  public var orangeCycleL2: Int?
  public var lemonSuccessL1: Int?
  public var timeImpaired: Int?
  public var orangeCycleAll: Int?
  public var lemonLoadSuccess: Int?
  public var lemonSuccessDefended: Int?
  public var orangeSuccessL1: Int?
  public var orangeSuccessUndefended: Int?
  public var lemonsSpilled: Int?

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
    lemonSuccessUndefended = json[SerializationKeys.lemonSuccessUndefended].int
    orangesScored = json[SerializationKeys.orangesScored].int
    orangeSuccessDefended = json[SerializationKeys.orangeSuccessDefended].int
    orangeSuccessL2 = json[SerializationKeys.orangeSuccessL2].int
    timeIncap = json[SerializationKeys.timeIncap].int
    lemonCycleAll = json[SerializationKeys.lemonCycleAll].int
    lemonsScored = json[SerializationKeys.lemonsScored].int
    lemonCycleL2 = json[SerializationKeys.lemonCycleL2].int
    orangeSuccessL3 = json[SerializationKeys.orangeSuccessL3].int
    orangeCycleL1 = json[SerializationKeys.orangeCycleL1].int
    orangeCycleL3 = json[SerializationKeys.orangeCycleL3].int
    lemonCycleL3 = json[SerializationKeys.lemonCycleL3].int
    lemonSuccessL2 = json[SerializationKeys.lemonSuccessL2].int
    lemonSuccessL3 = json[SerializationKeys.lemonSuccessL3].int
    lemonSuccessAll = json[SerializationKeys.lemonSuccessAll].int
    lemonCycleL1 = json[SerializationKeys.lemonCycleL1].int
    timeClimbing = json[SerializationKeys.timeClimbing].int
    orangeSuccessAll = json[SerializationKeys.orangeSuccessAll].int
    orangeCycleL2 = json[SerializationKeys.orangeCycleL2].int
    lemonSuccessL1 = json[SerializationKeys.lemonSuccessL1].int
    timeImpaired = json[SerializationKeys.timeImpaired].int
    orangeCycleAll = json[SerializationKeys.orangeCycleAll].int
    lemonLoadSuccess = json[SerializationKeys.lemonLoadSuccess].int
    lemonSuccessDefended = json[SerializationKeys.lemonSuccessDefended].int
    orangeSuccessL1 = json[SerializationKeys.orangeSuccessL1].int
    orangeSuccessUndefended = json[SerializationKeys.orangeSuccessUndefended].int
    lemonsSpilled = json[SerializationKeys.lemonsSpilled].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = lemonSuccessUndefended { dictionary[SerializationKeys.lemonSuccessUndefended] = value }
    if let value = orangesScored { dictionary[SerializationKeys.orangesScored] = value }
    if let value = orangeSuccessDefended { dictionary[SerializationKeys.orangeSuccessDefended] = value }
    if let value = orangeSuccessL2 { dictionary[SerializationKeys.orangeSuccessL2] = value }
    if let value = timeIncap { dictionary[SerializationKeys.timeIncap] = value }
    if let value = lemonCycleAll { dictionary[SerializationKeys.lemonCycleAll] = value }
    if let value = lemonsScored { dictionary[SerializationKeys.lemonsScored] = value }
    if let value = lemonCycleL2 { dictionary[SerializationKeys.lemonCycleL2] = value }
    if let value = orangeSuccessL3 { dictionary[SerializationKeys.orangeSuccessL3] = value }
    if let value = orangeCycleL1 { dictionary[SerializationKeys.orangeCycleL1] = value }
    if let value = orangeCycleL3 { dictionary[SerializationKeys.orangeCycleL3] = value }
    if let value = lemonCycleL3 { dictionary[SerializationKeys.lemonCycleL3] = value }
    if let value = lemonSuccessL2 { dictionary[SerializationKeys.lemonSuccessL2] = value }
    if let value = lemonSuccessL3 { dictionary[SerializationKeys.lemonSuccessL3] = value }
    if let value = lemonSuccessAll { dictionary[SerializationKeys.lemonSuccessAll] = value }
    if let value = lemonCycleL1 { dictionary[SerializationKeys.lemonCycleL1] = value }
    if let value = timeClimbing { dictionary[SerializationKeys.timeClimbing] = value }
    if let value = orangeSuccessAll { dictionary[SerializationKeys.orangeSuccessAll] = value }
    if let value = orangeCycleL2 { dictionary[SerializationKeys.orangeCycleL2] = value }
    if let value = lemonSuccessL1 { dictionary[SerializationKeys.lemonSuccessL1] = value }
    if let value = timeImpaired { dictionary[SerializationKeys.timeImpaired] = value }
    if let value = orangeCycleAll { dictionary[SerializationKeys.orangeCycleAll] = value }
    if let value = lemonLoadSuccess { dictionary[SerializationKeys.lemonLoadSuccess] = value }
    if let value = lemonSuccessDefended { dictionary[SerializationKeys.lemonSuccessDefended] = value }
    if let value = orangeSuccessL1 { dictionary[SerializationKeys.orangeSuccessL1] = value }
    if let value = orangeSuccessUndefended { dictionary[SerializationKeys.orangeSuccessUndefended] = value }
    if let value = lemonsSpilled { dictionary[SerializationKeys.lemonsSpilled] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.lemonSuccessUndefended = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessUndefended) as? Int
    self.orangesScored = aDecoder.decodeObject(forKey: SerializationKeys.orangesScored) as? Int
    self.orangeSuccessDefended = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessDefended) as? Int
    self.orangeSuccessL2 = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessL2) as? Int
    self.timeIncap = aDecoder.decodeObject(forKey: SerializationKeys.timeIncap) as? Int
    self.lemonCycleAll = aDecoder.decodeObject(forKey: SerializationKeys.lemonCycleAll) as? Int
    self.lemonsScored = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScored) as? Int
    self.lemonCycleL2 = aDecoder.decodeObject(forKey: SerializationKeys.lemonCycleL2) as? Int
    self.orangeSuccessL3 = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessL3) as? Int
    self.orangeCycleL1 = aDecoder.decodeObject(forKey: SerializationKeys.orangeCycleL1) as? Int
    self.orangeCycleL3 = aDecoder.decodeObject(forKey: SerializationKeys.orangeCycleL3) as? Int
    self.lemonCycleL3 = aDecoder.decodeObject(forKey: SerializationKeys.lemonCycleL3) as? Int
    self.lemonSuccessL2 = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessL2) as? Int
    self.lemonSuccessL3 = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessL3) as? Int
    self.lemonSuccessAll = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessAll) as? Int
    self.lemonCycleL1 = aDecoder.decodeObject(forKey: SerializationKeys.lemonCycleL1) as? Int
    self.timeClimbing = aDecoder.decodeObject(forKey: SerializationKeys.timeClimbing) as? Int
    self.orangeSuccessAll = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessAll) as? Int
    self.orangeCycleL2 = aDecoder.decodeObject(forKey: SerializationKeys.orangeCycleL2) as? Int
    self.lemonSuccessL1 = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessL1) as? Int
    self.timeImpaired = aDecoder.decodeObject(forKey: SerializationKeys.timeImpaired) as? Int
    self.orangeCycleAll = aDecoder.decodeObject(forKey: SerializationKeys.orangeCycleAll) as? Int
    self.lemonLoadSuccess = aDecoder.decodeObject(forKey: SerializationKeys.lemonLoadSuccess) as? Int
    self.lemonSuccessDefended = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessDefended) as? Int
    self.orangeSuccessL1 = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessL1) as? Int
    self.orangeSuccessUndefended = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessUndefended) as? Int
    self.lemonsSpilled = aDecoder.decodeObject(forKey: SerializationKeys.lemonsSpilled) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(lemonSuccessUndefended, forKey: SerializationKeys.lemonSuccessUndefended)
    aCoder.encode(orangesScored, forKey: SerializationKeys.orangesScored)
    aCoder.encode(orangeSuccessDefended, forKey: SerializationKeys.orangeSuccessDefended)
    aCoder.encode(orangeSuccessL2, forKey: SerializationKeys.orangeSuccessL2)
    aCoder.encode(timeIncap, forKey: SerializationKeys.timeIncap)
    aCoder.encode(lemonCycleAll, forKey: SerializationKeys.lemonCycleAll)
    aCoder.encode(lemonsScored, forKey: SerializationKeys.lemonsScored)
    aCoder.encode(lemonCycleL2, forKey: SerializationKeys.lemonCycleL2)
    aCoder.encode(orangeSuccessL3, forKey: SerializationKeys.orangeSuccessL3)
    aCoder.encode(orangeCycleL1, forKey: SerializationKeys.orangeCycleL1)
    aCoder.encode(orangeCycleL3, forKey: SerializationKeys.orangeCycleL3)
    aCoder.encode(lemonCycleL3, forKey: SerializationKeys.lemonCycleL3)
    aCoder.encode(lemonSuccessL2, forKey: SerializationKeys.lemonSuccessL2)
    aCoder.encode(lemonSuccessL3, forKey: SerializationKeys.lemonSuccessL3)
    aCoder.encode(lemonSuccessAll, forKey: SerializationKeys.lemonSuccessAll)
    aCoder.encode(lemonCycleL1, forKey: SerializationKeys.lemonCycleL1)
    aCoder.encode(timeClimbing, forKey: SerializationKeys.timeClimbing)
    aCoder.encode(orangeSuccessAll, forKey: SerializationKeys.orangeSuccessAll)
    aCoder.encode(orangeCycleL2, forKey: SerializationKeys.orangeCycleL2)
    aCoder.encode(lemonSuccessL1, forKey: SerializationKeys.lemonSuccessL1)
    aCoder.encode(timeImpaired, forKey: SerializationKeys.timeImpaired)
    aCoder.encode(orangeCycleAll, forKey: SerializationKeys.orangeCycleAll)
    aCoder.encode(lemonLoadSuccess, forKey: SerializationKeys.lemonLoadSuccess)
    aCoder.encode(lemonSuccessDefended, forKey: SerializationKeys.lemonSuccessDefended)
    aCoder.encode(orangeSuccessL1, forKey: SerializationKeys.orangeSuccessL1)
    aCoder.encode(orangeSuccessUndefended, forKey: SerializationKeys.orangeSuccessUndefended)
    aCoder.encode(lemonsSpilled, forKey: SerializationKeys.lemonsSpilled)
  }

}
