//
//  Team.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Team: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let actualRPs = "actualRPs"
    static let pitMinHeight = "pitMinHeight"
    static let pitHasVision = "pitHasVision"
    static let number = "number"
    static let pitHasCamera = "pitHasCamera"
    static let pitHasGyro = "pitHasGyro"
    static let pitHasPid = "pitHasPid"
    static let pitCanBuddyStartLevel2 = "pitCanBuddyStartLevel2"
    static let pitWidth = "pitWidth"
    static let pitWeight = "pitWeight"
    static let matchesPlayed = "matchesPlayed"
    static let pitLength = "pitLength"
    static let pitProgrammingLanguage = "pitProgrammingLanguage"
    static let pitHasOrangeShooter = "pitHasOrangeShooter"
    static let pitHasEncoders = "pitHasEncoders"
    static let pitDrivetrain = "pitDrivetrain"
    static let pitSandstormNavigationType = "pitSandstormNavigationType"
    static let pitMaxHeight = "pitMaxHeight"
    static let pitWheelDiameter = "pitWheelDiameter"
    static let pitClimbType = "pitClimbType"
    static let pitSEALsNotes = "pitSEALsNotes"
    static let calculatedData = "calculatedData"
  }

  // MARK: Properties
  public var name: String?
  @objc public var actualRPs: Int = -1
  public var pitMinHeight: Int?
  public var pitHasVision: Bool? = false
  @objc public var number: Int = -1
  public var pitHasCamera: Bool? = false
  public var pitHasGyro: Bool? = false
  public var pitHasPid: Bool? = false
  public var pitCanBuddyStartLevel2: Bool? = false
  public var pitWidth: Int?
  public var pitWeight: Int?
  public var matchesPlayed: Int?
  public var pitLength: Int?
  public var pitProgrammingLanguage: String?
  public var pitHasOrangeShooter: Bool? = false
  public var pitHasEncoders: Bool? = false
  public var pitDrivetrain: String?
  public var pitSandstormNavigationType: String?
  public var pitMaxHeight: Int?
  public var pitWheelDiameter: String?
    public var pitClimbType: [String:Int]?
    public var pitSEALsNotes: String?
  @objc public var calculatedData: CalculatedTeamData?

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
    name = json[SerializationKeys.name].string
    actualRPs = json[SerializationKeys.actualRPs].intValue
    pitMinHeight = json[SerializationKeys.pitMinHeight].int
    pitHasVision = json[SerializationKeys.pitHasVision].boolValue
    number = json[SerializationKeys.number].intValue
    pitHasCamera = json[SerializationKeys.pitHasCamera].boolValue
    pitHasGyro = json[SerializationKeys.pitHasGyro].boolValue
    pitHasPid = json[SerializationKeys.pitHasPid].boolValue
    pitCanBuddyStartLevel2 = json[SerializationKeys.pitCanBuddyStartLevel2].boolValue
    pitWidth = json[SerializationKeys.pitWidth].int
    pitWeight = json[SerializationKeys.pitWeight].int
    matchesPlayed = json[SerializationKeys.matchesPlayed].int
    pitLength = json[SerializationKeys.pitLength].int
    pitProgrammingLanguage = json[SerializationKeys.pitProgrammingLanguage].string
    pitHasOrangeShooter = json[SerializationKeys.pitHasOrangeShooter].boolValue
    pitHasEncoders = json[SerializationKeys.pitHasEncoders].boolValue
    pitDrivetrain = json[SerializationKeys.pitDrivetrain].string
    pitSandstormNavigationType = json[SerializationKeys.pitSandstormNavigationType].string
    pitMaxHeight = json[SerializationKeys.pitMaxHeight].int
    pitWheelDiameter = json[SerializationKeys.pitWheelDiameter].string
    pitClimbType = (json[SerializationKeys.pitClimbType].dictionaryObject as? [String:Int])
    pitSEALsNotes = json[SerializationKeys.pitSEALsNotes].string
    calculatedData = CalculatedTeamData(json: json[SerializationKeys.calculatedData])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    dictionary[SerializationKeys.actualRPs] = actualRPs
    if let value = pitMinHeight { dictionary[SerializationKeys.pitMinHeight] = value }
    dictionary[SerializationKeys.pitHasVision] = pitHasVision
    dictionary[SerializationKeys.number] = number
    dictionary[SerializationKeys.pitHasCamera] = pitHasCamera
    dictionary[SerializationKeys.pitHasGyro] = pitHasGyro
    dictionary[SerializationKeys.pitHasPid] = pitHasPid
    dictionary[SerializationKeys.pitCanBuddyStartLevel2] = pitCanBuddyStartLevel2
    if let value = pitWidth { dictionary[SerializationKeys.pitWidth] = value }
    if let value = pitWeight { dictionary[SerializationKeys.pitWeight] = value }
    if let value = matchesPlayed { dictionary[SerializationKeys.matchesPlayed] = value }
    if let value = pitLength { dictionary[SerializationKeys.pitLength] = value }
    if let value = pitProgrammingLanguage { dictionary[SerializationKeys.pitProgrammingLanguage] = value }
    dictionary[SerializationKeys.pitHasOrangeShooter] = pitHasOrangeShooter
    dictionary[SerializationKeys.pitHasEncoders] = pitHasEncoders
    if let value = pitDrivetrain { dictionary[SerializationKeys.pitDrivetrain] = value }
    if let value = pitSandstormNavigationType { dictionary[SerializationKeys.pitSandstormNavigationType] = value }
    if let value = pitMaxHeight { dictionary[SerializationKeys.pitMaxHeight] = value }
    if let value = pitWheelDiameter { dictionary[SerializationKeys.pitWheelDiameter] = value }
    if let value = pitClimbType { dictionary[SerializationKeys.pitClimbType] = value }
    if let value = pitSEALsNotes { dictionary[SerializationKeys.pitSEALsNotes] = value }
    if let value = calculatedData { dictionary[SerializationKeys.calculatedData] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.actualRPs = aDecoder.decodeInteger(forKey: SerializationKeys.actualRPs)
    self.pitMinHeight = aDecoder.decodeObject(forKey: SerializationKeys.pitMinHeight) as? Int
    self.pitHasVision = aDecoder.decodeObject(forKey: SerializationKeys.pitHasVision) as? Bool
    self.number = aDecoder.decodeInteger(forKey: SerializationKeys.number)
    self.pitHasCamera = aDecoder.decodeObject(forKey: SerializationKeys.pitHasCamera) as? Bool
    self.pitHasGyro = aDecoder.decodeObject(forKey: SerializationKeys.pitHasGyro) as? Bool
    self.pitHasPid = aDecoder.decodeObject(forKey: SerializationKeys.pitHasPid) as? Bool
    self.pitCanBuddyStartLevel2 = aDecoder.decodeObject(forKey: SerializationKeys.pitCanBuddyStartLevel2) as? Bool
    self.pitWidth = aDecoder.decodeObject(forKey: SerializationKeys.pitWidth) as? Int
    self.pitWeight = aDecoder.decodeObject(forKey: SerializationKeys.pitWeight) as? Int
    self.matchesPlayed = aDecoder.decodeObject(forKey: SerializationKeys.matchesPlayed) as? Int
    self.pitLength = aDecoder.decodeObject(forKey: SerializationKeys.pitLength) as? Int
    self.pitProgrammingLanguage = aDecoder.decodeObject(forKey: SerializationKeys.pitProgrammingLanguage) as? String
    self.pitHasOrangeShooter = aDecoder.decodeObject(forKey: SerializationKeys.pitHasOrangeShooter) as? Bool
    self.pitHasEncoders = aDecoder.decodeObject(forKey: SerializationKeys.pitHasEncoders) as? Bool
    self.pitDrivetrain = aDecoder.decodeObject(forKey: SerializationKeys.pitDrivetrain) as? String
    self.pitSandstormNavigationType = aDecoder.decodeObject(forKey: SerializationKeys.pitSandstormNavigationType) as? String
    self.pitMaxHeight = aDecoder.decodeObject(forKey: SerializationKeys.pitMaxHeight) as? Int
    self.pitWheelDiameter = aDecoder.decodeObject(forKey: SerializationKeys.pitWheelDiameter) as? String
    self.pitClimbType = aDecoder.decodeObject(forKey: SerializationKeys.pitClimbType) as? [String:Int]
    self.pitSEALsNotes = aDecoder.decodeObject(forKey: SerializationKeys.pitSEALsNotes) as? String
    self.calculatedData = aDecoder.decodeObject(forKey: SerializationKeys.calculatedData) as? CalculatedTeamData
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(actualRPs, forKey: SerializationKeys.actualRPs)
    aCoder.encode(pitMinHeight, forKey: SerializationKeys.pitMinHeight)
    aCoder.encode(pitHasVision, forKey: SerializationKeys.pitHasVision)
    aCoder.encode(number, forKey: SerializationKeys.number)
    aCoder.encode(pitHasCamera, forKey: SerializationKeys.pitHasCamera)
    aCoder.encode(pitHasGyro, forKey: SerializationKeys.pitHasGyro)
    aCoder.encode(pitHasPid, forKey: SerializationKeys.pitHasPid)
    aCoder.encode(pitCanBuddyStartLevel2, forKey: SerializationKeys.pitCanBuddyStartLevel2)
    aCoder.encode(pitWidth, forKey: SerializationKeys.pitWidth)
    aCoder.encode(pitWeight, forKey: SerializationKeys.pitWeight)
    aCoder.encode(matchesPlayed, forKey: SerializationKeys.matchesPlayed)
    aCoder.encode(pitLength, forKey: SerializationKeys.pitLength)
    aCoder.encode(pitProgrammingLanguage, forKey: SerializationKeys.pitProgrammingLanguage)
    aCoder.encode(pitHasOrangeShooter, forKey: SerializationKeys.pitHasOrangeShooter)
    aCoder.encode(pitHasEncoders, forKey: SerializationKeys.pitHasEncoders)
    aCoder.encode(pitDrivetrain, forKey: SerializationKeys.pitDrivetrain)
    aCoder.encode(pitSandstormNavigationType, forKey: SerializationKeys.pitSandstormNavigationType)
    aCoder.encode(pitMaxHeight, forKey: SerializationKeys.pitMaxHeight)
    aCoder.encode(pitWheelDiameter, forKey: SerializationKeys.pitWheelDiameter)
    aCoder.encode(pitClimbType, forKey: SerializationKeys.pitClimbType)
    aCoder.encode(pitSEALsNotes, forKey: SerializationKeys.pitSEALsNotes)
    aCoder.encode(calculatedData, forKey: SerializationKeys.calculatedData)
  }

}
