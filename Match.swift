//
//  Match.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Match: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let blueTeams = "blueTeams"
    static let blueActualRPs = "blueActualRPs"
    static let redDidClimbRP = "redDidClimbRP"
    static let calculatedData = "calculatedData"
    static let redFoulPoints = "redFoulPoints"
    static let redActualRPs = "redActualRPs"
    static let blueActualScore = "blueActualScore"
    static let blueFoulPoints = "blueFoulPoints"
    static let blueDidRocketRP = "blueDidRocketRP"
    static let redTeams = "redTeams"
    static let redActualScore = "redActualScore"
    static let blueDidClimbRP = "blueDidClimbRP"
    static let redDidRocketRP = "redDidRocketRP"
    static let blueCargoShipPreload = "blueCargoShipPreload"
    static let redCargoShipPreload = "redCargoShipPreload"
    static let noShowTeams = "noShowTeams"
    static let matchNumber = "matchNumber"
  }

  // MARK: Properties
  @objc public var blueTeams: [Int]?
  public var blueActualRPs: Int?
  @objc public var redDidClimbRP: Bool = false
  @objc public var calculatedData: CalculatedMatchData?
  public var redFoulPoints: Int?
  public var redActualRPs: Int?
  @objc public var blueActualScore: Int = -1
  public var blueFoulPoints: Int?
  @objc public var blueDidRocketRP: Bool = false
  @objc public var redTeams: [Int]?
  @objc public var redActualScore: Int = -1
  @objc public var blueDidClimbRP: Bool = false
  @objc public var redDidRocketRP: Bool = false
    public var blueCargoShipPreload: [String:String]?
    public var redCargoShipPreload: [String:String]?
    public var noShowTeams: [Int]?
    @objc public var matchNumber: Int = -1

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
    if let items = json[SerializationKeys.blueTeams].array { blueTeams = items.map { $0.intValue } }
    blueActualRPs = json[SerializationKeys.blueActualRPs].int
    redDidClimbRP = json[SerializationKeys.redDidClimbRP].boolValue
    calculatedData = CalculatedMatchData(json: json[SerializationKeys.calculatedData])
    redFoulPoints = json[SerializationKeys.redFoulPoints].int
    redActualRPs = json[SerializationKeys.redActualRPs].int
    blueActualScore = json[SerializationKeys.blueActualScore].intValue
    blueFoulPoints = json[SerializationKeys.blueFoulPoints].int
    blueDidRocketRP = json[SerializationKeys.blueDidRocketRP].boolValue
    if let items = json[SerializationKeys.redTeams].array { redTeams = items.map { $0.intValue } }
    redActualScore = json[SerializationKeys.redActualScore].intValue
    blueDidClimbRP = json[SerializationKeys.blueDidClimbRP].boolValue
    redDidRocketRP = json[SerializationKeys.redDidRocketRP].boolValue
    blueCargoShipPreload = json[SerializationKeys.blueCargoShipPreload].dictionaryObject as! [String : String]
    redCargoShipPreload = json[SerializationKeys.redCargoShipPreload].dictionaryObject as! [String: String]
    if let items = json[SerializationKeys.noShowTeams].array { noShowTeams = items.map { $0.intValue } }
    matchNumber = json[SerializationKeys.matchNumber].intValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = blueTeams { dictionary[SerializationKeys.blueTeams] = value }
    if let value = blueActualRPs { dictionary[SerializationKeys.blueActualRPs] = value }
    dictionary[SerializationKeys.redDidClimbRP] = redDidClimbRP
    if let value = calculatedData { dictionary[SerializationKeys.calculatedData] = value.dictionaryRepresentation() }
    if let value = redFoulPoints { dictionary[SerializationKeys.redFoulPoints] = value }
    if let value = redActualRPs { dictionary[SerializationKeys.redActualRPs] = value }
    dictionary[SerializationKeys.blueActualScore] = blueActualScore
    if let value = blueFoulPoints { dictionary[SerializationKeys.blueFoulPoints] = value }
    dictionary[SerializationKeys.blueDidRocketRP] = blueDidRocketRP
    if let value = redTeams { dictionary[SerializationKeys.redTeams] = value }
    dictionary[SerializationKeys.redActualScore] = redActualScore
    dictionary[SerializationKeys.blueDidClimbRP] = blueDidClimbRP
    dictionary[SerializationKeys.redDidRocketRP] = redDidRocketRP
    if let value = blueCargoShipPreload { dictionary[SerializationKeys.blueCargoShipPreload] = value }
    if let value = redCargoShipPreload { dictionary[SerializationKeys.redCargoShipPreload] = value}
    if let value = noShowTeams { dictionary[SerializationKeys.noShowTeams] = value }
    dictionary[SerializationKeys.matchNumber] = matchNumber
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.blueTeams = aDecoder.decodeObject(forKey: SerializationKeys.blueTeams) as? [Int]
    self.blueActualRPs = aDecoder.decodeObject(forKey: SerializationKeys.blueActualRPs) as? Int
    self.redDidClimbRP = aDecoder.decodeBool(forKey: SerializationKeys.redDidClimbRP)
    self.calculatedData = aDecoder.decodeObject(forKey: SerializationKeys.calculatedData) as? CalculatedMatchData
    self.redFoulPoints = aDecoder.decodeObject(forKey: SerializationKeys.redFoulPoints) as? Int
    self.redActualRPs = aDecoder.decodeObject(forKey: SerializationKeys.redActualRPs) as? Int
    self.blueActualScore = aDecoder.decodeInteger(forKey: SerializationKeys.blueActualScore)
    self.blueFoulPoints = aDecoder.decodeObject(forKey: SerializationKeys.blueFoulPoints) as? Int
    self.blueDidRocketRP = aDecoder.decodeBool(forKey: SerializationKeys.blueDidRocketRP)
    self.redTeams = aDecoder.decodeObject(forKey: SerializationKeys.redTeams) as? [Int]
    self.redActualScore = aDecoder.decodeInteger(forKey: SerializationKeys.redActualScore)
    self.blueDidClimbRP = aDecoder.decodeBool(forKey: SerializationKeys.blueDidClimbRP)
    self.redDidRocketRP = aDecoder.decodeBool(forKey: SerializationKeys.redDidRocketRP)
    self.blueCargoShipPreload = aDecoder.decodeObject(forKey: SerializationKeys.blueCargoShipPreload) as? [String:String]
    self.redCargoShipPreload = aDecoder.decodeObject(forKey: SerializationKeys.redCargoShipPreload) as? [String:String]
    self.noShowTeams = aDecoder.decodeObject(forKey: SerializationKeys.noShowTeams) as? [Int]
    self.matchNumber = aDecoder.decodeInteger(forKey: SerializationKeys.matchNumber)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(blueTeams, forKey: SerializationKeys.blueTeams)
    aCoder.encode(blueActualRPs, forKey: SerializationKeys.blueActualRPs)
    aCoder.encode(redDidClimbRP, forKey: SerializationKeys.redDidClimbRP)
    aCoder.encode(calculatedData, forKey: SerializationKeys.calculatedData)
    aCoder.encode(redFoulPoints, forKey: SerializationKeys.redFoulPoints)
    aCoder.encode(redActualRPs, forKey: SerializationKeys.redActualRPs)
    aCoder.encode(blueActualScore, forKey: SerializationKeys.blueActualScore)
    aCoder.encode(blueFoulPoints, forKey: SerializationKeys.blueFoulPoints)
    aCoder.encode(blueDidRocketRP, forKey: SerializationKeys.blueDidRocketRP)
    aCoder.encode(redTeams, forKey: SerializationKeys.redTeams)
    aCoder.encode(redActualScore, forKey: SerializationKeys.redActualScore)
    aCoder.encode(blueDidClimbRP, forKey: SerializationKeys.blueDidClimbRP)
    aCoder.encode(redDidRocketRP, forKey: SerializationKeys.redDidRocketRP)
    aCoder.encode(blueCargoShipPreload, forKey: SerializationKeys.blueCargoShipPreload)
    aCoder.encode(redCargoShipPreload, forKey: SerializationKeys.redCargoShipPreload)
    aCoder.encode(noShowTeams, forKey: SerializationKeys.noShowTeams)
    aCoder.encode(matchNumber, forKey: SerializationKeys.matchNumber)
  }

}
