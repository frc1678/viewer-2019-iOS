//
//  CalculatedTeamData.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedTeamData: NSObject {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let avgNumCubesFumbledAuto = "avgNumCubesFumbledAuto"
    static let avgNumHumanPortalIntakeTele = "avgNumHumanPortalIntakeTele"
    static let switchFailPercentageAuto = "switchFailPercentageAuto"
    static let avgNumElevatedPyramidIntakeAuto = "avgNumElevatedPyramidIntakeAuto"
    static let avgCubesPlacedInSwitchTele = "avgCubesPlacedInSwitchTele"
    static let avgCubesPlacedInScaleTele = "avgCubesPlacedInScaleTele"
    static let avgAgility = "avgAgility"
    static let secondPickAbility = "secondPickAbility"
    static let avgNumGoodDecicions = "avgNumGoodDecicions"
    static let avgNumBluePlatformIntakeAuto = "avgNumBluePlatformIntakeAuto"
    static let avgNumReturnIntakeTele = "avgNumReturnIntakeTele"
    static let avgNumRedPlatformIntakeTele = "avgNumRedPlatformIntakeTele"
    static let avgNumBadDecisions = "avgNumBadDecisions"
    static let avgClimbTime = "avgClimbTime"
    static let predictedClimb = "predictedClimb"
    static let avgDrivingAbility = "avgDrivingAbility"
    static let avgNumExchangeInputTele = "avgNumExchangeInputTele"
    static let avgDefense = "avgDefense"
    static let avgCubesPlacedInScaleAuto = "avgCubesPlacedInScaleAuto"
    static let disabledPercentage = "disabledPercentage"
    static let predictedNumScaleCubesAuto = "predictedNumScaleCubesAuto"
    static let scaleFailPercentageTele = "scaleFailPercentageTele"
    static let incapacitatedPercentage = "incapacitatedPercentage"
    static let predictedNumAllianceSwitchCubesAuto = "predictedNumAllianceSwitchCubesAuto"
    static let autoRunPercentage = "autoRunPercentage"
    static let avgNumCubesFumbledTele = "avgNumCubesFumbledTele"
    static let scaleFailPercentageAuto = "scaleFailPercentageAuto"
    static let avgCubesSpilled = "avgCubesSpilled"
    static let avgCubesPlacedInSwitchAuto = "avgCubesPlacedInSwitchAuto"
    static let switchFailPercentageTele = "switchFailPercentageTele"
    static let avgNumBluePlatformIntakeTele = "avgNumBluePlatformIntakeTele"
    static let avgNumGroundIntakeTele = "avgNumGroundIntakeTele"
    static let climbPercentage = "climbPercentage"
    static let avgNumRedPlatformIntakeAuto = "avgNumRedPlatformIntakeAuto"
    static let canScoreBothSwitchSidesAuto = "canScoreBothSwitchSidesAuto"
    static let avgNumGroundPortalIntakeTele = "avgNumGroundPortalIntakeTele"
    static let avgNumElevatedPyramidIntakeTele = "avgNumElevatedPyramidIntakeTele"
    static let avgNumGroundPyramidIntakeTele = "avgNumGroundPyramidIntakeTele"
    static let numMatchesPlayed = "numMatchesPlayed"
    static let avgNumGroundPyramidIntakeAuto = "avgNumGroundPyramidIntakeAuto"
    static let avgSpeed = "avgSpeed"
    static let firstPickAbility = "firstPickAbility"
    static let actualSeed = "actualSeed"
    static let predictedSeed = "predictedSeed"
    static let predictedNumRPs = "predictedNumRPs"
    static let actualNumRPs = "actualNumRPs"
    static let dysfunctionalPercentage = "dysfunctionalPercentage"
  }

  // MARK: Properties
  public var avgNumCubesFumbledAuto: Float?
  public var avgNumHumanPortalIntakeTele: Float?
  public var switchFailPercentageAuto: Float?
  public var avgNumElevatedPyramidIntakeAuto: Float?
  public var avgCubesPlacedInSwitchTele: Float?
  public var avgCubesPlacedInScaleTele: Float?
  public var avgAgility: Float?
  public var secondPickAbility: Float?
  public var avgNumGoodDecicions: Float?
  public var avgNumBluePlatformIntakeAuto: Float?
  public var avgNumReturnIntakeTele: Float?
  public var avgNumRedPlatformIntakeTele: Float?
  public var avgNumBadDecisions: Float?
  public var avgClimbTime: Float?
  public var predictedClimb: Float?
  public var avgDrivingAbility: Float?
  public var avgNumExchangeInputTele: Float?
  public var avgDefense: Float?
  public var avgCubesPlacedInScaleAuto: Float?
  public var disabledPercentage: Float = -1.0
  public var predictedNumScaleCubesAuto: Float?
  public var scaleFailPercentageTele: Float?
  public var incapacitatedPercentage: Float = -1.0
  public var predictedNumAllianceSwitchCubesAuto: Float?
  public var autoRunPercentage: Float?
  public var avgNumCubesFumbledTele: Float?
  public var scaleFailPercentageAuto: Float?
  public var avgCubesSpilled: Float?
  public var avgCubesPlacedInSwitchAuto: Float?
  public var switchFailPercentageTele: Float?
  public var avgNumBluePlatformIntakeTele: Float?
  public var avgNumGroundIntakeTele: Float?
  public var climbPercentage: Float?
  public var avgNumRedPlatformIntakeAuto: Float?
  public var canScoreBothSwitchSidesAuto: Bool? = false
  public var avgNumGroundPortalIntakeTele: Float?
  public var avgNumElevatedPyramidIntakeTele: Float?
  public var avgNumGroundPyramidIntakeTele: Float?
  public var numMatchesPlayed: Int?
  public var avgNumGroundPyramidIntakeAuto: Float = -1.0
  public var avgSpeed: Float?
  public var firstPickAbility: Float = -1.0
    public var actualSeed: Int = -1
    public var predictedSeed: Int?
    public var predictedNumRPs: Float = 1.0
    public var actualNumRPs: Float = -1.0
    public var dysfunctionalPercentage: Float = -1.0
    
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
    avgNumCubesFumbledAuto = json[SerializationKeys.avgNumCubesFumbledAuto].float
    avgNumHumanPortalIntakeTele = json[SerializationKeys.avgNumHumanPortalIntakeTele].float
    switchFailPercentageAuto = json[SerializationKeys.switchFailPercentageAuto].float
    avgNumElevatedPyramidIntakeAuto = json[SerializationKeys.avgNumElevatedPyramidIntakeAuto].float
    avgCubesPlacedInSwitchTele = json[SerializationKeys.avgCubesPlacedInSwitchTele].float
    avgCubesPlacedInScaleTele = json[SerializationKeys.avgCubesPlacedInScaleTele].float
    avgAgility = json[SerializationKeys.avgAgility].float
    secondPickAbility = json[SerializationKeys.secondPickAbility].float
    avgNumGoodDecicions = json[SerializationKeys.avgNumGoodDecicions].float
    avgNumBluePlatformIntakeAuto = json[SerializationKeys.avgNumBluePlatformIntakeAuto].float
    avgNumReturnIntakeTele = json[SerializationKeys.avgNumReturnIntakeTele].float
    avgNumRedPlatformIntakeTele = json[SerializationKeys.avgNumRedPlatformIntakeTele].float
    avgNumBadDecisions = json[SerializationKeys.avgNumBadDecisions].float
    avgClimbTime = json[SerializationKeys.avgClimbTime].float
    predictedClimb = json[SerializationKeys.predictedClimb].float
    avgDrivingAbility = json[SerializationKeys.avgDrivingAbility].float
    avgNumExchangeInputTele = json[SerializationKeys.avgNumExchangeInputTele].float
    avgDefense = json[SerializationKeys.avgDefense].float
    avgCubesPlacedInScaleAuto = json[SerializationKeys.avgCubesPlacedInScaleAuto].float
    disabledPercentage = json[SerializationKeys.disabledPercentage].floatValue
    predictedNumScaleCubesAuto = json[SerializationKeys.predictedNumScaleCubesAuto].float
    scaleFailPercentageTele = json[SerializationKeys.scaleFailPercentageTele].float
    incapacitatedPercentage = json[SerializationKeys.incapacitatedPercentage].floatValue
    predictedNumAllianceSwitchCubesAuto = json[SerializationKeys.predictedNumAllianceSwitchCubesAuto].float
    autoRunPercentage = json[SerializationKeys.autoRunPercentage].float
    avgNumCubesFumbledTele = json[SerializationKeys.avgNumCubesFumbledTele].float
    scaleFailPercentageAuto = json[SerializationKeys.scaleFailPercentageAuto].float
    avgCubesSpilled = json[SerializationKeys.avgCubesSpilled].float
    avgCubesPlacedInSwitchAuto = json[SerializationKeys.avgCubesPlacedInSwitchAuto].float
    switchFailPercentageTele = json[SerializationKeys.switchFailPercentageTele].float
    avgNumBluePlatformIntakeTele = json[SerializationKeys.avgNumBluePlatformIntakeTele].float
    avgNumGroundIntakeTele = json[SerializationKeys.avgNumGroundIntakeTele].float
    climbPercentage = json[SerializationKeys.climbPercentage].float
    avgNumRedPlatformIntakeAuto = json[SerializationKeys.avgNumRedPlatformIntakeAuto].float
    canScoreBothSwitchSidesAuto = json[SerializationKeys.canScoreBothSwitchSidesAuto].boolValue
    avgNumGroundPortalIntakeTele = json[SerializationKeys.avgNumGroundPortalIntakeTele].float
    avgNumElevatedPyramidIntakeTele = json[SerializationKeys.avgNumElevatedPyramidIntakeTele].float
    avgNumGroundPyramidIntakeTele = json[SerializationKeys.avgNumGroundPyramidIntakeTele].float
    numMatchesPlayed = json[SerializationKeys.numMatchesPlayed].int
    avgNumGroundPyramidIntakeAuto = json[SerializationKeys.avgNumGroundPyramidIntakeAuto].float!
    avgSpeed = json[SerializationKeys.avgSpeed].float
    firstPickAbility = json[SerializationKeys.firstPickAbility].floatValue
    actualSeed = json[SerializationKeys.actualSeed].intValue
    predictedSeed = json[SerializationKeys.predictedSeed].int
    predictedNumRPs = json[SerializationKeys.predictedNumRPs].floatValue
    actualNumRPs = json[SerializationKeys.actualNumRPs].floatValue
    dysfunctionalPercentage = json[SerializationKeys.dysfunctionalPercentage].floatValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = avgNumCubesFumbledAuto { dictionary[SerializationKeys.avgNumCubesFumbledAuto] = value }
    if let value = avgNumHumanPortalIntakeTele { dictionary[SerializationKeys.avgNumHumanPortalIntakeTele] = value }
    if let value = switchFailPercentageAuto { dictionary[SerializationKeys.switchFailPercentageAuto] = value }
    if let value = avgNumElevatedPyramidIntakeAuto { dictionary[SerializationKeys.avgNumElevatedPyramidIntakeAuto] = value }
    if let value = avgCubesPlacedInSwitchTele { dictionary[SerializationKeys.avgCubesPlacedInSwitchTele] = value }
    if let value = avgCubesPlacedInScaleTele { dictionary[SerializationKeys.avgCubesPlacedInScaleTele] = value }
    if let value = avgAgility { dictionary[SerializationKeys.avgAgility] = value }
    if let value = secondPickAbility { dictionary[SerializationKeys.secondPickAbility] = value }
    if let value = avgNumGoodDecicions { dictionary[SerializationKeys.avgNumGoodDecicions] = value }
    if let value = avgNumBluePlatformIntakeAuto { dictionary[SerializationKeys.avgNumBluePlatformIntakeAuto] = value }
    if let value = avgNumReturnIntakeTele { dictionary[SerializationKeys.avgNumReturnIntakeTele] = value }
    if let value = avgNumRedPlatformIntakeTele { dictionary[SerializationKeys.avgNumRedPlatformIntakeTele] = value }
    if let value = avgNumBadDecisions { dictionary[SerializationKeys.avgNumBadDecisions] = value }
    if let value = avgClimbTime { dictionary[SerializationKeys.avgClimbTime] = value }
    if let value = predictedClimb { dictionary[SerializationKeys.predictedClimb] = value }
    if let value = avgDrivingAbility { dictionary[SerializationKeys.avgDrivingAbility] = value }
    if let value = avgNumExchangeInputTele { dictionary[SerializationKeys.avgNumExchangeInputTele] = value }
    if let value = avgDefense { dictionary[SerializationKeys.avgDefense] = value }
    if let value = avgCubesPlacedInScaleAuto { dictionary[SerializationKeys.avgCubesPlacedInScaleAuto] = value }
    dictionary[SerializationKeys.disabledPercentage] = disabledPercentage
    if let value = predictedNumScaleCubesAuto { dictionary[SerializationKeys.predictedNumScaleCubesAuto] = value }
    if let value = scaleFailPercentageTele { dictionary[SerializationKeys.scaleFailPercentageTele] = value }
    dictionary[SerializationKeys.incapacitatedPercentage] = incapacitatedPercentage
    if let value = predictedNumAllianceSwitchCubesAuto { dictionary[SerializationKeys.predictedNumAllianceSwitchCubesAuto] = value }
    if let value = autoRunPercentage { dictionary[SerializationKeys.autoRunPercentage] = value }
    if let value = avgNumCubesFumbledTele { dictionary[SerializationKeys.avgNumCubesFumbledTele] = value }
    if let value = scaleFailPercentageAuto { dictionary[SerializationKeys.scaleFailPercentageAuto] = value }
    if let value = avgCubesSpilled { dictionary[SerializationKeys.avgCubesSpilled] = value }
    if let value = avgCubesPlacedInSwitchAuto { dictionary[SerializationKeys.avgCubesPlacedInSwitchAuto] = value }
    if let value = switchFailPercentageTele { dictionary[SerializationKeys.switchFailPercentageTele] = value }
    if let value = avgNumBluePlatformIntakeTele { dictionary[SerializationKeys.avgNumBluePlatformIntakeTele] = value }
    if let value = avgNumGroundIntakeTele { dictionary[SerializationKeys.avgNumGroundIntakeTele] = value }
    if let value = climbPercentage { dictionary[SerializationKeys.climbPercentage] = value }
    if let value = avgNumRedPlatformIntakeAuto { dictionary[SerializationKeys.avgNumRedPlatformIntakeAuto] = value }
    dictionary[SerializationKeys.canScoreBothSwitchSidesAuto] = canScoreBothSwitchSidesAuto
    if let value = avgNumGroundPortalIntakeTele { dictionary[SerializationKeys.avgNumGroundPortalIntakeTele] = value }
    if let value = avgNumElevatedPyramidIntakeTele { dictionary[SerializationKeys.avgNumElevatedPyramidIntakeTele] = value }
    if let value = avgNumGroundPyramidIntakeTele { dictionary[SerializationKeys.avgNumGroundPyramidIntakeTele] = value }
    if let value = numMatchesPlayed { dictionary[SerializationKeys.numMatchesPlayed] = value }
    dictionary[SerializationKeys.avgNumGroundPyramidIntakeAuto] = avgNumGroundPyramidIntakeAuto

    if let value = avgSpeed { dictionary[SerializationKeys.avgSpeed] = value }
    dictionary[SerializationKeys.firstPickAbility] = firstPickAbility
    dictionary[SerializationKeys.actualSeed] = actualSeed
    if let value = predictedSeed { dictionary[SerializationKeys.predictedSeed] = value }
    dictionary[SerializationKeys.predictedNumRPs] = predictedNumRPs
    dictionary[SerializationKeys.actualNumRPs] = actualNumRPs
    dictionary[SerializationKeys.dysfunctionalPercentage] = dysfunctionalPercentage
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avgNumCubesFumbledAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumCubesFumbledAuto) as? Float
    self.avgNumHumanPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumHumanPortalIntakeTele) as? Float
    self.switchFailPercentageAuto = aDecoder.decodeObject(forKey: SerializationKeys.switchFailPercentageAuto) as? Float
    self.avgNumElevatedPyramidIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumElevatedPyramidIntakeAuto) as? Float
    self.avgCubesPlacedInSwitchTele = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInSwitchTele) as? Float
    self.avgCubesPlacedInScaleTele = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInScaleTele) as? Float
    self.avgAgility = aDecoder.decodeObject(forKey: SerializationKeys.avgAgility) as? Float
    self.secondPickAbility = aDecoder.decodeObject(forKey: SerializationKeys.secondPickAbility) as? Float
    self.avgNumGoodDecicions = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGoodDecicions) as? Float
    self.avgNumBluePlatformIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumBluePlatformIntakeAuto) as? Float
    self.avgNumReturnIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumReturnIntakeTele) as? Float
    self.avgNumRedPlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumRedPlatformIntakeTele) as? Float
    self.avgNumBadDecisions = aDecoder.decodeObject(forKey: SerializationKeys.avgNumBadDecisions) as? Float
    self.avgClimbTime = aDecoder.decodeObject(forKey: SerializationKeys.avgClimbTime) as? Float
    self.predictedClimb = aDecoder.decodeObject(forKey: SerializationKeys.predictedClimb) as? Float
    self.avgDrivingAbility = aDecoder.decodeObject(forKey: SerializationKeys.avgDrivingAbility) as? Float
    self.avgNumExchangeInputTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumExchangeInputTele) as? Float
    self.avgDefense = aDecoder.decodeObject(forKey: SerializationKeys.avgDefense) as? Float
    self.avgCubesPlacedInScaleAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInScaleAuto) as? Float
    self.disabledPercentage = (aDecoder.decodeObject(forKey: SerializationKeys.disabledPercentage) as? Float)!
    self.predictedNumScaleCubesAuto = aDecoder.decodeObject(forKey: SerializationKeys.predictedNumScaleCubesAuto) as? Float
    self.scaleFailPercentageTele = aDecoder.decodeObject(forKey: SerializationKeys.scaleFailPercentageTele) as? Float
    self.incapacitatedPercentage = (aDecoder.decodeObject(forKey: SerializationKeys.incapacitatedPercentage) as? Float)!
    self.predictedNumAllianceSwitchCubesAuto = aDecoder.decodeObject(forKey: SerializationKeys.predictedNumAllianceSwitchCubesAuto) as? Float
    self.autoRunPercentage = aDecoder.decodeObject(forKey: SerializationKeys.autoRunPercentage) as? Float
    self.avgNumCubesFumbledTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumCubesFumbledTele) as? Float
    self.scaleFailPercentageAuto = aDecoder.decodeObject(forKey: SerializationKeys.scaleFailPercentageAuto) as? Float
    self.avgCubesSpilled = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesSpilled) as? Float
    self.avgCubesPlacedInSwitchAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInSwitchAuto) as? Float
    self.switchFailPercentageTele = aDecoder.decodeObject(forKey: SerializationKeys.switchFailPercentageTele) as? Float
    self.avgNumBluePlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumBluePlatformIntakeTele) as? Float
    self.avgNumGroundIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundIntakeTele) as? Float
    self.climbPercentage = aDecoder.decodeObject(forKey: SerializationKeys.climbPercentage) as? Float
    self.avgNumRedPlatformIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumRedPlatformIntakeAuto) as? Float
    self.canScoreBothSwitchSidesAuto = aDecoder.decodeBool(forKey: SerializationKeys.canScoreBothSwitchSidesAuto)
    self.avgNumGroundPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundPortalIntakeTele) as? Float
    self.avgNumElevatedPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumElevatedPyramidIntakeTele) as? Float
    self.avgNumGroundPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundPyramidIntakeTele) as? Float
    self.numMatchesPlayed = aDecoder.decodeObject(forKey: SerializationKeys.numMatchesPlayed) as? Int
    self.avgNumGroundPyramidIntakeAuto = (aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundPyramidIntakeAuto) as? Float)!
    self.avgSpeed = aDecoder.decodeObject(forKey: SerializationKeys.avgSpeed) as? Float
    self.firstPickAbility = (aDecoder.decodeObject(forKey: SerializationKeys.firstPickAbility) as? Float)!
    self.actualSeed = (aDecoder.decodeObject(forKey: SerializationKeys.actualSeed) as? Int)!
    self.predictedSeed = aDecoder.decodeObject(forKey: SerializationKeys.predictedSeed) as? Int
    self.predictedNumRPs = (aDecoder.decodeObject(forKey: SerializationKeys.predictedNumRPs) as? Float)!
    self.actualNumRPs = (aDecoder.decodeObject(forKey: SerializationKeys.actualNumRPs) as? Float)!
    self.dysfunctionalPercentage = (aDecoder.decodeObject(forKey: SerializationKeys.dysfunctionalPercentage) as? Float)!
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avgNumCubesFumbledAuto, forKey: SerializationKeys.avgNumCubesFumbledAuto)
    aCoder.encode(avgNumHumanPortalIntakeTele, forKey: SerializationKeys.avgNumHumanPortalIntakeTele)
    aCoder.encode(switchFailPercentageAuto, forKey: SerializationKeys.switchFailPercentageAuto)
    aCoder.encode(avgNumElevatedPyramidIntakeAuto, forKey: SerializationKeys.avgNumElevatedPyramidIntakeAuto)
    aCoder.encode(avgCubesPlacedInSwitchTele, forKey: SerializationKeys.avgCubesPlacedInSwitchTele)
    aCoder.encode(avgCubesPlacedInScaleTele, forKey: SerializationKeys.avgCubesPlacedInScaleTele)
    aCoder.encode(avgAgility, forKey: SerializationKeys.avgAgility)
    aCoder.encode(secondPickAbility, forKey: SerializationKeys.secondPickAbility)
    aCoder.encode(avgNumGoodDecicions, forKey: SerializationKeys.avgNumGoodDecicions)
    aCoder.encode(avgNumBluePlatformIntakeAuto, forKey: SerializationKeys.avgNumBluePlatformIntakeAuto)
    aCoder.encode(avgNumReturnIntakeTele, forKey: SerializationKeys.avgNumReturnIntakeTele)
    aCoder.encode(avgNumRedPlatformIntakeTele, forKey: SerializationKeys.avgNumRedPlatformIntakeTele)
    aCoder.encode(avgNumBadDecisions, forKey: SerializationKeys.avgNumBadDecisions)
    aCoder.encode(avgClimbTime, forKey: SerializationKeys.avgClimbTime)
    aCoder.encode(predictedClimb, forKey: SerializationKeys.predictedClimb)
    aCoder.encode(avgDrivingAbility, forKey: SerializationKeys.avgDrivingAbility)
    aCoder.encode(avgNumExchangeInputTele, forKey: SerializationKeys.avgNumExchangeInputTele)
    aCoder.encode(avgDefense, forKey: SerializationKeys.avgDefense)
    aCoder.encode(avgCubesPlacedInScaleAuto, forKey: SerializationKeys.avgCubesPlacedInScaleAuto)
    aCoder.encode(disabledPercentage, forKey: SerializationKeys.disabledPercentage)
    aCoder.encode(predictedNumScaleCubesAuto, forKey: SerializationKeys.predictedNumScaleCubesAuto)
    aCoder.encode(scaleFailPercentageTele, forKey: SerializationKeys.scaleFailPercentageTele)
    aCoder.encode(incapacitatedPercentage, forKey: SerializationKeys.incapacitatedPercentage)
    aCoder.encode(predictedNumAllianceSwitchCubesAuto, forKey: SerializationKeys.predictedNumAllianceSwitchCubesAuto)
    aCoder.encode(autoRunPercentage, forKey: SerializationKeys.autoRunPercentage)
    aCoder.encode(avgNumCubesFumbledTele, forKey: SerializationKeys.avgNumCubesFumbledTele)
    aCoder.encode(scaleFailPercentageAuto, forKey: SerializationKeys.scaleFailPercentageAuto)
    aCoder.encode(avgCubesSpilled, forKey: SerializationKeys.avgCubesSpilled)
    aCoder.encode(avgCubesPlacedInSwitchAuto, forKey: SerializationKeys.avgCubesPlacedInSwitchAuto)
    aCoder.encode(switchFailPercentageTele, forKey: SerializationKeys.switchFailPercentageTele)
    aCoder.encode(avgNumBluePlatformIntakeTele, forKey: SerializationKeys.avgNumBluePlatformIntakeTele)
    aCoder.encode(avgNumGroundIntakeTele, forKey: SerializationKeys.avgNumGroundIntakeTele)
    aCoder.encode(climbPercentage, forKey: SerializationKeys.climbPercentage)
    aCoder.encode(avgNumRedPlatformIntakeAuto, forKey: SerializationKeys.avgNumRedPlatformIntakeAuto)
    aCoder.encode(canScoreBothSwitchSidesAuto, forKey: SerializationKeys.canScoreBothSwitchSidesAuto)
    aCoder.encode(avgNumGroundPortalIntakeTele, forKey: SerializationKeys.avgNumGroundPortalIntakeTele)
    aCoder.encode(avgNumElevatedPyramidIntakeTele, forKey: SerializationKeys.avgNumElevatedPyramidIntakeTele)
    aCoder.encode(avgNumGroundPyramidIntakeTele, forKey: SerializationKeys.avgNumGroundPyramidIntakeTele)
    aCoder.encode(numMatchesPlayed, forKey: SerializationKeys.numMatchesPlayed)
    aCoder.encode(avgNumGroundPyramidIntakeAuto, forKey: SerializationKeys.avgNumGroundPyramidIntakeAuto)
    aCoder.encode(avgSpeed, forKey: SerializationKeys.avgSpeed)
    aCoder.encode(firstPickAbility, forKey: SerializationKeys.firstPickAbility)
    aCoder.encode(actualSeed, forKey: SerializationKeys.actualSeed)
    aCoder.encode(predictedSeed, forKey: SerializationKeys.predictedSeed)
    aCoder.encode(actualNumRPs, forKey: SerializationKeys.actualNumRPs)
    aCoder.encode(predictedNumRPs, forKey: SerializationKeys.predictedNumRPs)
    aCoder.encode(dysfunctionalPercentage, forKey: SerializationKeys.dysfunctionalPercentage)
  }

}
