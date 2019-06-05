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
    static let predictedDedicatedPanelCycles = "predictedDedicatedPanelCycles"
    static let avgTimeIncap = "avgTimeIncap"
    static let hasPanelGroundIntake = "hasPanelGroundIntake"
    static let sdPanelSuccessFromSide = "sdPanelSuccessFromSide"
    static let p75panelLoadSuccess = "p75panelLoadSuccess"
    static let p75percentIncap = "p75percentIncap"
    static let p75percentIncapEntireMatch = "p75PercentIncapEntireMatch"
    static let cargoSuccessL3 = "cargoSuccessL3"
    static let panelCycleL2 = "panelCycleL2"
    static let lfmCargoSuccessL3 = "lfmCargoSuccessL3"
    static let cargoCycleL3 = "cargoCycleL3"
    static let predictedRPs = "predictedRPs"
    static let p75panelCycleL2 = "p75panelCycleL2"
    static let p75avgTimeIncap = "p75avgTimeIncap"
    static let p75cargoCycleL1 = "p75cargoCycleL1"
    static let lfmPercentNoShow = "lfmPercentNoShow"
    static let lfmAvgCargoScored = "lfmAvgCargoScored"
    static let sdCargoSuccessL1 = "sdCargoSuccessL1"
    static let lfmPanelCycleL3 = "lfmPanelCycleL3"
    static let p75cargoSuccessUndefended = "p75cargoSuccessUndefended"
    static let sdAvgPanelsScored = "sdAvgPanelsScored"
    static let sdCargoSuccessAll = "sdCargoSuccessAll"
    static let p75panelSuccessAll = "p75panelSuccessAll"
    static let lfmAvgPanelsScored = "lfmAvgPanelsScored"
    static let panelCycleL1 = "panelCycleL1"
    static let habLineSuccessL1 = "habLineSuccessL1"
    static let habLineAttemptsL1 = "habLineAttemptsL1"
    static let habLineAttemptsL2 = "habLineAttemptsL2"
    static let numHabLineAttemptsL1 = "numHabLineAttemptsL1"
    static let numHabLineAttemptsL2 = "numHabLineAttemptsL2"
    static let sdPanelSuccessUndefended = "sdPanelSuccessUndefended"
    static let cargoCycleL2 = "cargoCycleL2"
    static let p75habLineSuccessL2 = "p75habLineSuccessL2"
    static let sdCargoSuccessDefended = "sdCargoSuccessDefended"
    static let p75panelSuccessFromSide = "p75panelSuccessFromSide"
    static let lfmAvgTimeClimbing = "lfmAvgTimeClimbing"
    static let p75habLineSuccessL1 = "p75habLineSuccessL1"
    static let panelSuccessUndefended = "panelSuccessUndefended"
    static let cargoSuccessL2 = "cargoSuccessL2"
    static let p75cargoSuccessAll = "p75cargoSuccessAll"
    static let p75cargoCycleAll = "p75cargoCycleAll"
    static let lfmPanelLoadSuccess = "lfmPanelLoadSuccess"
    static let p75cargoSuccessDefended = "p75cargoSuccessDefended"
    static let predictedDedicatedCargoCycles = "predictedDedicatedCargoCycles"
    static let predictedSeed = "predictedSeed"
    static let habLineSuccessL2 = "habLineSuccessL2"
    static let panelCycleL3 = "panelCycleL3"
    static let panelSuccessFromSide = "panelSuccessFromSide"
    static let sdPanelCycleAll = "sdPanelCycleAll"
    static let lfmCargoCycleL1 = "lfmCargoCycleL1"
    static let panelSuccessL2 = "panelSuccessL2"
    static let lfmCargoSuccessDefended = "lfmCargoSuccessDefended"
    static let percentIncap = "percentIncap"
    static let percentIncapEntireMatch = "percentIncapEntireMatch"
    static let p75panelSuccessDefended = "p75panelSuccessDefended"
    static let sdHabLineSuccessL2 = "sdHabLineSuccessL2"
    static let sdAvgTimeClimbing = "sdAvgTimeClimbing"
    static let sdCargoCycleAll = "sdCargoCycleAll"
    static let lfmPanelCycleAll = "lfmPanelCycleAll"
    static let sdCargoSuccessUndefended = "sdCargoSuccessUndefended"
    static let p75cargoSuccessL3 = "p75cargoSuccessL3"
    static let panelSuccessL3 = "panelSuccessL3"
    static let lfmPanelSuccessAll = "lfmPanelSuccessAll"
    static let avgPanelsScored = "avgPanelsScored"
    static let avgPanelsScoredL1 = "avgPanelsScoredL1"
    static let avgPanelsScoredL2 = "avgPanelsScoredL2"
    static let avgPanelsScoredL3 = "avgPanelsScoredL3"
    static let avgPanelsScoredSandstorm = "avgPanelsScoredSandstorm"
    static let avgPanelsScoredTeleL1 = "avgPanelsScoredTeleL1"
    static let avgPanelsScoredTeleL2 = "avgPanelsScoredTeleL2"
    static let avgPanelsScoredTeleL3 = "avgPanelsScoredTeleL3"
    static let p75panelCycleAll = "p75panelCycleAll"
    static let cargoSuccessL1 = "cargoSuccessL1"
    static let sdPanelSuccessL1 = "sdPanelSuccessL1"
    static let sdHabLineSuccessL1 = "sdHabLineSuccessL1"
    static let lfmPanelSuccessFromSide = "lfmPanelSuccessFromSide"
    static let sdCargoSuccessL3 = "sdCargoSuccessL3"
    static let sdPanelCycleL3 = "sdPanelCycleL3"
    static let lfmCargoCycleL2 = "lfmCargoCycleL2"
    static let hasCargoGroundIntake = "hasCargoGroundIntake"
    static let sdCargoCycleL3 = "sdCargoCycleL3"
    static let lfmHabLineSuccessL2 = "lfmHabLineSuccessL2"
    static let sdPanelCycleL1 = "sdPanelCycleL1"
    static let p75panelSuccessL2 = "p75panelSuccessL2"
    static let sdPercentNoShow = "sdPercentNoShow"
    static let sdCargoCycleL1 = "sdCargoCycleL1"
    static let secondPickAbility = "secondPickAbility"
    static let cargoCycleL1 = "cargoCycleL1"
    static let lfmPanelCycleL1 = "lfmPanelCycleL1"
    static let lfmPanelSuccessL2 = "lfmPanelSuccessL2"
    static let sdCargoSuccessL2 = "sdCargoSuccessL2"
    static let p75avgPanelsScored = "p75avgPanelsScored"
    static let p75cargoCycleL3 = "p75cargoCycleL3"
    static let cargoAbility = "cargoAbility"
    static let sdPanelCycleL2 = "sdPanelCycleL2"
    static let p75avgCargoScored = "p75avgCargoScored"
    static let sdAvgCargoScored = "sdAvgCargoScored"
    static let lfmCargoSuccessL1 = "lfmCargoSuccessL1"
    static let panelLoadSuccess = "panelLoadSuccess"
    static let p75cargoCycleL2 = "p75cargoCycleL2"
    static let panelSuccessDefended = "panelSuccessDefended"
    static let avgTimeClimbing = "avgTimeClimbing"
    static let lfmCargoSuccessUndefended = "lfmCargoSuccessUndefended"
    static let p75percentNoShow = "p75percentNoShow"
    static let cargoSuccessUndefended = "cargoSuccessUndefended"
    static let lfmPanelSuccessDefended = "lfmPanelSuccessDefended"
    static let p75panelSuccessL1 = "p75panelSuccessL1"
    static let didPreloadPanel = "didPreloadPanel"
    static let sdPercentIncap = "sdPercentIncap"
    static let sdPercentIncapEntireMatch = "sdPercentIncapEntireMatch"
    static let cargoSuccessDefended = "cargoSuccessDefended"
    static let lfmPanelCycleL2 = "lfmPanelCycleL2"
    static let panelCycleAll = "panelCycleAll"
    static let sdPanelSuccessL3 = "sdPanelSuccessL3"
    static let sdPanelSuccessDefended = "sdPanelSuccessDefended"
    static let lfmPanelSuccessUndefended = "lfmPanelSuccessUndefended"
    static let p75avgTimeClimbing = "p75avgTimeClimbing"
    static let sdPanelSuccessL2 = "sdPanelSuccessL2"
    static let panelAbility = "panelAbility"
    static let predictedSoloPoints = "predictedSoloPoints"
    static let percentNoShow = "percentNoShow"
    static let p75panelCycleL1 = "p75panelCycleL1"
    static let lfmHabLineSuccessL1 = "lfmHabLineSuccessL1"
    static let p75panelCycleL3 = "p75panelCycleL3"
    static let lfmCargoCycleL3 = "lfmCargoCycleL3"
    static let sdCargoCycleL2 = "sdCargoCycleL2"
    static let sdAvgTimeIncap = "sdAvgTimeIncap"
    static let p75cargoSuccessL2 = "p75cargoSuccessL2"
    static let lfmCargoSuccessL2 = "lfmCargoSuccessL2"
    static let p75panelSuccessL3 = "p75panelSuccessL3"
    static let lfmPercentIncap = "lfmPercentIncap"
    static let lfmPercentIncapEntireMatch = "lfmPercentIncapEntireMatch"
    static let panelSuccessAll = "panelSuccessAll"
    static let p75panelSuccessUndefended = "p75panelSuccessUndefended"
    static let lfmPanelSuccessL1 = "lfmPanelSuccessL1"
    static let cargoSuccessAll = "cargoSuccessAll"
    static let didPreloadCargo = "didPreloadCargo"
    static let panelSuccessL1 = "panelSuccessL1"
    static let sdPanelLoadSuccess = "sdPanelLoadSuccess"
    static let lfmCargoCycleAll = "lfmCargoCycleAll"
    static let cargoCycleAll = "cargoCycleAll"
    static let lfmAvgTimeIncap = "lfmAvgTimeIncap"
    static let p75cargoSuccessL1 = "p75cargoSuccessL1"
    static let lfmPanelSuccessL3 = "lfmPanelSuccessL3"
    static let lfmCargoSuccessAll = "lfmCargoSuccessAll"
    static let sdPanelSuccessAll = "sdPanelSuccessAll"
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
    static let avgPanelPointsPrevented = "avgPanelPointsPrevented"
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
  @objc public var predictedDedicatedPanelCycles: Float = -1.0
  @objc public var avgTimeIncap: Float = -1.0
  @objc public var hasPanelGroundIntake: Bool = false
  @objc public var sdPanelSuccessFromSide: Int = -1
  @objc public var p75panelLoadSuccess: Int = -1
  @objc public var p75percentIncap: Int = -1
  @objc public var p75percentIncapEntireMatch: Int = -1
  @objc public var cargoSuccessL3: Int = -1
  @objc public var panelCycleL2: Float = -1.0
  @objc public var lfmCargoSuccessL3: Int = -1
  @objc public var cargoCycleL3: Float = -1.0
  @objc public var predictedRPs: Float = -1.0
  @objc public var p75panelCycleL2: Float = -1.0
  @objc public var p75avgTimeIncap: Float = -1.0
  @objc public var p75cargoCycleL1: Float = -1.0
  @objc public var lfmPercentNoShow: Int = -1
  @objc public var lfmAvgCargoScored: Float = -1.0
  @objc public var sdCargoSuccessL1: Int = -1
  @objc public var lfmPanelCycleL3: Float = -1.0
  @objc public var p75cargoSuccessUndefended: Int = -1
  @objc public var sdAvgPanelsScored: Float = -1.0
  @objc public var sdCargoSuccessAll: Int = -1
  @objc public var p75panelSuccessAll: Int = -1
  @objc public var lfmAvgPanelsScored: Float = -1.0
  @objc public var panelCycleL1: Float = -1.0
  @objc public var habLineSuccessL1: Int = -1
    @objc public var habLineAttemptsL1: String?
    @objc public var habLineAttemptsL2: String?
    @objc public var numHabLineAttemptsL1: Int = -1
    @objc public var numHabLineAttemptsL2: Int = -1
  @objc public var sdPanelSuccessUndefended: Int = -1
  @objc public var cargoCycleL2: Float = -1.0
  @objc public var p75habLineSuccessL2: Int = -1
  @objc public var sdCargoSuccessDefended: Int = -1
  @objc public var p75panelSuccessFromSide: Int = -1
  @objc public var lfmAvgTimeClimbing:  Float = -1.0
  @objc public var p75habLineSuccessL1: Int = -1
  @objc public var panelSuccessUndefended: Int = -1
  @objc public var cargoSuccessL2: Int = -1
  @objc public var p75cargoSuccessAll: Int = -1
  @objc public var p75cargoCycleAll: Float = -1.0
  @objc public var lfmPanelLoadSuccess: Int = -1
  @objc public var p75cargoSuccessDefended: Int = -1
  @objc public var predictedDedicatedCargoCycles: Float = -1.0
  @objc public var predictedSeed: Int = -1
  @objc public var habLineSuccessL2: Int = -1
  @objc public var panelCycleL3: Float = -1.0
  @objc public var panelSuccessFromSide: Int = -1
  @objc public var sdPanelCycleAll: Float = -1.0
  @objc public var lfmCargoCycleL1: Float = -1.0
  @objc public var panelSuccessL2: Int = -1
  @objc public var lfmCargoSuccessDefended: Int = -1
  @objc public var percentIncap: Int = -1
  @objc public var percentIncapEntireMatch: Int = -1
  @objc public var p75panelSuccessDefended: Int = -1
  @objc public var sdHabLineSuccessL2: Int = -1
  @objc public var sdAvgTimeClimbing: Float = -1.0
  @objc public var sdCargoCycleAll: Float = -1.0
  @objc public var lfmPanelCycleAll: Float = -1.0
  @objc public var sdCargoSuccessUndefended: Int = -1
  @objc public var p75cargoSuccessL3: Int = -1
  @objc public var panelSuccessL3: Int = -1
  @objc public var lfmPanelSuccessAll: Int = -1
  @objc public var avgPanelsScored: Float = -1.0
    @objc public var avgPanelsScoredL1: Float = -1.0
    @objc public var avgPanelsScoredL2: Float = -1.0
    @objc public var avgPanelsScoredL3: Float = -1.0
    @objc public var avgPanelsScoredSandstorm: Float = -1.0
    @objc public var avgPanelsScoredTeleL1: Float = -1.0
    @objc public var avgPanelsScoredTeleL2: Float = -1.0
    @objc public var avgPanelsScoredTeleL3: Float = -1.0
  @objc public var p75panelCycleAll: Float = -1.0
  @objc public var cargoSuccessL1: Int = -1
  @objc public var sdPanelSuccessL1: Int = -1
  @objc public var sdHabLineSuccessL1: Int = -1
  @objc public var lfmPanelSuccessFromSide: Int = -1
  @objc public var sdCargoSuccessL3: Int = -1
  @objc public var sdPanelCycleL3: Float = -1.0
  @objc public var lfmCargoCycleL2: Float = -1.0
  @objc public var hasCargoGroundIntake: Bool = false
  @objc public var sdCargoCycleL3: Float = -1.0
  @objc public var lfmHabLineSuccessL2: Int = -1
  @objc public var sdPanelCycleL1: Float = -1.0
  @objc public var p75panelSuccessL2: Int = -1
  @objc public var sdPercentNoShow: Int = -1
  @objc public var sdCargoCycleL1: Float = -1.0
  @objc public var secondPickAbility: Float = -1.0
  @objc public var cargoCycleL1: Float = -1.0
  @objc public var lfmPanelCycleL1: Float = -1.0
  @objc public var lfmPanelSuccessL2: Int = -1
  @objc public var sdCargoSuccessL2: Int = -1
  @objc public var p75avgPanelsScored: Float = -1.0
  @objc public var p75cargoCycleL3: Float = -1.0
  @objc public var cargoAbility: Float = -1.0
  @objc public var sdPanelCycleL2: Float = -1.0
  @objc public var p75avgCargoScored: Float = -1.0
  @objc public var sdAvgCargoScored: Float = -1.0
  @objc public var lfmCargoSuccessL1: Int = -1
  @objc public var panelLoadSuccess: Int = -1
  @objc public var p75cargoCycleL2: Float = -1.0
  @objc public var panelSuccessDefended: Int = -1
  @objc public var avgTimeClimbing: Float = -1.0
  @objc public var lfmCargoSuccessUndefended: Int = -1
  @objc public var p75percentNoShow: Int = -1
  @objc public var cargoSuccessUndefended: Int = -1
  @objc public var lfmPanelSuccessDefended: Int = -1
  @objc public var p75panelSuccessL1: Int = -1
  @objc public var didPreloadPanel: Bool = false
  @objc public var sdPercentIncap: Int = -1
  @objc public var sdPercentIncapEntireMatch: Int = -1
  @objc public var cargoSuccessDefended: Int = -1
  @objc public var lfmPanelCycleL2: Float = -1.0
  @objc public var panelCycleAll: Float = -1.0
  @objc public var sdPanelSuccessL3: Int = -1
  @objc public var sdPanelSuccessDefended: Int = -1
  @objc public var lfmPanelSuccessUndefended: Int = -1
  @objc public var p75avgTimeClimbing: Float = -1.0
  @objc public var sdPanelSuccessL2: Int = -1
  @objc public var panelAbility: Float = -1.0
  @objc public var predictedSoloPoints: Float = -1.0
  @objc public var percentNoShow: Int = -1
  @objc public var p75panelCycleL1: Float = -1.0
  @objc public var lfmHabLineSuccessL1: Int = -1
  @objc public var p75panelCycleL3: Float = -1.0
  @objc public var lfmCargoCycleL3: Float = -1.0
  @objc public var sdCargoCycleL2: Float = -1.0
  @objc public var sdAvgTimeIncap: Float = -1.0
  @objc public var p75cargoSuccessL2: Int = -1
  @objc public var lfmCargoSuccessL2: Int = -1
  @objc public var p75panelSuccessL3: Int = -1
  @objc public var lfmPercentIncap: Int = -1
  @objc public var lfmPercentIncapEntireMatch: Int = -1
  @objc public var panelSuccessAll: Int = -1
  @objc public var p75panelSuccessUndefended: Int = -1
  @objc public var lfmPanelSuccessL1: Int = -1
  @objc public var cargoSuccessAll: Int = -1
  @objc public var didPreloadCargo: Bool = false
  @objc public var panelSuccessL1: Int = -1
  @objc public var sdPanelLoadSuccess: Int = -1
  @objc public var lfmCargoCycleAll: Float = -1.0
  @objc public var cargoCycleAll: Float = -1.0
  @objc public var lfmAvgTimeIncap: Float = -1.0
  @objc public var p75cargoSuccessL1: Int = -1
  @objc public var lfmPanelSuccessL3: Int = -1
  @objc public var lfmCargoSuccessAll: Int = -1
  @objc public var sdPanelSuccessAll: Int = -1
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
    @objc public var avgPanelPointsPrevented: Float = -1.0
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
    predictedDedicatedPanelCycles = json[SerializationKeys.predictedDedicatedPanelCycles].floatValue
    avgTimeIncap = json[SerializationKeys.avgTimeIncap].floatValue
    hasPanelGroundIntake = json[SerializationKeys.hasPanelGroundIntake].boolValue
    sdPanelSuccessFromSide = json[SerializationKeys.sdPanelSuccessFromSide].intValue
    p75panelLoadSuccess = json[SerializationKeys.p75panelLoadSuccess].intValue
    p75percentIncap = json[SerializationKeys.p75percentIncap].intValue
    p75percentIncapEntireMatch = json[SerializationKeys.p75percentIncapEntireMatch].intValue
    cargoSuccessL3 = json[SerializationKeys.cargoSuccessL3].intValue
    panelCycleL2 = json[SerializationKeys.panelCycleL2].floatValue
    lfmCargoSuccessL3 = json[SerializationKeys.lfmCargoSuccessL3].intValue
    cargoCycleL3 = json[SerializationKeys.cargoCycleL3].floatValue
    predictedRPs = json[SerializationKeys.predictedRPs].floatValue
    p75panelCycleL2 = json[SerializationKeys.p75panelCycleL2].floatValue
    p75avgTimeIncap = json[SerializationKeys.p75avgTimeIncap].floatValue
    p75cargoCycleL1 = json[SerializationKeys.p75cargoCycleL1].floatValue
    lfmPercentNoShow = json[SerializationKeys.lfmPercentNoShow].intValue
    lfmAvgCargoScored = json[SerializationKeys.lfmAvgCargoScored].floatValue
    sdCargoSuccessL1 = json[SerializationKeys.sdCargoSuccessL1].intValue
    lfmPanelCycleL3 = json[SerializationKeys.lfmPanelCycleL3].floatValue
    p75cargoSuccessUndefended = json[SerializationKeys.p75cargoSuccessUndefended].intValue
    sdAvgPanelsScored = json[SerializationKeys.sdAvgPanelsScored].floatValue
    sdCargoSuccessAll = json[SerializationKeys.sdCargoSuccessAll].intValue
    p75panelSuccessAll = json[SerializationKeys.p75panelSuccessAll].intValue
    lfmAvgPanelsScored = json[SerializationKeys.lfmAvgPanelsScored].floatValue
    panelCycleL1 = json[SerializationKeys.panelCycleL1].floatValue
    habLineSuccessL1 = json[SerializationKeys.habLineSuccessL1].intValue
    habLineAttemptsL1 = json[SerializationKeys.habLineAttemptsL1].string
    habLineAttemptsL2 = json[SerializationKeys.habLineAttemptsL2].string
    numHabLineAttemptsL1 = json[SerializationKeys.numHabLineAttemptsL1].intValue
    numHabLineAttemptsL2 = json[SerializationKeys.numHabLineAttemptsL2].intValue
    sdPanelSuccessUndefended = json[SerializationKeys.sdPanelSuccessUndefended].intValue
    cargoCycleL2 = json[SerializationKeys.cargoCycleL2].floatValue
    p75habLineSuccessL2 = json[SerializationKeys.p75habLineSuccessL2].intValue
    sdCargoSuccessDefended = json[SerializationKeys.sdCargoSuccessDefended].intValue
    p75panelSuccessFromSide = json[SerializationKeys.p75panelSuccessFromSide].intValue
    lfmAvgTimeClimbing = json[SerializationKeys.lfmAvgTimeClimbing].floatValue
    p75habLineSuccessL1 = json[SerializationKeys.p75habLineSuccessL1].intValue
    panelSuccessUndefended = json[SerializationKeys.panelSuccessUndefended].intValue
    cargoSuccessL2 = json[SerializationKeys.cargoSuccessL2].intValue
    p75cargoSuccessAll = json[SerializationKeys.p75cargoSuccessAll].intValue
    p75cargoCycleAll = json[SerializationKeys.p75cargoCycleAll].floatValue
    lfmPanelLoadSuccess = json[SerializationKeys.lfmPanelLoadSuccess].intValue
    p75cargoSuccessDefended = json[SerializationKeys.p75cargoSuccessDefended].intValue
    predictedDedicatedCargoCycles = json[SerializationKeys.predictedDedicatedCargoCycles].floatValue
    predictedSeed = json[SerializationKeys.predictedSeed].intValue
    habLineSuccessL2 = json[SerializationKeys.habLineSuccessL2].intValue
    panelCycleL3 = json[SerializationKeys.panelCycleL3].floatValue
    panelSuccessFromSide = json[SerializationKeys.panelSuccessFromSide].intValue
    sdPanelCycleAll = json[SerializationKeys.sdPanelCycleAll].floatValue
    lfmCargoCycleL1 = json[SerializationKeys.lfmCargoCycleL1].floatValue
    panelSuccessL2 = json[SerializationKeys.panelSuccessL2].intValue
    lfmCargoSuccessDefended = json[SerializationKeys.lfmCargoSuccessDefended].intValue
    percentIncap = json[SerializationKeys.percentIncap].intValue
    percentIncapEntireMatch = json[SerializationKeys.percentIncapEntireMatch].intValue
    p75panelSuccessDefended = json[SerializationKeys.p75panelSuccessDefended].intValue
    sdHabLineSuccessL2 = json[SerializationKeys.sdHabLineSuccessL2].intValue
    sdAvgTimeClimbing = json[SerializationKeys.sdAvgTimeClimbing].floatValue
    sdCargoCycleAll = json[SerializationKeys.sdCargoCycleAll].floatValue
    lfmPanelCycleAll = json[SerializationKeys.lfmPanelCycleAll].floatValue
    sdCargoSuccessUndefended = json[SerializationKeys.sdCargoSuccessUndefended].intValue
    p75cargoSuccessL3 = json[SerializationKeys.p75cargoSuccessL3].intValue
    panelSuccessL3 = json[SerializationKeys.panelSuccessL3].intValue
    lfmPanelSuccessAll = json[SerializationKeys.lfmPanelSuccessAll].intValue
    avgPanelsScored = json[SerializationKeys.avgPanelsScored].floatValue
    avgPanelsScoredL1 = json[SerializationKeys.avgPanelsScoredL1].floatValue
    avgPanelsScoredL2 = json[SerializationKeys.avgPanelsScoredL2].floatValue
    avgPanelsScoredL3 = json[SerializationKeys.avgPanelsScoredL3].floatValue
    avgPanelsScoredSandstorm = json[SerializationKeys.avgPanelsScoredSandstorm].floatValue
    avgPanelsScoredTeleL1 = json[SerializationKeys.avgPanelsScoredTeleL1].floatValue
    avgPanelsScoredTeleL2 = json[SerializationKeys.avgPanelsScoredTeleL2].floatValue
    avgPanelsScoredTeleL3 = json[SerializationKeys.avgPanelsScoredTeleL3].floatValue
    p75panelCycleAll = json[SerializationKeys.p75panelCycleAll].floatValue
    cargoSuccessL1 = json[SerializationKeys.cargoSuccessL1].intValue
    sdPanelSuccessL1 = json[SerializationKeys.sdPanelSuccessL1].intValue
    sdHabLineSuccessL1 = json[SerializationKeys.sdHabLineSuccessL1].intValue
    lfmPanelSuccessFromSide = json[SerializationKeys.lfmPanelSuccessFromSide].intValue
    sdCargoSuccessL3 = json[SerializationKeys.sdCargoSuccessL3].intValue
    sdPanelCycleL3 = json[SerializationKeys.sdPanelCycleL3].floatValue
    lfmCargoCycleL2 = json[SerializationKeys.lfmCargoCycleL2].floatValue
    hasCargoGroundIntake = json[SerializationKeys.hasCargoGroundIntake].boolValue
    sdCargoCycleL3 = json[SerializationKeys.sdCargoCycleL3].floatValue
    lfmHabLineSuccessL2 = json[SerializationKeys.lfmHabLineSuccessL2].intValue
    sdPanelCycleL1 = json[SerializationKeys.sdPanelCycleL1].floatValue
    p75panelSuccessL2 = json[SerializationKeys.p75panelSuccessL2].intValue
    sdPercentNoShow = json[SerializationKeys.sdPercentNoShow].intValue
    sdCargoCycleL1 = json[SerializationKeys.sdCargoCycleL1].floatValue
    secondPickAbility = json[SerializationKeys.secondPickAbility].floatValue
    cargoCycleL1 = json[SerializationKeys.cargoCycleL1].floatValue
    lfmPanelCycleL1 = json[SerializationKeys.lfmPanelCycleL1].floatValue
    lfmPanelSuccessL2 = json[SerializationKeys.lfmPanelSuccessL2].intValue
    sdCargoSuccessL2 = json[SerializationKeys.sdCargoSuccessL2].intValue
    p75avgPanelsScored = json[SerializationKeys.p75avgPanelsScored].floatValue
    p75cargoCycleL3 = json[SerializationKeys.p75cargoCycleL3].floatValue
    cargoAbility = json[SerializationKeys.cargoAbility].floatValue
    sdPanelCycleL2 = json[SerializationKeys.sdPanelCycleL2].floatValue
    p75avgCargoScored = json[SerializationKeys.p75avgCargoScored].floatValue
    sdAvgCargoScored = json[SerializationKeys.sdAvgCargoScored].floatValue
    lfmCargoSuccessL1 = json[SerializationKeys.lfmCargoSuccessL1].intValue
    panelLoadSuccess = json[SerializationKeys.panelLoadSuccess].intValue
    p75cargoCycleL2 = json[SerializationKeys.p75cargoCycleL2].floatValue
    panelSuccessDefended = json[SerializationKeys.panelSuccessDefended].intValue
    avgTimeClimbing = json[SerializationKeys.avgTimeClimbing].floatValue
    lfmCargoSuccessUndefended = json[SerializationKeys.lfmCargoSuccessUndefended].intValue
    p75percentNoShow = json[SerializationKeys.p75percentNoShow].intValue
    cargoSuccessUndefended = json[SerializationKeys.cargoSuccessUndefended].intValue
    lfmPanelSuccessDefended = json[SerializationKeys.lfmPanelSuccessDefended].intValue
    p75panelSuccessL1 = json[SerializationKeys.p75panelSuccessL1].intValue
    didPreloadPanel = json[SerializationKeys.didPreloadPanel].boolValue
    sdPercentIncap = json[SerializationKeys.sdPercentIncap].intValue
    sdPercentIncapEntireMatch = json[SerializationKeys.sdPercentIncapEntireMatch].intValue
    cargoSuccessDefended = json[SerializationKeys.cargoSuccessDefended].intValue
    lfmPanelCycleL2 = json[SerializationKeys.lfmPanelCycleL2].floatValue
    panelCycleAll = json[SerializationKeys.panelCycleAll].floatValue
    sdPanelSuccessL3 = json[SerializationKeys.sdPanelSuccessL3].intValue
    sdPanelSuccessDefended = json[SerializationKeys.sdPanelSuccessDefended].intValue
    lfmPanelSuccessUndefended = json[SerializationKeys.lfmPanelSuccessUndefended].intValue
    p75avgTimeClimbing = json[SerializationKeys.p75avgTimeClimbing].floatValue
    sdPanelSuccessL2 = json[SerializationKeys.sdPanelSuccessL2].intValue
    panelAbility = json[SerializationKeys.panelAbility].floatValue
    predictedSoloPoints = json[SerializationKeys.predictedSoloPoints].floatValue
    percentNoShow = json[SerializationKeys.percentNoShow].intValue
    p75panelCycleL1 = json[SerializationKeys.p75panelCycleL1].floatValue
    lfmHabLineSuccessL1 = json[SerializationKeys.lfmHabLineSuccessL1].intValue
    p75panelCycleL3 = json[SerializationKeys.p75panelCycleL3].floatValue
    lfmCargoCycleL3 = json[SerializationKeys.lfmCargoCycleL3].floatValue
    sdCargoCycleL2 = json[SerializationKeys.sdCargoCycleL2].floatValue
    sdAvgTimeIncap = json[SerializationKeys.sdAvgTimeIncap].floatValue
    p75cargoSuccessL2 = json[SerializationKeys.p75cargoSuccessL2].intValue
    lfmCargoSuccessL2 = json[SerializationKeys.lfmCargoSuccessL2].intValue
    p75panelSuccessL3 = json[SerializationKeys.p75panelSuccessL3].intValue
    lfmPercentIncap = json[SerializationKeys.lfmPercentIncap].intValue
    lfmPercentIncapEntireMatch = json[SerializationKeys.lfmPercentIncapEntireMatch].intValue
    panelSuccessAll = json[SerializationKeys.panelSuccessAll].intValue
    p75panelSuccessUndefended = json[SerializationKeys.p75panelSuccessUndefended].intValue
    lfmPanelSuccessL1 = json[SerializationKeys.lfmPanelSuccessL1].intValue
    cargoSuccessAll = json[SerializationKeys.cargoSuccessAll].intValue
    didPreloadCargo = json[SerializationKeys.didPreloadCargo].boolValue
    panelSuccessL1 = json[SerializationKeys.panelSuccessL1].intValue
    sdPanelLoadSuccess = json[SerializationKeys.sdPanelLoadSuccess].intValue
    lfmCargoCycleAll = json[SerializationKeys.lfmCargoCycleAll].floatValue
    cargoCycleAll = json[SerializationKeys.cargoCycleAll].floatValue
    lfmAvgTimeIncap = json[SerializationKeys.lfmAvgTimeIncap].floatValue
    p75cargoSuccessL1 = json[SerializationKeys.p75cargoSuccessL1].intValue
    lfmPanelSuccessL3 = json[SerializationKeys.lfmPanelSuccessL3].intValue
    lfmCargoSuccessAll = json[SerializationKeys.lfmCargoSuccessAll].intValue
    sdPanelSuccessAll = json[SerializationKeys.sdPanelSuccessAll].intValue
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
    avgPanelPointsPrevented = json[SerializationKeys.avgPanelPointsPrevented].floatValue
    avgCargoPointsPrevented = json[SerializationKeys.avgCargoPointsPrevented].floatValue
    pushAbility = json[SerializationKeys.pushAbility].floatValue

  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.hasPanelGroundIntake] = hasPanelGroundIntake
    dictionary[SerializationKeys.predictedRPs] = predictedRPs
    dictionary[SerializationKeys.percentIncap] = percentIncap
    dictionary[SerializationKeys.percentIncapEntireMatch] = percentIncapEntireMatch
    dictionary[SerializationKeys.hasCargoGroundIntake] = hasCargoGroundIntake
    dictionary[SerializationKeys.didPreloadPanel] = didPreloadPanel
    dictionary[SerializationKeys.didPreloadCargo] = didPreloadCargo
    dictionary[SerializationKeys.firstPickAbility] = firstPickAbility
    dictionary[SerializationKeys.predictedDedicatedPanelCycles] = predictedDedicatedPanelCycles
    dictionary[SerializationKeys.avgTimeIncap] = avgTimeIncap
    dictionary[SerializationKeys.sdPanelSuccessFromSide] = sdPanelSuccessFromSide
    dictionary[SerializationKeys.p75panelLoadSuccess] = p75panelLoadSuccess
    dictionary[SerializationKeys.p75percentIncap] = p75percentIncap
    dictionary[SerializationKeys.p75percentIncapEntireMatch] = p75percentIncapEntireMatch
    dictionary[SerializationKeys.cargoSuccessL3] = cargoSuccessL3
    dictionary[SerializationKeys.panelCycleL2] = panelCycleL2
    dictionary[SerializationKeys.lfmCargoSuccessL3] = lfmCargoSuccessL3
    dictionary[SerializationKeys.cargoCycleL3] = cargoCycleL3
    dictionary[SerializationKeys.p75panelCycleL2] = p75panelCycleL2
    dictionary[SerializationKeys.p75avgTimeIncap] = p75avgTimeIncap
    dictionary[SerializationKeys.p75cargoCycleL1] = p75cargoCycleL1
    dictionary[SerializationKeys.lfmPercentNoShow] = lfmPercentNoShow
    dictionary[SerializationKeys.lfmAvgCargoScored] = lfmAvgCargoScored
    dictionary[SerializationKeys.sdCargoSuccessL1] = sdCargoSuccessL1
    dictionary[SerializationKeys.lfmPanelCycleL3] = lfmPanelCycleL3
    dictionary[SerializationKeys.p75cargoSuccessUndefended] = p75cargoSuccessUndefended
    dictionary[SerializationKeys.sdAvgPanelsScored] = sdAvgPanelsScored
    dictionary[SerializationKeys.sdCargoSuccessAll] = sdCargoSuccessAll
    dictionary[SerializationKeys.p75panelSuccessAll] = p75panelSuccessAll
    dictionary[SerializationKeys.lfmAvgPanelsScored] = lfmAvgPanelsScored
    dictionary[SerializationKeys.panelCycleL1] = panelCycleL1
    dictionary[SerializationKeys.habLineSuccessL1] = habLineSuccessL1
    if let value = habLineAttemptsL1 { dictionary[SerializationKeys.habLineAttemptsL1] = value }
    if let value = habLineAttemptsL2 { dictionary[SerializationKeys.habLineAttemptsL2] = value}
    dictionary[SerializationKeys.numHabLineAttemptsL1] = numHabLineAttemptsL1
    dictionary[SerializationKeys.numHabLineAttemptsL2] = numHabLineAttemptsL2
    dictionary[SerializationKeys.sdPanelSuccessUndefended] = sdPanelSuccessUndefended
    dictionary[SerializationKeys.cargoCycleL2] = cargoCycleL2
    dictionary[SerializationKeys.p75habLineSuccessL2] = p75habLineSuccessL2
    dictionary[SerializationKeys.sdCargoSuccessDefended] = sdCargoSuccessDefended
    dictionary[SerializationKeys.p75panelSuccessFromSide] = p75panelSuccessFromSide
    dictionary[SerializationKeys.lfmAvgTimeClimbing] = lfmAvgTimeClimbing
    dictionary[SerializationKeys.p75habLineSuccessL1] = p75habLineSuccessL1
    dictionary[SerializationKeys.panelSuccessUndefended] = panelSuccessUndefended
    dictionary[SerializationKeys.cargoSuccessL2] = cargoSuccessL2
    dictionary[SerializationKeys.p75cargoSuccessAll] = p75cargoSuccessAll
    dictionary[SerializationKeys.p75cargoCycleAll] = p75cargoCycleAll
    dictionary[SerializationKeys.lfmPanelLoadSuccess] = lfmPanelLoadSuccess
    dictionary[SerializationKeys.p75cargoSuccessDefended] = p75cargoSuccessDefended
    dictionary[SerializationKeys.predictedDedicatedCargoCycles] = predictedDedicatedCargoCycles
    dictionary[SerializationKeys.predictedSeed] = predictedSeed
    dictionary[SerializationKeys.habLineSuccessL2] = habLineSuccessL2
    dictionary[SerializationKeys.panelCycleL3] = panelCycleL3
    dictionary[SerializationKeys.panelSuccessFromSide] = panelSuccessFromSide
    dictionary[SerializationKeys.sdPanelCycleAll] = sdPanelCycleAll
    dictionary[SerializationKeys.lfmCargoCycleL1] = lfmCargoCycleL1
    dictionary[SerializationKeys.panelSuccessL2] = panelSuccessL2
    dictionary[SerializationKeys.lfmCargoSuccessDefended] = lfmCargoSuccessDefended
    dictionary[SerializationKeys.p75panelSuccessDefended] = p75panelSuccessDefended
    dictionary[SerializationKeys.sdHabLineSuccessL2] = sdHabLineSuccessL2
    dictionary[SerializationKeys.sdAvgTimeClimbing] = sdAvgTimeClimbing
    dictionary[SerializationKeys.sdCargoCycleAll] = sdCargoCycleAll
    dictionary[SerializationKeys.lfmPanelCycleAll] = lfmPanelCycleAll
    dictionary[SerializationKeys.sdCargoSuccessUndefended] = sdCargoSuccessUndefended
    dictionary[SerializationKeys.p75cargoSuccessL3] = p75cargoSuccessL3
    dictionary[SerializationKeys.panelSuccessL3] = panelSuccessL3
    dictionary[SerializationKeys.lfmPanelSuccessAll] = lfmPanelSuccessAll
    dictionary[SerializationKeys.avgPanelsScored] = avgPanelsScored
    dictionary[SerializationKeys.avgPanelsScoredL1] = avgPanelsScoredL1
    dictionary[SerializationKeys.avgPanelsScoredL2] = avgPanelsScoredL2
    dictionary[SerializationKeys.avgPanelsScoredL3] = avgPanelsScoredL3
    dictionary[SerializationKeys.avgPanelsScoredSandstorm] = avgPanelsScoredSandstorm
    dictionary[SerializationKeys.avgPanelsScoredTeleL1] = avgPanelsScoredTeleL1
    dictionary[SerializationKeys.avgPanelsScoredTeleL2] = avgPanelsScoredTeleL2
    dictionary[SerializationKeys.avgPanelsScoredTeleL3] = avgPanelsScoredTeleL3
    dictionary[SerializationKeys.p75panelCycleAll] = p75panelCycleAll
    dictionary[SerializationKeys.cargoSuccessL1] = cargoSuccessL1
    dictionary[SerializationKeys.sdPanelSuccessL1] = sdPanelSuccessL1
    dictionary[SerializationKeys.sdHabLineSuccessL1] = sdHabLineSuccessL1
    dictionary[SerializationKeys.lfmPanelSuccessFromSide] = lfmPanelSuccessFromSide
    dictionary[SerializationKeys.sdCargoSuccessL3] = sdCargoSuccessL3
    dictionary[SerializationKeys.sdPanelCycleL3] = sdPanelCycleL3
    dictionary[SerializationKeys.lfmCargoCycleL2] = lfmCargoCycleL2
    dictionary[SerializationKeys.sdCargoCycleL3] = sdCargoCycleL3
    dictionary[SerializationKeys.lfmHabLineSuccessL2] = lfmHabLineSuccessL2
    dictionary[SerializationKeys.sdPanelCycleL1] = sdPanelCycleL1
    dictionary[SerializationKeys.p75panelSuccessL2] = p75panelSuccessL2
    dictionary[SerializationKeys.sdPercentNoShow] = sdPercentNoShow
    dictionary[SerializationKeys.sdCargoCycleL1] = sdCargoCycleL1
    dictionary[SerializationKeys.secondPickAbility] = secondPickAbility
    dictionary[SerializationKeys.cargoCycleL1] = cargoCycleL1
    dictionary[SerializationKeys.lfmPanelCycleL1] = lfmPanelCycleL1
    dictionary[SerializationKeys.lfmPanelSuccessL2] = lfmPanelSuccessL2
    dictionary[SerializationKeys.sdCargoSuccessL2] = sdCargoSuccessL2
    dictionary[SerializationKeys.p75avgPanelsScored] = p75avgPanelsScored
    dictionary[SerializationKeys.p75cargoCycleL3] = p75cargoCycleL3
    dictionary[SerializationKeys.cargoAbility] = cargoAbility
    dictionary[SerializationKeys.sdPanelCycleL2] = sdPanelCycleL2
    dictionary[SerializationKeys.p75avgCargoScored] = p75avgCargoScored
    dictionary[SerializationKeys.sdAvgCargoScored] = sdAvgCargoScored
    dictionary[SerializationKeys.lfmCargoSuccessL1] = lfmCargoSuccessL1
    dictionary[SerializationKeys.panelLoadSuccess] = panelLoadSuccess
    dictionary[SerializationKeys.p75cargoCycleL2] = p75cargoCycleL2
    dictionary[SerializationKeys.panelSuccessDefended] = panelSuccessDefended
    dictionary[SerializationKeys.avgTimeClimbing] = avgTimeClimbing
    dictionary[SerializationKeys.lfmCargoSuccessUndefended] = lfmCargoSuccessUndefended
    dictionary[SerializationKeys.p75percentNoShow] = p75percentNoShow
    dictionary[SerializationKeys.cargoSuccessUndefended] = cargoSuccessUndefended
    dictionary[SerializationKeys.lfmPanelSuccessDefended] = lfmPanelSuccessDefended
    dictionary[SerializationKeys.p75panelSuccessL1] = p75panelSuccessL1
    dictionary[SerializationKeys.sdPercentIncap] = sdPercentIncap
    dictionary[SerializationKeys.sdPercentIncapEntireMatch] = sdPercentIncapEntireMatch
    dictionary[SerializationKeys.cargoSuccessDefended] = cargoSuccessDefended
    dictionary[SerializationKeys.lfmPanelCycleL2] = lfmPanelCycleL2
    dictionary[SerializationKeys.panelCycleAll] = panelCycleAll
    dictionary[SerializationKeys.sdPanelSuccessL3] = sdPanelSuccessL3
    dictionary[SerializationKeys.sdPanelSuccessDefended] = sdPanelSuccessDefended
    dictionary[SerializationKeys.lfmPanelSuccessUndefended] = lfmPanelSuccessUndefended
    dictionary[SerializationKeys.p75avgTimeClimbing] = p75avgTimeClimbing
    dictionary[SerializationKeys.sdPanelSuccessL2] = sdPanelSuccessL2
    dictionary[SerializationKeys.panelAbility] = panelAbility
    dictionary[SerializationKeys.predictedSoloPoints] = predictedSoloPoints
    dictionary[SerializationKeys.percentNoShow] = percentNoShow
    dictionary[SerializationKeys.p75panelCycleL1] = p75panelCycleL1
    dictionary[SerializationKeys.lfmHabLineSuccessL1] = lfmHabLineSuccessL1
    dictionary[SerializationKeys.p75panelCycleL3] = p75panelCycleL3
    dictionary[SerializationKeys.lfmCargoCycleL3] = lfmCargoCycleL3
    dictionary[SerializationKeys.sdCargoCycleL2] = sdCargoCycleL2
    dictionary[SerializationKeys.sdAvgTimeIncap] = sdAvgTimeIncap
    dictionary[SerializationKeys.p75cargoSuccessL2] = p75cargoSuccessL2
    dictionary[SerializationKeys.lfmCargoSuccessL2] = lfmCargoSuccessL2
    dictionary[SerializationKeys.p75panelSuccessL3] = p75panelSuccessL3
    dictionary[SerializationKeys.lfmPercentIncap] = lfmPercentIncap
    dictionary[SerializationKeys.lfmPercentIncapEntireMatch] = lfmPercentIncapEntireMatch
    dictionary[SerializationKeys.panelSuccessAll] = panelSuccessAll
    dictionary[SerializationKeys.p75panelSuccessUndefended] = p75panelSuccessUndefended
    dictionary[SerializationKeys.lfmPanelSuccessL1] = lfmPanelSuccessL1
    dictionary[SerializationKeys.cargoSuccessAll] = cargoSuccessAll
    dictionary[SerializationKeys.panelSuccessL1] = panelSuccessL1
    dictionary[SerializationKeys.sdPanelLoadSuccess] = sdPanelLoadSuccess
    dictionary[SerializationKeys.lfmCargoCycleAll] = lfmCargoCycleAll
    dictionary[SerializationKeys.cargoCycleAll] = cargoCycleAll
    dictionary[SerializationKeys.lfmAvgTimeIncap] = lfmAvgTimeIncap
    dictionary[SerializationKeys.p75cargoSuccessL1] = p75cargoSuccessL1
    dictionary[SerializationKeys.lfmPanelSuccessL3] = lfmPanelSuccessL3
    dictionary[SerializationKeys.lfmCargoSuccessAll] = lfmCargoSuccessAll
    dictionary[SerializationKeys.sdPanelSuccessAll] = sdPanelSuccessAll
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
    dictionary[SerializationKeys.avgPanelPointsPrevented] = avgPanelPointsPrevented
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
    self.predictedDedicatedPanelCycles = aDecoder.decodeFloat(forKey: SerializationKeys.predictedDedicatedPanelCycles)
    self.avgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeIncap)
    self.hasPanelGroundIntake = aDecoder.decodeBool(forKey: SerializationKeys.hasPanelGroundIntake)
    self.sdPanelSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelSuccessFromSide)
    self.p75panelLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelLoadSuccess)
    self.p75percentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentIncap)
    self.p75percentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentIncapEntireMatch)
    self.cargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessL3)
    self.panelCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.panelCycleL2)
    self.lfmCargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessL3)
    self.cargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleL3)
    self.predictedRPs = aDecoder.decodeFloat(forKey: SerializationKeys.predictedRPs)
    self.p75panelCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.p75panelCycleL2)
    self.p75avgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgTimeIncap)
    self.p75cargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleL1)
    self.lfmPercentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentNoShow)
    self.lfmAvgCargoScored = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgCargoScored)
    self.sdCargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessL1)
    self.lfmPanelCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmPanelCycleL3)
    self.p75cargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessUndefended)
    self.sdAvgPanelsScored = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgPanelsScored)
    self.sdCargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessAll)
    self.p75panelSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelSuccessAll)
    self.lfmAvgPanelsScored = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgPanelsScored)
    self.panelCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.panelCycleL1)
    self.habLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.habLineSuccessL1)
    self.habLineAttemptsL1 = aDecoder.decodeObject(forKey: SerializationKeys.habLineAttemptsL1) as? String
    self.habLineAttemptsL2 = aDecoder.decodeObject(forKey: SerializationKeys.habLineAttemptsL2) as? String
    self.numHabLineAttemptsL1 = aDecoder.decodeInteger(forKey: SerializationKeys.numHabLineAttemptsL1)
    self.numHabLineAttemptsL2 = aDecoder.decodeInteger(forKey: SerializationKeys.numHabLineAttemptsL2)
    self.sdPanelSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelSuccessUndefended)
    self.cargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleL2)
    self.p75habLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75habLineSuccessL2)
    self.sdCargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessDefended)
    self.p75panelSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelSuccessFromSide)
    self.lfmAvgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgTimeClimbing)
    self.p75habLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75habLineSuccessL1)
    self.panelSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.panelSuccessUndefended)
    self.cargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessL2)
    self.p75cargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessAll)
    self.p75cargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleAll)
    self.lfmPanelLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelLoadSuccess)
    self.p75cargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessDefended)
    self.predictedDedicatedCargoCycles = aDecoder.decodeFloat(forKey: SerializationKeys.predictedDedicatedCargoCycles)
    self.predictedSeed = aDecoder.decodeInteger(forKey: SerializationKeys.predictedSeed)
    self.habLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.habLineSuccessL2)
    self.panelCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.panelCycleL3)
    self.panelSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.panelSuccessFromSide)
    self.sdPanelCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.sdPanelCycleAll)
    self.lfmCargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleL1)
    self.panelSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.panelSuccessL2)
    self.lfmCargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessDefended)
    self.percentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.percentIncap)
    self.percentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.percentIncapEntireMatch)
    self.p75panelSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelSuccessDefended)
    self.sdHabLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdHabLineSuccessL2)
    self.sdAvgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgTimeClimbing)
    self.sdCargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleAll)
    self.lfmPanelCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.lfmPanelCycleAll)
    self.sdCargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessUndefended)
    self.p75cargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessL3)
    self.panelSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.panelSuccessL3)
    self.lfmPanelSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelSuccessAll)
    self.avgPanelsScored = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScored)
    self.avgPanelsScoredL1 = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScoredL1)
    self.avgPanelsScoredL2 = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScoredL2)
    self.avgPanelsScoredL3 = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScoredL3)
    self.avgPanelsScoredSandstorm = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScoredSandstorm)
    self.avgPanelsScoredTeleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScoredTeleL1)
    self.avgPanelsScoredTeleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScoredTeleL2)
    self.avgPanelsScoredTeleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelsScoredTeleL3)
    self.p75panelCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.p75panelCycleAll)
    self.cargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessL1)
    self.sdPanelSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelSuccessL1)
    self.sdHabLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdHabLineSuccessL1)
    self.lfmPanelSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelSuccessFromSide)
    self.sdCargoSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessL3)
    self.sdPanelCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.sdPanelCycleL3)
    self.lfmCargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleL2)
    self.hasCargoGroundIntake = aDecoder.decodeBool(forKey: SerializationKeys.hasCargoGroundIntake)
    self.sdCargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleL3)
    self.lfmHabLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmHabLineSuccessL2)
    self.sdPanelCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.sdPanelCycleL1)
    self.p75panelSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelSuccessL2)
    self.sdPercentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentNoShow)
    self.sdCargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleL1)
    self.secondPickAbility = aDecoder.decodeFloat(forKey: SerializationKeys.secondPickAbility)
    self.cargoCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleL1)
    self.lfmPanelCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmPanelCycleL1)
    self.lfmPanelSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelSuccessL2)
    self.sdCargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdCargoSuccessL2)
    self.p75avgPanelsScored = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgPanelsScored)
    self.p75cargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleL3)
    self.cargoAbility = aDecoder.decodeFloat(forKey: SerializationKeys.cargoAbility)
    self.sdPanelCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.sdPanelCycleL2)
    self.p75avgCargoScored = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgCargoScored)
    self.sdAvgCargoScored = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgCargoScored)
    self.lfmCargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessL1)
    self.panelLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.panelLoadSuccess)
    self.p75cargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.p75cargoCycleL2)
    self.panelSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.panelSuccessDefended)
    self.avgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeClimbing)
    self.lfmCargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessUndefended)
    self.p75percentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentNoShow)
    self.cargoSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessUndefended)
    self.lfmPanelSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelSuccessDefended)
    self.p75panelSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelSuccessL1)
    self.didPreloadPanel = aDecoder.decodeBool(forKey: SerializationKeys.didPreloadPanel)
    self.sdPercentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentIncap)
    self.sdPercentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentIncapEntireMatch)
    self.cargoSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessDefended)
    self.lfmPanelCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmPanelCycleL2)
    self.panelCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.panelCycleAll)
    self.sdPanelSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelSuccessL3)
    self.sdPanelSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelSuccessDefended)
    self.lfmPanelSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelSuccessUndefended)
    self.p75avgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgTimeClimbing)
    self.sdPanelSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelSuccessL2)
    self.panelAbility = aDecoder.decodeFloat(forKey: SerializationKeys.panelAbility)
    self.predictedSoloPoints = aDecoder.decodeFloat(forKey: SerializationKeys.predictedSoloPoints)
    self.percentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.percentNoShow)
    self.p75panelCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.p75panelCycleL1)
    self.lfmHabLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmHabLineSuccessL1)
    self.p75panelCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.p75panelCycleL3)
    self.lfmCargoCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleL3)
    self.sdCargoCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.sdCargoCycleL2)
    self.sdAvgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgTimeIncap)
    self.p75cargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessL2)
    self.lfmCargoSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessL2)
    self.p75panelSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelSuccessL3)
    self.lfmPercentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentIncap)
    self.lfmPercentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentIncapEntireMatch)
    self.panelSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.panelSuccessAll)
    self.p75panelSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75panelSuccessUndefended)
    self.lfmPanelSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelSuccessL1)
    self.cargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.cargoSuccessAll)
    self.didPreloadCargo = aDecoder.decodeBool(forKey: SerializationKeys.didPreloadCargo)
    self.panelSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.panelSuccessL1)
    self.sdPanelLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelLoadSuccess)
    self.lfmCargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.lfmCargoCycleAll)
    self.cargoCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.cargoCycleAll)
    self.lfmAvgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgTimeIncap)
    self.p75cargoSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75cargoSuccessL1)
    self.lfmPanelSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPanelSuccessL3)
    self.lfmCargoSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lfmCargoSuccessAll)
    self.sdPanelSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.sdPanelSuccessAll)
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
    self.avgPanelPointsPrevented = aDecoder.decodeFloat(forKey: SerializationKeys.avgPanelPointsPrevented)
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
    aCoder.encode(predictedDedicatedPanelCycles, forKey: SerializationKeys.predictedDedicatedPanelCycles)
    aCoder.encode(avgTimeIncap, forKey: SerializationKeys.avgTimeIncap)
    aCoder.encode(hasPanelGroundIntake, forKey: SerializationKeys.hasPanelGroundIntake)
    aCoder.encode(sdPanelSuccessFromSide, forKey: SerializationKeys.sdPanelSuccessFromSide)
    aCoder.encode(p75panelLoadSuccess, forKey: SerializationKeys.p75panelLoadSuccess)
    aCoder.encode(p75percentIncap, forKey: SerializationKeys.p75percentIncap)
    aCoder.encode(p75percentIncapEntireMatch, forKey: SerializationKeys.p75percentIncapEntireMatch)
    aCoder.encode(cargoSuccessL3, forKey: SerializationKeys.cargoSuccessL3)
    aCoder.encode(panelCycleL2, forKey: SerializationKeys.panelCycleL2)
    aCoder.encode(lfmCargoSuccessL3, forKey: SerializationKeys.lfmCargoSuccessL3)
    aCoder.encode(cargoCycleL3, forKey: SerializationKeys.cargoCycleL3)
    aCoder.encode(predictedRPs, forKey: SerializationKeys.predictedRPs)
    aCoder.encode(p75panelCycleL2, forKey: SerializationKeys.p75panelCycleL2)
    aCoder.encode(p75avgTimeIncap, forKey: SerializationKeys.p75avgTimeIncap)
    aCoder.encode(p75cargoCycleL1, forKey: SerializationKeys.p75cargoCycleL1)
    aCoder.encode(lfmPercentNoShow, forKey: SerializationKeys.lfmPercentNoShow)
    aCoder.encode(lfmAvgCargoScored, forKey: SerializationKeys.lfmAvgCargoScored)
    aCoder.encode(sdCargoSuccessL1, forKey: SerializationKeys.sdCargoSuccessL1)
    aCoder.encode(lfmPanelCycleL3, forKey: SerializationKeys.lfmPanelCycleL3)
    aCoder.encode(p75cargoSuccessUndefended, forKey: SerializationKeys.p75cargoSuccessUndefended)
    aCoder.encode(sdAvgPanelsScored, forKey: SerializationKeys.sdAvgPanelsScored)
    aCoder.encode(sdCargoSuccessAll, forKey: SerializationKeys.sdCargoSuccessAll)
    aCoder.encode(p75panelSuccessAll, forKey: SerializationKeys.p75panelSuccessAll)
    aCoder.encode(lfmAvgPanelsScored, forKey: SerializationKeys.lfmAvgPanelsScored)
    aCoder.encode(panelCycleL1, forKey: SerializationKeys.panelCycleL1)
    aCoder.encode(habLineSuccessL1, forKey: SerializationKeys.habLineSuccessL1)
    aCoder.encode(habLineAttemptsL1, forKey: SerializationKeys.habLineAttemptsL1)
    aCoder.encode(habLineAttemptsL2, forKey: SerializationKeys.habLineAttemptsL2)
    aCoder.encode(numHabLineAttemptsL1, forKey: SerializationKeys.numHabLineAttemptsL1)
    aCoder.encode(numHabLineAttemptsL2, forKey: SerializationKeys.numHabLineAttemptsL2)
    aCoder.encode(sdPanelSuccessUndefended, forKey: SerializationKeys.sdPanelSuccessUndefended)
    aCoder.encode(cargoCycleL2, forKey: SerializationKeys.cargoCycleL2)
    aCoder.encode(p75habLineSuccessL2, forKey: SerializationKeys.p75habLineSuccessL2)
    aCoder.encode(sdCargoSuccessDefended, forKey: SerializationKeys.sdCargoSuccessDefended)
    aCoder.encode(p75panelSuccessFromSide, forKey: SerializationKeys.p75panelSuccessFromSide)
    aCoder.encode(lfmAvgTimeClimbing, forKey: SerializationKeys.lfmAvgTimeClimbing)
    aCoder.encode(p75habLineSuccessL1, forKey: SerializationKeys.p75habLineSuccessL1)
    aCoder.encode(panelSuccessUndefended, forKey: SerializationKeys.panelSuccessUndefended)
    aCoder.encode(cargoSuccessL2, forKey: SerializationKeys.cargoSuccessL2)
    aCoder.encode(p75cargoSuccessAll, forKey: SerializationKeys.p75cargoSuccessAll)
    aCoder.encode(p75cargoCycleAll, forKey: SerializationKeys.p75cargoCycleAll)
    aCoder.encode(lfmPanelLoadSuccess, forKey: SerializationKeys.lfmPanelLoadSuccess)
    aCoder.encode(p75cargoSuccessDefended, forKey: SerializationKeys.p75cargoSuccessDefended)
    aCoder.encode(predictedDedicatedCargoCycles, forKey: SerializationKeys.predictedDedicatedCargoCycles)
    aCoder.encode(predictedSeed, forKey: SerializationKeys.predictedSeed)
    aCoder.encode(habLineSuccessL2, forKey: SerializationKeys.habLineSuccessL2)
    aCoder.encode(panelCycleL3, forKey: SerializationKeys.panelCycleL3)
    aCoder.encode(panelSuccessFromSide, forKey: SerializationKeys.panelSuccessFromSide)
    aCoder.encode(sdPanelCycleAll, forKey: SerializationKeys.sdPanelCycleAll)
    aCoder.encode(lfmCargoCycleL1, forKey: SerializationKeys.lfmCargoCycleL1)
    aCoder.encode(panelSuccessL2, forKey: SerializationKeys.panelSuccessL2)
    aCoder.encode(lfmCargoSuccessDefended, forKey: SerializationKeys.lfmCargoSuccessDefended)
    aCoder.encode(percentIncap, forKey: SerializationKeys.percentIncap)
    aCoder.encode(percentIncapEntireMatch, forKey: SerializationKeys.percentIncapEntireMatch)
    aCoder.encode(p75panelSuccessDefended, forKey: SerializationKeys.p75panelSuccessDefended)
    aCoder.encode(sdHabLineSuccessL2, forKey: SerializationKeys.sdHabLineSuccessL2)
    aCoder.encode(sdAvgTimeClimbing, forKey: SerializationKeys.sdAvgTimeClimbing)
    aCoder.encode(sdCargoCycleAll, forKey: SerializationKeys.sdCargoCycleAll)
    aCoder.encode(lfmPanelCycleAll, forKey: SerializationKeys.lfmPanelCycleAll)
    aCoder.encode(sdCargoSuccessUndefended, forKey: SerializationKeys.sdCargoSuccessUndefended)
    aCoder.encode(p75cargoSuccessL3, forKey: SerializationKeys.p75cargoSuccessL3)
    aCoder.encode(panelSuccessL3, forKey: SerializationKeys.panelSuccessL3)
    aCoder.encode(lfmPanelSuccessAll, forKey: SerializationKeys.lfmPanelSuccessAll)
    aCoder.encode(avgPanelsScored, forKey: SerializationKeys.avgPanelsScored)
    aCoder.encode(avgPanelsScoredL1, forKey: SerializationKeys.avgPanelsScoredL1)
    aCoder.encode(avgPanelsScoredL2, forKey: SerializationKeys.avgPanelsScoredL2)
    aCoder.encode(avgPanelsScoredL3, forKey: SerializationKeys.avgPanelsScoredL3)
    aCoder.encode(avgPanelsScoredSandstorm, forKey: SerializationKeys.avgPanelsScoredSandstorm)
    aCoder.encode(avgPanelsScoredTeleL1, forKey: SerializationKeys.avgPanelsScoredTeleL1)
    aCoder.encode(avgPanelsScoredTeleL2, forKey: SerializationKeys.avgPanelsScoredTeleL2)
    aCoder.encode(avgPanelsScoredTeleL3, forKey: SerializationKeys.avgPanelsScoredTeleL3)
    aCoder.encode(p75panelCycleAll, forKey: SerializationKeys.p75panelCycleAll)
    aCoder.encode(cargoSuccessL1, forKey: SerializationKeys.cargoSuccessL1)
    aCoder.encode(sdPanelSuccessL1, forKey: SerializationKeys.sdPanelSuccessL1)
    aCoder.encode(sdHabLineSuccessL1, forKey: SerializationKeys.sdHabLineSuccessL1)
    aCoder.encode(lfmPanelSuccessFromSide, forKey: SerializationKeys.lfmPanelSuccessFromSide)
    aCoder.encode(sdCargoSuccessL3, forKey: SerializationKeys.sdCargoSuccessL3)
    aCoder.encode(sdPanelCycleL3, forKey: SerializationKeys.sdPanelCycleL3)
    aCoder.encode(lfmCargoCycleL2, forKey: SerializationKeys.lfmCargoCycleL2)
    aCoder.encode(hasCargoGroundIntake, forKey: SerializationKeys.hasCargoGroundIntake)
    aCoder.encode(sdCargoCycleL3, forKey: SerializationKeys.sdCargoCycleL3)
    aCoder.encode(lfmHabLineSuccessL2, forKey: SerializationKeys.lfmHabLineSuccessL2)
    aCoder.encode(sdPanelCycleL1, forKey: SerializationKeys.sdPanelCycleL1)
    aCoder.encode(p75panelSuccessL2, forKey: SerializationKeys.p75panelSuccessL2)
    aCoder.encode(sdPercentNoShow, forKey: SerializationKeys.sdPercentNoShow)
    aCoder.encode(sdCargoCycleL1, forKey: SerializationKeys.sdCargoCycleL1)
    aCoder.encode(secondPickAbility, forKey: SerializationKeys.secondPickAbility)
    aCoder.encode(cargoCycleL1, forKey: SerializationKeys.cargoCycleL1)
    aCoder.encode(lfmPanelCycleL1, forKey: SerializationKeys.lfmPanelCycleL1)
    aCoder.encode(lfmPanelSuccessL2, forKey: SerializationKeys.lfmPanelSuccessL2)
    aCoder.encode(sdCargoSuccessL2, forKey: SerializationKeys.sdCargoSuccessL2)
    aCoder.encode(p75avgPanelsScored, forKey: SerializationKeys.p75avgPanelsScored)
    aCoder.encode(p75cargoCycleL3, forKey: SerializationKeys.p75cargoCycleL3)
    aCoder.encode(cargoAbility, forKey: SerializationKeys.cargoAbility)
    aCoder.encode(sdPanelCycleL2, forKey: SerializationKeys.sdPanelCycleL2)
    aCoder.encode(p75avgCargoScored, forKey: SerializationKeys.p75avgCargoScored)
    aCoder.encode(sdAvgCargoScored, forKey: SerializationKeys.sdAvgCargoScored)
    aCoder.encode(lfmCargoSuccessL1, forKey: SerializationKeys.lfmCargoSuccessL1)
    aCoder.encode(panelLoadSuccess, forKey: SerializationKeys.panelLoadSuccess)
    aCoder.encode(p75cargoCycleL2, forKey: SerializationKeys.p75cargoCycleL2)
    aCoder.encode(panelSuccessDefended, forKey: SerializationKeys.panelSuccessDefended)
    aCoder.encode(avgTimeClimbing, forKey: SerializationKeys.avgTimeClimbing)
    aCoder.encode(lfmCargoSuccessUndefended, forKey: SerializationKeys.lfmCargoSuccessUndefended)
    aCoder.encode(p75percentNoShow, forKey: SerializationKeys.p75percentNoShow)
    aCoder.encode(cargoSuccessUndefended, forKey: SerializationKeys.cargoSuccessUndefended)
    aCoder.encode(lfmPanelSuccessDefended, forKey: SerializationKeys.lfmPanelSuccessDefended)
    aCoder.encode(p75panelSuccessL1, forKey: SerializationKeys.p75panelSuccessL1)
    aCoder.encode(didPreloadPanel, forKey: SerializationKeys.didPreloadPanel)
    aCoder.encode(sdPercentIncap, forKey: SerializationKeys.sdPercentIncap)
    aCoder.encode(sdPercentIncapEntireMatch, forKey: SerializationKeys.sdPercentIncapEntireMatch)
    aCoder.encode(cargoSuccessDefended, forKey: SerializationKeys.cargoSuccessDefended)
    aCoder.encode(lfmPanelCycleL2, forKey: SerializationKeys.lfmPanelCycleL2)
    aCoder.encode(panelCycleAll, forKey: SerializationKeys.panelCycleAll)
    aCoder.encode(sdPanelSuccessL3, forKey: SerializationKeys.sdPanelSuccessL3)
    aCoder.encode(sdPanelSuccessDefended, forKey: SerializationKeys.sdPanelSuccessDefended)
    aCoder.encode(lfmPanelSuccessUndefended, forKey: SerializationKeys.lfmPanelSuccessUndefended)
    aCoder.encode(p75avgTimeClimbing, forKey: SerializationKeys.p75avgTimeClimbing)
    aCoder.encode(sdPanelSuccessL2, forKey: SerializationKeys.sdPanelSuccessL2)
    aCoder.encode(panelAbility, forKey: SerializationKeys.panelAbility)
    aCoder.encode(predictedSoloPoints, forKey: SerializationKeys.predictedSoloPoints)
    aCoder.encode(percentNoShow, forKey: SerializationKeys.percentNoShow)
    aCoder.encode(p75panelCycleL1, forKey: SerializationKeys.p75panelCycleL1)
    aCoder.encode(lfmHabLineSuccessL1, forKey: SerializationKeys.lfmHabLineSuccessL1)
    aCoder.encode(p75panelCycleL3, forKey: SerializationKeys.p75panelCycleL3)
    aCoder.encode(lfmCargoCycleL3, forKey: SerializationKeys.lfmCargoCycleL3)
    aCoder.encode(sdCargoCycleL2, forKey: SerializationKeys.sdCargoCycleL2)
    aCoder.encode(sdAvgTimeIncap, forKey: SerializationKeys.sdAvgTimeIncap)
    aCoder.encode(p75cargoSuccessL2, forKey: SerializationKeys.p75cargoSuccessL2)
    aCoder.encode(lfmCargoSuccessL2, forKey: SerializationKeys.lfmCargoSuccessL2)
    aCoder.encode(p75panelSuccessL3, forKey: SerializationKeys.p75panelSuccessL3)
    aCoder.encode(lfmPercentIncap, forKey: SerializationKeys.lfmPercentIncap)
    aCoder.encode(lfmPercentIncapEntireMatch, forKey: SerializationKeys.lfmPercentIncapEntireMatch)
    aCoder.encode(panelSuccessAll, forKey: SerializationKeys.panelSuccessAll)
    aCoder.encode(p75panelSuccessUndefended, forKey: SerializationKeys.p75panelSuccessUndefended)
    aCoder.encode(lfmPanelSuccessL1, forKey: SerializationKeys.lfmPanelSuccessL1)
    aCoder.encode(cargoSuccessAll, forKey: SerializationKeys.cargoSuccessAll)
    aCoder.encode(didPreloadCargo, forKey: SerializationKeys.didPreloadCargo)
    aCoder.encode(panelSuccessL1, forKey: SerializationKeys.panelSuccessL1)
    aCoder.encode(sdPanelLoadSuccess, forKey: SerializationKeys.sdPanelLoadSuccess)
    aCoder.encode(lfmCargoCycleAll, forKey: SerializationKeys.lfmCargoCycleAll)
    aCoder.encode(cargoCycleAll, forKey: SerializationKeys.cargoCycleAll)
    aCoder.encode(lfmAvgTimeIncap, forKey: SerializationKeys.lfmAvgTimeIncap)
    aCoder.encode(p75cargoSuccessL1, forKey: SerializationKeys.p75cargoSuccessL1)
    aCoder.encode(lfmPanelSuccessL3, forKey: SerializationKeys.lfmPanelSuccessL3)
    aCoder.encode(lfmCargoSuccessAll, forKey: SerializationKeys.lfmCargoSuccessAll)
    aCoder.encode(sdPanelSuccessAll, forKey: SerializationKeys.sdPanelSuccessAll)
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
    aCoder.encode(avgPanelPointsPrevented, forKey: SerializationKeys.avgPanelPointsPrevented)
    aCoder.encode(avgCargoPointsPrevented, forKey: SerializationKeys.avgCargoPointsPrevented)
    aCoder.encode(pushAbility, forKey: SerializationKeys.pushAbility)

  }

}
