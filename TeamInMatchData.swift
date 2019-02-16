//
//  TeamInMatchData.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeamInMatchData: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let crossedHabLine = "crossedHabLine"
    static let timeline = "timeline"
    static let calculatedData = "calculatedData"
    static let preload = "preload"
    static let startingLocation = "startingLocation"
    static let startingLevel = "startingLevel"
    static let driverStation = "driverStation"
    static let isNoShow = "isNoShow"
    static let teamNumber = "teamNumber"
    static let matchNumber = "matchNumber"
    static let superNotes = "superNotes"
  }

  // MARK: Properties
  public var crossedHabLine: Bool? = false
  public var timeline: [Timeline]?
  public var calculatedData: CalculatedTeamInMatchData?
  public var preload: String?
  public var startingLocation: String?
  public var startingLevel: Int?
  public var driverStation: Int?
  public var isNoShow: Bool? = false
    public var teamNumber: Int?
    public var matchNumber: Int?
    public var superNotes: String?

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
    crossedHabLine = json[SerializationKeys.crossedHabLine].boolValue
    if let items = json[SerializationKeys.timeline].array { timeline = items.map { Timeline(json: $0) } }
    calculatedData = CalculatedTeamInMatchData(json: json[SerializationKeys.calculatedData])
    preload = json[SerializationKeys.preload].string
    startingLocation = json[SerializationKeys.startingLocation].string
    startingLevel = json[SerializationKeys.startingLevel].int
    driverStation = json[SerializationKeys.driverStation].int
    isNoShow = json[SerializationKeys.isNoShow].boolValue
    teamNumber = json[SerializationKeys.teamNumber].int
    matchNumber = json[SerializationKeys.matchNumber].int
    superNotes = json[SerializationKeys.superNotes].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.crossedHabLine] = crossedHabLine
    if let value = timeline { dictionary[SerializationKeys.timeline] = value.map { $0.dictionaryRepresentation() } }
    if let value = calculatedData { dictionary[SerializationKeys.calculatedData] = value.dictionaryRepresentation() }
    if let value = preload { dictionary[SerializationKeys.preload] = value }
    if let value = startingLocation { dictionary[SerializationKeys.startingLocation] = value }
    if let value = startingLevel { dictionary[SerializationKeys.startingLevel] = value }
    if let value = driverStation { dictionary[SerializationKeys.driverStation] = value }
    dictionary[SerializationKeys.isNoShow] = isNoShow
    if let value = teamNumber { dictionary[SerializationKeys.teamNumber] = value }
    if let value = matchNumber { dictionary[SerializationKeys.matchNumber] = value }
    if let value = superNotes { dictionary[SerializationKeys.superNotes] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.crossedHabLine = aDecoder.decodeBool(forKey: SerializationKeys.crossedHabLine)
    self.timeline = aDecoder.decodeObject(forKey: SerializationKeys.timeline) as? [Timeline]
    self.calculatedData = aDecoder.decodeObject(forKey: SerializationKeys.calculatedData) as? CalculatedTeamInMatchData
    self.preload = aDecoder.decodeObject(forKey: SerializationKeys.preload) as? String
    self.startingLocation = aDecoder.decodeObject(forKey: SerializationKeys.startingLocation) as? String
    self.startingLevel = aDecoder.decodeObject(forKey: SerializationKeys.startingLevel) as? Int
    self.driverStation = aDecoder.decodeObject(forKey: SerializationKeys.driverStation) as? Int
    self.isNoShow = aDecoder.decodeBool(forKey: SerializationKeys.isNoShow)
    self.teamNumber = aDecoder.decodeObject(forKey: SerializationKeys.teamNumber) as? Int
    self.matchNumber = aDecoder.decodeObject(forKey: SerializationKeys.matchNumber) as? Int
    self.superNotes = aDecoder.decodeObject(forKey: SerializationKeys.superNotes) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(crossedHabLine, forKey: SerializationKeys.crossedHabLine)
    aCoder.encode(timeline, forKey: SerializationKeys.timeline)
    aCoder.encode(calculatedData, forKey: SerializationKeys.calculatedData)
    aCoder.encode(preload, forKey: SerializationKeys.preload)
    aCoder.encode(startingLocation, forKey: SerializationKeys.startingLocation)
    aCoder.encode(startingLevel, forKey: SerializationKeys.startingLevel)
    aCoder.encode(driverStation, forKey: SerializationKeys.driverStation)
    aCoder.encode(isNoShow, forKey: SerializationKeys.isNoShow)
    aCoder.encode(teamNumber, forKey: SerializationKeys.teamNumber)
    aCoder.encode(matchNumber, forKey: SerializationKeys.matchNumber)
    aCoder.encode(superNotes, forKey: SerializationKeys.superNotes)
  }

}
