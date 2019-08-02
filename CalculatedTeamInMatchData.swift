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
    static let panelLoadSuccess = "panelLoadSuccess"
    static let pinningFouls = "pinningFouls"
    static let panelsScored = "panelsScored"
    static let panelsScoredL1 = "panelsScoredL1"
    static let panelsScoredL2 = "panelsScoredL2"
    static let panelsScoredL3 = "panelsScoredL3"
    static let panelsScoredSandstorm = "panelsScoredSandstorm"
    static let panelsScoredTeleL1 = "panelsScoredTeleL1"
    static let panelsScoredTeleL2 = "panelsScoredTeleL2"
    static let panelsScoredTeleL3 = "panelsScoredTeleL2"
    static let panelSuccessDefended = "panelSuccessDefended"
    static let panelSuccessUndefended = "panelSuccessUndefended"
    static let panelSuccessL1 = "panelSuccessL1"
    static let panelSuccessL2 = "panelSuccessL2"
    static let panelSuccessL3 = "panelSuccessL3"
    static let panelSuccessAll = "panelSuccessAll"
    static let panelCycleAll = "panelCycleAll"
    static let panelCycleL1 = "panelCycleL1"
    static let panelCycleL2 = "panelCycleL2"
    static let panelCycleL3 = "panelCycleL3"
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
    static let panelPointsPrevented = "panelPointsPrevented"
    static let cargoPointsPrevented = "cargoPointsPrevented"
  }

  // MARK: Properties
  public var panelLoadSuccess: Int?
  public var pinningFouls: Int?
  public var panelsScored: Int?
  public var panelsScoredL1: Int?
  public var panelsScoredL2: Int?
  public var panelsScoredL3: Int?
  public var panelsScoredSandstorm: Int?
  public var panelsScoredTeleL1: Int?
  public var panelsScoredTeleL2: Int?
  public var panelsScoredTeleL3: Int?
  public var panelSuccessDefended: Int?
  public var panelSuccessUndefended: Int?
  public var panelSuccessL1: Int?
  public var panelSuccessL2: Int?
  public var panelSuccessL3: Int?
  public var panelSuccessAll: Int?
  public var panelCycleAll: Int?
  public var panelCycleL1: Int?
  public var panelCycleL2: Int?
  public var panelCycleL3: Int?
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
  public var panelPointsPrevented: Float?
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
    panelSuccessUndefended = json[SerializationKeys.panelSuccessUndefended].int
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
    panelCycleAll = json[SerializationKeys.panelCycleAll].int
    panelsScored = json[SerializationKeys.panelsScored].int
    panelsScoredL1 = json[SerializationKeys.panelsScoredL1].intValue
    panelsScoredL2 = json[SerializationKeys.panelsScoredL2].intValue
    panelsScoredL3 = json[SerializationKeys.panelsScoredL3].intValue
    panelsScoredSandstorm = json[SerializationKeys.panelsScoredSandstorm].intValue
    panelsScoredTeleL1 = json[SerializationKeys.panelsScoredTeleL1].intValue
    panelsScoredTeleL2 = json[SerializationKeys.panelsScoredTeleL2].intValue
    panelsScoredTeleL3 = json [SerializationKeys.panelsScoredTeleL3].intValue
    panelCycleL2 = json[SerializationKeys.panelCycleL2].int
    cargoSuccessL3 = json[SerializationKeys.cargoSuccessL3].int
    cargoCycleL1 = json[SerializationKeys.cargoCycleL1].int
    cargoCycleL3 = json[SerializationKeys.cargoCycleL3].int
    panelCycleL3 = json[SerializationKeys.panelCycleL3].int
    panelSuccessL2 = json[SerializationKeys.panelSuccessL2].int
    panelSuccessL3 = json[SerializationKeys.panelSuccessL3].int
    panelSuccessAll = json[SerializationKeys.panelSuccessAll].int
    panelCycleL1 = json[SerializationKeys.panelCycleL1].int
    timeClimbing = json[SerializationKeys.timeClimbing].float
    cargoSuccessAll = json[SerializationKeys.cargoSuccessAll].int
    cargoCycleL2 = json[SerializationKeys.cargoCycleL2].int
    panelSuccessL1 = json[SerializationKeys.panelSuccessL1].int
    cargoCycleAll = json[SerializationKeys.cargoCycleAll].int
    panelLoadSuccess = json[SerializationKeys.panelLoadSuccess].int
    panelSuccessDefended = json[SerializationKeys.panelSuccessDefended].int
    cargoSuccessL1 = json[SerializationKeys.cargoSuccessL1].int
    cargoSuccessUndefended = json[SerializationKeys.cargoSuccessUndefended].int
    pinningFouls = json[SerializationKeys.pinningFouls].int
    selfClimbLevel = json[SerializationKeys.selfClimbLevel].int
    robot1ClimbLevel = json[SerializationKeys.robot1ClimbLevel].int
    robot2ClimbLevel = json[SerializationKeys.robot2ClimbLevel].int
    timeDefending = json[SerializationKeys.timeDefending].float
    totalFailedCyclesCaused = json[SerializationKeys.totalFailedCyclesCaused].int
    pointsPrevented = json[SerializationKeys.pointsPrevented].float
    panelPointsPrevented = json[SerializationKeys.panelPointsPrevented].float
    cargoPointsPrevented = json[SerializationKeys.cargoPointsPrevented].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = panelSuccessUndefended { dictionary[SerializationKeys.panelSuccessUndefended] = value }
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
    if let value = panelCycleAll { dictionary[SerializationKeys.panelCycleAll] = value }
    if let value = panelsScored { dictionary[SerializationKeys.panelsScored] = value }
    if let value = panelsScoredL1 { dictionary[SerializationKeys.panelsScoredL1] = value }
    if let value = panelsScoredL2 { dictionary[SerializationKeys.panelsScoredL2] = value }
    if let value = panelsScoredL3 { dictionary[SerializationKeys.panelsScoredL3] = value }
    if let value = panelsScoredSandstorm { dictionary[SerializationKeys.panelsScoredSandstorm] = value }
    if let value = panelsScoredTeleL1 { dictionary[SerializationKeys.panelsScoredTeleL1] = value }
    if let value = panelsScoredTeleL2 { dictionary[SerializationKeys.panelsScoredTeleL2] = value }
    if let value = panelsScoredTeleL3 { dictionary[SerializationKeys.panelsScoredTeleL3] = value }
    if let value = panelCycleL2 { dictionary[SerializationKeys.panelCycleL2] = value }
    if let value = cargoSuccessL3 { dictionary[SerializationKeys.cargoSuccessL3] = value }
    if let value = cargoCycleL1 { dictionary[SerializationKeys.cargoCycleL1] = value }
    if let value = cargoCycleL3 { dictionary[SerializationKeys.cargoCycleL3] = value }
    if let value = panelCycleL3 { dictionary[SerializationKeys.panelCycleL3] = value }
    if let value = panelSuccessL2 { dictionary[SerializationKeys.panelSuccessL2] = value }
    if let value = panelSuccessL3 { dictionary[SerializationKeys.panelSuccessL3] = value }
    if let value = panelSuccessAll { dictionary[SerializationKeys.panelSuccessAll] = value }
    if let value = panelCycleL1 { dictionary[SerializationKeys.panelCycleL1] = value }
    if let value = timeClimbing { dictionary[SerializationKeys.timeClimbing] = value }
    if let value = cargoSuccessAll { dictionary[SerializationKeys.cargoSuccessAll] = value }
    if let value = cargoCycleL2 { dictionary[SerializationKeys.cargoCycleL2] = value }
    if let value = panelSuccessL1 { dictionary[SerializationKeys.panelSuccessL1] = value }
    if let value = cargoCycleAll { dictionary[SerializationKeys.cargoCycleAll] = value }
    if let value = panelLoadSuccess { dictionary[SerializationKeys.panelLoadSuccess] = value }
    if let value = panelSuccessDefended { dictionary[SerializationKeys.panelSuccessDefended] = value }
    if let value = cargoSuccessL1 { dictionary[SerializationKeys.cargoSuccessL1] = value }
    if let value = cargoSuccessUndefended { dictionary[SerializationKeys.cargoSuccessUndefended] = value }
    if let value = pinningFouls { dictionary[SerializationKeys.pinningFouls] = value }
    if let value = selfClimbLevel { dictionary[SerializationKeys.selfClimbLevel] = value}
    if let value = robot1ClimbLevel { dictionary[SerializationKeys.robot1ClimbLevel] = value}
    if let value = robot2ClimbLevel { dictionary[SerializationKeys.robot2ClimbLevel] = value}
    if let value = timeDefending { dictionary[SerializationKeys.timeDefending] = value}
    if let value = totalFailedCyclesCaused { dictionary[SerializationKeys.totalFailedCyclesCaused] = value}
    if let value = pointsPrevented { dictionary[SerializationKeys.pointsPrevented] = value}
    if let value = panelPointsPrevented { dictionary[SerializationKeys.panelPointsPrevented] = value}
    if let value = cargoPointsPrevented { dictionary[SerializationKeys.cargoPointsPrevented] = value}
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.panelSuccessUndefended = aDecoder.decodeObject(forKey: SerializationKeys.panelSuccessUndefended) as? Int
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
    self.panelCycleAll = aDecoder.decodeObject(forKey: SerializationKeys.panelCycleAll) as? Int
    self.panelsScored = aDecoder.decodeObject(forKey: SerializationKeys.panelsScored) as? Int
    self.panelsScoredL1 = aDecoder.decodeObject(forKey: SerializationKeys.panelsScoredL1) as? Int
    self.panelsScoredL2 = aDecoder.decodeObject(forKey: SerializationKeys.panelsScoredL2) as? Int
    self.panelsScoredL3 = aDecoder.decodeObject(forKey: SerializationKeys.panelsScoredL3) as? Int
    self.panelsScoredSandstorm = aDecoder.decodeObject(forKey: SerializationKeys.panelsScoredSandstorm) as? Int
    self.panelsScoredTeleL1 = aDecoder.decodeObject(forKey: SerializationKeys.panelsScoredTeleL1) as? Int
    self.panelsScoredTeleL2 = aDecoder.decodeObject(forKey: SerializationKeys.panelsScoredTeleL2) as? Int
    self.panelsScoredTeleL3 = aDecoder.decodeObject(forKey: SerializationKeys.panelsScoredTeleL3) as? Int
    self.panelCycleL2 = aDecoder.decodeObject(forKey: SerializationKeys.panelCycleL2) as? Int
    self.cargoSuccessL3 = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessL3) as? Int
    self.cargoCycleL1 = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleL1) as? Int
    self.cargoCycleL3 = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleL3) as? Int
    self.panelCycleL3 = aDecoder.decodeObject(forKey: SerializationKeys.panelCycleL3) as? Int
    self.panelSuccessL2 = aDecoder.decodeObject(forKey: SerializationKeys.panelSuccessL2) as? Int
    self.panelSuccessL3 = aDecoder.decodeObject(forKey: SerializationKeys.panelSuccessL3) as? Int
    self.panelSuccessAll = aDecoder.decodeObject(forKey: SerializationKeys.panelSuccessAll) as? Int
    self.panelCycleL1 = aDecoder.decodeObject(forKey: SerializationKeys.panelCycleL1) as? Int
    self.timeClimbing = aDecoder.decodeObject(forKey: SerializationKeys.timeClimbing) as? Float
    self.cargoSuccessAll = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessAll) as? Int
    self.cargoCycleL2 = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleL2) as? Int
    self.panelSuccessL1 = aDecoder.decodeObject(forKey: SerializationKeys.panelSuccessL1) as? Int
    self.cargoCycleAll = aDecoder.decodeObject(forKey: SerializationKeys.cargoCycleAll) as? Int
    self.panelLoadSuccess = aDecoder.decodeObject(forKey: SerializationKeys.panelLoadSuccess) as? Int
    self.panelSuccessDefended = aDecoder.decodeObject(forKey: SerializationKeys.panelSuccessDefended) as? Int
    self.cargoSuccessL1 = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessL1) as? Int
    self.cargoSuccessUndefended = aDecoder.decodeObject(forKey: SerializationKeys.cargoSuccessUndefended) as? Int
    self.pinningFouls = aDecoder.decodeObject(forKey: SerializationKeys.pinningFouls) as? Int
    self.selfClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.selfClimbLevel) as? Int
    self.robot1ClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.robot1ClimbLevel) as? Int
    self.robot2ClimbLevel = aDecoder.decodeObject(forKey: SerializationKeys.robot2ClimbLevel) as? Int
    self.timeDefending = aDecoder.decodeObject(forKey: SerializationKeys.timeDefending) as? Float
    self.totalFailedCyclesCaused = aDecoder.decodeObject(forKey: SerializationKeys.totalFailedCyclesCaused) as? Int
    self.pointsPrevented = aDecoder.decodeObject(forKey: SerializationKeys.pointsPrevented) as? Float
    self.panelPointsPrevented = aDecoder.decodeObject(forKey: SerializationKeys.panelPointsPrevented) as? Float
    self.cargoPointsPrevented = aDecoder.decodeObject(forKey: SerializationKeys.cargoPointsPrevented) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(panelSuccessUndefended, forKey: SerializationKeys.panelSuccessUndefended)
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
    aCoder.encode(panelCycleAll, forKey: SerializationKeys.panelCycleAll)
    aCoder.encode(panelsScored, forKey: SerializationKeys.panelsScored)
    aCoder.encode(panelsScoredL1, forKey: SerializationKeys.panelsScoredL1)
    aCoder.encode(panelsScoredL2, forKey: SerializationKeys.panelsScoredL2)
    aCoder.encode(panelsScoredL3, forKey: SerializationKeys.panelsScoredL3)
    aCoder.encode(panelsScoredSandstorm, forKey: SerializationKeys.panelsScoredSandstorm)
    aCoder.encode(panelsScoredTeleL1, forKey: SerializationKeys.panelsScoredTeleL1)
    aCoder.encode(panelsScoredTeleL2, forKey: SerializationKeys.panelsScoredTeleL2)
    aCoder.encode(panelsScoredTeleL3, forKey: SerializationKeys.panelsScoredTeleL3)
    aCoder.encode(panelCycleL2, forKey: SerializationKeys.panelCycleL2)
    aCoder.encode(cargoSuccessL3, forKey: SerializationKeys.cargoSuccessL3)
    aCoder.encode(cargoCycleL1, forKey: SerializationKeys.cargoCycleL1)
    aCoder.encode(cargoCycleL3, forKey: SerializationKeys.cargoCycleL3)
    aCoder.encode(panelCycleL3, forKey: SerializationKeys.panelCycleL3)
    aCoder.encode(panelSuccessL2, forKey: SerializationKeys.panelSuccessL2)
    aCoder.encode(panelSuccessL3, forKey: SerializationKeys.panelSuccessL3)
    aCoder.encode(panelSuccessAll, forKey: SerializationKeys.panelSuccessAll)
    aCoder.encode(panelCycleL1, forKey: SerializationKeys.panelCycleL1)
    aCoder.encode(timeClimbing, forKey: SerializationKeys.timeClimbing)
    aCoder.encode(cargoSuccessAll, forKey: SerializationKeys.cargoSuccessAll)
    aCoder.encode(cargoCycleL2, forKey: SerializationKeys.cargoCycleL2)
    aCoder.encode(panelSuccessL1, forKey: SerializationKeys.panelSuccessL1)
    aCoder.encode(cargoCycleAll, forKey: SerializationKeys.cargoCycleAll)
    aCoder.encode(panelLoadSuccess, forKey: SerializationKeys.panelLoadSuccess)
    aCoder.encode(panelSuccessDefended, forKey: SerializationKeys.panelSuccessDefended)
    aCoder.encode(cargoSuccessL1, forKey: SerializationKeys.cargoSuccessL1)
    aCoder.encode(cargoSuccessUndefended, forKey: SerializationKeys.cargoSuccessUndefended)
    aCoder.encode(pinningFouls, forKey: SerializationKeys.pinningFouls)
    aCoder.encode(selfClimbLevel, forKey: SerializationKeys.selfClimbLevel)
    aCoder.encode(robot1ClimbLevel, forKey: SerializationKeys.robot1ClimbLevel)
    aCoder.encode(robot2ClimbLevel, forKey: SerializationKeys.robot2ClimbLevel)
    aCoder.encode(timeDefending, forKey: SerializationKeys.timeDefending)
    aCoder.encode(totalFailedCyclesCaused, forKey: SerializationKeys.totalFailedCyclesCaused)
    aCoder.encode(pointsPrevented, forKey: SerializationKeys.pointsPrevented)
    aCoder.encode(panelPointsPrevented, forKey: SerializationKeys.panelPointsPrevented)
    aCoder.encode(cargoPointsPrevented, forKey: SerializationKeys.cargoPointsPrevented)
  }

}
