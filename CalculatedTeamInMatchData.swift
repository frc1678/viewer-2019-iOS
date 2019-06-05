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
    static let pinningFouls = "pinningFouls"
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
    static let cargoScored = "cargoScored"
    static let cargoScoredL1 = "cargoScoredL1"
    static let cargoScoredL2 = "cargoScoredL2"
    static let cargoScoredL3 = "cargoScoredL3"
    static let cargoScoredSandstorm = "cargoScoredSandstorm"
    static let cargoScoredTeleL1 = "cargoScoredTeleL1"
    static let cargoScoredTeleL2 = "cargoScoredTeleL2"
    static let cargoScoredTeleL3 = "cargoScoredTeleL3"
    static let cargoSuccessDefended = "cargoSuccessDefended"
    static let cargoSuccessUndefended = "cargoSuccessUndefended"
    static let cargoSuccessL1 = "cargoSuccessL1"
    static let cargoSuccessL2 = "cargoSuccessL2"
    static let cargoSuccessL3 = "cargoSuccessL3"
    static let cargoSuccessAll = "cargoSuccessAll"
    static let cargoCycleAll = "cargoCycleAll"
    static let cargoCycleL1 = "cargoCycleL1"
    static let cargoCycleL2 = "cargoCycleL2"
    static let cargoCycleL3 = "cargoCycleL3"
    static let timeIncap = "timeIncap"
    static let timeClimbing = "timeClimbing"
    static let selfClimbLevel = "selfClimbLevel"
    static let robot1ClimbLevel = "robot1ClimbLevel"
    static let robot2ClimbLevel = "robot2ClimbLevel"
    static let timeDefending = "timeDefending"
    static let totalFailedCyclesCaused = "totalFailedCyclesCaused"
    static let pointsPrevented = "pointsPrevented"
    static let lemonPointsPrevented = "lemonPointsPrevented"
    static let cargoPointsPrevented = "cargoPointsPrevented"
  }

  // MARK: Properties
  public var lemonLoadSuccess: Int?
  public var pinningFouls: Int?
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
  public var cargoScored: Int?
  public var cargoScoredL1: Int?
  public var cargoScoredL2: Int?
  public var cargoScoredL3: Int?
  public var cargoScoredSandstorm: Int?
  public var cargoScoredTeleL1: Int?
  public var cargoScoredTeleL2: Int?
  public var cargoScoredTeleL3: Int?
  public var cargoSuccessDefended: Int?
  public var cargoSuccessUndefended: Int?
  public var cargoSuccessL1: Int?
  public var cargoSuccessL2: Int?
  public var cargoSuccessL3: Int?
  public var cargoSuccessAll: Int?
  public var cargoCycleAll: Int?
  public var cargoCycleL1: Int?
  public var cargoCycleL2: Int?
  public var cargoCycleL3: Int?
  public var timeIncap: Float?
  public var timeClimbing: Float?
  public var selfClimbLevel: Int?
  public var robot1ClimbLevel: Int?
  public var robot2ClimbLevel: Int?
  public var timeDefending: Float?
  public var totalFailedCyclesCaused: Int?
  public var pointsPrevented: Float?
  public var lemonPointsPrevented: Float?
  public var cargoPointsPrevented: Float?
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
    cargoScored = json[SerializationKeys.cargoScored].int
    cargoScoredL1 = json[SerializationKeys.cargoScoredL1].int
    cargoScoredL2 = json[SerializationKeys.cargoScoredL2].int
    cargoScoredL3 = json[SerializationKeys.cargoScoredL3].int
    cargoScoredSandstorm = json[SerializationKeys.cargoScoredSandstorm].int
    cargoScoredTeleL1 = json[SerializationKeys.cargoScoredTeleL1].int
    cargoScoredTeleL2 = json[SerializationKeys.cargoScoredTeleL2].int
    cargoScoredTeleL3 = json[SerializationKeys.cargoScoredTeleL3].int
    cargoSuccessDefended = json[SerializationKeys.cargoSuccessDefended].int
    cargoSuccessL2 = json[SerializationKeys.cargoSuccessL2].int
    timeIncap = json[SerializationKeys.timeIncap].float
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
    cargoSuccessL3 = json[SerializationKeys.cargoSuccessL3].int
    cargoCycleL1 = json[SerializationKeys.cargoCycleL1].int
    cargoCycleL3 = json[SerializationKeys.cargoCycleL3].int
    lemonCycleL3 = json[SerializationKeys.lemonCycleL3].int
    lemonSuccessL2 = json[SerializationKeys.lemonSuccessL2].int
    lemonSuccessL3 = json[SerializationKeys.lemonSuccessL3].int
    lemonSuccessAll = json[SerializationKeys.lemonSuccessAll].int
    lemonCycleL1 = json[SerializationKeys.lemonCycleL1].int
    timeClimbing = json[SerializationKeys.timeClimbing].float
    cargoSuccessAll = json[SerializationKeys.cargoSuccessAll].int
    cargoCycleL2 = json[SerializationKeys.cargoCycleL2].int
    lemonSuccessL1 = json[SerializationKeys.lemonSuccessL1].int
    cargoCycleAll = json[SerializationKeys.cargoCycleAll].int
    lemonLoadSuccess = json[SerializationKeys.lemonLoadSuccess].int
    lemonSuccessDefended = json[SerializationKeys.lemonSuccessDefended].int
    cargoSuccessL1 = json[SerializationKeys.cargoSuccessL1].int
    cargoSuccessUndefended = json[SerializationKeys.cargoSuccessUndefended].int
    pinningFouls = json[SerializationKeys.pinningFouls].int
    selfClimbLevel = json[SerializationKeys.selfClimbLevel].int
    robot1ClimbLevel = json[SerializationKeys.robot1ClimbLevel].int
    robot2ClimbLevel = json[SerializationKeys.robot2ClimbLevel].int
    timeDefending = json[SerializationKeys.timeDefending].float
    totalFailedCyclesCaused = json[SerializationKeys.totalFailedCyclesCaused].int
    pointsPrevented = json[SerializationKeys.pointsPrevented].float
    lemonPointsPrevented = json[SerializationKeys.lemonPointsPrevented].float
    cargoPointsPrevented = json[SerializationKeys.cargoPointsPrevented].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = lemonSuccessUndefended { dictionary[SerializationKeys.lemonSuccessUndefended] = value }
    if let value = cargoScored { dictionary[SerializationKeys.cargoScored] = value }
    if let value = cargoScoredL1 { dictionary[SerializationKeys.cargoScoredL1] = value }
    if let value = cargoScoredL2 { dictionary[SerializationKeys.cargoScoredL2] = value }
    if let value = cargoScoredL3 { dictionary[SerializationKeys.cargoScoredL3] = value }
    if let value = cargoScoredSandstorm { dictionary[SerializationKeys.cargoScoredSandstorm] = value }
    if let value = cargoScoredTeleL1 { dictionary[SerializationKeys.cargoScoredTeleL1] = value }
    if let value = cargoScoredTeleL2 { dictionary[SerializationKeys.cargoScoredTeleL2] = value }
    if let value = cargoScoredTeleL3 { dictionary[SerializationKeys.cargoScoredTeleL3] = value }
    if let value = cargoSuccessDefended { dictionary[SerializationKeys.cargoSuccessDefended] = value }
    if let value = cargoSuccessL2 { dictionary[SerializationKeys.cargoSuccessL2] = value }
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
    if let value = cargoSuccessL3 { dictionary[SerializationKeys.cargoSuccessL3] = value }
    if let value = cargoCycleL1 { dictionary[SerializationKeys.cargoCycleL1] = value }
    if let value = cargoCycleL3 { dictionary[SerializationKeys.cargoCycleL3] = value }
    if let value = lemonCycleL3 { dictionary[SerializationKeys.lemonCycleL3] = value }
    if let value = lemonSuccessL2 { dictionary[SerializationKeys.lemonSuccessL2] = value }
    if let value = lemonSuccessL3 { dictionary[SerializationKeys.lemonSuccessL3] = value }
    if let value = lemonSuccessAll { dictionary[SerializationKeys.lemonSuccessAll] = value }
    if let value = lemonCycleL1 { dictionary[SerializationKeys.lemonCycleL1] = value }
    if let value = timeClimbing { dictionary[SerializationKeys.timeClimbing] = value }
    if let value = cargoSuccessAll { dictionary[SerializationKeys.cargoSuccessAll] = value }
    if let value = cargoCycleL2 { dictionary[SerializationKeys.cargoCycleL2] = value }
    if let value = lemonSuccessL1 { dictionary[SerializationKeys.lemonSuccessL1] = value }
    if let value = cargoCycleAll { dictionary[SerializationKeys.cargoCycleAll] = value }
    if let value = lemonLoadSuccess { dictionary[SerializationKeys.lemonLoadSuccess] = value }
    if let value = lemonSuccessDefended { dictionary[SerializationKeys.lemonSuccessDefended] = value }
    if let value = cargoSuccessL1 { dictionary[SerializationKeys.cargoSuccessL1] = value }
    if let value = cargoSuccessUndefended { dictionary[SerializationKeys.cargoSuccessUndefended] = value }
    if let value = pinningFouls { dictionary[SerializationKeys.pinningFouls] = value }
    if let value = selfClimbLevel { dictionary[SerializationKeys.selfClimbLevel] = value}
    if let value = robot1ClimbLevel { dictionary[SerializationKeys.robot1ClimbLevel] = value}
    if let value = robot2ClimbLevel { dictionary[SerializationKeys.robot2ClimbLevel] = value}
    if let value = timeDefending { dictionary[SerializationKeys.timeDefending] = value}
    if let value = totalFailedCyclesCaused { dictionary[SerializationKeys.totalFailedCyclesCaused] = value}
    if let value = pointsPrevented { dictionary[SerializationKeys.pointsPrevented] = value}
    if let value = lemonPointsPrevented { dictionary[SerializationKeys.lemonPointsPrevented] = value}
    if let value = cargoPointsPrevented { dictionary[SerializationKeys.cargoPointsPrevented] = value}
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.lemonSuccessUndefended = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessUndefended) as? Int
    self.cargoScored = aDecoder.decodeObject(forKey: SerializationKeys.cargoScored) as? Int
    self.cargoScoredL1 = aDecoder.decodeObject(forKey: SerializationKeys.cargoScoredL1) as? Int
    self.cargoScoredL2 = aDecoder.decodeObject(forKey: SerializationKeys.cargoScoredL2) as? Int
    self.cargoScoredL3 = aDecoder.decodeObject(forKey: SerializationKeys.cargoScoredL3) as? Int
    self.cargoScoredSandstorm = aDecoder.decodeObject(forKey: SerializationKeys.cargoScoredSandstorm) as? Int
    self.cargoScoredTeleL1 = aDecoder.decodeObject(forKey: SerializationKeys.cargoScoredTeleL1) as? Int
    self.cargoScoredTeleL2 = aDecoder.decodeObject(forKey: SerializationKeys.cargoScoredTeleL2) as? Int
    self.cargoScoredTeleL3 = aDecoder.decodeObject(forKey: SerializationKeys.cargoScoredTeleL3) as? Int
    self.cargoSuccessDefended = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessDefended) as? Int
    self.cargoSuccessL2 = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessL2) as? Int
    self.timeIncap = aDecoder.decodeObject(forKey: SerializationKeys.timeIncap) as? Float
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
    self.cargoSuccessL3 = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessL3) as? Int
    self.cargoCycleL1 = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleL1) as? Int
    self.cargoCycleL3 = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleL3) as? Int
    self.lemonCycleL3 = aDecoder.decodeObject(forKey: SerializationKeys.lemonCycleL3) as? Int
    self.lemonSuccessL2 = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessL2) as? Int
    self.lemonSuccessL3 = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessL3) as? Int
    self.lemonSuccessAll = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessAll) as? Int
    self.lemonCycleL1 = aDecoder.decodeObject(forKey: SerializationKeys.lemonCycleL1) as? Int
    self.timeClimbing = aDecoder.decodeObject(forKey: SerializationKeys.timeClimbing) as? Float
    self.cargoSuccessAll = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessAll) as? Int
    self.cargoCycleL2 = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleL2) as? Int
    self.lemonSuccessL1 = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessL1) as? Int
    self.cargoCycleAll = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleAll) as? Int
    self.lemonLoadSuccess = aDecoder.decodeObject(forKey: SerializationKeys.lemonLoadSuccess) as? Int
    self.lemonSuccessDefended = aDecoder.decodeObject(forKey: SerializationKeys.lemonSuccessDefended) as? Int
    self.cargoSuccessL1 = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessL1) as? Int
    self.cargoSuccessUndefended = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessUndefended) as? Int
    self.pinningFouls = aDecoder.decodeObject(forKey: SerializationKeys.pinningFouls) as? Int
    self.selfClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.selfClimbLevel) as? Int
    self.robot1ClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.robot1ClimbLevel) as? Int
    self.robot2ClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.robot2ClimbLevel) as? Int
    self.timeDefending = aDecoder.decodeObject(forKey: SerializationKeys.timeDefending) as? Float
    self.totalFailedCyclesCaused = aDecoder.decodeObject(forKey: SerializationKeys.totalFailedCyclesCaused) as? Int
    self.pointsPrevented = aDecoder.decodeObject(forKey: SerializationKeys.pointsPrevented) as? Float
    self.lemonPointsPrevented = aDecoder.decodeObject(forKey: SerializationKeys.lemonPointsPrevented) as? Float
    self.cargoPointsPrevented = aDecoder.decodeObject(forKey: SerializationKeys.cargoPointsPrevented) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(lemonSuccessUndefended, forKey: SerializationKeys.lemonSuccessUndefended)
    aCoder.encode(cargoScored, forKey: SerializationKeys.cargoScored)
    aCoder.encode(cargoScoredL1, forKey: SerializationKeys.cargoScoredL1)
    aCoder.encode(cargoScoredL2, forKey: SerializationKeys.cargoScoredL2)
    aCoder.encode(cargoScoredL3, forKey: SerializationKeys.cargoScoredL3)
    aCoder.encode(cargoScoredSandstorm, forKey: SerializationKeys.cargoScoredSandstorm)
    aCoder.encode(cargoScoredTeleL1, forKey: SerializationKeys.cargoScoredTeleL1)
    aCoder.encode(cargoScoredTeleL2, forKey: SerializationKeys.cargoScoredTeleL2)
    aCoder.encode(cargoScoredTeleL3, forKey: SerializationKeys.cargoScoredTeleL3)
    aCoder.encode(cargoSuccessDefended, forKey: SerializationKeys.cargoSuccessDefended)
    aCoder.encode(cargoSuccessL2, forKey: SerializationKeys.cargoSuccessL2)
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
    aCoder.encode(cargoSuccessL3, forKey: SerializationKeys.cargoSuccessL3)
    aCoder.encode(cargoCycleL1, forKey: SerializationKeys.cargoCycleL1)
    aCoder.encode(cargoCycleL3, forKey: SerializationKeys.cargoCycleL3)
    aCoder.encode(lemonCycleL3, forKey: SerializationKeys.lemonCycleL3)
    aCoder.encode(lemonSuccessL2, forKey: SerializationKeys.lemonSuccessL2)
    aCoder.encode(lemonSuccessL3, forKey: SerializationKeys.lemonSuccessL3)
    aCoder.encode(lemonSuccessAll, forKey: SerializationKeys.lemonSuccessAll)
    aCoder.encode(lemonCycleL1, forKey: SerializationKeys.lemonCycleL1)
    aCoder.encode(timeClimbing, forKey: SerializationKeys.timeClimbing)
    aCoder.encode(cargoSuccessAll, forKey: SerializationKeys.cargoSuccessAll)
    aCoder.encode(cargoCycleL2, forKey: SerializationKeys.cargoCycleL2)
    aCoder.encode(lemonSuccessL1, forKey: SerializationKeys.lemonSuccessL1)
    aCoder.encode(cargoCycleAll, forKey: SerializationKeys.cargoCycleAll)
    aCoder.encode(lemonLoadSuccess, forKey: SerializationKeys.lemonLoadSuccess)
    aCoder.encode(lemonSuccessDefended, forKey: SerializationKeys.lemonSuccessDefended)
    aCoder.encode(cargoSuccessL1, forKey: SerializationKeys.cargoSuccessL1)
    aCoder.encode(cargoSuccessUndefended, forKey: SerializationKeys.cargoSuccessUndefended)
    aCoder.encode(pinningFouls, forKey: SerializationKeys.pinningFouls)
    aCoder.encode(selfClimbLevel, forKey: SerializationKeys.selfClimbLevel)
    aCoder.encode(robot1ClimbLevel, forKey: SerializationKeys.robot1ClimbLevel)
    aCoder.encode(robot2ClimbLevel, forKey: SerializationKeys.robot2ClimbLevel)
    aCoder.encode(timeDefending, forKey: SerializationKeys.timeDefending)
    aCoder.encode(totalFailedCyclesCaused, forKey: SerializationKeys.totalFailedCyclesCaused)
    aCoder.encode(pointsPrevented, forKey: SerializationKeys.pointsPrevented)
    aCoder.encode(lemonPointsPrevented, forKey: SerializationKeys.lemonPointsPrevented)
    aCoder.encode(cargoPointsPrevented, forKey: SerializationKeys.cargoPointsPrevented)
  }

}
