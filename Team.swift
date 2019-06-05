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
    static let redActualRPs = "redActualRPs"
    static let blueActualRPs = "blueActualRPs"
    static let actualRPs = "actualRPs"
    static let teamNumber = "teamNumber"
    static let pitHasCamera = "pitHasCamera"
    static let pitWidth = "pitWidth"
    static let pitWeight = "pitWeight"
    static let matchesPlayed = "matchesPlayed"
    static let pitLength = "pitLength"
    static let pitProgrammingLanguage = "pitProgrammingLanguage"
    static let pitDrivetrain = "pitDrivetrain"
    static let pitWheelDiameter = "pitWheelDiameter"
    static let pitClimbType = "pitClimbType"
    static let pitSEALsNotes = "pitSEALsNotes"
    static let pitSEALsRampRanking = "pitSEALsRampRanking"
    static let pitIsPanelSpecialist = "pitIsPanelSpecialist"
    static let pitNumDriveTrainMotors = "pitNumDriveTrainMotors"
    static let pitDriveTrainMotorType = "pitDriveTrainMotorType"
    static let percentDysfunctional = "percentDysfunctional"
    static let actualSeed = "actualSeed"
    static let calculatedData = "calculatedData"
  }

  // MARK: Properties
  public var name: String?
  @objc public var redActualRPs: Int = -1
  @objc public var blueActualRPs: Int = -1
  @objc public var actualRPs: Int = -1
  @objc public var teamNumber: Int = -1
  public var pitHasCamera: Bool? = false
  public var pitWidth: Int?
  public var pitWeight: Int?
  public var matchesPlayed: Int?
  public var pitLength: Int?
  public var pitProgrammingLanguage: String?
  public var pitDrivetrain: String?
  public var pitWheelDiameter: String?
  public var pitClimbType: [String:Int]?
  public var pitSEALsNotes: String?
  public var pitSEALsRampRanking: Int?
  public var pitIsPanelSpecialist: Bool? = false
    public var pitNumDriveTrainMotors: Int? = -1
    public var pitDriveTrainMotorType: String?
  public var percentDysfunctional: Int?
@objc public var actualSeed: Int = -1
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
    redActualRPs = json[SerializationKeys.redActualRPs].intValue
    blueActualRPs = json[SerializationKeys.blueActualRPs].intValue
    actualRPs = json[SerializationKeys.actualRPs].intValue
    teamNumber = json[SerializationKeys.teamNumber].intValue
    pitHasCamera = json[SerializationKeys.pitHasCamera].boolValue
    pitWidth = json[SerializationKeys.pitWidth].int
    pitWeight = json[SerializationKeys.pitWeight].int
    matchesPlayed = json[SerializationKeys.matchesPlayed].int
    pitLength = json[SerializationKeys.pitLength].int
    pitProgrammingLanguage = json[SerializationKeys.pitProgrammingLanguage].string
    pitDrivetrain = json[SerializationKeys.pitDrivetrain].string
    pitWheelDiameter = json[SerializationKeys.pitWheelDiameter].string
    pitClimbType = (json[SerializationKeys.pitClimbType].dictionaryObject as? [String:Int])
    pitSEALsNotes = json[SerializationKeys.pitSEALsNotes].string
    pitSEALsRampRanking = json[SerializationKeys.pitSEALsRampRanking].int
    pitIsPanelSpecialist = json[SerializationKeys.pitIsPanelSpecialist].boolValue
    pitNumDriveTrainMotors = json[SerializationKeys.pitNumDriveTrainMotors].int
    pitDriveTrainMotorType = json[SerializationKeys.pitDriveTrainMotorType].string
    percentDysfunctional = json[SerializationKeys.percentDysfunctional].int
    actualSeed = json[SerializationKeys.actualSeed].intValue
    calculatedData = CalculatedTeamData(json: json[SerializationKeys.calculatedData])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    dictionary[SerializationKeys.redActualRPs] = redActualRPs
    dictionary[SerializationKeys.blueActualRPs] = blueActualRPs
    dictionary[SerializationKeys.actualRPs] = actualRPs
    dictionary[SerializationKeys.teamNumber] = teamNumber
    dictionary[SerializationKeys.pitHasCamera] = pitHasCamera
    if let value = pitWidth { dictionary[SerializationKeys.pitWidth] = value }
    if let value = pitWeight { dictionary[SerializationKeys.pitWeight] = value }
    if let value = matchesPlayed { dictionary[SerializationKeys.matchesPlayed] = value }
    if let value = pitLength { dictionary[SerializationKeys.pitLength] = value }
    if let value = pitProgrammingLanguage { dictionary[SerializationKeys.pitProgrammingLanguage] = value }
    if let value = pitDrivetrain { dictionary[SerializationKeys.pitDrivetrain] = value }
    if let value = pitWheelDiameter { dictionary[SerializationKeys.pitWheelDiameter] = value }
    if let value = pitClimbType { dictionary[SerializationKeys.pitClimbType] = value }
    if let value = pitSEALsNotes { dictionary[SerializationKeys.pitSEALsNotes] = value }
    if let value = pitSEALsRampRanking { dictionary[SerializationKeys.pitSEALsRampRanking] = value}
    if let value = pitIsPanelSpecialist { dictionary[SerializationKeys.pitIsPanelSpecialist] = value}
    if let value = pitNumDriveTrainMotors { dictionary[SerializationKeys.pitNumDriveTrainMotors] = value}
    if let value = pitDriveTrainMotorType { dictionary[SerializationKeys.pitDriveTrainMotorType] = value}
    if let value = percentDysfunctional { dictionary[SerializationKeys.percentDysfunctional] = value}
    dictionary[SerializationKeys.actualSeed] = actualSeed
    if let value = calculatedData { dictionary[SerializationKeys.calculatedData] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.redActualRPs = aDecoder.decodeInteger(forKey: SerializationKeys.redActualRPs)
    self.blueActualRPs = aDecoder.decodeInteger(forKey: SerializationKeys.blueActualRPs)
    self.actualRPs = aDecoder.decodeInteger(forKey: SerializationKeys.actualRPs)
    self.teamNumber = aDecoder.decodeInteger(forKey: SerializationKeys.teamNumber)
    self.pitHasCamera = aDecoder.decodeObject(forKey: SerializationKeys.pitHasCamera) as? Bool
    self.teamNumber = aDecoder.decodeInteger(forKey: SerializationKeys.teamNumber)
    self.pitHasCamera = aDecoder.decodeObject(forKey: SerializationKeys.pitHasCamera) as? Bool
    self.pitWidth = aDecoder.decodeObject(forKey: SerializationKeys.pitWidth) as? Int
    self.pitWeight = aDecoder.decodeObject(forKey: SerializationKeys.pitWeight) as? Int
    self.matchesPlayed = aDecoder.decodeObject(forKey: SerializationKeys.matchesPlayed) as? Int
    self.pitLength = aDecoder.decodeObject(forKey: SerializationKeys.pitLength) as? Int
    self.pitProgrammingLanguage = aDecoder.decodeObject(forKey: SerializationKeys.pitProgrammingLanguage) as? String
    self.pitDrivetrain = aDecoder.decodeObject(forKey: SerializationKeys.pitDrivetrain) as? String
    self.pitWheelDiameter = aDecoder.decodeObject(forKey: SerializationKeys.pitWheelDiameter) as? String
    self.pitClimbType = aDecoder.decodeObject(forKey: SerializationKeys.pitClimbType) as? [String:Int]
    self.pitSEALsNotes = aDecoder.decodeObject(forKey: SerializationKeys.pitSEALsNotes) as? String
    self.pitSEALsRampRanking = aDecoder.decodeObject(forKey: SerializationKeys.pitSEALsRampRanking) as? Int
    self.pitIsPanelSpecialist = aDecoder.decodeObject(forKey: SerializationKeys.pitIsPanelSpecialist) as? Bool
    self.pitNumDriveTrainMotors = aDecoder.decodeObject(forKey: SerializationKeys.pitNumDriveTrainMotors) as? Int
    self.pitDriveTrainMotorType = aDecoder.decodeObject(forKey: SerializationKeys.pitDriveTrainMotorType) as? String
    self.percentDysfunctional = aDecoder.decodeObject(forKey: SerializationKeys.percentDysfunctional) as? Int
    self.actualSeed = aDecoder.decodeInteger(forKey: SerializationKeys.actualSeed)
    self.calculatedData = aDecoder.decodeObject(forKey: SerializationKeys.calculatedData) as? CalculatedTeamData
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(redActualRPs, forKey: SerializationKeys.redActualRPs)
    aCoder.encode(blueActualRPs, forKey: SerializationKeys.redActualRPs)
    aCoder.encode(actualRPs, forKey: SerializationKeys.actualRPs)
    aCoder.encode(teamNumber, forKey: SerializationKeys.teamNumber)
    aCoder.encode(pitHasCamera, forKey: SerializationKeys.pitHasCamera)
    aCoder.encode(pitWidth, forKey: SerializationKeys.pitWidth)
    aCoder.encode(pitWeight, forKey: SerializationKeys.pitWeight)
    aCoder.encode(matchesPlayed, forKey: SerializationKeys.matchesPlayed)
    aCoder.encode(pitLength, forKey: SerializationKeys.pitLength)
    aCoder.encode(pitProgrammingLanguage, forKey: SerializationKeys.pitProgrammingLanguage)
    aCoder.encode(pitDrivetrain, forKey: SerializationKeys.pitDrivetrain)
    aCoder.encode(pitWheelDiameter, forKey: SerializationKeys.pitWheelDiameter)
    aCoder.encode(pitClimbType, forKey: SerializationKeys.pitClimbType)
    aCoder.encode(pitSEALsNotes, forKey: SerializationKeys.pitSEALsNotes)
    aCoder.encode(pitSEALsRampRanking, forKey: SerializationKeys.pitSEALsRampRanking)
    aCoder.encode(pitIsPanelSpecialist, forKey: SerializationKeys.pitIsPanelSpecialist)
    aCoder.encode(pitNumDriveTrainMotors, forKey: SerializationKeys.pitNumDriveTrainMotors)
    aCoder.encode(pitDriveTrainMotorType, forKey: SerializationKeys.pitDriveTrainMotorType)
    aCoder.encode(percentDysfunctional, forKey: SerializationKeys.percentDysfunctional)
    aCoder.encode(actualSeed, forKey: SerializationKeys.actualSeed)
    aCoder.encode(calculatedData, forKey: SerializationKeys.calculatedData)
  }

}
