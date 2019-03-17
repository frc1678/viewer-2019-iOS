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
    static let lemonLoadSuccess = "lemonLoadSuccess"
    static let lemonsSpilled = "lemonsSpilled"
    static let lemonsScored = "lemonsScored"
    static let lemonsScoredL1 = "lemonsScoredL1"
    static let lemonsScoredL2 = "lemonsScoredL2"
    static let lemonsScoredL3 = "lemonsScoredL3"
    static let lemonsScoredSandstorm = "lemonsScoredSandstorm"
    static let lemonsScoredTeleL1 = "lemonsScoredTeleL1"
    static let lemonsScoredTeleL2 = "lemonsScoredTeleL2"
    static let lemonsScoredTeleL3 = "lemonsScoredTeleL2"
    static let lemonSuccessDefended = "lemonSuccessDefended"
    static let lemonSuccessUndefended = "lemonSuccessUndefended"
    static let lemonSuccessL1 = "lemonSuccessL1"
    static let lemonSuccessL2 = "lemonSuccessL2"
    static let lemonSuccessL3 = "lemonSuccessL3"
    static let lemonSuccessAll = "lemonSuccessAll"
    static let lemonCycleAll = "lemonCycleAll"
    static let lemonCycleL1 = "lemonCycleL1"
    static let lemonCycleL2 = "lemonCycleL2"
    static let lemonCycleL3 = "lemonCycleL3"
    static let orangesScored = "orangesScored"
    static let orangesScoredL1 = "orangesScoredL1"
    static let orangesScoredL2 = "orangesScoredL2"
    static let orangesScoredL3 = "orangesScoredL3"
    static let orangesScoredSandstorm = "orangesScoredSandstorm"
    static let orangesScoredTeleL1 = "orangesScoredTeleL1"
    static let orangesScoredTeleL2 = "orangesScoredTeleL2"
    static let orangesScoredTeleL3 = "orangesScoredTeleL3"
    static let orangeSuccessDefended = "orangeSuccessDefended"
    static let orangeSuccessUndefended = "orangeSuccessUndefended"
    static let orangeSuccessL1 = "orangeSuccessL1"
    static let orangeSuccessL2 = "orangeSuccessL2"
    static let orangeSuccessL3 = "orangeSuccessL3"
    static let orangeSuccessAll = "orangeSuccessAll"
    static let orangeCycleAll = "orangeCycleAll"
    static let orangeCycleL1 = "orangeCycleL1"
    static let orangeCycleL2 = "orangeCycleL2"
    static let orangeCycleL3 = "orangeCycleL3"
    static let timeIncap = "timeIncap"
    static let timeImpaired = "timeImpaired"
    static let timeClimbing = "timeClimbing"
    static let selfClimbLevel = "selfClimbLevel"
    static let robot1ClimbLevel = "robot1ClimbLevel"
    static let robot2ClimbLevel = "robot2ClimbLevel"
  }

  // MARK: Properties
  public var lemonLoadSuccess: Int?
  public var lemonsSpilled: Int?
  public var lemonsScored: Int?
  public var lemonsScoredL1: Int?
  public var lemonsScoredL2: Int?
  public var lemonsScoredL3: Int?
  public var lemonsScoredSandstorm: Int?
  public var lemonsScoredTeleL1: Int?
  public var lemonsScoredTeleL2: Int?
  public var lemonsScoredTeleL3: Int?
  public var lemonSuccessDefended: Int?
  public var lemonSuccessUndefended: Int?
  public var lemonSuccessL1: Int?
  public var lemonSuccessL2: Int?
  public var lemonSuccessL3: Int?
  public var lemonSuccessAll: Int?
  public var lemonCycleAll: Int?
  public var lemonCycleL1: Int?
  public var lemonCycleL2: Int?
  public var lemonCycleL3: Int?
  public var orangesScored: Int?
  public var orangesScoredL1: Int?
  public var orangesScoredL2: Int?
  public var orangesScoredL3: Int?
  public var orangesScoredSandstorm: Int?
  public var orangesScoredTeleL1: Int?
  public var orangesScoredTeleL2: Int?
  public var orangesScoredTeleL3: Int?
  public var orangeSuccessDefended: Int?
  public var orangeSuccessUndefended: Int?
  public var orangeSuccessL1: Int?
  public var orangeSuccessL2: Int?
  public var orangeSuccessL3: Int?
  public var orangeSuccessAll: Int?
  public var orangeCycleAll: Int?
  public var orangeCycleL1: Int?
  public var orangeCycleL2: Int?
  public var orangeCycleL3: Int?
  public var timeIncap: Int?
  public var timeImpaired: Int?
  public var timeClimbing: Int?
  public var selfClimbLevel: Int?
  public var robot1ClimbLevel: Int?
  public var robot2ClimbLevel: Int?
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
    orangesScoredL1 = json[SerializationKeys.orangesScoredL1].int
    orangesScoredL2 = json[SerializationKeys.orangesScoredL2].int
    orangesScoredL3 = json[SerializationKeys.orangesScoredL3].int
    orangesScoredSandstorm = json[SerializationKeys.orangesScoredSandstorm].int
    orangesScoredTeleL1 = json[SerializationKeys.orangesScoredTeleL1].int
    orangesScoredTeleL2 = json[SerializationKeys.orangesScoredTeleL2].int
    orangesScoredTeleL3 = json[SerializationKeys.orangesScoredTeleL3].int
    orangeSuccessDefended = json[SerializationKeys.orangeSuccessDefended].int
    orangeSuccessL2 = json[SerializationKeys.orangeSuccessL2].int
    timeIncap = json[SerializationKeys.timeIncap].int
    lemonCycleAll = json[SerializationKeys.lemonCycleAll].int
    lemonsScored = json[SerializationKeys.lemonsScored].int
    lemonsScoredL1 = json[SerializationKeys.lemonsScoredL1].intValue
    lemonsScoredL2 = json[SerializationKeys.lemonsScoredL2].intValue
    lemonsScoredL3 = json[SerializationKeys.lemonsScoredL3].intValue
    lemonsScoredSandstorm = json[SerializationKeys.lemonsScoredSandstorm].intValue
    lemonsScoredTeleL1 = json[SerializationKeys.lemonsScoredTeleL1].intValue
    lemonsScoredTeleL2 = json[SerializationKeys.lemonsScoredTeleL2].intValue
    lemonsScoredTeleL3 = json [SerializationKeys.lemonsScoredTeleL3].intValue
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
    selfClimbLevel = json[SerializationKeys.selfClimbLevel].int
    robot1ClimbLevel = json[SerializationKeys.robot1ClimbLevel].int
    robot2ClimbLevel = json[SerializationKeys.robot2ClimbLevel].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = lemonSuccessUndefended { dictionary[SerializationKeys.lemonSuccessUndefended] = value }
    if let value = orangesScored { dictionary[SerializationKeys.orangesScored] = value }
    if let value = orangesScoredL1 { dictionary[SerializationKeys.orangesScoredL1] = value }
    if let value = orangesScoredL2 { dictionary[SerializationKeys.orangesScoredL2] = value }
    if let value = orangesScoredL3 { dictionary[SerializationKeys.orangesScoredL3] = value }
    if let value = orangesScoredSandstorm { dictionary[SerializationKeys.orangesScoredSandstorm] = value }
    if let value = orangesScoredTeleL1 { dictionary[SerializationKeys.orangesScoredTeleL1] = value }
    if let value = orangesScoredTeleL2 { dictionary[SerializationKeys.orangesScoredTeleL2] = value }
    if let value = orangesScoredTeleL3 { dictionary[SerializationKeys.orangesScoredTeleL3] = value }
    if let value = orangeSuccessDefended { dictionary[SerializationKeys.orangeSuccessDefended] = value }
    if let value = orangeSuccessL2 { dictionary[SerializationKeys.orangeSuccessL2] = value }
    if let value = timeIncap { dictionary[SerializationKeys.timeIncap] = value }
    if let value = lemonCycleAll { dictionary[SerializationKeys.lemonCycleAll] = value }
    if let value = lemonsScored { dictionary[SerializationKeys.lemonsScored] = value }
    if let value = lemonsScoredL1 { dictionary[SerializationKeys.lemonsScoredL1] = value }
    if let value = lemonsScoredL2 { dictionary[SerializationKeys.lemonsScoredL2] = value }
    if let value = lemonsScoredL3 { dictionary[SerializationKeys.lemonsScoredL3] = value }
    if let value = lemonsScoredSandstorm { dictionary[SerializationKeys.lemonsScoredSandstorm] = value }
    if let value = lemonsScoredTeleL1 { dictionary[SerializationKeys.lemonsScoredTeleL1] = value }
    if let value = lemonsScoredTeleL2 { dictionary[SerializationKeys.lemonsScoredTeleL2] = value }
    if let value = lemonsScoredTeleL3 { dictionary[SerializationKeys.lemonsScoredTeleL3] = value }
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
    if let value = selfClimbLevel { dictionary[SerializationKeys.selfClimbLevel] = value}
    if let value = robot1ClimbLevel { dictionary[SerializationKeys.robot1ClimbLevel] = value}
    if let value = robot2ClimbLevel { dictionary[SerializationKeys.robot2ClimbLevel] = value}
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.lemonSuccessUndefended = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessUndefended) as? Int
    self.orangesScored = aDecoder.decodeObject(forKey: SerializationKeys.orangesScored) as? Int
    self.orangesScoredL1 = aDecoder.decodeObject(forKey: SerializationKeys.orangesScoredL1) as? Int
    self.orangesScoredL2 = aDecoder.decodeObject(forKey: SerializationKeys.orangesScoredL2) as? Int
    self.orangesScoredL3 = aDecoder.decodeObject(forKey: SerializationKeys.orangesScoredL3) as? Int
    self.orangesScoredSandstorm = aDecoder.decodeObject(forKey: SerializationKeys.orangesScoredSandstorm) as? Int
    self.orangesScoredTeleL1 = aDecoder.decodeObject(forKey: SerializationKeys.orangesScoredTeleL1) as? Int
    self.orangesScoredTeleL2 = aDecoder.decodeObject(forKey: SerializationKeys.orangesScoredTeleL2) as? Int
    self.orangesScoredTeleL3 = aDecoder.decodeObject(forKey: SerializationKeys.orangesScoredTeleL3) as? Int
    self.orangeSuccessDefended = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessDefended) as? Int
    self.orangeSuccessL2 = aDecoder.decodeObject(forKey: SerializationKeys.orangeSuccessL2) as? Int
    self.timeIncap = aDecoder.decodeObject(forKey: SerializationKeys.timeIncap) as? Int
    self.lemonCycleAll = aDecoder.decodeObject(forKey: SerializationKeys.lemonCycleAll) as? Int
    self.lemonsScored = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScored) as? Int
    self.lemonsScoredL1 = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScoredL1) as? Int
    self.lemonsScoredL2 = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScoredL2) as? Int
    self.lemonsScoredL3 = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScoredL3) as? Int
    self.lemonsScoredSandstorm = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScoredSandstorm) as? Int
    self.lemonsScoredTeleL1 = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScoredTeleL1) as? Int
    self.lemonsScoredTeleL2 = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScoredTeleL2) as? Int
    self.lemonsScoredTeleL3 = aDecoder.decodeObject(forKey: SerializationKeys.lemonsScoredTeleL3) as? Int
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
    self.selfClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.selfClimbLevel) as? Int
    self.robot1ClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.robot1ClimbLevel) as? Int
    self.robot2ClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.robot2ClimbLevel) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(lemonSuccessUndefended, forKey: SerializationKeys.lemonSuccessUndefended)
    aCoder.encode(orangesScored, forKey: SerializationKeys.orangesScored)
    aCoder.encode(orangesScoredL1, forKey: SerializationKeys.orangesScoredL1)
    aCoder.encode(orangesScoredL2, forKey: SerializationKeys.orangesScoredL2)
    aCoder.encode(orangesScoredL3, forKey: SerializationKeys.orangesScoredL3)
    aCoder.encode(orangesScoredSandstorm, forKey: SerializationKeys.orangesScoredSandstorm)
    aCoder.encode(orangesScoredTeleL1, forKey: SerializationKeys.orangesScoredTeleL1)
    aCoder.encode(orangesScoredTeleL2, forKey: SerializationKeys.orangesScoredTeleL2)
    aCoder.encode(orangesScoredTeleL3, forKey: SerializationKeys.orangesScoredTeleL3)
    aCoder.encode(orangeSuccessDefended, forKey: SerializationKeys.orangeSuccessDefended)
    aCoder.encode(orangeSuccessL2, forKey: SerializationKeys.orangeSuccessL2)
    aCoder.encode(timeIncap, forKey: SerializationKeys.timeIncap)
    aCoder.encode(lemonCycleAll, forKey: SerializationKeys.lemonCycleAll)
    aCoder.encode(lemonsScored, forKey: SerializationKeys.lemonsScored)
    aCoder.encode(lemonsScoredL1, forKey: SerializationKeys.lemonsScoredL1)
    aCoder.encode(lemonsScoredL2, forKey: SerializationKeys.lemonsScoredL2)
    aCoder.encode(lemonsScoredL3, forKey: SerializationKeys.lemonsScoredL3)
    aCoder.encode(lemonsScoredSandstorm, forKey: SerializationKeys.lemonsScoredSandstorm)
    aCoder.encode(lemonsScoredTeleL1, forKey: SerializationKeys.lemonsScoredTeleL1)
    aCoder.encode(lemonsScoredTeleL2, forKey: SerializationKeys.lemonsScoredTeleL2)
    aCoder.encode(lemonsScoredTeleL3, forKey: SerializationKeys.lemonsScoredTeleL3)
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
    aCoder.encode(selfClimbLevel, forKey: SerializationKeys.selfClimbLevel)
    aCoder.encode(robot1ClimbLevel, forKey: SerializationKeys.robot1ClimbLevel)
    aCoder.encode(robot2ClimbLevel, forKey: SerializationKeys.robot2ClimbLevel)
  }

}
