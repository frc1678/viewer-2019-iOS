//
//  CalculatedTeamData.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedTeamData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let avgNumCubesFumbledAuto = "avgNumCubesFumbledAuto"
    static let lfmAvgNumBluePlatformIntakeAuto = "lfmAvgNumBluePlatformIntakeAuto"
    static let lfmAvgNumHumanPortalIntakeTele = "lfmAvgNumHumanPortalIntakeTele"
    static let avgNumHumanPortalIntakeTele = "avgNumHumanPortalIntakeTele"
    static let switchFailPercentageAuto = "switchFailPercentageAuto"
    static let avgNumElevatedPyramidIntakeAuto = "avgNumElevatedPyramidIntakeAuto"
    static let avgCubesPlacedInSwitchTele = "avgCubesPlacedInSwitchTele"
    static let lfmAvgNumGroundPyramidIntakeAuto = "lfmAvgNumGroundPyramidIntakeAuto"
    static let avgCubesPlacedInScaleTele = "avgCubesPlacedInScaleTele"
    static let lfmAvgDefense = "lfmAvgDefense"
    static let avgAgility = "avgAgility"
    static let secondPickAbility = "secondPickAbility"
    static let avgNumGoodDecicions = "avgNumGoodDecicions"
    static let avgNumBluePlatformIntakeAuto = "avgNumBluePlatformIntakeAuto"
    static let avgNumReturnIntakeTele = "avgNumReturnIntakeTele"
    static let lfmAvgNumGroundIntakeTele = "lfmAvgNumGroundIntakeTele"
    static let avgNumRedPlatformIntakeTele = "avgNumRedPlatformIntakeTele"
    static let avgNumBadDecisions = "avgNumBadDecisions"
    static let avgClimbTime = "avgClimbTime"
    static let predictedClimb = "predictedClimb"
    static let avgDrivingAbility = "avgDrivingAbility"
    static let lfmAvgNumCubesFumbledAuto = "lfmAvgNumCubesFumbledAuto"
    static let lfmAvgNumGroundPortalIntakeTele = "lfmAvgNumGroundPortalIntakeTele"
    static let avgNumExchangeInputTele = "avgNumExchangeInputTele"
    static let avgDefense = "avgDefense"
    static let avgCubesPlacedInScaleAuto = "avgCubesPlacedInScaleAuto"
    static let disabledPercentage = "disabledPercentage"
    static let lfmAvgNumRedPlatformIntakeTele = "lfmAvgNumRedPlatformIntakeTele"
    static let predictedNumScaleCubesAuto = "predictedNumScaleCubesAuto"
    static let lfmAvgNumExchangeInputTele = "lfmAvgNumExchangeInputTele"
    static let lfmAvgNumBadDecisions = "lfmAvgNumBadDecisions"
    static let scaleFailPercentageTele = "scaleFailPercentageTele"
    static let incapacitatedPercentage = "incapacitatedPercentage"
    static let predictedNumAllianceSwitchCubesAuto = "predictedNumAllianceSwitchCubesAuto"
    static let autoRunPercentage = "autoRunPercentage"
    static let avgNumCubesFumbledTele = "avgNumCubesFumbledTele"
    static let scaleFailPercentageAuto = "scaleFailPercentageAuto"
    static let avgCubesSpilled = "avgCubesSpilled"
    static let lfmAvgNumRedPlatformIntakeAuto = "lfmAvgNumRedPlatformIntakeAuto"
    static let avgCubesPlacedInSwitchAuto = "avgCubesPlacedInSwitchAuto"
    static let switchFailPercentageTele = "switchFailPercentageTele"
    static let avgNumBluePlatformIntakeTele = "avgNumBluePlatformIntakeTele"
    static let lfmAvgCubesSpilled = "lfmAvgCubesSpilled"
    static let lfmAvgSpeed = "lfmAvgSpeed"
    static let avgNumGroundIntakeTele = "avgNumGroundIntakeTele"
    static let climbPercentage = "climbPercentage"
    static let lfmAvgDrivingAbility = "lfmAvgDrivingAbility"
    static let lfmAvgNumGoodDecicions = "lfmAvgNumGoodDecicions"
    static let name = "name"
    static let avgNumRedPlatformIntakeAuto = "avgNumRedPlatformIntakeAuto"
    static let canScoreBothSwitchSidesAuto = "canScoreBothSwitchSidesAuto"
    static let lfmAvgAgility = "lfmAvgAgility"
    static let lfmAvgNumElevatedPyramidIntakeAuto = "lfmAvgNumElevatedPyramidIntakeAuto"
    static let lfmAvgNumCubesFumbledTele = "lfmAvgNumCubesFumbledTele"
    static let number = "number"
    static let avgNumGroundPortalIntakeTele = "avgNumGroundPortalIntakeTele"
    static let avgNumElevatedPyramidIntakeTele = "avgNumElevatedPyramidIntakeTele"
    static let avgNumGroundPyramidIntakeTele = "avgNumGroundPyramidIntakeTele"
    static let numMatchesPlayed = "numMatchesPlayed"
    static let lfmAvgNumPyramidintakeTele = "lfmAvgNumPyramidintakeTele"
    static let avgNumGroundPyramidIntakeAuto = "avgNumGroundPyramidIntakeAuto"
    static let avgSpeed = "avgSpeed"
    static let lfmAvgNumBluePlatformintakeTele = "lfmAvgNumBluePlatformintakeTele"
    static let lfmAvgNumGroundPyramidIntakeTele = "lfmAvgNumGroundPyramidIntakeTele"
    static let lfmAvgNumReturnIntakeTele = "lfmAvgNumReturnIntakeTele"
    static let firstPickAbility = "firstPickAbility"
    static let lfmAvgNumElevatedPyramidIntakeTele = "lfmAvgNumElevatedPyramidIntakeTele"
    static let actualSeed = "actualSeed"
    static let predictedSeed = "predictedSeed"
  }

  // MARK: Properties
  public var avgNumCubesFumbledAuto: Int?
  public var lfmAvgNumBluePlatformIntakeAuto: Int?
  public var lfmAvgNumHumanPortalIntakeTele: Int?
  public var avgNumHumanPortalIntakeTele: Int?
  public var switchFailPercentageAuto: Int?
  public var avgNumElevatedPyramidIntakeAuto: Int?
  public var avgCubesPlacedInSwitchTele: Int?
  public var lfmAvgNumGroundPyramidIntakeAuto: Int?
  public var avgCubesPlacedInScaleTele: Int?
  public var lfmAvgDefense: Int?
  public var avgAgility: Int?
  public var secondPickAbility: Int?
  public var avgNumGoodDecicions: Int?
  public var avgNumBluePlatformIntakeAuto: Int?
  public var avgNumReturnIntakeTele: Int?
  public var lfmAvgNumGroundIntakeTele: Int?
  public var avgNumRedPlatformIntakeTele: Int?
  public var avgNumBadDecisions: Int?
  public var avgClimbTime: Int?
  public var predictedClimb: Int?
  public var avgDrivingAbility: Int?
  public var lfmAvgNumCubesFumbledAuto: Int?
  public var lfmAvgNumGroundPortalIntakeTele: Int?
  public var avgNumExchangeInputTele: Int?
  public var avgDefense: Int?
  public var avgCubesPlacedInScaleAuto: Int?
  public var disabledPercentage: Int?
  public var lfmAvgNumRedPlatformIntakeTele: Int?
  public var predictedNumScaleCubesAuto: Int?
  public var lfmAvgNumExchangeInputTele: Int?
  public var lfmAvgNumBadDecisions: Int?
  public var scaleFailPercentageTele: Int?
  public var incapacitatedPercentage: Int?
  public var predictedNumAllianceSwitchCubesAuto: Int?
  public var autoRunPercentage: Int?
  public var avgNumCubesFumbledTele: Int?
  public var scaleFailPercentageAuto: Int?
  public var avgCubesSpilled: Int?
  public var lfmAvgNumRedPlatformIntakeAuto: Int?
  public var avgCubesPlacedInSwitchAuto: Int?
  public var switchFailPercentageTele: Int?
  public var avgNumBluePlatformIntakeTele: Int?
  public var lfmAvgCubesSpilled: Int?
  public var lfmAvgSpeed: Int?
  public var avgNumGroundIntakeTele: Int?
  public var climbPercentage: Int?
  public var lfmAvgDrivingAbility: Int?
  public var lfmAvgNumGoodDecicions: Int?
  public var name: Int?
  public var avgNumRedPlatformIntakeAuto: Int?
  public var canScoreBothSwitchSidesAuto: Bool? = false
  public var lfmAvgAgility: Int?
  public var lfmAvgNumElevatedPyramidIntakeAuto: Int?
  public var lfmAvgNumCubesFumbledTele: Int?
  public var number: Int?
  public var avgNumGroundPortalIntakeTele: Int?
  public var avgNumElevatedPyramidIntakeTele: Int?
  public var avgNumGroundPyramidIntakeTele: Int?
  public var numMatchesPlayed: Int?
  public var lfmAvgNumPyramidintakeTele: Int?
  public var avgNumGroundPyramidIntakeAuto: Int?
  public var avgSpeed: Int?
  public var lfmAvgNumBluePlatformintakeTele: Int?
  public var lfmAvgNumGroundPyramidIntakeTele: Int?
  public var lfmAvgNumReturnIntakeTele: Int?
  public var firstPickAbility: Int?
  public var lfmAvgNumElevatedPyramidIntakeTele: Int?
    public var actualSeed: Int?
    public var predictedSeed: Int?

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
    avgNumCubesFumbledAuto = json[SerializationKeys.avgNumCubesFumbledAuto].int
    lfmAvgNumBluePlatformIntakeAuto = json[SerializationKeys.lfmAvgNumBluePlatformIntakeAuto].int
    lfmAvgNumHumanPortalIntakeTele = json[SerializationKeys.lfmAvgNumHumanPortalIntakeTele].int
    avgNumHumanPortalIntakeTele = json[SerializationKeys.avgNumHumanPortalIntakeTele].int
    switchFailPercentageAuto = json[SerializationKeys.switchFailPercentageAuto].int
    avgNumElevatedPyramidIntakeAuto = json[SerializationKeys.avgNumElevatedPyramidIntakeAuto].int
    avgCubesPlacedInSwitchTele = json[SerializationKeys.avgCubesPlacedInSwitchTele].int
    lfmAvgNumGroundPyramidIntakeAuto = json[SerializationKeys.lfmAvgNumGroundPyramidIntakeAuto].int
    avgCubesPlacedInScaleTele = json[SerializationKeys.avgCubesPlacedInScaleTele].int
    lfmAvgDefense = json[SerializationKeys.lfmAvgDefense].int
    avgAgility = json[SerializationKeys.avgAgility].int
    secondPickAbility = json[SerializationKeys.secondPickAbility].int
    avgNumGoodDecicions = json[SerializationKeys.avgNumGoodDecicions].int
    avgNumBluePlatformIntakeAuto = json[SerializationKeys.avgNumBluePlatformIntakeAuto].int
    avgNumReturnIntakeTele = json[SerializationKeys.avgNumReturnIntakeTele].int
    lfmAvgNumGroundIntakeTele = json[SerializationKeys.lfmAvgNumGroundIntakeTele].int
    avgNumRedPlatformIntakeTele = json[SerializationKeys.avgNumRedPlatformIntakeTele].int
    avgNumBadDecisions = json[SerializationKeys.avgNumBadDecisions].int
    avgClimbTime = json[SerializationKeys.avgClimbTime].int
    predictedClimb = json[SerializationKeys.predictedClimb].int
    avgDrivingAbility = json[SerializationKeys.avgDrivingAbility].int
    lfmAvgNumCubesFumbledAuto = json[SerializationKeys.lfmAvgNumCubesFumbledAuto].int
    lfmAvgNumGroundPortalIntakeTele = json[SerializationKeys.lfmAvgNumGroundPortalIntakeTele].int
    avgNumExchangeInputTele = json[SerializationKeys.avgNumExchangeInputTele].int
    avgDefense = json[SerializationKeys.avgDefense].int
    avgCubesPlacedInScaleAuto = json[SerializationKeys.avgCubesPlacedInScaleAuto].int
    disabledPercentage = json[SerializationKeys.disabledPercentage].int
    lfmAvgNumRedPlatformIntakeTele = json[SerializationKeys.lfmAvgNumRedPlatformIntakeTele].int
    predictedNumScaleCubesAuto = json[SerializationKeys.predictedNumScaleCubesAuto].int
    lfmAvgNumExchangeInputTele = json[SerializationKeys.lfmAvgNumExchangeInputTele].int
    lfmAvgNumBadDecisions = json[SerializationKeys.lfmAvgNumBadDecisions].int
    scaleFailPercentageTele = json[SerializationKeys.scaleFailPercentageTele].int
    incapacitatedPercentage = json[SerializationKeys.incapacitatedPercentage].int
    predictedNumAllianceSwitchCubesAuto = json[SerializationKeys.predictedNumAllianceSwitchCubesAuto].int
    autoRunPercentage = json[SerializationKeys.autoRunPercentage].int
    avgNumCubesFumbledTele = json[SerializationKeys.avgNumCubesFumbledTele].int
    scaleFailPercentageAuto = json[SerializationKeys.scaleFailPercentageAuto].int
    avgCubesSpilled = json[SerializationKeys.avgCubesSpilled].int
    lfmAvgNumRedPlatformIntakeAuto = json[SerializationKeys.lfmAvgNumRedPlatformIntakeAuto].int
    avgCubesPlacedInSwitchAuto = json[SerializationKeys.avgCubesPlacedInSwitchAuto].int
    switchFailPercentageTele = json[SerializationKeys.switchFailPercentageTele].int
    avgNumBluePlatformIntakeTele = json[SerializationKeys.avgNumBluePlatformIntakeTele].int
    lfmAvgCubesSpilled = json[SerializationKeys.lfmAvgCubesSpilled].int
    lfmAvgSpeed = json[SerializationKeys.lfmAvgSpeed].int
    avgNumGroundIntakeTele = json[SerializationKeys.avgNumGroundIntakeTele].int
    climbPercentage = json[SerializationKeys.climbPercentage].int
    lfmAvgDrivingAbility = json[SerializationKeys.lfmAvgDrivingAbility].int
    lfmAvgNumGoodDecicions = json[SerializationKeys.lfmAvgNumGoodDecicions].int
    name = json[SerializationKeys.name].int
    avgNumRedPlatformIntakeAuto = json[SerializationKeys.avgNumRedPlatformIntakeAuto].int
    canScoreBothSwitchSidesAuto = json[SerializationKeys.canScoreBothSwitchSidesAuto].boolValue
    lfmAvgAgility = json[SerializationKeys.lfmAvgAgility].int
    lfmAvgNumElevatedPyramidIntakeAuto = json[SerializationKeys.lfmAvgNumElevatedPyramidIntakeAuto].int
    lfmAvgNumCubesFumbledTele = json[SerializationKeys.lfmAvgNumCubesFumbledTele].int
    number = json[SerializationKeys.number].int
    avgNumGroundPortalIntakeTele = json[SerializationKeys.avgNumGroundPortalIntakeTele].int
    avgNumElevatedPyramidIntakeTele = json[SerializationKeys.avgNumElevatedPyramidIntakeTele].int
    avgNumGroundPyramidIntakeTele = json[SerializationKeys.avgNumGroundPyramidIntakeTele].int
    numMatchesPlayed = json[SerializationKeys.numMatchesPlayed].int
    lfmAvgNumPyramidintakeTele = json[SerializationKeys.lfmAvgNumPyramidintakeTele].int
    avgNumGroundPyramidIntakeAuto = json[SerializationKeys.avgNumGroundPyramidIntakeAuto].int
    avgSpeed = json[SerializationKeys.avgSpeed].int
    lfmAvgNumBluePlatformintakeTele = json[SerializationKeys.lfmAvgNumBluePlatformintakeTele].int
    lfmAvgNumGroundPyramidIntakeTele = json[SerializationKeys.lfmAvgNumGroundPyramidIntakeTele].int
    lfmAvgNumReturnIntakeTele = json[SerializationKeys.lfmAvgNumReturnIntakeTele].int
    firstPickAbility = json[SerializationKeys.firstPickAbility].int
    lfmAvgNumElevatedPyramidIntakeTele = json[SerializationKeys.lfmAvgNumElevatedPyramidIntakeTele].int
    actualSeed = json[SerializationKeys.actualSeed].int
    predictedSeed = json[SerializationKeys.predictedSeed].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = avgNumCubesFumbledAuto { dictionary[SerializationKeys.avgNumCubesFumbledAuto] = value }
    if let value = lfmAvgNumBluePlatformIntakeAuto { dictionary[SerializationKeys.lfmAvgNumBluePlatformIntakeAuto] = value }
    if let value = lfmAvgNumHumanPortalIntakeTele { dictionary[SerializationKeys.lfmAvgNumHumanPortalIntakeTele] = value }
    if let value = avgNumHumanPortalIntakeTele { dictionary[SerializationKeys.avgNumHumanPortalIntakeTele] = value }
    if let value = switchFailPercentageAuto { dictionary[SerializationKeys.switchFailPercentageAuto] = value }
    if let value = avgNumElevatedPyramidIntakeAuto { dictionary[SerializationKeys.avgNumElevatedPyramidIntakeAuto] = value }
    if let value = avgCubesPlacedInSwitchTele { dictionary[SerializationKeys.avgCubesPlacedInSwitchTele] = value }
    if let value = lfmAvgNumGroundPyramidIntakeAuto { dictionary[SerializationKeys.lfmAvgNumGroundPyramidIntakeAuto] = value }
    if let value = avgCubesPlacedInScaleTele { dictionary[SerializationKeys.avgCubesPlacedInScaleTele] = value }
    if let value = lfmAvgDefense { dictionary[SerializationKeys.lfmAvgDefense] = value }
    if let value = avgAgility { dictionary[SerializationKeys.avgAgility] = value }
    if let value = secondPickAbility { dictionary[SerializationKeys.secondPickAbility] = value }
    if let value = avgNumGoodDecicions { dictionary[SerializationKeys.avgNumGoodDecicions] = value }
    if let value = avgNumBluePlatformIntakeAuto { dictionary[SerializationKeys.avgNumBluePlatformIntakeAuto] = value }
    if let value = avgNumReturnIntakeTele { dictionary[SerializationKeys.avgNumReturnIntakeTele] = value }
    if let value = lfmAvgNumGroundIntakeTele { dictionary[SerializationKeys.lfmAvgNumGroundIntakeTele] = value }
    if let value = avgNumRedPlatformIntakeTele { dictionary[SerializationKeys.avgNumRedPlatformIntakeTele] = value }
    if let value = avgNumBadDecisions { dictionary[SerializationKeys.avgNumBadDecisions] = value }
    if let value = avgClimbTime { dictionary[SerializationKeys.avgClimbTime] = value }
    if let value = predictedClimb { dictionary[SerializationKeys.predictedClimb] = value }
    if let value = avgDrivingAbility { dictionary[SerializationKeys.avgDrivingAbility] = value }
    if let value = lfmAvgNumCubesFumbledAuto { dictionary[SerializationKeys.lfmAvgNumCubesFumbledAuto] = value }
    if let value = lfmAvgNumGroundPortalIntakeTele { dictionary[SerializationKeys.lfmAvgNumGroundPortalIntakeTele] = value }
    if let value = avgNumExchangeInputTele { dictionary[SerializationKeys.avgNumExchangeInputTele] = value }
    if let value = avgDefense { dictionary[SerializationKeys.avgDefense] = value }
    if let value = avgCubesPlacedInScaleAuto { dictionary[SerializationKeys.avgCubesPlacedInScaleAuto] = value }
    if let value = disabledPercentage { dictionary[SerializationKeys.disabledPercentage] = value }
    if let value = lfmAvgNumRedPlatformIntakeTele { dictionary[SerializationKeys.lfmAvgNumRedPlatformIntakeTele] = value }
    if let value = predictedNumScaleCubesAuto { dictionary[SerializationKeys.predictedNumScaleCubesAuto] = value }
    if let value = lfmAvgNumExchangeInputTele { dictionary[SerializationKeys.lfmAvgNumExchangeInputTele] = value }
    if let value = lfmAvgNumBadDecisions { dictionary[SerializationKeys.lfmAvgNumBadDecisions] = value }
    if let value = scaleFailPercentageTele { dictionary[SerializationKeys.scaleFailPercentageTele] = value }
    if let value = incapacitatedPercentage { dictionary[SerializationKeys.incapacitatedPercentage] = value }
    if let value = predictedNumAllianceSwitchCubesAuto { dictionary[SerializationKeys.predictedNumAllianceSwitchCubesAuto] = value }
    if let value = autoRunPercentage { dictionary[SerializationKeys.autoRunPercentage] = value }
    if let value = avgNumCubesFumbledTele { dictionary[SerializationKeys.avgNumCubesFumbledTele] = value }
    if let value = scaleFailPercentageAuto { dictionary[SerializationKeys.scaleFailPercentageAuto] = value }
    if let value = avgCubesSpilled { dictionary[SerializationKeys.avgCubesSpilled] = value }
    if let value = lfmAvgNumRedPlatformIntakeAuto { dictionary[SerializationKeys.lfmAvgNumRedPlatformIntakeAuto] = value }
    if let value = avgCubesPlacedInSwitchAuto { dictionary[SerializationKeys.avgCubesPlacedInSwitchAuto] = value }
    if let value = switchFailPercentageTele { dictionary[SerializationKeys.switchFailPercentageTele] = value }
    if let value = avgNumBluePlatformIntakeTele { dictionary[SerializationKeys.avgNumBluePlatformIntakeTele] = value }
    if let value = lfmAvgCubesSpilled { dictionary[SerializationKeys.lfmAvgCubesSpilled] = value }
    if let value = lfmAvgSpeed { dictionary[SerializationKeys.lfmAvgSpeed] = value }
    if let value = avgNumGroundIntakeTele { dictionary[SerializationKeys.avgNumGroundIntakeTele] = value }
    if let value = climbPercentage { dictionary[SerializationKeys.climbPercentage] = value }
    if let value = lfmAvgDrivingAbility { dictionary[SerializationKeys.lfmAvgDrivingAbility] = value }
    if let value = lfmAvgNumGoodDecicions { dictionary[SerializationKeys.lfmAvgNumGoodDecicions] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = avgNumRedPlatformIntakeAuto { dictionary[SerializationKeys.avgNumRedPlatformIntakeAuto] = value }
    dictionary[SerializationKeys.canScoreBothSwitchSidesAuto] = canScoreBothSwitchSidesAuto
    if let value = lfmAvgAgility { dictionary[SerializationKeys.lfmAvgAgility] = value }
    if let value = lfmAvgNumElevatedPyramidIntakeAuto { dictionary[SerializationKeys.lfmAvgNumElevatedPyramidIntakeAuto] = value }
    if let value = lfmAvgNumCubesFumbledTele { dictionary[SerializationKeys.lfmAvgNumCubesFumbledTele] = value }
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = avgNumGroundPortalIntakeTele { dictionary[SerializationKeys.avgNumGroundPortalIntakeTele] = value }
    if let value = avgNumElevatedPyramidIntakeTele { dictionary[SerializationKeys.avgNumElevatedPyramidIntakeTele] = value }
    if let value = avgNumGroundPyramidIntakeTele { dictionary[SerializationKeys.avgNumGroundPyramidIntakeTele] = value }
    if let value = numMatchesPlayed { dictionary[SerializationKeys.numMatchesPlayed] = value }
    if let value = lfmAvgNumPyramidintakeTele { dictionary[SerializationKeys.lfmAvgNumPyramidintakeTele] = value }
    if let value = avgNumGroundPyramidIntakeAuto { dictionary[SerializationKeys.avgNumGroundPyramidIntakeAuto] = value }
    if let value = avgSpeed { dictionary[SerializationKeys.avgSpeed] = value }
    if let value = lfmAvgNumBluePlatformintakeTele { dictionary[SerializationKeys.lfmAvgNumBluePlatformintakeTele] = value }
    if let value = lfmAvgNumGroundPyramidIntakeTele { dictionary[SerializationKeys.lfmAvgNumGroundPyramidIntakeTele] = value }
    if let value = lfmAvgNumReturnIntakeTele { dictionary[SerializationKeys.lfmAvgNumReturnIntakeTele] = value }
    if let value = firstPickAbility { dictionary[SerializationKeys.firstPickAbility] = value }
    if let value = lfmAvgNumElevatedPyramidIntakeTele { dictionary[SerializationKeys.lfmAvgNumElevatedPyramidIntakeTele] = value }
    if let value = actualSeed { dictionary[SerializationKeys.actualSeed] = value }
    if let value = predictedSeed { dictionary[SerializationKeys.predictedSeed] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avgNumCubesFumbledAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumCubesFumbledAuto) as? Int
    self.lfmAvgNumBluePlatformIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumBluePlatformIntakeAuto) as? Int
    self.lfmAvgNumHumanPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumHumanPortalIntakeTele) as? Int
    self.avgNumHumanPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumHumanPortalIntakeTele) as? Int
    self.switchFailPercentageAuto = aDecoder.decodeObject(forKey: SerializationKeys.switchFailPercentageAuto) as? Int
    self.avgNumElevatedPyramidIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumElevatedPyramidIntakeAuto) as? Int
    self.avgCubesPlacedInSwitchTele = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInSwitchTele) as? Int
    self.lfmAvgNumGroundPyramidIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumGroundPyramidIntakeAuto) as? Int
    self.avgCubesPlacedInScaleTele = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInScaleTele) as? Int
    self.lfmAvgDefense = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgDefense) as? Int
    self.avgAgility = aDecoder.decodeObject(forKey: SerializationKeys.avgAgility) as? Int
    self.secondPickAbility = aDecoder.decodeObject(forKey: SerializationKeys.secondPickAbility) as? Int
    self.avgNumGoodDecicions = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGoodDecicions) as? Int
    self.avgNumBluePlatformIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumBluePlatformIntakeAuto) as? Int
    self.avgNumReturnIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumReturnIntakeTele) as? Int
    self.lfmAvgNumGroundIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumGroundIntakeTele) as? Int
    self.avgNumRedPlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumRedPlatformIntakeTele) as? Int
    self.avgNumBadDecisions = aDecoder.decodeObject(forKey: SerializationKeys.avgNumBadDecisions) as? Int
    self.avgClimbTime = aDecoder.decodeObject(forKey: SerializationKeys.avgClimbTime) as? Int
    self.predictedClimb = aDecoder.decodeObject(forKey: SerializationKeys.predictedClimb) as? Int
    self.avgDrivingAbility = aDecoder.decodeObject(forKey: SerializationKeys.avgDrivingAbility) as? Int
    self.lfmAvgNumCubesFumbledAuto = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumCubesFumbledAuto) as? Int
    self.lfmAvgNumGroundPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumGroundPortalIntakeTele) as? Int
    self.avgNumExchangeInputTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumExchangeInputTele) as? Int
    self.avgDefense = aDecoder.decodeObject(forKey: SerializationKeys.avgDefense) as? Int
    self.avgCubesPlacedInScaleAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInScaleAuto) as? Int
    self.disabledPercentage = aDecoder.decodeObject(forKey: SerializationKeys.disabledPercentage) as? Int
    self.lfmAvgNumRedPlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumRedPlatformIntakeTele) as? Int
    self.predictedNumScaleCubesAuto = aDecoder.decodeObject(forKey: SerializationKeys.predictedNumScaleCubesAuto) as? Int
    self.lfmAvgNumExchangeInputTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumExchangeInputTele) as? Int
    self.lfmAvgNumBadDecisions = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumBadDecisions) as? Int
    self.scaleFailPercentageTele = aDecoder.decodeObject(forKey: SerializationKeys.scaleFailPercentageTele) as? Int
    self.incapacitatedPercentage = aDecoder.decodeObject(forKey: SerializationKeys.incapacitatedPercentage) as? Int
    self.predictedNumAllianceSwitchCubesAuto = aDecoder.decodeObject(forKey: SerializationKeys.predictedNumAllianceSwitchCubesAuto) as? Int
    self.autoRunPercentage = aDecoder.decodeObject(forKey: SerializationKeys.autoRunPercentage) as? Int
    self.avgNumCubesFumbledTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumCubesFumbledTele) as? Int
    self.scaleFailPercentageAuto = aDecoder.decodeObject(forKey: SerializationKeys.scaleFailPercentageAuto) as? Int
    self.avgCubesSpilled = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesSpilled) as? Int
    self.lfmAvgNumRedPlatformIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumRedPlatformIntakeAuto) as? Int
    self.avgCubesPlacedInSwitchAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgCubesPlacedInSwitchAuto) as? Int
    self.switchFailPercentageTele = aDecoder.decodeObject(forKey: SerializationKeys.switchFailPercentageTele) as? Int
    self.avgNumBluePlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumBluePlatformIntakeTele) as? Int
    self.lfmAvgCubesSpilled = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgCubesSpilled) as? Int
    self.lfmAvgSpeed = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgSpeed) as? Int
    self.avgNumGroundIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundIntakeTele) as? Int
    self.climbPercentage = aDecoder.decodeObject(forKey: SerializationKeys.climbPercentage) as? Int
    self.lfmAvgDrivingAbility = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgDrivingAbility) as? Int
    self.lfmAvgNumGoodDecicions = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumGoodDecicions) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? Int
    self.avgNumRedPlatformIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumRedPlatformIntakeAuto) as? Int
    self.canScoreBothSwitchSidesAuto = aDecoder.decodeBool(forKey: SerializationKeys.canScoreBothSwitchSidesAuto)
    self.lfmAvgAgility = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgAgility) as? Int
    self.lfmAvgNumElevatedPyramidIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumElevatedPyramidIntakeAuto) as? Int
    self.lfmAvgNumCubesFumbledTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumCubesFumbledTele) as? Int
    self.number = aDecoder.decodeObject(forKey: SerializationKeys.number) as? Int
    self.avgNumGroundPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundPortalIntakeTele) as? Int
    self.avgNumElevatedPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumElevatedPyramidIntakeTele) as? Int
    self.avgNumGroundPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundPyramidIntakeTele) as? Int
    self.numMatchesPlayed = aDecoder.decodeObject(forKey: SerializationKeys.numMatchesPlayed) as? Int
    self.lfmAvgNumPyramidintakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumPyramidintakeTele) as? Int
    self.avgNumGroundPyramidIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgNumGroundPyramidIntakeAuto) as? Int
    self.avgSpeed = aDecoder.decodeObject(forKey: SerializationKeys.avgSpeed) as? Int
    self.lfmAvgNumBluePlatformintakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumBluePlatformintakeTele) as? Int
    self.lfmAvgNumGroundPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumGroundPyramidIntakeTele) as? Int
    self.lfmAvgNumReturnIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumReturnIntakeTele) as? Int
    self.firstPickAbility = aDecoder.decodeObject(forKey: SerializationKeys.firstPickAbility) as? Int
    self.lfmAvgNumElevatedPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.lfmAvgNumElevatedPyramidIntakeTele) as? Int
    self.actualSeed = aDecoder.decodeObject(forKey: SerializationKeys.actualSeed) as? Int
    self.predictedSeed = aDecoder.decodeObject(forKey: SerializationKeys.predictedSeed) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avgNumCubesFumbledAuto, forKey: SerializationKeys.avgNumCubesFumbledAuto)
    aCoder.encode(lfmAvgNumBluePlatformIntakeAuto, forKey: SerializationKeys.lfmAvgNumBluePlatformIntakeAuto)
    aCoder.encode(lfmAvgNumHumanPortalIntakeTele, forKey: SerializationKeys.lfmAvgNumHumanPortalIntakeTele)
    aCoder.encode(avgNumHumanPortalIntakeTele, forKey: SerializationKeys.avgNumHumanPortalIntakeTele)
    aCoder.encode(switchFailPercentageAuto, forKey: SerializationKeys.switchFailPercentageAuto)
    aCoder.encode(avgNumElevatedPyramidIntakeAuto, forKey: SerializationKeys.avgNumElevatedPyramidIntakeAuto)
    aCoder.encode(avgCubesPlacedInSwitchTele, forKey: SerializationKeys.avgCubesPlacedInSwitchTele)
    aCoder.encode(lfmAvgNumGroundPyramidIntakeAuto, forKey: SerializationKeys.lfmAvgNumGroundPyramidIntakeAuto)
    aCoder.encode(avgCubesPlacedInScaleTele, forKey: SerializationKeys.avgCubesPlacedInScaleTele)
    aCoder.encode(lfmAvgDefense, forKey: SerializationKeys.lfmAvgDefense)
    aCoder.encode(avgAgility, forKey: SerializationKeys.avgAgility)
    aCoder.encode(secondPickAbility, forKey: SerializationKeys.secondPickAbility)
    aCoder.encode(avgNumGoodDecicions, forKey: SerializationKeys.avgNumGoodDecicions)
    aCoder.encode(avgNumBluePlatformIntakeAuto, forKey: SerializationKeys.avgNumBluePlatformIntakeAuto)
    aCoder.encode(avgNumReturnIntakeTele, forKey: SerializationKeys.avgNumReturnIntakeTele)
    aCoder.encode(lfmAvgNumGroundIntakeTele, forKey: SerializationKeys.lfmAvgNumGroundIntakeTele)
    aCoder.encode(avgNumRedPlatformIntakeTele, forKey: SerializationKeys.avgNumRedPlatformIntakeTele)
    aCoder.encode(avgNumBadDecisions, forKey: SerializationKeys.avgNumBadDecisions)
    aCoder.encode(avgClimbTime, forKey: SerializationKeys.avgClimbTime)
    aCoder.encode(predictedClimb, forKey: SerializationKeys.predictedClimb)
    aCoder.encode(avgDrivingAbility, forKey: SerializationKeys.avgDrivingAbility)
    aCoder.encode(lfmAvgNumCubesFumbledAuto, forKey: SerializationKeys.lfmAvgNumCubesFumbledAuto)
    aCoder.encode(lfmAvgNumGroundPortalIntakeTele, forKey: SerializationKeys.lfmAvgNumGroundPortalIntakeTele)
    aCoder.encode(avgNumExchangeInputTele, forKey: SerializationKeys.avgNumExchangeInputTele)
    aCoder.encode(avgDefense, forKey: SerializationKeys.avgDefense)
    aCoder.encode(avgCubesPlacedInScaleAuto, forKey: SerializationKeys.avgCubesPlacedInScaleAuto)
    aCoder.encode(disabledPercentage, forKey: SerializationKeys.disabledPercentage)
    aCoder.encode(lfmAvgNumRedPlatformIntakeTele, forKey: SerializationKeys.lfmAvgNumRedPlatformIntakeTele)
    aCoder.encode(predictedNumScaleCubesAuto, forKey: SerializationKeys.predictedNumScaleCubesAuto)
    aCoder.encode(lfmAvgNumExchangeInputTele, forKey: SerializationKeys.lfmAvgNumExchangeInputTele)
    aCoder.encode(lfmAvgNumBadDecisions, forKey: SerializationKeys.lfmAvgNumBadDecisions)
    aCoder.encode(scaleFailPercentageTele, forKey: SerializationKeys.scaleFailPercentageTele)
    aCoder.encode(incapacitatedPercentage, forKey: SerializationKeys.incapacitatedPercentage)
    aCoder.encode(predictedNumAllianceSwitchCubesAuto, forKey: SerializationKeys.predictedNumAllianceSwitchCubesAuto)
    aCoder.encode(autoRunPercentage, forKey: SerializationKeys.autoRunPercentage)
    aCoder.encode(avgNumCubesFumbledTele, forKey: SerializationKeys.avgNumCubesFumbledTele)
    aCoder.encode(scaleFailPercentageAuto, forKey: SerializationKeys.scaleFailPercentageAuto)
    aCoder.encode(avgCubesSpilled, forKey: SerializationKeys.avgCubesSpilled)
    aCoder.encode(lfmAvgNumRedPlatformIntakeAuto, forKey: SerializationKeys.lfmAvgNumRedPlatformIntakeAuto)
    aCoder.encode(avgCubesPlacedInSwitchAuto, forKey: SerializationKeys.avgCubesPlacedInSwitchAuto)
    aCoder.encode(switchFailPercentageTele, forKey: SerializationKeys.switchFailPercentageTele)
    aCoder.encode(avgNumBluePlatformIntakeTele, forKey: SerializationKeys.avgNumBluePlatformIntakeTele)
    aCoder.encode(lfmAvgCubesSpilled, forKey: SerializationKeys.lfmAvgCubesSpilled)
    aCoder.encode(lfmAvgSpeed, forKey: SerializationKeys.lfmAvgSpeed)
    aCoder.encode(avgNumGroundIntakeTele, forKey: SerializationKeys.avgNumGroundIntakeTele)
    aCoder.encode(climbPercentage, forKey: SerializationKeys.climbPercentage)
    aCoder.encode(lfmAvgDrivingAbility, forKey: SerializationKeys.lfmAvgDrivingAbility)
    aCoder.encode(lfmAvgNumGoodDecicions, forKey: SerializationKeys.lfmAvgNumGoodDecicions)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(avgNumRedPlatformIntakeAuto, forKey: SerializationKeys.avgNumRedPlatformIntakeAuto)
    aCoder.encode(canScoreBothSwitchSidesAuto, forKey: SerializationKeys.canScoreBothSwitchSidesAuto)
    aCoder.encode(lfmAvgAgility, forKey: SerializationKeys.lfmAvgAgility)
    aCoder.encode(lfmAvgNumElevatedPyramidIntakeAuto, forKey: SerializationKeys.lfmAvgNumElevatedPyramidIntakeAuto)
    aCoder.encode(lfmAvgNumCubesFumbledTele, forKey: SerializationKeys.lfmAvgNumCubesFumbledTele)
    aCoder.encode(number, forKey: SerializationKeys.number)
    aCoder.encode(avgNumGroundPortalIntakeTele, forKey: SerializationKeys.avgNumGroundPortalIntakeTele)
    aCoder.encode(avgNumElevatedPyramidIntakeTele, forKey: SerializationKeys.avgNumElevatedPyramidIntakeTele)
    aCoder.encode(avgNumGroundPyramidIntakeTele, forKey: SerializationKeys.avgNumGroundPyramidIntakeTele)
    aCoder.encode(numMatchesPlayed, forKey: SerializationKeys.numMatchesPlayed)
    aCoder.encode(lfmAvgNumPyramidintakeTele, forKey: SerializationKeys.lfmAvgNumPyramidintakeTele)
    aCoder.encode(avgNumGroundPyramidIntakeAuto, forKey: SerializationKeys.avgNumGroundPyramidIntakeAuto)
    aCoder.encode(avgSpeed, forKey: SerializationKeys.avgSpeed)
    aCoder.encode(lfmAvgNumBluePlatformintakeTele, forKey: SerializationKeys.lfmAvgNumBluePlatformintakeTele)
    aCoder.encode(lfmAvgNumGroundPyramidIntakeTele, forKey: SerializationKeys.lfmAvgNumGroundPyramidIntakeTele)
    aCoder.encode(lfmAvgNumReturnIntakeTele, forKey: SerializationKeys.lfmAvgNumReturnIntakeTele)
    aCoder.encode(firstPickAbility, forKey: SerializationKeys.firstPickAbility)
    aCoder.encode(lfmAvgNumElevatedPyramidIntakeTele, forKey: SerializationKeys.lfmAvgNumElevatedPyramidIntakeTele)
    aCoder.encode(actualSeed, forKey: SerializationKeys.actualSeed)
    aCoder.encode(predictedSeed, forKey: SerializationKeys.predictedSeed)
  }

}
