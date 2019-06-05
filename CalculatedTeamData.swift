//
//  CalculatedTeamData.swift
//
//  Created by Carter Luck on 1/19/19
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedTeamData: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let avgCargoScored = "avgCargoScored"
    static let avgCargoScoredL1 = "avgCargoScoredL1"
    static let avgCargoScoredL2 = "avgCargoScoredL2"
    static let avgCargoScoredL3 = "avgCargoScoredL3"
    static let avgCargoScoredSandstorm = "avgCargoScoredSandstorm"
    static let avgCargoScoredTeleL1 = "avgCargoScoredTeleL1"
    static let avgCargoScoredTeleL2 = "avgCargoScoredTeleL2"
    static let avgCargoScoredTeleL3 = "avgCargoScoredTeleL3"
    static let predictedDedicatedLemonCycles = "predictedDedicatedLemonCycles"
    static let avgTimeIncap = "avgTimeIncap"
    static let hasLemonGroundIntake = "hasLemonGroundIntake"
    static let sdLemonSuccessFromSide = "sdLemonSuccessFromSide"
    static let p75lemonLoadSuccess = "p75lemonLoadSuccess"
    static let p75percentIncap = "p75percentIncap"
    static let p75percentIncapEntireMatch = "p75PercentIncapEntireMatch"
    static let cargoSuccessL3 = "cargoSuccessL3"
    static let lemonCycleL2 = "lemonCycleL2"
    static let lfmCargoSuccessL3 = "lfmCargoSuccessL3"
    static let cargoCycleL3 = "cargoCycleL3"
    static let predictedRPs = "predictedRPs"
    static let p75lemonCycleL2 = "p75lemonCycleL2"
    static let p75avgTimeIncap = "p75avgTimeIncap"
    static let p75cargoCycleL1 = "p75cargoCycleL1"
    static let lfmPercentNoShow = "lfmPercentNoShow"
    static let lfmAvgCargoScored = "lfmAvgCargoScored"
    static let sdCargoSuccessL1 = "sdCargoSuccessL1"
    static let lfmLemonCycleL3 = "lfmLemonCycleL3"
    static let p75cargoSuccessUndefended = "p75cargoSuccessUndefended"
    static let sdAvgLemonsScored = "sdAvgLemonsScored"
    static let sdCargoSuccessAll = "sdCargoSuccessAll"
    static let p75lemonSuccessAll = "p75lemonSuccessAll"
    static let lfmAvgLemonsScored = "lfmAvgLemonsScored"
    static let lemonCycleL1 = "lemonCycleL1"
    static let habLineSuccessL1 = "habLineSuccessL1"
    static let habLineAttemptsL1 = "habLineAttemptsL1"
    static let habLineAttemptsL2 = "habLineAttemptsL2"
    static let numHabLineAttemptsL1 = "numHabLineAttemptsL1"
    static let numHabLineAttemptsL2 = "numHabLineAttemptsL2"
    static let sdLemonSuccessUndefended = "sdLemonSuccessUndefended"
    static let cargoCycleL2 = "cargoCycleL2"
    static let p75habLineSuccessL2 = "p75habLineSuccessL2"
    static let sdCargoSuccessDefended = "sdCargoSuccessDefended"
    static let p75lemonSuccessFromSide = "p75lemonSuccessFromSide"
    static let lfmAvgTimeClimbing = "lfmAvgTimeClimbing"
    static let p75habLineSuccessL1 = "p75habLineSuccessL1"
    static let lemonSuccessUndefended = "lemonSuccessUndefended"
    static let cargoSuccessL2 = "cargoSuccessL2"
    static let p75cargoSuccessAll = "p75cargoSuccessAll"
    static let p75cargoCycleAll = "p75cargoCycleAll"
    static let lfmLemonLoadSuccess = "lfmLemonLoadSuccess"
    static let p75cargoSuccessDefended = "p75cargoSuccessDefended"
    static let predictedDedicatedCargoCycles = "predictedDedicatedCargoCycles"
    static let predictedSeed = "predictedSeed"
    static let habLineSuccessL2 = "habLineSuccessL2"
    static let lemonCycleL3 = "lemonCycleL3"
    static let lemonSuccessFromSide = "lemonSuccessFromSide"
    static let sdLemonCycleAll = "sdLemonCycleAll"
    static let lfmCargoCycleL1 = "lfmCargoCycleL1"
    static let lemonSuccessL2 = "lemonSuccessL2"
    static let lfmCargoSuccessDefended = "lfmCargoSuccessDefended"
    static let percentIncap = "percentIncap"
    static let percentIncapEntireMatch = "percentIncapEntireMatch"
    static let p75lemonSuccessDefended = "p75lemonSuccessDefended"
    static let sdHabLineSuccessL2 = "sdHabLineSuccessL2"
    static let sdAvgTimeClimbing = "sdAvgTimeClimbing"
    static let sdCargoCycleAll = "sdCargoCycleAll"
    static let lfmLemonCycleAll = "lfmLemonCycleAll"
    static let sdCargoSuccessUndefended = "sdCargoSuccessUndefended"
    static let p75cargoSuccessL3 = "p75cargoSuccessL3"
    static let lemonSuccessL3 = "lemonSuccessL3"
    static let lfmLemonSuccessAll = "lfmLemonSuccessAll"
    static let avgLemonsScored = "avgLemonsScored"
    static let avgLemonsScoredL1 = "avgLemonsScoredL1"
    static let avgLemonsScoredL2 = "avgLemonsScoredL2"
    static let avgLemonsScoredL3 = "avgLemonsScoredL3"
    static let avgLemonsScoredSandstorm = "avgLemonsScoredSandstorm"
    static let avgLemonsScoredTeleL1 = "avgLemonsScoredTeleL1"
    static let avgLemonsScoredTeleL2 = "avgLemonsScoredTeleL2"
    static let avgLemonsScoredTeleL3 = "avgLemonsScoredTeleL3"
    static let p75lemonCycleAll = "p75lemonCycleAll"
    static let cargoSuccessL1 = "cargoSuccessL1"
    static let sdLemonSuccessL1 = "sdLemonSuccessL1"
    static let sdHabLineSuccessL1 = "sdHabLineSuccessL1"
    static let lfmLemonSuccessFromSide = "lfmLemonSuccessFromSide"
    static let sdCargoSuccessL3 = "sdCargoSuccessL3"
    static let sdLemonCycleL3 = "sdLemonCycleL3"
    static let lfmCargoCycleL2 = "lfmCargoCycleL2"
    static let hasCargoGroundIntake = "hasCargoGroundIntake"
    static let sdCargoCycleL3 = "sdCargoCycleL3"
    static let lfmHabLineSuccessL2 = "lfmHabLineSuccessL2"
    static let sdLemonCycleL1 = "sdLemonCycleL1"
    static let p75lemonSuccessL2 = "p75lemonSuccessL2"
    static let sdPercentNoShow = "sdPercentNoShow"
    static let sdCargoCycleL1 = "sdCargoCycleL1"
    static let secondPickAbility = "secondPickAbility"
    static let cargoCycleL1 = "cargoCycleL1"
    static let lfmLemonCycleL1 = "lfmLemonCycleL1"
    static let lfmLemonSuccessL2 = "lfmLemonSuccessL2"
    static let sdCargoSuccessL2 = "sdCargoSuccessL2"
    static let p75avgLemonsScored = "p75avgLemonsScored"
    static let p75cargoCycleL3 = "p75cargoCycleL3"
    static let cargoAbility = "cargoAbility"
    static let sdLemonCycleL2 = "sdLemonCycleL2"
    static let p75avgCargoScored = "p75avgCargoScored"
    static let sdAvgCargoScored = "sdAvgCargoScored"
    static let lfmCargoSuccessL1 = "lfmCargoSuccessL1"
    static let lemonLoadSuccess = "lemonLoadSuccess"
    static let p75cargoCycleL2 = "p75cargoCycleL2"
    static let lemonSuccessDefended = "lemonSuccessDefended"
    static let avgTimeClimbing = "avgTimeClimbing"
    static let lfmCargoSuccessUndefended = "lfmCargoSuccessUndefended"
    static let p75percentNoShow = "p75percentNoShow"
    static let cargoSuccessUndefended = "cargoSuccessUndefended"
    static let lfmLemonSuccessDefended = "lfmLemonSuccessDefended"
    static let p75lemonSuccessL1 = "p75lemonSuccessL1"
    static let didPreloadLemon = "didPreloadLemon"
    static let sdPercentIncap = "sdPercentIncap"
    static let sdPercentIncapEntireMatch = "sdPercentIncapEntireMatch"
    static let cargoSuccessDefended = "cargoSuccessDefended"
    static let lfmLemonCycleL2 = "lfmLemonCycleL2"
    static let lemonCycleAll = "lemonCycleAll"
    static let sdLemonSuccessL3 = "sdLemonSuccessL3"
    static let sdLemonSuccessDefended = "sdLemonSuccessDefended"
    static let lfmLemonSuccessUndefended = "lfmLemonSuccessUndefended"
    static let p75avgTimeClimbing = "p75avgTimeClimbing"
    static let sdLemonSuccessL2 = "sdLemonSuccessL2"
    static let lemonAbility = "lemonAbility"
    static let predictedSoloPoints = "predictedSoloPoints"
    static let percentNoShow = "percentNoShow"
    static let p75lemonCycleL1 = "p75lemonCycleL1"
    static let lfmHabLineSuccessL1 = "lfmHabLineSuccessL1"
    static let p75lemonCycleL3 = "p75lemonCycleL3"
    static let lfmCargoCycleL3 = "lfmCargoCycleL3"
    static let sdCargoCycleL2 = "sdCargoCycleL2"
    static let sdAvgTimeIncap = "sdAvgTimeIncap"
    static let p75cargoSuccessL2 = "p75cargoSuccessL2"
    static let lfmCargoSuccessL2 = "lfmCargoSuccessL2"
    static let p75lemonSuccessL3 = "p75lemonSuccessL3"
    static let lfmPercentIncap = "lfmPercentIncap"
    static let lfmPercentIncapEntireMatch = "lfmPercentIncapEntireMatch"
    static let lemonSuccessAll = "lemonSuccessAll"
    static let p75lemonSuccessUndefended = "p75lemonSuccessUndefended"
    static let lfmLemonSuccessL1 = "lfmLemonSuccessL1"
    static let cargoSuccessAll = "cargoSuccessAll"
    static let didPreloadCargo = "didPreloadCargo"
    static let lemonSuccessL1 = "lemonSuccessL1"
    static let sdLemonLoadSuccess = "sdLemonLoadSuccess"
    static let lfmCargoCycleAll = "lfmCargoCycleAll"
    static let cargoCycleAll = "cargoCycleAll"
    static let lfmAvgTimeIncap = "lfmAvgTimeIncap"
    static let p75cargoSuccessL1 = "p75cargoSuccessL1"
    static let lfmLemonSuccessL3 = "lfmLemonSuccessL3"
    static let lfmCargoSuccessAll = "lfmCargoSuccessAll"
    static let sdLemonSuccessAll = "sdLemonSuccessAll"
    static let firstPickAbility = "firstPickAbility"
    static let avgPinningFouls = "avgPinningFouls"
    static let p75avgPinningFouls = "p75avgPinningFouls"
    static let lfmAvgPinningFouls = "lfmAvgPinningFouls"
    static let sdAvgPinningFouls = "sdAvgPinningFouls"
    static let climbAttemptsL1 = "climbAttemptsL1"
    static let climbAttemptsL2 = "climbAttemptsL2"
    static let climbAttemptsL3 = "climbAttemptsL3"
    static let numClimbAttemptsL1 = "numClimbAttemptsL1"
    static let numClimbAttemptsL2 = "numClimbAttemptsL2"
    static let numClimbAttempts3 = "numClimbAttemptsL3"
    static let climbSuccessL1 = "climbSuccessL1"
    static let climbSuccessL2 = "climbSuccessL2"
    static let climbSuccessL3 = "climbSuccessL3"
    static let selfClimbLevel = "selfClimbLevel"
    static let robot1ClimbLevel = "robot1ClimbLevel"
    static let robot2ClimbLevel = "robot2ClimbLevel"
    static let failedCyclesCaused = "failedCyclesCaused"
    static let avgRankDefense = "avgRankDefense"
    static let totalTimeDefending = "totalTimeDefending"
    static let avgFailedCyclesCaused = "avgFailedCyclesCaused"
    static let failedCyclesCausedPerSecond = "failedCyclesCausedPerSecond"
    static let avgTimeDefending = "avgTimeDefending"
    static let lastMatch = "lastMatch"
    static let matchesDefended = "matchesDefended"
    static let avgPointsPrevented = "avgPointsPrevented"
    static let avgLemonPointsPrevented = "avgLemonPointsPrevented"
    static let avgCargoPointsPrevented = "avgCargoPointsPrevented"
    static let pushAbility = "pushAbility"
    
  }

  // MARK: Properties
  @objc public var avgCargoScored: Float = -1.0
    @objc public var avgCargoScoredL1: Float = -1.0
    @objc public var avgCargoScoredL2: Float = -1.0
    @objc public var avgCargoScoredL3: Float = -1.0
    @objc public var avgCargoScoredSandstorm: Float = -1.0
    @objc public var avgCargoScoredTeleL1: Float = -1.0
    @objc public var avgCargoScoredTeleL2: Float = -1.0
    @objc public var avgCargoScoredTeleL3: Float = -1.0
  @objc public var predictedDedicatedLemonCycles: Float = -1.0
  @objc public var avgTimeIncap: Float = -1.0
  @objc public var hasLemonGroundIntake: Bool = false
  @objc public var sdLemonSuccessFromSide: Int = -1
  @objc public var p75lemonLoadSuccess: Int = -1
  @objc public var p75percentIncap: Int = -1
  @objc public var p75percentIncapEntireMatch: Int = -1
  @objc public var cargoSuccessL3: Int = -1
  @objc public var lemonCycleL2: Float = -1.0
  @objc public var lfmCargoSuccessL3: Int = -1
  @objc public var cargoCycleL3: Float = -1.0
  @objc public var predictedRPs: Float = -1.0
  @objc public var p75lemonCycleL2: Float = -1.0
  @objc public var p75avgTimeIncap: Float = -1.0
  @objc public var p75cargoCycleL1: Float = -1.0
  @objc public var lfmPercentNoShow: Int = -1
  @objc public var lfmAvgCargoScored: Float = -1.0
  @objc public var sdCargoSuccessL1: Int = -1
  @objc public var lfmLemonCycleL3: Float = -1.0
  @objc public var p75cargoSuccessUndefended: Int = -1
  @objc public var sdAvgLemonsScored: Float = -1.0
  @objc public var sdCargoSuccessAll: Int = -1
  @objc public var p75lemonSuccessAll: Int = -1
  @objc public var lfmAvgLemonsScored: Float = -1.0
  @objc public var lemonCycleL1: Float = -1.0
  @objc public var habLineSuccessL1: Int = -1
    @objc public var habLineAttemptsL1: String?
    @objc public var habLineAttemptsL2: String?
    @objc public var numHabLineAttemptsL1: Int = -1
    @objc public var numHabLineAttemptsL2: Int = -1
  @objc public var sdLemonSuccessUndefended: Int = -1
  @objc public var cargoCycleL2: Float = -1.0
  @objc public var p75habLineSuccessL2: Int = -1
  @objc public var sdCargoSuccessDefended: Int = -1
  @objc public var p75lemonSuccessFromSide: Int = -1
  @objc public var lfmAvgTimeClimbing:  Float = -1.0
  @objc public var p75habLineSuccessL1: Int = -1
  @objc public var lemonSuccessUndefended: Int = -1
  @objc public var cargoSuccessL2: Int = -1
  @objc public var p75cargoSuccessAll: Int = -1
  @objc public var p75cargoCycleAll: Float = -1.0
  @objc public var lfmLemonLoadSuccess: Int = -1
  @objc public var p75cargoSuccessDefended: Int = -1
  @objc public var predictedDedicatedCargoCycles: Float = -1.0
  @objc public var predictedSeed: Int = -1
  @objc public var habLineSuccessL2: Int = -1
  @objc public var lemonCycleL3: Float = -1.0
  @objc public var lemonSuccessFromSide: Int = -1
  @objc public var sdLemonCycleAll: Float = -1.0
  @objc public var lfmCargoCycleL1: Float = -1.0
  @objc public var lemonSuccessL2: Int = -1
  @objc public var lfmCargoSuccessDefended: Int = -1
  @objc public var percentIncap: Int = -1
  @objc public var percentIncapEntireMatch: Int = -1
  @objc public var p75lemonSuccessDefended: Int = -1
  @objc public var sdHabLineSuccessL2: Int = -1
  @objc public var sdAvgTimeClimbing: Float = -1.0
  @objc public var sdCargoCycleAll: Float = -1.0
  @objc public var lfmLemonCycleAll: Float = -1.0
  @objc public var sdCargoSuccessUndefended: Int = -1
  @objc public var p75cargoSuccessL3: Int = -1
  @objc public var lemonSuccessL3: Int = -1
  @objc public var lfmLemonSuccessAll: Int = -1
  @objc public var avgLemonsScored: Float = -1.0
    @objc public var avgLemonsScoredL1: Float = -1.0
    @objc public var avgLemonsScoredL2: Float = -1.0
    @objc public var avgLemonsScoredL3: Float = -1.0
    @objc public var avgLemonsScoredSandstorm: Float = -1.0
    @objc public var avgLemonsScoredTeleL1: Float = -1.0
    @objc public var avgLemonsScoredTeleL2: Float = -1.0
    @objc public var avgLemonsScoredTeleL3: Float = -1.0
  @objc public var p75lemonCycleAll: Float = -1.0
  @objc public var cargoSuccessL1: Int = -1
  @objc public var sdLemonSuccessL1: Int = -1
  @objc public var sdHabLineSuccessL1: Int = -1
  @objc public var lfmLemonSuccessFromSide: Int = -1
  @objc public var sdCargoSuccessL3: Int = -1
  @objc public var sdLemonCycleL3: Float = -1.0
  @objc public var lfmCargoCycleL2: Float = -1.0
  @objc public var hasCargoGroundIntake: Bool = false
  @objc public var sdCargoCycleL3: Float = -1.0
  @objc public var lfmHabLineSuccessL2: Int = -1
  @objc public var sdLemonCycleL1: Float = -1.0
  @objc public var p75lemonSuccessL2: Int = -1
  @objc public var sdPercentNoShow: Int = -1
  @objc public var sdCargoCycleL1: Float = -1.0
  @objc public var secondPickAbility: Float = -1.0
  @objc public var cargoCycleL1: Float = -1.0
  @objc public var lfmLemonCycleL1: Float = -1.0
  @objc public var lfmLemonSuccessL2: Int = -1
  @objc public var sdCargoSuccessL2: Int = -1
  @objc public var p75avgLemonsScored: Float = -1.0
  @objc public var p75cargoCycleL3: Float = -1.0
  @objc public var cargoAbility: Float = -1.0
  @objc public var sdLemonCycleL2: Float = -1.0
  @objc public var p75avgCargoScored: Float = -1.0
  @objc public var sdAvgCargoScored: Float = -1.0
  @objc public var lfmCargoSuccessL1: Int = -1
  @objc public var lemonLoadSuccess: Int = -1
  @objc public var p75cargoCycleL2: Float = -1.0
  @objc public var lemonSuccessDefended: Int = -1
  @objc public var avgTimeClimbing: Float = -1.0
  @objc public var lfmCargoSuccessUndefended: Int = -1
  @objc public var p75percentNoShow: Int = -1
  @objc public var cargoSuccessUndefended: Int = -1
  @objc public var lfmLemonSuccessDefended: Int = -1
  @objc public var p75lemonSuccessL1: Int = -1
  @objc public var didPreloadLemon: Bool = false
  @objc public var sdPercentIncap: Int = -1
  @objc public var sdPercentIncapEntireMatch: Int = -1
  @objc public var cargoSuccessDefended: Int = -1
  @objc public var lfmLemonCycleL2: Float = -1.0
  @objc public var lemonCycleAll: Float = -1.0
  @objc public var sdLemonSuccessL3: Int = -1
  @objc public var sdLemonSuccessDefended: Int = -1
  @objc public var lfmLemonSuccessUndefended: Int = -1
  @objc public var p75avgTimeClimbing: Float = -1.0
  @objc public var sdLemonSuccessL2: Int = -1
  @objc public var lemonAbility: Float = -1.0
  @objc public var predictedSoloPoints: Float = -1.0
  @objc public var percentNoShow: Int = -1
  @objc public var p75lemonCycleL1: Float = -1.0
  @objc public var lfmHabLineSuccessL1: Int = -1
  @objc public var p75lemonCycleL3: Float = -1.0
  @objc public var lfmCargoCycleL3: Float = -1.0
  @objc public var sdCargoCycleL2: Float = -1.0
  @objc public var sdAvgTimeIncap: Float = -1.0
  @objc public var p75cargoSuccessL2: Int = -1
  @objc public var lfmCargoSuccessL2: Int = -1
  @objc public var p75lemonSuccessL3: Int = -1
  @objc public var lfmPercentIncap: Int = -1
  @objc public var lfmPercentIncapEntireMatch: Int = -1
  @objc public var lemonSuccessAll: Int = -1
  @objc public var p75lemonSuccessUndefended: Int = -1
  @objc public var lfmLemonSuccessL1: Int = -1
  @objc public var cargoSuccessAll: Int = -1
  @objc public var didPreloadCargo: Bool = false
  @objc public var lemonSuccessL1: Int = -1
  @objc public var sdLemonLoadSuccess: Int = -1
  @objc public var lfmCargoCycleAll: Float = -1.0
  @objc public var cargoCycleAll: Float = -1.0
  @objc public var lfmAvgTimeIncap: Float = -1.0
  @objc public var p75cargoSuccessL1: Int = -1
  @objc public var lfmLemonSuccessL3: Int = -1
  @objc public var lfmCargoSuccessAll: Int = -1
  @objc public var sdLemonSuccessAll: Int = -1
  @objc public var firstPickAbility: Float = -1.0
  @objc public var avgPinningFouls: Float = -1.0
  @objc public var p75avgPinningFouls: Float = -1.0
  @objc public var lfmAvgPinningFouls: Float = -1.0
  @objc public var sdAvgPinningFouls: Float = -1.0
  @objc public var climbAttemptsL1: String?
  @objc public var climbAttemptsL2: String?
  @objc public var climbAttemptsL3: String?
  @objc public var numClimbAttemptsL1: Int = -1
  @objc public var numClimbAttemptsL2: Int = -1
  @objc public var numClimbAttemptsL3: Int = -1
  @objc public var climbSuccessL1: Int = -1
  @objc public var climbSuccessL2 : Int = -1
  @objc public var climbSuccessL3: Int = -1
  @objc public var selfClimbLevel: Int = -1
  @objc public var robot1ClimbLevel: Int = -1
  @objc public var robot2ClimbLevel: Int = -1
  @objc public var failedCyclesCaused: Int = -1
    @objc public var avgRankDefense: Float = -1.0
    @objc public var totalTimeDefending: Float = -1.0
    @objc public var avgFailedCyclesCaused: Float = -1.0
    @objc public var failedCyclesCausedPerSecond: Float = -1.0
    @objc public var avgTimeDefending: Float = -1.0
    @objc public var lastMatch: Int = -1
    @objc public var matchesDefended: Int = -1
    @objc public var avgPointsPrevented: Float = -1.0
    @objc public var avgLemonPointsPrevented: Float = -1.0
    @objc public var avgCargoPointsPrevented: Float = -1.0
    @objc public var pushAbility: Float = -1.0

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
    avgCargoScored = json[SerializationKeys.avgCargoScored].floatValue
    avgCargoScoredL1 = json[SerializationKeys.avgCargoScoredL1].floatValue
    avgCargoScoredL2 = json[SerializationKeys.avgCargoScoredL2].floatValue
    avgCargoScoredL3 = json[SerializationKeys.avgCargoScoredL3].floatValue
    avgCargoScoredSandstorm = json[SerializationKeys.avgCargoScoredSandstorm].floatValue
    avgCargoScoredTeleL1 = json[SerializationKeys.avgCargoScoredTeleL1].floatValue
    avgCargoScoredTeleL2 = json[SerializationKeys.avgCargoScoredTeleL2].floatValue
    avgCargoScoredTeleL3 = json[SerializationKeys.avgCargoScoredTeleL3].floatValue
    predictedDedicatedLemonCycles = json[SerializationKeys.predictedDedicatedLemonCycles].floatValue
    avgTimeIncap = json[SerializationKeys.avgTimeIncap].floatValue
    hasLemonGroundIntake = json[SerializationKeys.hasLemonGroundIntake].boolValue
    sdLemonSuccessFromSide = json[SerializationKeys.sdLemonSuccessFromSide].intValue
    p75lemonLoadSuccess = json[SerializationKeys.p75lemonLoadSuccess].intValue
    p75percentIncap = json[SerializationKeys.p75percentIncap].intValue
    p75percentIncapEntireMatch = json[SerializationKeys.p75percentIncapEntireMatch].intValue
    cargoSuccessL3 = json[SerializationKeys.cargoSuccessL3].intValue
    lemonCycleL2 = json[SerializationKeys.lemonCycleL2].floatValue
    lfmCargoSuccessL3 = json[SerializationKeys.lfmCargoSuccessL3].intValue
    cargoCycleL3 = json[SerializationKeys.cargoCycleL3].floatValue
    predictedRPs = json[SerializationKeys.predictedRPs].floatValue
    p75lemonCycleL2 = json[SerializationKeys.p75lemonCycleL2].floatValue
    p75avgTimeIncap = json[SerializationKeys.p75avgTimeIncap].floatValue
    p75cargoCycleL1 = json[SerializationKeys.p75cargoCycleL1].floatValue
    lfmPercentNoShow = json[SerializationKeys.lfmPercentNoShow].intValue
    lfmAvgCargoScored = json[SerializationKeys.lfmAvgCargoScored].floatValue
    sdCargoSuccessL1 = json[SerializationKeys.sdCargoSuccessL1].intValue
    lfmLemonCycleL3 = json[SerializationKeys.lfmLemonCycleL3].floatValue
    p75cargoSuccessUndefended = json[SerializationKeys.p75cargoSuccessUndefended].intValue
    sdAvgLemonsScored = json[SerializationKeys.sdAvgLemonsScored].floatValue
    sdCargoSuccessAll = json[SerializationKeys.sdCargoSuccessAll].intValue
    p75lemonSuccessAll = json[SerializationKeys.p75lemonSuccessAll].intValue
    lfmAvgLemonsScored = json[SerializationKeys.lfmAvgLemonsScored].floatValue
    lemonCycleL1 = json[SerializationKeys.lemonCycleL1].floatValue
    habLineSuccessL1 = json[SerializationKeys.habLineSuccessL1].intValue
    habLineAttemptsL1 = json[SerializationKeys.habLineAttemptsL1].string
    habLineAttemptsL2 = json[SerializationKeys.habLineAttemptsL2].string
    numHabLineAttemptsL1 = json[SerializationKeys.numHabLineAttemptsL1].intValue
    numHabLineAttemptsL2 = json[SerializationKeys.numHabLineAttemptsL2].intValue
    sdLemonSuccessUndefended = json[SerializationKeys.sdLemonSuccessUndefended].intValue
    cargoCycleL2 = json[SerializationKeys.cargoCycleL2].floatValue
    p75habLineSuccessL2 = json[SerializationKeys.p75habLineSuccessL2].intValue
    sdCargoSuccessDefended = json[SerializationKeys.sdCargoSuccessDefended].intValue
    p75lemonSuccessFromSide = json[SerializationKeys.p75lemonSuccessFromSide].intValue
    lfmAvgTimeClimbing = json[SerializationKeys.lfmAvgTimeClimbing].floatValue
    p75habLineSuccessL1 = json[SerializationKeys.p75habLineSuccessL1].intValue
    lemonSuccessUndefended = json[SerializationKeys.lemonSuccessUndefended].intValue
    cargoSuccessL2 = json[SerializationKeys.cargoSuccessL2].intValue
    p75cargoSuccessAll = json[SerializationKeys.p75cargoSuccessAll].intValue
    p75cargoCycleAll = json[SerializationKeys.p75cargoCycleAll].floatValue
    lfmLemonLoadSuccess = json[SerializationKeys.lfmLemonLoadSuccess].intValue
    p75cargoSuccessDefended = json[SerializationKeys.p75cargoSuccessDefended].intValue
    predictedDedicatedCargoCycles = json[SerializationKeys.predictedDedicatedCargoCycles].floatValue
    predictedSeed = json[SerializationKeys.predictedSeed].intValue
    habLineSuccessL2 = json[SerializationKeys.habLineSuccessL2].intValue
    lemonCycleL3 = json[SerializationKeys.lemonCycleL3].floatValue
    lemonSuccessFromSide = json[SerializationKeys.lemonSuccessFromSide].intValue
    sdLemonCycleAll = json[SerializationKeys.sdLemonCycleAll].floatValue
    lfmCargoCycleL1 = json[SerializationKeys.lfmCargoCycleL1].floatValue
    lemonSuccessL2 = json[SerializationKeys.lemonSuccessL2].intValue
    lfmCargoSuccessDefended = json[SerializationKeys.lfmCargoSuccessDefended].intValue
    percentIncap = json[SerializationKeys.percentIncap].intValue
    percentIncapEntireMatch = json[SerializationKeys.percentIncapEntireMatch].intValue
    p75lemonSuccessDefended = json[SerializationKeys.p75lemonSuccessDefended].intValue
    sdHabLineSuccessL2 = json[SerializationKeys.sdHabLineSuccessL2].intValue
    sdAvgTimeClimbing = json[SerializationKeys.sdAvgTimeClimbing].floatValue
    sdCargoCycleAll = json[SerializationKeys.sdCargoCycleAll].floatValue
    lfmLemonCycleAll = json[SerializationKeys.lfmLemonCycleAll].floatValue
    sdCargoSuccessUndefended = json[SerializationKeys.sdCargoSuccessUndefended].intValue
    p75cargoSuccessL3 = json[SerializationKeys.p75cargoSuccessL3].intValue
    lemonSuccessL3 = json[SerializationKeys.lemonSuccessL3].intValue
    lfmLemonSuccessAll = json[SerializationKeys.lfmLemonSuccessAll].intValue
    avgLemonsScored = json[SerializationKeys.avgLemonsScored].floatValue
    avgLemonsScoredL1 = json[SerializationKeys.avgLemonsScoredL1].floatValue
    avgLemonsScoredL2 = json[SerializationKeys.avgLemonsScoredL2].floatValue
    avgLemonsScoredL3 = json[SerializationKeys.avgLemonsScoredL3].floatValue
    avgLemonsScoredSandstorm = json[SerializationKeys.avgLemonsScoredSandstorm].floatValue
    avgLemonsScoredTeleL1 = json[SerializationKeys.avgLemonsScoredTeleL1].floatValue
    avgLemonsScoredTeleL2 = json[SerializationKeys.avgLemonsScoredTeleL2].floatValue
    avgLemonsScoredTeleL3 = json[SerializationKeys.avgLemonsScoredTeleL3].floatValue
    p75lemonCycleAll = json[SerializationKeys.p75lemonCycleAll].floatValue
    cargoSuccessL1 = json[SerializationKeys.cargoSuccessL1].intValue
    sdLemonSuccessL1 = json[SerializationKeys.sdLemonSuccessL1].intValue
    sdHabLineSuccessL1 = json[SerializationKeys.sdHabLineSuccessL1].intValue
    lfmLemonSuccessFromSide = json[SerializationKeys.lfmLemonSuccessFromSide].intValue
    sdCargoSuccessL3 = json[SerializationKeys.sdCargoSuccessL3].intValue
    sdLemonCycleL3 = json[SerializationKeys.sdLemonCycleL3].floatValue
    lfmCargoCycleL2 = json[SerializationKeys.lfmCargoCycleL2].floatValue
    hasCargoGroundIntake = json[SerializationKeys.hasCargoGroundIntake].boolValue
    sdCargoCycleL3 = json[SerializationKeys.sdCargoCycleL3].floatValue
    lfmHabLineSuccessL2 = json[SerializationKeys.lfmHabLineSuccessL2].intValue
    sdLemonCycleL1 = json[SerializationKeys.sdLemonCycleL1].floatValue
    p75lemonSuccessL2 = json[SerializationKeys.p75lemonSuccessL2].intValue
    sdPercentNoShow = json[SerializationKeys.sdPercentNoShow].intValue
    sdCargoCycleL1 = json[SerializationKeys.sdCargoCycleL1].floatValue
    secondPickAbility = json[SerializationKeys.secondPickAbility].floatValue
    cargoCycleL1 = json[SerializationKeys.cargoCycleL1].floatValue
    lfmLemonCycleL1 = json[SerializationKeys.lfmLemonCycleL1].floatValue
    lfmLemonSuccessL2 = json[SerializationKeys.lfmLemonSuccessL2].intValue
    sdCargoSuccessL2 = json[SerializationKeys.sdCargoSuccessL2].intValue
    p75avgLemonsScored = json[SerializationKeys.p75avgLemonsScored].floatValue
    p75cargoCycleL3 = json[SerializationKeys.p75cargoCycleL3].floatValue
    cargoAbility = json[SerializationKeys.cargoAbility].floatValue
    sdLemonCycleL2 = json[SerializationKeys.sdLemonCycleL2].floatValue
    p75avgCargoScored = json[SerializationKeys.p75avgCargoScored].floatValue
    sdAvgCargoScored = json[SerializationKeys.sdAvgCargoScored].floatValue
    lfmCargoSuccessL1 = json[SerializationKeys.lfmCargoSuccessL1].intValue
    lemonLoadSuccess = json[SerializationKeys.lemonLoadSuccess].intValue
    p75cargoCycleL2 = json[SerializationKeys.p75cargoCycleL2].floatValue
    lemonSuccessDefended = json[SerializationKeys.lemonSuccessDefended].intValue
    avgTimeClimbing = json[SerializationKeys.avgTimeClimbing].floatValue
    lfmCargoSuccessUndefended = json[SerializationKeys.lfmCargoSuccessUndefended].intValue
    p75percentNoShow = json[SerializationKeys.p75percentNoShow].intValue
    cargoSuccessUndefended = json[SerializationKeys.cargoSuccessUndefended].intValue
    lfmLemonSuccessDefended = json[SerializationKeys.lfmLemonSuccessDefended].intValue
    p75lemonSuccessL1 = json[SerializationKeys.p75lemonSuccessL1].intValue
    didPreloadLemon = json[SerializationKeys.didPreloadLemon].boolValue
    sdPercentIncap = json[SerializationKeys.sdPercentIncap].intValue
    sdPercentIncapEntireMatch = json[SerializationKeys.sdPercentIncapEntireMatch].intValue
    cargoSuccessDefended = json[SerializationKeys.cargoSuccessDefended].intValue
    lfmLemonCycleL2 = json[SerializationKeys.lfmLemonCycleL2].floatValue
    lemonCycleAll = json[SerializationKeys.lemonCycleAll].floatValue
    sdLemonSuccessL3 = json[SerializationKeys.sdLemonSuccessL3].intValue
    sdLemonSuccessDefended = json[SerializationKeys.sdLemonSuccessDefended].intValue
    lfmLemonSuccessUndefended = json[SerializationKeys.lfmLemonSuccessUndefended].intValue
    p75avgTimeClimbing = json[SerializationKeys.p75avgTimeClimbing].floatValue
    sdLemonSuccessL2 = json[SerializationKeys.sdLemonSuccessL2].intValue
    lemonAbility = json[SerializationKeys.lemonAbility].floatValue
    predictedSoloPoints = json[SerializationKeys.predictedSoloPoints].floatValue
    percentNoShow = json[SerializationKeys.percentNoShow].intValue
    p75lemonCycleL1 = json[SerializationKeys.p75lemonCycleL1].floatValue
    lfmHabLineSuccessL1 = json[SerializationKeys.lfmHabLineSuccessL1].intValue
    p75lemonCycleL3 = json[SerializationKeys.p75lemonCycleL3].floatValue
    lfmCargoCycleL3 = json[SerializationKeys.lfmCargoCycleL3].floatValue
    sdCargoCycleL2 = json[SerializationKeys.sdCargoCycleL2].floatValue
    sdAvgTimeIncap = json[SerializationKeys.sdAvgTimeIncap].floatValue
    p75cargoSuccessL2 = json[SerializationKeys.p75cargoSuccessL2].intValue
    lfmCargoSuccessL2 = json[SerializationKeys.lfmCargoSuccessL2].intValue
    p75lemonSuccessL3 = json[SerializationKeys.p75lemonSuccessL3].intValue
    lfmPercentIncap = json[SerializationKeys.lfmPercentIncap].intValue
    lfmPercentIncapEntireMatch = json[SerializationKeys.lfmPercentIncapEntireMatch].intValue
    lemonSuccessAll = json[SerializationKeys.lemonSuccessAll].intValue
    p75lemonSuccessUndefended = json[SerializationKeys.p75lemonSuccessUndefended].intValue
    lfmLemonSuccessL1 = json[SerializationKeys.lfmLemonSuccessL1].intValue
    cargoSuccessAll = json[SerializationKeys.cargoSuccessAll].intValue
    didPreloadCargo = json[SerializationKeys.didPreloadCargo].boolValue
    lemonSuccessL1 = json[SerializationKeys.lemonSuccessL1].intValue
    sdLemonLoadSuccess = json[SerializationKeys.sdLemonLoadSuccess].intValue
    lfmCargoCycleAll = json[SerializationKeys.lfmCargoCycleAll].floatValue
    cargoCycleAll = json[SerializationKeys.cargoCycleAll].floatValue
    lfmAvgTimeIncap = json[SerializationKeys.lfmAvgTimeIncap].floatValue
    p75cargoSuccessL1 = json[SerializationKeys.p75cargoSuccessL1].intValue
    lfmLemonSuccessL3 = json[SerializationKeys.lfmLemonSuccessL3].intValue
    lfmCargoSuccessAll = json[SerializationKeys.lfmCargoSuccessAll].intValue
    sdLemonSuccessAll = json[SerializationKeys.sdLemonSuccessAll].intValue
    firstPickAbility = json[SerializationKeys.firstPickAbility].floatValue
    avgPinningFouls = json[SerializationKeys.avgPinningFouls].floatValue
    p75avgPinningFouls = json[SerializationKeys.p75avgPinningFouls].floatValue
    lfmAvgPinningFouls = json[SerializationKeys.lfmAvgPinningFouls].floatValue
    sdAvgPinningFouls = json[SerializationKeys.sdAvgPinningFouls].floatValue
    climbAttemptsL1 = json[SerializationKeys.climbAttemptsL1].string
    climbAttemptsL2 = json[SerializationKeys.climbAttemptsL2].string
    climbAttemptsL3 = json[SerializationKeys.climbAttemptsL3].string
    numClimbAttemptsL1 = json[SerializationKeys.numClimbAttemptsL1].intValue
    numClimbAttemptsL2 = json[SerializationKeys.numClimbAttemptsL2].intValue
    numClimbAttemptsL3 = json[SerializationKeys.numClimbAttempts3].intValue
    climbSuccessL1 = json[SerializationKeys.climbSuccessL1].intValue
    climbSuccessL2 = json[SerializationKeys.climbSuccessL2].intValue
    climbSuccessL3 = json[SerializationKeys.climbSuccessL3].intValue
    selfClimbLevel = json[SerializationKeys.selfClimbLevel].intValue
    robot1ClimbLevel = json[SerializationKeys.robot1ClimbLevel].intValue
    robot2ClimbLevel = json[SerializationKeys.robot2ClimbLevel].intValue
    failedCyclesCaused = json[SerializationKeys.failedCyclesCaused].intValue
    avgRankDefense = json[SerializationKeys.avgRankDefense].floatValue
    totalTimeDefending = json[SerializationKeys.totalTimeDefending].floatValue
    avgFailedCyclesCaused = json[SerializationKeys.avgFailedCyclesCaused].floatValue
    failedCyclesCausedPerSecond = json[SerializationKeys.failedCyclesCausedPerSecond].floatValue
    avgTimeDefending = json[SerializationKeys.avgTimeDefending].floatValue
    lastMatch = json[SerializationKeys.lastMatch].intValue
    matchesDefended = json[SerializationKeys.matchesDefended].intValue
    avgPointsPrevented = json[SerializationKeys.avgPointsPrevented].floatValue
    avgLemonPointsPrevented = json[SerializationKeys.avgLemonPointsPrevented].floatValue
    avgCargoPointsPrevented = json[SerializationKeys.avgCargoPointsPrevented].floatValue
    pushAbility = json[SerializationKeys.pushAbility].floatValue

  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.hasLemonGroundIntake] = hasLemonGroundIntake
    dictionary[SerializationKeys.predictedRPs] = predictedRPs
    dictionary[SerializationKeys.percentIncap] = percentIncap
    dictionary[SerializationKeys.percentIncapEntireMatch] = percentIncapEntireMatch
    dictionary[SerializationKeys.hasCargoGroundIntake] = hasCargoGroundIntake
    dictionary[SerializationKeys.didPreloadLemon] = didPreloadLemon
    dictionary[SerializationKeys.didPreloadCargo] = didPreloadCargo
    dictionary[SerializationKeys.firstPickAbility] = firstPickAbility
    dictionary[SerializationKeys.predictedDedicatedLemonCycles] = predictedDedicatedLemonCycles
    dictionary[SerializationKeys.avgTimeIncap] = avgTimeIncap
    dictionary[SerializationKeys.sdLemonSuccessFromSide] = sdLemonSuccessFromSide
    dictionary[SerializationKeys.p75lemonLoadSuccess] = p75lemonLoadSuccess
    dictionary[SerializationKeys.p75percentIncap] = p75percentIncap
    dictionary[SerializationKeys.p75percentIncapEntireMatch] = p75percentIncapEntireMatch
    dictionary[SerializationKeys.cargoSuccessL3] = cargoSuccessL3
    dictionary[SerializationKeys.lemonCycleL2] = lemonCycleL2
    dictionary[SerializationKeys.lfmCargoSuccessL3] = lfmCargoSuccessL3
    dictionary[SerializationKeys.cargoCycleL3] = cargoCycleL3
    dictionary[SerializationKeys.p75lemonCycleL2] = p75lemonCycleL2
    dictionary[SerializationKeys.p75avgTimeIncap] = p75avgTimeIncap
    dictionary[SerializationKeys.p75cargoCycleL1] = p75cargoCycleL1
    dictionary[SerializationKeys.lfmPercentNoShow] = lfmPercentNoShow
    dictionary[SerializationKeys.lfmAvgCargoScored] = lfmAvgCargoScored
    dictionary[SerializationKeys.sdCargoSuccessL1] = sdCargoSuccessL1
    dictionary[SerializationKeys.lfmLemonCycleL3] = lfmLemonCycleL3
    dictionary[SerializationKeys.p75cargoSuccessUndefended] = p75cargoSuccessUndefended
    dictionary[SerializationKeys.sdAvgLemonsScored] = sdAvgLemonsScored
    dictionary[SerializationKeys.sdCargoSuccessAll] = sdCargoSuccessAll
    dictionary[SerializationKeys.p75lemonSuccessAll] = p75lemonSuccessAll
    dictionary[SerializationKeys.lfmAvgLemonsScored] = lfmAvgLemonsScored
    dictionary[SerializationKeys.lemonCycleL1] = lemonCycleL1
    dictionary[SerializationKeys.habLineSuccessL1] = habLineSuccessL1
    if let value = habLineAttemptsL1 { dictionary[SerializationKeys.habLineAttemptsL1] = value }
    if let value = habLineAttemptsL2 { dictionary[SerializationKeys.habLineAttemptsL2] = value}
    dictionary[SerializationKeys.numHabLineAttemptsL1] = numHabLineAttemptsL1
    dictionary[SerializationKeys.numHabLineAttemptsL2] = numHabLineAttemptsL2
    dictionary[SerializationKeys.sdLemonSuccessUndefended] = sdLemonSuccessUndefended
    dictionary[SerializationKeys.cargoCycleL2] = cargoCycleL2
    dictionary[SerializationKeys.p75habLineSuccessL2] = p75habLineSuccessL2
    dictionary[SerializationKeys.sdCargoSuccessDefended] = sdCargoSuccessDefended
    dictionary[SerializationKeys.p75lemonSuccessFromSide] = p75lemonSuccessFromSide
    dictionary[SerializationKeys.lfmAvgTimeClimbing] = lfmAvgTimeClimbing
    dictionary[SerializationKeys.p75habLineSuccessL1] = p75habLineSuccessL1
    dictionary[SerializationKeys.lemonSuccessUndefended] = lemonSuccessUndefended
    dictionary[SerializationKeys.cargoSuccessL2] = cargoSuccessL2
    dictionary[SerializationKeys.p75cargoSuccessAll] = p75cargoSuccessAll
    dictionary[SerializationKeys.p75cargoCycleAll] = p75cargoCycleAll
    dictionary[SerializationKeys.lfmLemonLoadSuccess] = lfmLemonLoadSuccess
    dictionary[SerializationKeys.p75cargoSuccessDefended] = p75cargoSuccessDefended
    dictionary[SerializationKeys.predictedDedicatedCargoCycles] = predictedDedicatedCargoCycles
    dictionary[SerializationKeys.predictedSeed] = predictedSeed
    dictionary[SerializationKeys.habLineSuccessL2] = habLineSuccessL2
    dictionary[SerializationKeys.lemonCycleL3] = lemonCycleL3
    dictionary[SerializationKeys.lemonSuccessFromSide] = lemonSuccessFromSide
    dictionary[SerializationKeys.sdLemonCycleAll] = sdLemonCycleAll
    dictionary[SerializationKeys.lfmCargoCycleL1] = lfmCargoCycleL1
    dictionary[SerializationKeys.lemonSuccessL2] = lemonSuccessL2
    dictionary[SerializationKeys.lfmCargoSuccessDefended] = lfmCargoSuccessDefended
    dictionary[SerializationKeys.p75lemonSuccessDefended] = p75lemonSuccessDefended
    dictionary[SerializationKeys.sdHabLineSuccessL2] = sdHabLineSuccessL2
    dictionary[SerializationKeys.sdAvgTimeClimbing] = sdAvgTimeClimbing
    dictionary[SerializationKeys.sdCargoCycleAll] = sdCargoCycleAll
    dictionary[SerializationKeys.lfmLemonCycleAll] = lfmLemonCycleAll
    dictionary[SerializationKeys.sdCargoSuccessUndefended] = sdCargoSuccessUndefended
    dictionary[SerializationKeys.p75cargoSuccessL3] = p75cargoSuccessL3
    dictionary[SerializationKeys.lemonSuccessL3] = lemonSuccessL3
    dictionary[SerializationKeys.lfmLemonSuccessAll] = lfmLemonSuccessAll
    dictionary[SerializationKeys.avgLemonsScored] = avgLemonsScored
    dictionary[SerializationKeys.avgLemonsScoredL1] = avgLemonsScoredL1
    dictionary[SerializationKeys.avgLemonsScoredL2] = avgLemonsScoredL2
    dictionary[SerializationKeys.avgLemonsScoredL3] = avgLemonsScoredL3
    dictionary[SerializationKeys.avgLemonsScoredSandstorm] = avgLemonsScoredSandstorm
    dictionary[SerializationKeys.avgLemonsScoredTeleL1] = avgLemonsScoredTeleL1
    dictionary[SerializationKeys.avgLemonsScoredTeleL2] = avgLemonsScoredTeleL2
    dictionary[SerializationKeys.avgLemonsScoredTeleL3] = avgLemonsScoredTeleL3
    dictionary[SerializationKeys.p75lemonCycleAll] = p75lemonCycleAll
    dictionary[SerializationKeys.cargoSuccessL1] = cargoSuccessL1
    dictionary[SerializationKeys.sdLemonSuccessL1] = sdLemonSuccessL1
    dictionary[SerializationKeys.sdHabLineSuccessL1] = sdHabLineSuccessL1
    dictionary[SerializationKeys.lfmLemonSuccessFromSide] = lfmLemonSuccessFromSide
    dictionary[SerializationKeys.sdCargoSuccessL3] = sdCargoSuccessL3
    dictionary[SerializationKeys.sdLemonCycleL3] = sdLemonCycleL3
    dictionary[SerializationKeys.lfmCargoCycleL2] = lfmCargoCycleL2
    dictionary[SerializationKeys.sdCargoCycleL3] = sdCargoCycleL3
    dictionary[SerializationKeys.lfmHabLineSuccessL2] = lfmHabLineSuccessL2
    dictionary[SerializationKeys.sdLemonCycleL1] = sdLemonCycleL1
    dictionary[SerializationKeys.p75lemonSuccessL2] = p75lemonSuccessL2
    dictionary[SerializationKeys.sdPercentNoShow] = sdPercentNoShow
    dictionary[SerializationKeys.sdCargoCycleL1] = sdCargoCycleL1
    dictionary[SerializationKeys.secondPickAbility] = secondPickAbility
    dictionary[SerializationKeys.cargoCycleL1] = cargoCycleL1
    dictionary[SerializationKeys.lfmLemonCycleL1] = lfmLemonCycleL1
    dictionary[SerializationKeys.lfmLemonSuccessL2] = lfmLemonSuccessL2
    dictionary[SerializationKeys.sdCargoSuccessL2] = sdCargoSuccessL2
    dictionary[SerializationKeys.p75avgLemonsScored] = p75avgLemonsScored
    dictionary[SerializationKeys.p75cargoCycleL3] = p75cargoCycleL3
    dictionary[SerializationKeys.cargoAbility] = cargoAbility
    dictionary[SerializationKeys.sdLemonCycleL2] = sdLemonCycleL2
    dictionary[SerializationKeys.p75avgCargoScored] = p75avgCargoScored
    dictionary[SerializationKeys.sdAvgCargoScored] = sdAvgCargoScored
    dictionary[SerializationKeys.lfmCargoSuccessL1] = lfmCargoSuccessL1
    dictionary[SerializationKeys.lemonLoadSuccess] = lemonLoadSuccess
    dictionary[SerializationKeys.p75cargoCycleL2] = p75cargoCycleL2
    dictionary[SerializationKeys.lemonSuccessDefended] = lemonSuccessDefended
    dictionary[SerializationKeys.avgTimeClimbing] = avgTimeClimbing
    dictionary[SerializationKeys.lfmCargoSuccessUndefended] = lfmCargoSuccessUndefended
    dictionary[SerializationKeys.p75percentNoShow] = p75percentNoShow
    dictionary[SerializationKeys.cargoSuccessUndefended] = cargoSuccessUndefended
    dictionary[SerializationKeys.lfmLemonSuccessDefended] = lfmLemonSuccessDefended
    dictionary[SerializationKeys.p75lemonSuccessL1] = p75lemonSuccessL1
    dictionary[SerializationKeys.sdPercentIncap] = sdPercentIncap
    dictionary[SerializationKeys.sdPercentIncapEntireMatch] = sdPercentIncapEntireMatch
    dictionary[SerializationKeys.cargoSuccessDefended] = cargoSuccessDefended
    dictionary[SerializationKeys.lfmLemonCycleL2] = lfmLemonCycleL2
    dictionary[SerializationKeys.lemonCycleAll] = lemonCycleAll
    dictionary[SerializationKeys.sdLemonSuccessL3] = sdLemonSuccessL3
    dictionary[SerializationKeys.sdLemonSuccessDefended] = sdLemonSuccessDefended
    dictionary[SerializationKeys.lfmLemonSuccessUndefended] = lfmLemonSuccessUndefended
    dictionary[SerializationKeys.p75avgTimeClimbing] = p75avgTimeClimbing
    dictionary[SerializationKeys.sdLemonSuccessL2] = sdLemonSuccessL2
    dictionary[SerializationKeys.lemonAbility] = lemonAbility
    dictionary[SerializationKeys.predictedSoloPoints] = predictedSoloPoints
    dictionary[SerializationKeys.percentNoShow] = percentNoShow
    dictionary[SerializationKeys.p75lemonCycleL1] = p75lemonCycleL1
    dictionary[SerializationKeys.lfmHabLineSuccessL1] = lfmHabLineSuccessL1
    dictionary[SerializationKeys.p75lemonCycleL3] = p75lemonCycleL3
    dictionary[SerializationKeys.lfmCargoCycleL3] = lfmCargoCycleL3
    dictionary[SerializationKeys.sdCargoCycleL2] = sdCargoCycleL2
    dictionary[SerializationKeys.sdAvgTimeIncap] = sdAvgTimeIncap
    dictionary[SerializationKeys.p75cargoSuccessL2] = p75cargoSuccessL2
    dictionary[SerializationKeys.lfmCargoSuccessL2] = lfmCargoSuccessL2
    dictionary[SerializationKeys.p75lemonSuccessL3] = p75lemonSuccessL3
    dictionary[SerializationKeys.lfmPercentIncap] = lfmPercentIncap
    dictionary[SerializationKeys.lfmPercentIncapEntireMatch] = lfmPercentIncapEntireMatch
    dictionary[SerializationKeys.lemonSuccessAll] = lemonSuccessAll
    dictionary[SerializationKeys.p75lemonSuccessUndefended] = p75lemonSuccessUndefended
    dictionary[SerializationKeys.lfmLemonSuccessL1] = lfmLemonSuccessL1
    dictionary[SerializationKeys.cargoSuccessAll] = cargoSuccessAll
    dictionary[SerializationKeys.lemonSuccessL1] = lemonSuccessL1
    dictionary[SerializationKeys.sdLemonLoadSuccess] = sdLemonLoadSuccess
    dictionary[SerializationKeys.lfmCargoCycleAll] = lfmCargoCycleAll
    dictionary[SerializationKeys.cargoCycleAll] = cargoCycleAll
    dictionary[SerializationKeys.lfmAvgTimeIncap] = lfmAvgTimeIncap
    dictionary[SerializationKeys.p75cargoSuccessL1] = p75cargoSuccessL1
    dictionary[SerializationKeys.lfmLemonSuccessL3] = lfmLemonSuccessL3
    dictionary[SerializationKeys.lfmCargoSuccessAll] = lfmCargoSuccessAll
    dictionary[SerializationKeys.sdLemonSuccessAll] = sdLemonSuccessAll
    dictionary[SerializationKeys.avgPinningFouls] = avgPinningFouls
    dictionary[SerializationKeys.p75avgPinningFouls] = p75avgPinningFouls
    dictionary[SerializationKeys.lfmAvgPinningFouls] = lfmAvgPinningFouls
    dictionary[SerializationKeys.sdAvgPinningFouls] = sdAvgPinningFouls
    dictionary[SerializationKeys.avgCargoScored] = avgCargoScored
    dictionary[SerializationKeys.avgCargoScoredL1] = avgCargoScoredL1
    dictionary[SerializationKeys.avgCargoScoredL2] = avgCargoScoredL2
    dictionary[SerializationKeys.avgCargoScoredL3] = avgCargoScoredL3
    dictionary[SerializationKeys.avgCargoScoredSandstorm] = avgCargoScoredSandstorm
    dictionary[SerializationKeys.avgCargoScoredTeleL1] = avgCargoScoredTeleL1
    dictionary[SerializationKeys.avgCargoScoredTeleL2] = avgCargoScoredTeleL2
    dictionary[SerializationKeys.avgCargoScoredTeleL3] = avgCargoScoredTeleL3
    if let value = climbAttemptsL1 { dictionary[SerializationKeys.climbAttemptsL1] = value }
    if let value = climbAttemptsL2 { dictionary[SerializationKeys.climbAttemptsL2] = value }
    if let value = climbAttemptsL3 { dictionary[SerializationKeys.climbAttemptsL3] = value}
    dictionary[SerializationKeys.numClimbAttemptsL1] = numClimbAttemptsL1
    dictionary[SerializationKeys.numClimbAttemptsL2] = numClimbAttemptsL2
    dictionary[SerializationKeys.numClimbAttempts3] = numClimbAttemptsL3
    dictionary[SerializationKeys.climbSuccessL1] = climbSuccessL1
    dictionary[SerializationKeys.climbSuccessL2] = climbSuccessL2
    dictionary[SerializationKeys.climbSuccessL3] = climbSuccessL3
    dictionary[SerializationKeys.selfClimbLevel] = selfClimbLevel
    dictionary[SerializationKeys.robot1ClimbLevel] = robot1ClimbLevel
    dictionary[SerializationKeys.robot2ClimbLevel] = robot2ClimbLevel
    dictionary[SerializationKeys.failedCyclesCaused] = failedCyclesCaused
    dictionary[SerializationKeys.avgRankDefense] = avgRankDefense
    dictionary[SerializationKeys.totalTimeDefending] = totalTimeDefending
    dictionary[SerializationKeys.avgFailedCyclesCaused] = avgFailedCyclesCaused
    dictionary[SerializationKeys.failedCyclesCausedPerSecond] = failedCyclesCausedPerSecond
    dictionary[SerializationKeys.avgTimeDefending] = avgTimeDefending
    dictionary[SerializationKeys.lastMatch] = lastMatch
    dictionary[SerializationKeys.matchesDefended] = matchesDefended
    dictionary[SerializationKeys.avgPointsPrevented] = avgPointsPrevented
    dictionary[SerializationKeys.avgLemonPointsPrevented] = avgLemonPointsPrevented
    dictionary[SerializationKeys.avgCargoPointsPrevented] = avgCargoPointsPrevented
    dictionary[SerializationKeys.pushAbility] = pushAbility
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avgCargoScored = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScored)
    self.avgCargoScoredL1 = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScoredL1)
    self.avgCargoScoredL2 = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScoredL2)
    self.avgCargoScoredL3 = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScoredL3)
    self.avgCargoScoredSandstorm = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScoredSandstorm)
    self.avgCargoScoredTeleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScoredTeleL1)
    self.avgCargoScoredTeleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScoredTeleL2)
    self.avgCargoScoredTeleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoScoredTeleL3)
    self.predictedDedicatedLemonCycles = aDecoder.decodeFloat(forKey: SerializationKeys.predictedDedicatedLemonCycles)
    self.avgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeIncap)
    self.hasLemonGroundIntake = aDecoder.decodeBool(forKey: SerializationKeys.hasLemonGroundIntake)
    self.sdLemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessFromSide)
    self.p75lemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonLoadSuccess)
    self.p75percentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentIncap)
    self.p75percentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentIncapEntireMatch)
    self.cargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessL3)
    self.lemonCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.lemonCycleL2)
    self.lfmCargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessL3)
    self.cargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleL3)
    self.predictedRPs = aDecoder.decodeFloat(forKey: SerializationKeys.predictedRPs)
    self.p75lemonCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleL2)
    self.p75avgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgTimeIncap)
    self.p75cargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleL1)
    self.lfmPercentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentNoShow)
    self.lfmAvgCargoScored = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgCargoScored)
    self.sdCargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessL1)
    self.lfmLemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmLemonCycleL3)
    self.p75cargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessUndefended)
    self.sdAvgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgLemonsScored)
    self.sdCargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessAll)
    self.p75lemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessAll)
    self.lfmAvgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgLemonsScored)
    self.lemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lemonCycleL1)
    self.habLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.habLineSuccessL1)
    self.habLineAttemptsL1 = aDecoder.decodeObject(forKey: SerializationKeys.habLineAttemptsL1) as? String
    self.habLineAttemptsL2 = aDecoder.decodeObject(forKey: SerializationKeys.habLineAttemptsL2) as? String
    self.numHabLineAttemptsL1 = aDecoder.decodeInteger(forKey: SerializationKeys.numHabLineAttemptsL1)
    self.numHabLineAttemptsL2 = aDecoder.decodeInteger(forKey: SerializationKeys.numHabLineAttemptsL2)
    self.sdLemonSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessUndefended)
    self.cargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleL2)
    self.p75habLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75habLineSuccessL2)
    self.sdCargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessDefended)
    self.p75lemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessFromSide)
    self.lfmAvgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgTimeClimbing)
    self.p75habLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75habLineSuccessL1)
    self.lemonSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessUndefended)
    self.cargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessL2)
    self.p75cargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessAll)
    self.p75cargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleAll)
    self.lfmLemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonLoadSuccess)
    self.p75cargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessDefended)
    self.predictedDedicatedCargoCycles = aDecoder.decodeFloat(forKey: SerializationKeys.predictedDedicatedCargoCycles)
    self.predictedSeed = aDecoder.decodeInteger(forKey: SerializationKeys.predictedSeed)
    self.habLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.habLineSuccessL2)
    self.lemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lemonCycleL3)
    self.lemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessFromSide)
    self.sdLemonCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleAll)
    self.lfmCargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleL1)
    self.lemonSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessL2)
    self.lfmCargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessDefended)
    self.percentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.percentIncap)
    self.percentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.percentIncapEntireMatch)
    self.p75lemonSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessDefended)
    self.sdHabLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdHabLineSuccessL2)
    self.sdAvgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgTimeClimbing)
    self.sdCargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleAll)
    self.lfmLemonCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.lfmLemonCycleAll)
    self.sdCargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessUndefended)
    self.p75cargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessL3)
    self.lemonSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessL3)
    self.lfmLemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessAll)
    self.avgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScored)
    self.avgLemonsScoredL1 = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScoredL1)
    self.avgLemonsScoredL2 = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScoredL2)
    self.avgLemonsScoredL3 = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScoredL3)
    self.avgLemonsScoredSandstorm = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScoredSandstorm)
    self.avgLemonsScoredTeleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScoredTeleL1)
    self.avgLemonsScoredTeleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScoredTeleL2)
    self.avgLemonsScoredTeleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScoredTeleL3)
    self.p75lemonCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleAll)
    self.cargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessL1)
    self.sdLemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessL1)
    self.sdHabLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdHabLineSuccessL1)
    self.lfmLemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessFromSide)
    self.sdCargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessL3)
    self.sdLemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleL3)
    self.lfmCargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleL2)
    self.hasCargoGroundIntake = aDecoder.decodeBool(forKey: SerializationKeys.hasCargoGroundIntake)
    self.sdCargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleL3)
    self.lfmHabLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmHabLineSuccessL2)
    self.sdLemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleL1)
    self.p75lemonSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessL2)
    self.sdPercentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentNoShow)
    self.sdCargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleL1)
    self.secondPickAbility = aDecoder.decodeFloat(forKey: SerializationKeys.secondPickAbility)
    self.cargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleL1)
    self.lfmLemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmLemonCycleL1)
    self.lfmLemonSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessL2)
    self.sdCargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessL2)
    self.p75avgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgLemonsScored)
    self.p75cargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleL3)
    self.cargoAbility = aDecoder.decodeFloat(forKey: SerializationKeys.cargoAbility)
    self.sdLemonCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleL2)
    self.p75avgCargoScored = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgCargoScored)
    self.sdAvgCargoScored = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgCargoScored)
    self.lfmCargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessL1)
    self.lemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.lemonLoadSuccess)
    self.p75cargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleL2)
    self.lemonSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessDefended)
    self.avgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeClimbing)
    self.lfmCargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessUndefended)
    self.p75percentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentNoShow)
    self.cargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessUndefended)
    self.lfmLemonSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessDefended)
    self.p75lemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessL1)
    self.didPreloadLemon = aDecoder.decodeBool(forKey: SerializationKeys.didPreloadLemon)
    self.sdPercentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentIncap)
    self.sdPercentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentIncapEntireMatch)
    self.cargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessDefended)
    self.lfmLemonCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmLemonCycleL2)
    self.lemonCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.lemonCycleAll)
    self.sdLemonSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessL3)
    self.sdLemonSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessDefended)
    self.lfmLemonSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessUndefended)
    self.p75avgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgTimeClimbing)
    self.sdLemonSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessL2)
    self.lemonAbility = aDecoder.decodeFloat(forKey: SerializationKeys.lemonAbility)
    self.predictedSoloPoints = aDecoder.decodeFloat(forKey: SerializationKeys.predictedSoloPoints)
    self.percentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.percentNoShow)
    self.p75lemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleL1)
    self.lfmHabLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmHabLineSuccessL1)
    self.p75lemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleL3)
    self.lfmCargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleL3)
    self.sdCargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleL2)
    self.sdAvgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgTimeIncap)
    self.p75cargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessL2)
    self.lfmCargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessL2)
    self.p75lemonSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessL3)
    self.lfmPercentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentIncap)
    self.lfmPercentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentIncapEntireMatch)
    self.lemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessAll)
    self.p75lemonSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessUndefended)
    self.lfmLemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessL1)
    self.cargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessAll)
    self.didPreloadCargo = aDecoder.decodeBool(forKey: SerializationKeys.didPreloadCargo)
    self.lemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessL1)
    self.sdLemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonLoadSuccess)
    self.lfmCargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleAll)
    self.cargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleAll)
    self.lfmAvgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgTimeIncap)
    self.p75cargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessL1)
    self.lfmLemonSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessL3)
    self.lfmCargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessAll)
    self.sdLemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessAll)
    self.firstPickAbility = aDecoder.decodeFloat(forKey: SerializationKeys.firstPickAbility)
    self.avgPinningFouls = aDecoder.decodeFloat(forKey: SerializationKeys.avgPinningFouls)
    self.p75avgPinningFouls = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgPinningFouls)
    self.lfmAvgPinningFouls = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgPinningFouls)
    self.sdAvgPinningFouls = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgPinningFouls)
    self.climbAttemptsL1 = aDecoder.decodeObject(forKey: SerializationKeys.climbAttemptsL1) as? String
    self.climbAttemptsL2 = aDecoder.decodeObject(forKey: SerializationKeys.climbAttemptsL2) as? String
    self.climbAttemptsL3 = aDecoder.decodeObject(forKey: SerializationKeys.climbAttemptsL3) as? String
    self.numClimbAttemptsL1 = aDecoder.decodeInteger(forKey: SerializationKeys.numClimbAttemptsL1)
    self.numClimbAttemptsL2 = aDecoder.decodeInteger(forKey: SerializationKeys.numClimbAttemptsL2)
    self.numClimbAttemptsL3 = aDecoder.decodeInteger(forKey: SerializationKeys.numClimbAttempts3)
    self.climbSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.climbSuccessL1)
    self.climbSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.climbSuccessL2)
    self.climbSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.climbSuccessL3)
    self.selfClimbLevel = aDecoder.decodeInteger(forKey: SerializationKeys.selfClimbLevel)
    self.robot1ClimbLevel = aDecoder.decodeInteger(forKey: SerializationKeys.robot1ClimbLevel)
    self.robot2ClimbLevel = aDecoder.decodeInteger(forKey: SerializationKeys.robot2ClimbLevel)
    self.failedCyclesCaused = aDecoder.decodeInteger(forKey: SerializationKeys.failedCyclesCaused)
    self.avgRankDefense = aDecoder.decodeFloat(forKey: SerializationKeys.avgRankDefense)
    self.totalTimeDefending = aDecoder.decodeFloat(forKey: SerializationKeys.totalTimeDefending)
    self.avgFailedCyclesCaused = aDecoder.decodeFloat(forKey: SerializationKeys.avgFailedCyclesCaused)
    self.failedCyclesCausedPerSecond = aDecoder.decodeFloat(forKey: SerializationKeys.failedCyclesCausedPerSecond)
    self.avgTimeDefending = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeDefending)
    self.lastMatch = aDecoder.decodeInteger(forKey: SerializationKeys.lastMatch)
    self.matchesDefended = aDecoder.decodeInteger(forKey: SerializationKeys.matchesDefended)
    self.avgPointsPrevented = aDecoder.decodeFloat(forKey: SerializationKeys.avgPointsPrevented)
    self.avgLemonPointsPrevented = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonPointsPrevented)
    self.avgCargoPointsPrevented = aDecoder.decodeFloat(forKey: SerializationKeys.avgCargoPointsPrevented)
    self.pushAbility = aDecoder.decodeFloat(forKey: SerializationKeys.pushAbility)

  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avgCargoScored, forKey: SerializationKeys.avgCargoScored)
    aCoder.encode(avgCargoScoredL1, forKey: SerializationKeys.avgCargoScoredL1)
    aCoder.encode(avgCargoScoredL2, forKey: SerializationKeys.avgCargoScoredL2)
    aCoder.encode(avgCargoScoredL3, forKey: SerializationKeys.avgCargoScoredL3)
    aCoder.encode(avgCargoScoredSandstorm, forKey: SerializationKeys.avgCargoScoredSandstorm)
    aCoder.encode(avgCargoScoredTeleL1, forKey: SerializationKeys.avgCargoScoredTeleL1)
    aCoder.encode(avgCargoScoredTeleL2, forKey: SerializationKeys.avgCargoScoredTeleL2)
    aCoder.encode(avgCargoScored, forKey: SerializationKeys.avgCargoScoredTeleL3)
    aCoder.encode(predictedDedicatedLemonCycles, forKey: SerializationKeys.predictedDedicatedLemonCycles)
    aCoder.encode(avgTimeIncap, forKey: SerializationKeys.avgTimeIncap)
    aCoder.encode(hasLemonGroundIntake, forKey: SerializationKeys.hasLemonGroundIntake)
    aCoder.encode(sdLemonSuccessFromSide, forKey: SerializationKeys.sdLemonSuccessFromSide)
    aCoder.encode(p75lemonLoadSuccess, forKey: SerializationKeys.p75lemonLoadSuccess)
    aCoder.encode(p75percentIncap, forKey: SerializationKeys.p75percentIncap)
    aCoder.encode(p75percentIncapEntireMatch, forKey: SerializationKeys.p75percentIncapEntireMatch)
    aCoder.encode(cargoSuccessL3, forKey: SerializationKeys.cargoSuccessL3)
    aCoder.encode(lemonCycleL2, forKey: SerializationKeys.lemonCycleL2)
    aCoder.encode(lfmCargoSuccessL3, forKey: SerializationKeys.lfmCargoSuccessL3)
    aCoder.encode(cargoCycleL3, forKey: SerializationKeys.cargoCycleL3)
    aCoder.encode(predictedRPs, forKey: SerializationKeys.predictedRPs)
    aCoder.encode(p75lemonCycleL2, forKey: SerializationKeys.p75lemonCycleL2)
    aCoder.encode(p75avgTimeIncap, forKey: SerializationKeys.p75avgTimeIncap)
    aCoder.encode(p75cargoCycleL1, forKey: SerializationKeys.p75cargoCycleL1)
    aCoder.encode(lfmPercentNoShow, forKey: SerializationKeys.lfmPercentNoShow)
    aCoder.encode(lfmAvgCargoScored, forKey: SerializationKeys.lfmAvgCargoScored)
    aCoder.encode(sdCargoSuccessL1, forKey: SerializationKeys.sdCargoSuccessL1)
    aCoder.encode(lfmLemonCycleL3, forKey: SerializationKeys.lfmLemonCycleL3)
    aCoder.encode(p75cargoSuccessUndefended, forKey: SerializationKeys.p75cargoSuccessUndefended)
    aCoder.encode(sdAvgLemonsScored, forKey: SerializationKeys.sdAvgLemonsScored)
    aCoder.encode(sdCargoSuccessAll, forKey: SerializationKeys.sdCargoSuccessAll)
    aCoder.encode(p75lemonSuccessAll, forKey: SerializationKeys.p75lemonSuccessAll)
    aCoder.encode(lfmAvgLemonsScored, forKey: SerializationKeys.lfmAvgLemonsScored)
    aCoder.encode(lemonCycleL1, forKey: SerializationKeys.lemonCycleL1)
    aCoder.encode(habLineSuccessL1, forKey: SerializationKeys.habLineSuccessL1)
    aCoder.encode(habLineAttemptsL1, forKey: SerializationKeys.habLineAttemptsL1)
    aCoder.encode(habLineAttemptsL2, forKey: SerializationKeys.habLineAttemptsL2)
    aCoder.encode(numHabLineAttemptsL1, forKey: SerializationKeys.numHabLineAttemptsL1)
    aCoder.encode(numHabLineAttemptsL2, forKey: SerializationKeys.numHabLineAttemptsL2)
    aCoder.encode(sdLemonSuccessUndefended, forKey: SerializationKeys.sdLemonSuccessUndefended)
    aCoder.encode(cargoCycleL2, forKey: SerializationKeys.cargoCycleL2)
    aCoder.encode(p75habLineSuccessL2, forKey: SerializationKeys.p75habLineSuccessL2)
    aCoder.encode(sdCargoSuccessDefended, forKey: SerializationKeys.sdCargoSuccessDefended)
    aCoder.encode(p75lemonSuccessFromSide, forKey: SerializationKeys.p75lemonSuccessFromSide)
    aCoder.encode(lfmAvgTimeClimbing, forKey: SerializationKeys.lfmAvgTimeClimbing)
    aCoder.encode(p75habLineSuccessL1, forKey: SerializationKeys.p75habLineSuccessL1)
    aCoder.encode(lemonSuccessUndefended, forKey: SerializationKeys.lemonSuccessUndefended)
    aCoder.encode(cargoSuccessL2, forKey: SerializationKeys.cargoSuccessL2)
    aCoder.encode(p75cargoSuccessAll, forKey: SerializationKeys.p75cargoSuccessAll)
    aCoder.encode(p75cargoCycleAll, forKey: SerializationKeys.p75cargoCycleAll)
    aCoder.encode(lfmLemonLoadSuccess, forKey: SerializationKeys.lfmLemonLoadSuccess)
    aCoder.encode(p75cargoSuccessDefended, forKey: SerializationKeys.p75cargoSuccessDefended)
    aCoder.encode(predictedDedicatedCargoCycles, forKey: SerializationKeys.predictedDedicatedCargoCycles)
    aCoder.encode(predictedSeed, forKey: SerializationKeys.predictedSeed)
    aCoder.encode(habLineSuccessL2, forKey: SerializationKeys.habLineSuccessL2)
    aCoder.encode(lemonCycleL3, forKey: SerializationKeys.lemonCycleL3)
    aCoder.encode(lemonSuccessFromSide, forKey: SerializationKeys.lemonSuccessFromSide)
    aCoder.encode(sdLemonCycleAll, forKey: SerializationKeys.sdLemonCycleAll)
    aCoder.encode(lfmCargoCycleL1, forKey: SerializationKeys.lfmCargoCycleL1)
    aCoder.encode(lemonSuccessL2, forKey: SerializationKeys.lemonSuccessL2)
    aCoder.encode(lfmCargoSuccessDefended, forKey: SerializationKeys.lfmCargoSuccessDefended)
    aCoder.encode(percentIncap, forKey: SerializationKeys.percentIncap)
    aCoder.encode(percentIncapEntireMatch, forKey: SerializationKeys.percentIncapEntireMatch)
    aCoder.encode(p75lemonSuccessDefended, forKey: SerializationKeys.p75lemonSuccessDefended)
    aCoder.encode(sdHabLineSuccessL2, forKey: SerializationKeys.sdHabLineSuccessL2)
    aCoder.encode(sdAvgTimeClimbing, forKey: SerializationKeys.sdAvgTimeClimbing)
    aCoder.encode(sdCargoCycleAll, forKey: SerializationKeys.sdCargoCycleAll)
    aCoder.encode(lfmLemonCycleAll, forKey: SerializationKeys.lfmLemonCycleAll)
    aCoder.encode(sdCargoSuccessUndefended, forKey: SerializationKeys.sdCargoSuccessUndefended)
    aCoder.encode(p75cargoSuccessL3, forKey: SerializationKeys.p75cargoSuccessL3)
    aCoder.encode(lemonSuccessL3, forKey: SerializationKeys.lemonSuccessL3)
    aCoder.encode(lfmLemonSuccessAll, forKey: SerializationKeys.lfmLemonSuccessAll)
    aCoder.encode(avgLemonsScored, forKey: SerializationKeys.avgLemonsScored)
    aCoder.encode(avgLemonsScoredL1, forKey: SerializationKeys.avgLemonsScoredL1)
    aCoder.encode(avgLemonsScoredL2, forKey: SerializationKeys.avgLemonsScoredL2)
    aCoder.encode(avgLemonsScoredL3, forKey: SerializationKeys.avgLemonsScoredL3)
    aCoder.encode(avgLemonsScoredSandstorm, forKey: SerializationKeys.avgLemonsScoredSandstorm)
    aCoder.encode(avgLemonsScoredTeleL1, forKey: SerializationKeys.avgLemonsScoredTeleL1)
    aCoder.encode(avgLemonsScoredTeleL2, forKey: SerializationKeys.avgLemonsScoredTeleL2)
    aCoder.encode(avgLemonsScoredTeleL3, forKey: SerializationKeys.avgLemonsScoredTeleL3)
    aCoder.encode(p75lemonCycleAll, forKey: SerializationKeys.p75lemonCycleAll)
    aCoder.encode(cargoSuccessL1, forKey: SerializationKeys.cargoSuccessL1)
    aCoder.encode(sdLemonSuccessL1, forKey: SerializationKeys.sdLemonSuccessL1)
    aCoder.encode(sdHabLineSuccessL1, forKey: SerializationKeys.sdHabLineSuccessL1)
    aCoder.encode(lfmLemonSuccessFromSide, forKey: SerializationKeys.lfmLemonSuccessFromSide)
    aCoder.encode(sdCargoSuccessL3, forKey: SerializationKeys.sdCargoSuccessL3)
    aCoder.encode(sdLemonCycleL3, forKey: SerializationKeys.sdLemonCycleL3)
    aCoder.encode(lfmCargoCycleL2, forKey: SerializationKeys.lfmCargoCycleL2)
    aCoder.encode(hasCargoGroundIntake, forKey: SerializationKeys.hasCargoGroundIntake)
    aCoder.encode(sdCargoCycleL3, forKey: SerializationKeys.sdCargoCycleL3)
    aCoder.encode(lfmHabLineSuccessL2, forKey: SerializationKeys.lfmHabLineSuccessL2)
    aCoder.encode(sdLemonCycleL1, forKey: SerializationKeys.sdLemonCycleL1)
    aCoder.encode(p75lemonSuccessL2, forKey: SerializationKeys.p75lemonSuccessL2)
    aCoder.encode(sdPercentNoShow, forKey: SerializationKeys.sdPercentNoShow)
    aCoder.encode(sdCargoCycleL1, forKey: SerializationKeys.sdCargoCycleL1)
    aCoder.encode(secondPickAbility, forKey: SerializationKeys.secondPickAbility)
    aCoder.encode(cargoCycleL1, forKey: SerializationKeys.cargoCycleL1)
    aCoder.encode(lfmLemonCycleL1, forKey: SerializationKeys.lfmLemonCycleL1)
    aCoder.encode(lfmLemonSuccessL2, forKey: SerializationKeys.lfmLemonSuccessL2)
    aCoder.encode(sdCargoSuccessL2, forKey: SerializationKeys.sdCargoSuccessL2)
    aCoder.encode(p75avgLemonsScored, forKey: SerializationKeys.p75avgLemonsScored)
    aCoder.encode(p75cargoCycleL3, forKey: SerializationKeys.p75cargoCycleL3)
    aCoder.encode(cargoAbility, forKey: SerializationKeys.cargoAbility)
    aCoder.encode(sdLemonCycleL2, forKey: SerializationKeys.sdLemonCycleL2)
    aCoder.encode(p75avgCargoScored, forKey: SerializationKeys.p75avgCargoScored)
    aCoder.encode(sdAvgCargoScored, forKey: SerializationKeys.sdAvgCargoScored)
    aCoder.encode(lfmCargoSuccessL1, forKey: SerializationKeys.lfmCargoSuccessL1)
    aCoder.encode(lemonLoadSuccess, forKey: SerializationKeys.lemonLoadSuccess)
    aCoder.encode(p75cargoCycleL2, forKey: SerializationKeys.p75cargoCycleL2)
    aCoder.encode(lemonSuccessDefended, forKey: SerializationKeys.lemonSuccessDefended)
    aCoder.encode(avgTimeClimbing, forKey: SerializationKeys.avgTimeClimbing)
    aCoder.encode(lfmCargoSuccessUndefended, forKey: SerializationKeys.lfmCargoSuccessUndefended)
    aCoder.encode(p75percentNoShow, forKey: SerializationKeys.p75percentNoShow)
    aCoder.encode(cargoSuccessUndefended, forKey: SerializationKeys.cargoSuccessUndefended)
    aCoder.encode(lfmLemonSuccessDefended, forKey: SerializationKeys.lfmLemonSuccessDefended)
    aCoder.encode(p75lemonSuccessL1, forKey: SerializationKeys.p75lemonSuccessL1)
    aCoder.encode(didPreloadLemon, forKey: SerializationKeys.didPreloadLemon)
    aCoder.encode(sdPercentIncap, forKey: SerializationKeys.sdPercentIncap)
    aCoder.encode(sdPercentIncapEntireMatch, forKey: SerializationKeys.sdPercentIncapEntireMatch)
    aCoder.encode(cargoSuccessDefended, forKey: SerializationKeys.cargoSuccessDefended)
    aCoder.encode(lfmLemonCycleL2, forKey: SerializationKeys.lfmLemonCycleL2)
    aCoder.encode(lemonCycleAll, forKey: SerializationKeys.lemonCycleAll)
    aCoder.encode(sdLemonSuccessL3, forKey: SerializationKeys.sdLemonSuccessL3)
    aCoder.encode(sdLemonSuccessDefended, forKey: SerializationKeys.sdLemonSuccessDefended)
    aCoder.encode(lfmLemonSuccessUndefended, forKey: SerializationKeys.lfmLemonSuccessUndefended)
    aCoder.encode(p75avgTimeClimbing, forKey: SerializationKeys.p75avgTimeClimbing)
    aCoder.encode(sdLemonSuccessL2, forKey: SerializationKeys.sdLemonSuccessL2)
    aCoder.encode(lemonAbility, forKey: SerializationKeys.lemonAbility)
    aCoder.encode(predictedSoloPoints, forKey: SerializationKeys.predictedSoloPoints)
    aCoder.encode(percentNoShow, forKey: SerializationKeys.percentNoShow)
    aCoder.encode(p75lemonCycleL1, forKey: SerializationKeys.p75lemonCycleL1)
    aCoder.encode(lfmHabLineSuccessL1, forKey: SerializationKeys.lfmHabLineSuccessL1)
    aCoder.encode(p75lemonCycleL3, forKey: SerializationKeys.p75lemonCycleL3)
    aCoder.encode(lfmCargoCycleL3, forKey: SerializationKeys.lfmCargoCycleL3)
    aCoder.encode(sdCargoCycleL2, forKey: SerializationKeys.sdCargoCycleL2)
    aCoder.encode(sdAvgTimeIncap, forKey: SerializationKeys.sdAvgTimeIncap)
    aCoder.encode(p75cargoSuccessL2, forKey: SerializationKeys.p75cargoSuccessL2)
    aCoder.encode(lfmCargoSuccessL2, forKey: SerializationKeys.lfmCargoSuccessL2)
    aCoder.encode(p75lemonSuccessL3, forKey: SerializationKeys.p75lemonSuccessL3)
    aCoder.encode(lfmPercentIncap, forKey: SerializationKeys.lfmPercentIncap)
    aCoder.encode(lfmPercentIncapEntireMatch, forKey: SerializationKeys.lfmPercentIncapEntireMatch)
    aCoder.encode(lemonSuccessAll, forKey: SerializationKeys.lemonSuccessAll)
    aCoder.encode(p75lemonSuccessUndefended, forKey: SerializationKeys.p75lemonSuccessUndefended)
    aCoder.encode(lfmLemonSuccessL1, forKey: SerializationKeys.lfmLemonSuccessL1)
    aCoder.encode(cargoSuccessAll, forKey: SerializationKeys.cargoSuccessAll)
    aCoder.encode(didPreloadCargo, forKey: SerializationKeys.didPreloadCargo)
    aCoder.encode(lemonSuccessL1, forKey: SerializationKeys.lemonSuccessL1)
    aCoder.encode(sdLemonLoadSuccess, forKey: SerializationKeys.sdLemonLoadSuccess)
    aCoder.encode(lfmCargoCycleAll, forKey: SerializationKeys.lfmCargoCycleAll)
    aCoder.encode(cargoCycleAll, forKey: SerializationKeys.cargoCycleAll)
    aCoder.encode(lfmAvgTimeIncap, forKey: SerializationKeys.lfmAvgTimeIncap)
    aCoder.encode(p75cargoSuccessL1, forKey: SerializationKeys.p75cargoSuccessL1)
    aCoder.encode(lfmLemonSuccessL3, forKey: SerializationKeys.lfmLemonSuccessL3)
    aCoder.encode(lfmCargoSuccessAll, forKey: SerializationKeys.lfmCargoSuccessAll)
    aCoder.encode(sdLemonSuccessAll, forKey: SerializationKeys.sdLemonSuccessAll)
    aCoder.encode(firstPickAbility, forKey: SerializationKeys.firstPickAbility)
    aCoder.encode(avgPinningFouls, forKey: SerializationKeys.avgPinningFouls)
    aCoder.encode(p75avgPinningFouls, forKey: SerializationKeys.p75avgPinningFouls)
    aCoder.encode(lfmAvgPinningFouls, forKey: SerializationKeys.lfmAvgPinningFouls)
    aCoder.encode(sdAvgPinningFouls, forKey: SerializationKeys.sdAvgPinningFouls)
    aCoder.encode(climbAttemptsL1, forKey: SerializationKeys.climbAttemptsL1)
    aCoder.encode(climbAttemptsL2, forKey: SerializationKeys.climbAttemptsL2)
    aCoder.encode(climbAttemptsL3, forKey: SerializationKeys.climbAttemptsL3)
    aCoder.encode(numClimbAttemptsL1, forKey: SerializationKeys.numClimbAttemptsL1)
    aCoder.encode(numClimbAttemptsL2, forKey: SerializationKeys.numClimbAttemptsL2)
    aCoder.encode(numClimbAttemptsL3, forKey: SerializationKeys.numClimbAttempts3)
    aCoder.encode(climbSuccessL1, forKey: SerializationKeys.climbSuccessL1)
    aCoder.encode(climbSuccessL2, forKey: SerializationKeys.climbSuccessL2)
    aCoder.encode(climbSuccessL3, forKey: SerializationKeys.climbSuccessL3)
    aCoder.encode(selfClimbLevel, forKey: SerializationKeys.selfClimbLevel)
    aCoder.encode(robot1ClimbLevel, forKey: SerializationKeys.robot1ClimbLevel)
    aCoder.encode(robot2ClimbLevel, forKey: SerializationKeys.robot2ClimbLevel)
    aCoder.encode(failedCyclesCaused, forKey: SerializationKeys.failedCyclesCaused)
    aCoder.encode(avgRankDefense, forKey: SerializationKeys.avgRankDefense)
    aCoder.encode(totalTimeDefending, forKey: SerializationKeys.totalTimeDefending)
    aCoder.encode(avgFailedCyclesCaused, forKey: SerializationKeys.avgFailedCyclesCaused)
    aCoder.encode(failedCyclesCausedPerSecond, forKey: SerializationKeys.failedCyclesCausedPerSecond)
    aCoder.encode(avgTimeDefending, forKey: SerializationKeys.avgTimeDefending)
    aCoder.encode(lastMatch, forKey: SerializationKeys.lastMatch)
    aCoder.encode(matchesDefended, forKey: SerializationKeys.matchesDefended)
    aCoder.encode(avgPointsPrevented, forKey: SerializationKeys.avgPointsPrevented)
    aCoder.encode(avgLemonPointsPrevented, forKey: SerializationKeys.avgLemonPointsPrevented)
    aCoder.encode(avgCargoPointsPrevented, forKey: SerializationKeys.avgCargoPointsPrevented)
    aCoder.encode(pushAbility, forKey: SerializationKeys.pushAbility)

  }

}
