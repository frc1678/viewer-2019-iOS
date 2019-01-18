//
//  Team.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Team: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let pitDrivetrain = "pitDrivetrain"
    static let number = "number"
    static let calculatedData = "calculatedData"
    static let pitAllImageURLs = "pitAllImageURLs"
    static let pitSEALsNotes = "pitSEALsNotes"
    static let pitSelectedImage = "pitSelectedImage"
    static let matchesPlayed = "matchesPlayed"
    static let pitClimbType = "pitClimbType"
    static let pitProgrammingLanguage = "pitProgrammingLanguage"
    static let pitAvailableWeight = "pitAvailableWeight"
    static let pitWidth = "pitWidth"
    static let pitLength = "pitLength"
    static let picklistPosition = "picklistPosition"
    static let pitRampTimes = "pitRampTimes"
    static let pitDriveTimes = "pitDriveTimes"
    static let pitWheelDiameter = "pitWheelDiameter"
    static let pitHasCamera = "pitHasCamera"
    static let pitHasPid = "pitHasPid"
    static let pitHasGyro = "pitHasGyro"
    static let pitHasEncoders = "pitHasEncoders"
    static let pitMinHeight = "pitMinHeight"
    static let pitMaxHeight = "pitMaxHeight"
    static let pitWeight = "pitWeight"
    static let pitHasVision = "pitHasVision"
    static let pitCanBuddyStartLevel2 = "pitCanBuddyStartLevel2"
    static let pitHasOrangeShooter = "pitHasOrangeShooter"
    static let pitSandstormNavigationType = "pitSandstormNavigationType"
    static let actualRPs = "actualRPs"
  }

  // MARK: Properties
  public var name: String?
  public var pitDrivetrain: String?
  @objc public var number: Int = -1
  @objc public var calculatedData: CalculatedTeamData?
    @objc public var pitAllImageURLs: [String]?
  public var pitSEALsNotes: String?
  public var pitSelectedImage: String?
  public var matchesPlayed: Int?
    public var pitClimbType: [String:Int]?
  public var pitProgrammingLanguage: String?
  public var pitAvailableWeight: Float = -1
  public var pitWidth: Int?
    public var pitLength: Int?
    public var picklistPosition: Int = -1
    public var pitWheelDiameter: String?
    public var pitHasCamera: Bool? = false
    public var pitHasPid: Bool? = false
    public var pitHasGyro: Bool? = false
    public var pitHasEncoders: Bool? = false
    public var pitMinHeight: Int?
    public var pitMaxHeight: Int?
    public var pitWeight: Int?
    public var pitHasVision: Bool? = false
    public var pitCanBuddyStartLevel2: Bool? = false
    public var pitHasOrangeShooter: Bool? = false
    public var pitSandstormNavigationType: String?
    public var actualRPs: Int = -1

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
    pitDrivetrain = json[SerializationKeys.pitDrivetrain].string
    number = json[SerializationKeys.number].intValue
    calculatedData = CalculatedTeamData(json: json[SerializationKeys.calculatedData])
    var a : [String] = []
    if json[SerializationKeys.pitAllImageURLs].array != nil { for i in json[SerializationKeys.pitAllImageURLs].array! { a.append(i.string!) } }
    pitAllImageURLs = a
    pitSEALsNotes = json[SerializationKeys.pitSEALsNotes].string
    pitSelectedImage = json[SerializationKeys.pitSelectedImage].string
    matchesPlayed = json[SerializationKeys.matchesPlayed].int
    pitClimbType = json[SerializationKeys.pitClimbType].dictionaryObject as? [String:Int]
    pitProgrammingLanguage = json[SerializationKeys.pitProgrammingLanguage].string
    pitAvailableWeight = json[SerializationKeys.pitAvailableWeight].floatValue
    pitWidth = json[SerializationKeys.pitWidth].int
    pitLength = json[SerializationKeys.pitLength].int
    picklistPosition = json[SerializationKeys.picklistPosition].intValue
    pitWheelDiameter = json[SerializationKeys.pitWheelDiameter].string
    pitHasCamera = json[SerializationKeys.pitHasCamera].boolValue
    pitHasPid = json[SerializationKeys.pitHasPid].boolValue
    pitHasGyro = json[SerializationKeys.pitHasGyro].boolValue
    pitHasEncoders = json[SerializationKeys.pitHasEncoders].boolValue
    pitMinHeight = json[SerializationKeys.pitMinHeight].int
    pitMaxHeight = json[SerializationKeys.pitMaxHeight].int
    pitWeight = json[SerializationKeys.pitWeight].int
    pitHasVision = json[SerializationKeys.pitHasVision].boolValue
    pitCanBuddyStartLevel2 = json[SerializationKeys.pitCanBuddyStartLevel2].boolValue
    pitHasOrangeShooter = json[SerializationKeys.pitHasOrangeShooter].boolValue
    pitSandstormNavigationType = json[SerializationKeys.pitSandstormNavigationType].string
    actualRPs = json[SerializationKeys.actualRPs].intValue
}

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = pitDrivetrain { dictionary[SerializationKeys.pitDrivetrain] = value }
    dictionary[SerializationKeys.number] = number
    if let value = calculatedData { dictionary[SerializationKeys.calculatedData] = value.dictionaryRepresentation() }
    if let value = pitAllImageURLs { dictionary[SerializationKeys.pitAllImageURLs] = value }
    if let value = pitSEALsNotes { dictionary[SerializationKeys.pitSEALsNotes] = value }
    if let value = pitSelectedImage { dictionary[SerializationKeys.pitSelectedImage] = value }
    if let value = matchesPlayed { dictionary[SerializationKeys.matchesPlayed] = value }
    if let value = pitClimbType { dictionary[SerializationKeys.pitClimbType] = value }
    if let value = pitProgrammingLanguage { dictionary[SerializationKeys.pitProgrammingLanguage] = value }
    if let value = pitWidth { dictionary[SerializationKeys.pitWidth] = value }
    if let value = pitLength { dictionary[SerializationKeys.pitLength] = value }
    dictionary[SerializationKeys.pitAvailableWeight] = pitAvailableWeight
    dictionary[SerializationKeys.picklistPosition] = picklistPosition
    if let value = pitWheelDiameter { dictionary[SerializationKeys.pitWheelDiameter] = value }
    dictionary[SerializationKeys.pitHasCamera] = pitHasCamera
    dictionary[SerializationKeys.pitHasPid] = pitHasPid
    dictionary[SerializationKeys.pitHasGyro] = pitHasGyro
    dictionary[SerializationKeys.pitHasEncoders] = pitHasEncoders
    if let value = pitMinHeight { dictionary[SerializationKeys.pitMinHeight] = value }
    if let value = pitMaxHeight { dictionary[SerializationKeys.pitMaxHeight] = value }
    if let value = pitWeight { dictionary[SerializationKeys.pitWeight] = value }
    dictionary[SerializationKeys.pitHasVision] = pitHasVision
    dictionary[SerializationKeys.pitCanBuddyStartLevel2] = pitCanBuddyStartLevel2
    dictionary[SerializationKeys.pitHasOrangeShooter] = pitHasOrangeShooter
    if let value = pitSandstormNavigationType { dictionary[SerializationKeys.pitSandstormNavigationType] = value }
    dictionary[SerializationKeys.actualRPs] = actualRPs
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init?(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.pitDrivetrain = aDecoder.decodeObject(forKey: SerializationKeys.pitDrivetrain) as? String
    self.pitAvailableWeight = aDecoder.decodeFloat(forKey: SerializationKeys.pitAvailableWeight)
    self.number = aDecoder.decodeInteger(forKey: SerializationKeys.number)
    self.calculatedData = aDecoder.decodeObject(forKey: SerializationKeys.calculatedData) as? CalculatedTeamData
    self.pitAllImageURLs = aDecoder.decodeObject(forKey: SerializationKeys.pitAllImageURLs) as? [String]
    self.pitSEALsNotes = aDecoder.decodeObject(forKey: SerializationKeys.pitSEALsNotes) as? String
    self.pitSelectedImage = aDecoder.decodeObject(forKey: SerializationKeys.pitSelectedImage) as? String
    self.matchesPlayed = aDecoder.decodeObject(forKey: SerializationKeys.matchesPlayed) as? Int
    self.pitClimbType = aDecoder.decodeObject(forKey: SerializationKeys.pitClimbType) as? [String:Int]
    self.pitProgrammingLanguage = aDecoder.decodeObject(forKey: SerializationKeys.pitProgrammingLanguage) as? String
    self.pitWidth = aDecoder.decodeObject(forKey: SerializationKeys.pitWidth) as? Int
    self.pitLength = aDecoder.decodeObject(forKey: SerializationKeys.pitLength) as? Int
    self.picklistPosition = aDecoder.decodeInteger(forKey: SerializationKeys.picklistPosition)
    self.pitWheelDiameter = aDecoder.decodeObject(forKey: SerializationKeys.pitWheelDiameter) as? String
    self.pitHasCamera = aDecoder.decodeObject(forKey: SerializationKeys.pitHasCamera) as? Bool
    self.pitHasPid = aDecoder.decodeObject(forKey: SerializationKeys.pitHasPid) as? Bool
    self.pitHasGyro = aDecoder.decodeObject(forKey: SerializationKeys.pitHasGyro) as? Bool
    self.pitHasEncoders = aDecoder.decodeObject(forKey: SerializationKeys.pitHasEncoders) as? Bool
    self.pitMinHeight = aDecoder.decodeObject(forKey: SerializationKeys.pitMinHeight) as? Int
    self.pitMaxHeight = aDecoder.decodeObject(forKey: SerializationKeys.pitMaxHeight) as? Int
    self.pitWeight = aDecoder.decodeObject(forKey: SerializationKeys.pitWeight) as? Int
    self.pitHasVision = aDecoder.decodeObject(forKey: SerializationKeys.pitHasVision) as? Bool
    self.pitCanBuddyStartLevel2 = aDecoder.decodeObject(forKey: SerializationKeys.pitCanBuddyStartLevel2) as? Bool
    self.pitHasOrangeShooter = aDecoder.decodeObject(forKey: SerializationKeys.pitHasOrangeShooter) as? Bool
    self.pitSandstormNavigationType = aDecoder.decodeObject(forKey: SerializationKeys.pitSandstormNavigationType) as? String
    self.actualRPs = aDecoder.decodeInteger(forKey: SerializationKeys.actualRPs)
    }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(pitDrivetrain, forKey: SerializationKeys.pitDrivetrain)
    aCoder.encode(number, forKey: SerializationKeys.number)
    aCoder.encode(calculatedData, forKey: SerializationKeys.calculatedData)
    aCoder.encode(pitAllImageURLs, forKey: SerializationKeys.pitAllImageURLs)
    aCoder.encode(pitSEALsNotes, forKey: SerializationKeys.pitSEALsNotes)
    aCoder.encode(pitSelectedImage, forKey: SerializationKeys.pitSelectedImage)
    aCoder.encode(matchesPlayed, forKey: SerializationKeys.matchesPlayed)
    aCoder.encode(pitClimbType, forKey: SerializationKeys.pitClimbType)
    aCoder.encode(pitProgrammingLanguage, forKey: SerializationKeys.pitProgrammingLanguage)
    aCoder.encode(pitAvailableWeight, forKey: SerializationKeys.pitAvailableWeight)
    aCoder.encode(pitWidth, forKey: SerializationKeys.pitWidth)
    aCoder.encode(pitLength, forKey: SerializationKeys.pitLength)
    aCoder.encode(picklistPosition, forKey: SerializationKeys.picklistPosition)
    aCoder.encode(pitWheelDiameter, forKey: SerializationKeys.pitWheelDiameter)
    aCoder.encode(pitHasCamera, forKey: SerializationKeys.pitHasCamera)
    aCoder.encode(pitHasPid, forKey: SerializationKeys.pitHasPid)
    aCoder.encode(pitHasGyro, forKey: SerializationKeys.pitHasGyro)
    aCoder.encode(pitHasEncoders, forKey: SerializationKeys.pitHasEncoders)
    aCoder.encode(pitMinHeight, forKey: SerializationKeys.pitMinHeight)
    aCoder.encode(pitMaxHeight, forKey: SerializationKeys.pitMaxHeight)
    aCoder.encode(pitWeight, forKey: SerializationKeys.pitWeight)
    aCoder.encode(pitHasVision, forKey: SerializationKeys.pitHasVision)
    aCoder.encode(pitCanBuddyStartLevel2, forKey: SerializationKeys.pitCanBuddyStartLevel2)
    aCoder.encode(pitHasOrangeShooter, forKey: SerializationKeys.pitHasOrangeShooter)
    aCoder.encode(pitSandstormNavigationType, forKey: SerializationKeys.pitSandstormNavigationType)
    aCoder.encode(actualRPs, forKey: SerializationKeys.actualRPs)
  }
}
