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
    static let avgOrangesScored = "avgOrangesScored"
    static let predictedDedicatedLemonCycles = "predictedDedicatedLemonCycles"
    static let avgTimeIncap = "avgTimeIncap"
    static let hasLemonGroundIntake = "hasLemonGroundIntake"
    static let sdLemonSuccessFromSide = "sdLemonSuccessFromSide"
    static let percentImpaired = "percentImpaired"
    static let p75lemonLoadSuccess = "p75lemonLoadSuccess"
    static let p75percentIncap = "p75percentIncap"
    static let p75percentIncapEntireMatch = "p75PercentIncapEntireMatch"
    static let orangeSuccessL3 = "orangeSuccessL3"
    static let lemonCycleL2 = "lemonCycleL2"
    static let p75avgTimeImpaired = "p75avgTimeImpaired"
    static let sdAvgTimeImpaired = "sdAvgTimeImpaired"
    static let lfmOrangeSuccessL3 = "lfmOrangeSuccessL3"
    static let orangeCycleL3 = "orangeCycleL3"
    static let predictedRPs = "predictedRPs"
    static let p75lemonCycleL2 = "p75lemonCycleL2"
    static let p75avgTimeIncap = "p75avgTimeIncap"
    static let p75orangeCycleL1 = "p75orangeCycleL1"
    static let lfmPercentNoShow = "lfmPercentNoShow"
    static let lfmAvgOrangesScored = "lfmAvgOrangesScored"
    static let lfmPercentImpaired = "lfmPercentImpaired"
    static let sdOrangeSuccessL1 = "sdOrangeSuccessL1"
    static let lfmLemonCycleL3 = "lfmLemonCycleL3"
    static let p75orangeSuccessUndefended = "p75orangeSuccessUndefended"
    static let sdAvgLemonsScored = "sdAvgLemonsScored"
    static let sdOrangeSuccessAll = "sdOrangeSuccessAll"
    static let p75lemonSuccessAll = "p75lemonSuccessAll"
    static let lfmAvgLemonsScored = "lfmAvgLemonsScored"
    static let lemonCycleL1 = "lemonCycleL1"
    static let habLineSuccessL1 = "habLineSuccessL1"
    static let sdLemonSuccessUndefended = "sdLemonSuccessUndefended"
    static let orangeCycleL2 = "orangeCycleL2"
    static let p75habLineSuccessL2 = "p75habLineSuccessL2"
    static let sdOrangeSuccessDefended = "sdOrangeSuccessDefended"
    static let p75lemonSuccessFromSide = "p75lemonSuccessFromSide"
    static let lfmAvgTimeClimbing = "lfmAvgTimeClimbing"
    static let p75habLineSuccessL1 = "p75habLineSuccessL1"
    static let lemonSuccessUndefended = "lemonSuccessUndefended"
    static let orangeSuccessL2 = "orangeSuccessL2"
    static let p75orangeSuccessAll = "p75orangeSuccessAll"
    static let p75orangeCycleAll = "p75orangeCycleAll"
    static let lfmLemonLoadSuccess = "lfmLemonLoadSuccess"
    static let actualSeed = "actualSeed"
    static let p75orangeSuccessDefended = "p75orangeSuccessDefended"
    static let predictedDedicatedOrangeCycles = "predictedDedicatedOrangeCycles"
    static let predictedSeed = "predictedSeed"
    static let habLineSuccessL2 = "habLineSuccessL2"
    static let lemonCycleL3 = "lemonCycleL3"
    static let lemonSuccessFromSide = "lemonSuccessFromSide"
    static let sdLemonCycleAll = "sdLemonCycleAll"
    static let lfmOrangeCycleL1 = "lfmOrangeCycleL1"
    static let lemonSuccessL2 = "lemonSuccessL2"
    static let lfmOrangeSuccessDefended = "lfmOrangeSuccessDefended"
    static let percentIncap = "percentIncap"
    static let percentIncapEntireMatch = "percentIncapEntireMatch"
    static let p75lemonSuccessDefended = "p75lemonSuccessDefended"
    static let sdHabLineSuccessL2 = "sdHabLineSuccessL2"
    static let sdAvgTimeClimbing = "sdAvgTimeClimbing"
    static let sdOrangeCycleAll = "sdOrangeCycleAll"
    static let lfmLemonCycleAll = "lfmLemonCycleAll"
    static let sdOrangeSuccessUndefended = "sdOrangeSuccessUndefended"
    static let p75orangeSuccessL3 = "p75orangeSuccessL3"
    static let lemonSuccessL3 = "lemonSuccessL3"
    static let lfmLemonSuccessAll = "lfmLemonSuccessAll"
    static let avgLemonsScored = "avgLemonsScored"
    static let p75lemonCycleAll = "p75lemonCycleAll"
    static let orangeSuccessL1 = "orangeSuccessL1"
    static let sdLemonSuccessL1 = "sdLemonSuccessL1"
    static let sdHabLineSuccessL1 = "sdHabLineSuccessL1"
    static let lfmLemonSuccessFromSide = "lfmLemonSuccessFromSide"
    static let lfmAvgGoodDecisions = "lfmAvgGoodDecisions"
    static let sdOrangeSuccessL3 = "sdOrangeSuccessL3"
    static let sdLemonCycleL3 = "sdLemonCycleL3"
    static let lfmOrangeCycleL2 = "lfmOrangeCycleL2"
    static let hasOrangeGroundIntake = "hasOrangeGroundIntake"
    static let sdOrangeCycleL3 = "sdOrangeCycleL3"
    static let lfmHabLineSuccessL2 = "lfmHabLineSuccessL2"
    static let sdLemonCycleL1 = "sdLemonCycleL1"
    static let p75lemonSuccessL2 = "p75lemonSuccessL2"
    static let sdAvgGoodDecisions = "sdAvgGoodDecisions"
    static let sdPercentImpaired = "sdPercentImpaired"
    static let sdPercentNoShow = "sdPercentNoShow"
    static let sdOrangeCycleL1 = "sdOrangeCycleL1"
    static let avgGoodDecisions = "avgGoodDecisions"
    static let secondPickAbility = "secondPickAbility"
    static let orangeCycleL1 = "orangeCycleL1"
    static let lfmLemonCycleL1 = "lfmLemonCycleL1"
    static let lfmLemonSuccessL2 = "lfmLemonSuccessL2"
    static let sdOrangeSuccessL2 = "sdOrangeSuccessL2"
    static let sdAvgBadDecisions = "sdAvgBadDecisions"
    static let p75avgLemonsScored = "p75avgLemonsScored"
    static let avgBadDecisions = "avgBadDecisions"
    static let p75orangeCycleL3 = "p75orangeCycleL3"
    static let lfmAvgBadDecisions = "lfmAvgBadDecisions"
    static let orangeAbility = "orangeAbility"
    static let sdLemonCycleL2 = "sdLemonCycleL2"
    static let p75avgOrangesScored = "p75avgOrangesScored"
    static let sdAvgOrangesScored = "sdAvgOrangesScored"
    static let lfmOrangeSuccessL1 = "lfmOrangeSuccessL1"
    static let lemonLoadSuccess = "lemonLoadSuccess"
    static let p75orangeCycleL2 = "p75orangeCycleL2"
    static let lemonSuccessDefended = "lemonSuccessDefended"
    static let avgTimeClimbing = "avgTimeClimbing"
    static let lfmOrangeSuccessUndefended = "lfmOrangeSuccessUndefended"
    static let p75percentNoShow = "p75percentNoShow"
    static let orangeSuccessUndefended = "orangeSuccessUndefended"
    static let lfmLemonSuccessDefended = "lfmLemonSuccessDefended"
    static let p75lemonSuccessL1 = "p75lemonSuccessL1"
    static let lfmAvgTimeImpaired = "lfmAvgTimeImpaired"
    static let didPreloadLemon = "didPreloadLemon"
    static let sdPercentIncap = "sdPercentIncap"
    static let sdPercentIncapEntireMatch = "sdPercentIncapEntireMatch"
    static let orangeSuccessDefended = "orangeSuccessDefended"
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
    static let avgTimeImpaired = "avgTimeImpaired"
    static let p75lemonCycleL1 = "p75lemonCycleL1"
    static let lfmHabLineSuccessL1 = "lfmHabLineSuccessL1"
    static let p75lemonCycleL3 = "p75lemonCycleL3"
    static let lfmOrangeCycleL3 = "lfmOrangeCycleL3"
    static let sdOrangeCycleL2 = "sdOrangeCycleL2"
    static let sdAvgTimeIncap = "sdAvgTimeIncap"
    static let p75orangeSuccessL2 = "p75orangeSuccessL2"
    static let lfmOrangeSuccessL2 = "lfmOrangeSuccessL2"
    static let p75lemonSuccessL3 = "p75lemonSuccessL3"
    static let p75percentImpaired = "p75percentImpaired"
    static let p75avgBadDecisions = "p75avgBadDecisions"
    static let lfmPercentIncap = "lfmPercentIncap"
    static let lfmPercentIncapEntireMatch = "lfmPercentIncapEntireMatch"
    static let lemonSuccessAll = "lemonSuccessAll"
    static let p75lemonSuccessUndefended = "p75lemonSuccessUndefended"
    static let lfmLemonSuccessL1 = "lfmLemonSuccessL1"
    static let orangeSuccessAll = "orangeSuccessAll"
    static let didPreloadOrange = "didPreloadOrange"
    static let lemonSuccessL1 = "lemonSuccessL1"
    static let sdLemonLoadSuccess = "sdLemonLoadSuccess"
    static let lfmOrangeCycleAll = "lfmOrangeCycleAll"
    static let orangeCycleAll = "orangeCycleAll"
    static let lfmAvgTimeIncap = "lfmAvgTimeIncap"
    static let p75orangeSuccessL1 = "p75orangeSuccessL1"
    static let lfmLemonSuccessL3 = "lfmLemonSuccessL3"
    static let lfmOrangeSuccessAll = "lfmOrangeSuccessAll"
    static let sdLemonSuccessAll = "sdLemonSuccessAll"
    static let p75avgGoodDecisions = "p75avgGoodDecisions"
    static let firstPickAbility = "firstPickAbility"
    static let avgOrangesSpilled = "avgOrangesSpilled"
    static let p75avgOrangesSpilled = "p75avgOrangesSpilled"
    static let lfmAvgOrangesSpilled = "lfmAvgOrangesSpilled"
    static let sdAvgOrangesSpilled = "sdAvgOrangesSpilled"
    static let avgLemonsSpilled = "avgLemonsSpilled"
    static let p75avgLemonsSpilled = "p75avgLemonsSpilled"
    static let lfmAvgLemonsSpilled = "lfmAvgLemonsSpilled"
    static let sdAvgLemonsSpilled = "sdAvgLemonsSpilled"
  }

  // MARK: Properties
  @objc public var avgOrangesScored: Float = -1.0
  @objc public var predictedDedicatedLemonCycles: Float = -1.0
  @objc public var avgTimeIncap: Float = -1.0
  @objc public var hasLemonGroundIntake: Bool = false
  @objc public var sdLemonSuccessFromSide: Int = -1
  @objc public var percentImpaired: Int = -1
  @objc public var p75lemonLoadSuccess: Int = -1
  @objc public var p75percentIncap: Int = -1
  @objc public var p75percentIncapEntireMatch: Int = -1
  @objc public var orangeSuccessL3: Int = -1
  @objc public var lemonCycleL2: Float = -1.0
  @objc public var p75avgTimeImpaired: Float = -1.0
  @objc public var sdAvgTimeImpaired: Float = -1.0
  @objc public var lfmOrangeSuccessL3: Int = -1
  @objc public var orangeCycleL3: Float = -1.0
  @objc public var predictedRPs: Float = -1.0
  @objc public var p75lemonCycleL2: Float = -1.0
  @objc public var p75avgTimeIncap: Float = -1.0
  @objc public var p75orangeCycleL1: Float = -1.0
  @objc public var lfmPercentNoShow: Int = -1
  @objc public var lfmAvgOrangesScored: Float = -1.0
  @objc public var lfmPercentImpaired: Int = -1
  @objc public var sdOrangeSuccessL1: Int = -1
  @objc public var lfmLemonCycleL3: Float = -1.0
  @objc public var p75orangeSuccessUndefended: Int = -1
  @objc public var sdAvgLemonsScored: Float = -1.0
  @objc public var sdOrangeSuccessAll: Int = -1
  @objc public var p75lemonSuccessAll: Int = -1
  @objc public var lfmAvgLemonsScored: Float = -1.0
  @objc public var lemonCycleL1: Float = -1.0
  @objc public var habLineSuccessL1: Int = -1
  @objc public var sdLemonSuccessUndefended: Int = -1
  @objc public var orangeCycleL2: Float = -1.0
  @objc public var p75habLineSuccessL2: Int = -1
  @objc public var sdOrangeSuccessDefended: Int = -1
  @objc public var p75lemonSuccessFromSide: Int = -1
  @objc public var lfmAvgTimeClimbing:  Float = -1.0
  @objc public var p75habLineSuccessL1: Int = -1
  @objc public var lemonSuccessUndefended: Int = -1
  @objc public var orangeSuccessL2: Int = -1
  @objc public var p75orangeSuccessAll: Int = -1
  @objc public var p75orangeCycleAll: Float = -1.0
  @objc public var lfmLemonLoadSuccess: Int = -1
  @objc public var actualSeed: Int = -1
  @objc public var p75orangeSuccessDefended: Int = -1
  @objc public var predictedDedicatedOrangeCycles: Float = -1.0
  @objc public var predictedSeed: Int = -1
  @objc public var habLineSuccessL2: Int = -1
  @objc public var lemonCycleL3: Float = -1.0
  @objc public var lemonSuccessFromSide: Int = -1
  @objc public var sdLemonCycleAll: Float = -1.0
  @objc public var lfmOrangeCycleL1: Float = -1.0
  @objc public var lemonSuccessL2: Int = -1
  @objc public var lfmOrangeSuccessDefended: Int = -1
  @objc public var percentIncap: Int = -1
  @objc public var percentIncapEntireMatch: Int = -1
  @objc public var p75lemonSuccessDefended: Int = -1
  @objc public var sdHabLineSuccessL2: Int = -1
  @objc public var sdAvgTimeClimbing: Float = -1.0
  @objc public var sdOrangeCycleAll: Float = -1.0
  @objc public var lfmLemonCycleAll: Float = -1.0
  @objc public var sdOrangeSuccessUndefended: Int = -1
  @objc public var p75orangeSuccessL3: Int = -1
  @objc public var lemonSuccessL3: Int = -1
  @objc public var lfmLemonSuccessAll: Int = -1
  @objc public var avgLemonsScored: Float = -1.0
  @objc public var p75lemonCycleAll: Float = -1.0
  @objc public var orangeSuccessL1: Int = -1
  @objc public var sdLemonSuccessL1: Int = -1
  @objc public var sdHabLineSuccessL1: Int = -1
  @objc public var lfmLemonSuccessFromSide: Int = -1
  @objc public var lfmAvgGoodDecisions: Float = -1.0
  @objc public var sdOrangeSuccessL3: Int = -1
  @objc public var sdLemonCycleL3: Float = -1.0
  @objc public var lfmOrangeCycleL2: Float = -1.0
  @objc public var hasOrangeGroundIntake: Bool = false
  @objc public var sdOrangeCycleL3: Float = -1.0
  @objc public var lfmHabLineSuccessL2: Int = -1
  @objc public var sdLemonCycleL1: Float = -1.0
  @objc public var p75lemonSuccessL2: Int = -1
  @objc public var sdAvgGoodDecisions: Float = -1.0
  @objc public var sdPercentImpaired: Int = -1
  @objc public var sdPercentNoShow: Int = -1
  @objc public var sdOrangeCycleL1: Float = -1.0
  @objc public var avgGoodDecisions: Float = -1.0
  @objc public var secondPickAbility: Float = -1.0
  @objc public var orangeCycleL1: Float = -1.0
  @objc public var lfmLemonCycleL1: Float = -1.0
  @objc public var lfmLemonSuccessL2: Int = -1
  @objc public var sdOrangeSuccessL2: Int = -1
  @objc public var sdAvgBadDecisions: Float = -1.0
  @objc public var p75avgLemonsScored: Float = -1.0
  @objc public var avgBadDecisions: Float = -1.0
  @objc public var p75orangeCycleL3: Float = -1.0
  @objc public var lfmAvgBadDecisions: Float = -1.0
  @objc public var orangeAbility: Float = -1.0
  @objc public var sdLemonCycleL2: Float = -1.0
  @objc public var p75avgOrangesScored: Float = -1.0
  @objc public var sdAvgOrangesScored: Float = -1.0
  @objc public var lfmOrangeSuccessL1: Int = -1
  @objc public var lemonLoadSuccess: Int = -1
  @objc public var p75orangeCycleL2: Float = -1.0
  @objc public var lemonSuccessDefended: Int = -1
  @objc public var avgTimeClimbing: Float = -1.0
  @objc public var lfmOrangeSuccessUndefended: Int = -1
  @objc public var p75percentNoShow: Int = -1
  @objc public var orangeSuccessUndefended: Int = -1
  @objc public var lfmLemonSuccessDefended: Int = -1
  @objc public var p75lemonSuccessL1: Int = -1
  @objc public var lfmAvgTimeImpaired: Float = -1.0
  @objc public var didPreloadLemon: Bool = false
  @objc public var sdPercentIncap: Int = -1
  @objc public var sdPercentIncapEntireMatch: Int = -1
  @objc public var orangeSuccessDefended: Int = -1
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
  @objc public var avgTimeImpaired: Float = -1.0
  @objc public var p75lemonCycleL1: Float = -1.0
  @objc public var lfmHabLineSuccessL1: Int = -1
  @objc public var p75lemonCycleL3: Float = -1.0
  @objc public var lfmOrangeCycleL3: Float = -1.0
  @objc public var sdOrangeCycleL2: Float = -1.0
  @objc public var sdAvgTimeIncap: Float = -1.0
  @objc public var p75orangeSuccessL2: Int = -1
  @objc public var lfmOrangeSuccessL2: Int = -1
  @objc public var p75lemonSuccessL3: Int = -1
  @objc public var p75percentImpaired: Int = -1
  @objc public var p75avgBadDecisions: Float = -1.0
  @objc public var lfmPercentIncap: Int = -1
  @objc public var lfmPercentIncapEntireMatch: Int = -1
  @objc public var lemonSuccessAll: Int = -1
  @objc public var p75lemonSuccessUndefended: Int = -1
  @objc public var lfmLemonSuccessL1: Int = -1
  @objc public var orangeSuccessAll: Int = -1
  @objc public var didPreloadOrange: Bool = false
  @objc public var lemonSuccessL1: Int = -1
  @objc public var sdLemonLoadSuccess: Int = -1
  @objc public var lfmOrangeCycleAll: Float = -1.0
  @objc public var orangeCycleAll: Float = -1.0
  @objc public var lfmAvgTimeIncap: Float = -1.0
  @objc public var p75orangeSuccessL1: Int = -1
  @objc public var lfmLemonSuccessL3: Int = -1
  @objc public var lfmOrangeSuccessAll: Int = -1
  @objc public var sdLemonSuccessAll: Int = -1
  @objc public var p75avgGoodDecisions: Float = -1.0
  @objc public var firstPickAbility: Float = -1.0
  @objc public var avgOrangesSpilled: Float = -1.0
  @objc public var p75avgOrangesSpilled: Float = -1.0
  @objc public var lfmAvgOrangesSpilled: Float = -1.0
  @objc public var sdAvgOrangesSpilled: Float = -1.0
  @objc public var avgLemonsSpilled: Float = -1.0
  @objc public var p75avgLemonsSpilled: Float = -1.0
  @objc public var lfmAvgLemonsSpilled: Float = -1.0
  @objc public var sdAvgLemonsSpilled: Float = -1.0

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
    avgOrangesScored = json[SerializationKeys.avgOrangesScored].floatValue
    predictedDedicatedLemonCycles = json[SerializationKeys.predictedDedicatedLemonCycles].floatValue
    avgTimeIncap = json[SerializationKeys.avgTimeIncap].floatValue
    hasLemonGroundIntake = json[SerializationKeys.hasLemonGroundIntake].boolValue
    sdLemonSuccessFromSide = json[SerializationKeys.sdLemonSuccessFromSide].intValue
    percentImpaired = json[SerializationKeys.percentImpaired].intValue
    p75lemonLoadSuccess = json[SerializationKeys.p75lemonLoadSuccess].intValue
    p75percentIncap = json[SerializationKeys.p75percentIncap].intValue
    p75percentIncapEntireMatch = json[SerializationKeys.p75percentIncapEntireMatch].intValue
    orangeSuccessL3 = json[SerializationKeys.orangeSuccessL3].intValue
    lemonCycleL2 = json[SerializationKeys.lemonCycleL2].floatValue
    p75avgTimeImpaired = json[SerializationKeys.p75avgTimeImpaired].floatValue
    sdAvgTimeImpaired = json[SerializationKeys.sdAvgTimeImpaired].floatValue
    lfmOrangeSuccessL3 = json[SerializationKeys.lfmOrangeSuccessL3].intValue
    orangeCycleL3 = json[SerializationKeys.orangeCycleL3].floatValue
    predictedRPs = json[SerializationKeys.predictedRPs].floatValue
    p75lemonCycleL2 = json[SerializationKeys.p75lemonCycleL2].floatValue
    p75avgTimeIncap = json[SerializationKeys.p75avgTimeIncap].floatValue
    p75orangeCycleL1 = json[SerializationKeys.p75orangeCycleL1].floatValue
    lfmPercentNoShow = json[SerializationKeys.lfmPercentNoShow].intValue
    lfmAvgOrangesScored = json[SerializationKeys.lfmAvgOrangesScored].floatValue
    lfmPercentImpaired = json[SerializationKeys.lfmPercentImpaired].intValue
    sdOrangeSuccessL1 = json[SerializationKeys.sdOrangeSuccessL1].intValue
    lfmLemonCycleL3 = json[SerializationKeys.lfmLemonCycleL3].floatValue
    p75orangeSuccessUndefended = json[SerializationKeys.p75orangeSuccessUndefended].intValue
    sdAvgLemonsScored = json[SerializationKeys.sdAvgLemonsScored].floatValue
    sdOrangeSuccessAll = json[SerializationKeys.sdOrangeSuccessAll].intValue
    p75lemonSuccessAll = json[SerializationKeys.p75lemonSuccessAll].intValue
    lfmAvgLemonsScored = json[SerializationKeys.lfmAvgLemonsScored].floatValue
    lemonCycleL1 = json[SerializationKeys.lemonCycleL1].floatValue
    habLineSuccessL1 = json[SerializationKeys.habLineSuccessL1].intValue
    sdLemonSuccessUndefended = json[SerializationKeys.sdLemonSuccessUndefended].intValue
    orangeCycleL2 = json[SerializationKeys.orangeCycleL2].floatValue
    p75habLineSuccessL2 = json[SerializationKeys.p75habLineSuccessL2].intValue
    sdOrangeSuccessDefended = json[SerializationKeys.sdOrangeSuccessDefended].intValue
    p75lemonSuccessFromSide = json[SerializationKeys.p75lemonSuccessFromSide].intValue
    lfmAvgTimeClimbing = json[SerializationKeys.lfmAvgTimeClimbing].floatValue
    p75habLineSuccessL1 = json[SerializationKeys.p75habLineSuccessL1].intValue
    lemonSuccessUndefended = json[SerializationKeys.lemonSuccessUndefended].intValue
    p75avgOrangesSpilled = json[SerializationKeys.p75avgOrangesSpilled].floatValue
    orangeSuccessL2 = json[SerializationKeys.orangeSuccessL2].intValue
    p75orangeSuccessAll = json[SerializationKeys.p75orangeSuccessAll].intValue
    p75orangeCycleAll = json[SerializationKeys.p75orangeCycleAll].floatValue
    lfmLemonLoadSuccess = json[SerializationKeys.lfmLemonLoadSuccess].intValue
    actualSeed = json[SerializationKeys.actualSeed].intValue
    p75orangeSuccessDefended = json[SerializationKeys.p75orangeSuccessDefended].intValue
    predictedDedicatedOrangeCycles = json[SerializationKeys.predictedDedicatedOrangeCycles].floatValue
    predictedSeed = json[SerializationKeys.predictedSeed].intValue
    habLineSuccessL2 = json[SerializationKeys.habLineSuccessL2].intValue
    lemonCycleL3 = json[SerializationKeys.lemonCycleL3].floatValue
    lemonSuccessFromSide = json[SerializationKeys.lemonSuccessFromSide].intValue
    sdLemonCycleAll = json[SerializationKeys.sdLemonCycleAll].floatValue
    lfmOrangeCycleL1 = json[SerializationKeys.lfmOrangeCycleL1].floatValue
    lemonSuccessL2 = json[SerializationKeys.lemonSuccessL2].intValue
    lfmOrangeSuccessDefended = json[SerializationKeys.lfmOrangeSuccessDefended].intValue
    percentIncap = json[SerializationKeys.percentIncap].intValue
    percentIncapEntireMatch = json[SerializationKeys.percentIncapEntireMatch].intValue
    p75lemonSuccessDefended = json[SerializationKeys.p75lemonSuccessDefended].intValue
    sdHabLineSuccessL2 = json[SerializationKeys.sdHabLineSuccessL2].intValue
    sdAvgTimeClimbing = json[SerializationKeys.sdAvgTimeClimbing].floatValue
    sdOrangeCycleAll = json[SerializationKeys.sdOrangeCycleAll].floatValue
    lfmLemonCycleAll = json[SerializationKeys.lfmLemonCycleAll].floatValue
    sdOrangeSuccessUndefended = json[SerializationKeys.sdOrangeSuccessUndefended].intValue
    p75orangeSuccessL3 = json[SerializationKeys.p75orangeSuccessL3].intValue
    lemonSuccessL3 = json[SerializationKeys.lemonSuccessL3].intValue
    lfmLemonSuccessAll = json[SerializationKeys.lfmLemonSuccessAll].intValue
    avgLemonsScored = json[SerializationKeys.avgLemonsScored].floatValue
    p75lemonCycleAll = json[SerializationKeys.p75lemonCycleAll].floatValue
    orangeSuccessL1 = json[SerializationKeys.orangeSuccessL1].intValue
    sdLemonSuccessL1 = json[SerializationKeys.sdLemonSuccessL1].intValue
    sdHabLineSuccessL1 = json[SerializationKeys.sdHabLineSuccessL1].intValue
    lfmLemonSuccessFromSide = json[SerializationKeys.lfmLemonSuccessFromSide].intValue
    lfmAvgGoodDecisions = json[SerializationKeys.lfmAvgGoodDecisions].floatValue
    sdOrangeSuccessL3 = json[SerializationKeys.sdOrangeSuccessL3].intValue
    sdLemonCycleL3 = json[SerializationKeys.sdLemonCycleL3].floatValue
    lfmOrangeCycleL2 = json[SerializationKeys.lfmOrangeCycleL2].floatValue
    hasOrangeGroundIntake = json[SerializationKeys.hasOrangeGroundIntake].boolValue
    sdOrangeCycleL3 = json[SerializationKeys.sdOrangeCycleL3].floatValue
    lfmHabLineSuccessL2 = json[SerializationKeys.lfmHabLineSuccessL2].intValue
    sdLemonCycleL1 = json[SerializationKeys.sdLemonCycleL1].floatValue
    p75lemonSuccessL2 = json[SerializationKeys.p75lemonSuccessL2].intValue
    sdAvgGoodDecisions = json[SerializationKeys.sdAvgGoodDecisions].floatValue
    sdPercentImpaired = json[SerializationKeys.sdPercentImpaired].intValue
    sdPercentNoShow = json[SerializationKeys.sdPercentNoShow].intValue
    sdOrangeCycleL1 = json[SerializationKeys.sdOrangeCycleL1].floatValue
    avgGoodDecisions = json[SerializationKeys.avgGoodDecisions].floatValue
    secondPickAbility = json[SerializationKeys.secondPickAbility].floatValue
    orangeCycleL1 = json[SerializationKeys.orangeCycleL1].floatValue
    lfmLemonCycleL1 = json[SerializationKeys.lfmLemonCycleL1].floatValue
    lfmLemonSuccessL2 = json[SerializationKeys.lfmLemonSuccessL2].intValue
    sdOrangeSuccessL2 = json[SerializationKeys.sdOrangeSuccessL2].intValue
    sdAvgBadDecisions = json[SerializationKeys.sdAvgBadDecisions].floatValue
    p75avgLemonsScored = json[SerializationKeys.p75avgLemonsScored].floatValue
    avgBadDecisions = json[SerializationKeys.avgBadDecisions].floatValue
    p75orangeCycleL3 = json[SerializationKeys.p75orangeCycleL3].floatValue
    lfmAvgBadDecisions = json[SerializationKeys.lfmAvgBadDecisions].floatValue
    orangeAbility = json[SerializationKeys.orangeAbility].floatValue
    sdLemonCycleL2 = json[SerializationKeys.sdLemonCycleL2].floatValue
    p75avgOrangesScored = json[SerializationKeys.p75avgOrangesScored].floatValue
    sdAvgOrangesScored = json[SerializationKeys.sdAvgOrangesScored].floatValue
    lfmOrangeSuccessL1 = json[SerializationKeys.lfmOrangeSuccessL1].intValue
    avgOrangesSpilled = json[SerializationKeys.avgOrangesSpilled].floatValue
    sdAvgOrangesSpilled = json[SerializationKeys.sdAvgOrangesSpilled].floatValue
    lemonLoadSuccess = json[SerializationKeys.lemonLoadSuccess].intValue
    p75orangeCycleL2 = json[SerializationKeys.p75orangeCycleL2].floatValue
    lemonSuccessDefended = json[SerializationKeys.lemonSuccessDefended].intValue
    avgTimeClimbing = json[SerializationKeys.avgTimeClimbing].floatValue
    lfmOrangeSuccessUndefended = json[SerializationKeys.lfmOrangeSuccessUndefended].intValue
    p75percentNoShow = json[SerializationKeys.p75percentNoShow].intValue
    orangeSuccessUndefended = json[SerializationKeys.orangeSuccessUndefended].intValue
    lfmLemonSuccessDefended = json[SerializationKeys.lfmLemonSuccessDefended].intValue
    p75lemonSuccessL1 = json[SerializationKeys.p75lemonSuccessL1].intValue
    lfmAvgTimeImpaired = json[SerializationKeys.lfmAvgTimeImpaired].floatValue
    didPreloadLemon = json[SerializationKeys.didPreloadLemon].boolValue
    sdPercentIncap = json[SerializationKeys.sdPercentIncap].intValue
    sdPercentIncapEntireMatch = json[SerializationKeys.sdPercentIncapEntireMatch].intValue
    orangeSuccessDefended = json[SerializationKeys.orangeSuccessDefended].intValue
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
    avgTimeImpaired = json[SerializationKeys.avgTimeImpaired].floatValue
    p75lemonCycleL1 = json[SerializationKeys.p75lemonCycleL1].floatValue
    lfmHabLineSuccessL1 = json[SerializationKeys.lfmHabLineSuccessL1].intValue
    p75lemonCycleL3 = json[SerializationKeys.p75lemonCycleL3].floatValue
    lfmOrangeCycleL3 = json[SerializationKeys.lfmOrangeCycleL3].floatValue
    sdOrangeCycleL2 = json[SerializationKeys.sdOrangeCycleL2].floatValue
    sdAvgTimeIncap = json[SerializationKeys.sdAvgTimeIncap].floatValue
    p75orangeSuccessL2 = json[SerializationKeys.p75orangeSuccessL2].intValue
    lfmOrangeSuccessL2 = json[SerializationKeys.lfmOrangeSuccessL2].intValue
    p75lemonSuccessL3 = json[SerializationKeys.p75lemonSuccessL3].intValue
    p75percentImpaired = json[SerializationKeys.p75percentImpaired].intValue
    p75avgBadDecisions = json[SerializationKeys.p75avgBadDecisions].floatValue
    lfmPercentIncap = json[SerializationKeys.lfmPercentIncap].intValue
    lfmPercentIncapEntireMatch = json[SerializationKeys.lfmPercentIncapEntireMatch].intValue
    lemonSuccessAll = json[SerializationKeys.lemonSuccessAll].intValue
    p75lemonSuccessUndefended = json[SerializationKeys.p75lemonSuccessUndefended].intValue
    lfmLemonSuccessL1 = json[SerializationKeys.lfmLemonSuccessL1].intValue
    orangeSuccessAll = json[SerializationKeys.orangeSuccessAll].intValue
    didPreloadOrange = json[SerializationKeys.didPreloadOrange].boolValue
    lemonSuccessL1 = json[SerializationKeys.lemonSuccessL1].intValue
    sdLemonLoadSuccess = json[SerializationKeys.sdLemonLoadSuccess].intValue
    lfmOrangeCycleAll = json[SerializationKeys.lfmOrangeCycleAll].floatValue
    orangeCycleAll = json[SerializationKeys.orangeCycleAll].floatValue
    lfmAvgTimeIncap = json[SerializationKeys.lfmAvgTimeIncap].floatValue
    p75orangeSuccessL1 = json[SerializationKeys.p75orangeSuccessL1].intValue
    lfmLemonSuccessL3 = json[SerializationKeys.lfmLemonSuccessL3].intValue
    lfmOrangeSuccessAll = json[SerializationKeys.lfmOrangeSuccessAll].intValue
    sdLemonSuccessAll = json[SerializationKeys.sdLemonSuccessAll].intValue
    p75avgGoodDecisions = json[SerializationKeys.p75avgGoodDecisions].floatValue
    firstPickAbility = json[SerializationKeys.firstPickAbility].floatValue
    lfmAvgOrangesSpilled = json[SerializationKeys.lfmAvgOrangesSpilled].floatValue
    avgLemonsSpilled = json[SerializationKeys.avgLemonsSpilled].floatValue
    p75avgLemonsSpilled = json[SerializationKeys.p75avgLemonsSpilled].floatValue
    lfmAvgLemonsSpilled = json[SerializationKeys.lfmAvgLemonsSpilled].floatValue
    sdAvgLemonsSpilled = json[SerializationKeys.sdAvgLemonsSpilled].floatValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.hasLemonGroundIntake] = hasLemonGroundIntake
    
    dictionary[SerializationKeys.predictedRPs] = predictedRPs
    
    dictionary[SerializationKeys.actualSeed] = actualSeed
    
    dictionary[SerializationKeys.percentIncap] = percentIncap
    
    dictionary[SerializationKeys.percentIncapEntireMatch] = percentIncapEntireMatch
    
    dictionary[SerializationKeys.hasOrangeGroundIntake] = hasOrangeGroundIntake
    
    dictionary[SerializationKeys.didPreloadLemon] = didPreloadLemon
    
    dictionary[SerializationKeys.didPreloadOrange] = didPreloadOrange
    dictionary[SerializationKeys.firstPickAbility] = firstPickAbility
    
    dictionary[SerializationKeys.predictedDedicatedLemonCycles] = predictedDedicatedLemonCycles
    dictionary[SerializationKeys.avgTimeIncap] = avgTimeIncap
    dictionary[SerializationKeys.sdLemonSuccessFromSide] = sdLemonSuccessFromSide
    dictionary[SerializationKeys.percentImpaired] = percentImpaired
    dictionary[SerializationKeys.p75lemonLoadSuccess] = p75lemonLoadSuccess
    dictionary[SerializationKeys.p75percentIncap] = p75percentIncap
    dictionary[SerializationKeys.p75percentIncapEntireMatch] = p75percentIncapEntireMatch
    dictionary[SerializationKeys.orangeSuccessL3] = orangeSuccessL3
    dictionary[SerializationKeys.lemonCycleL2] = lemonCycleL2
    dictionary[SerializationKeys.p75avgTimeImpaired] = p75avgTimeImpaired
    dictionary[SerializationKeys.sdAvgTimeImpaired] = sdAvgTimeImpaired
    dictionary[SerializationKeys.lfmOrangeSuccessL3] = lfmOrangeSuccessL3
    dictionary[SerializationKeys.orangeCycleL3] = orangeCycleL3
    dictionary[SerializationKeys.p75lemonCycleL2] = p75lemonCycleL2
    dictionary[SerializationKeys.p75avgTimeIncap] = p75avgTimeIncap
    dictionary[SerializationKeys.p75orangeCycleL1] = p75orangeCycleL1
    dictionary[SerializationKeys.lfmPercentNoShow] = lfmPercentNoShow
    dictionary[SerializationKeys.lfmAvgOrangesScored] = lfmAvgOrangesScored
    dictionary[SerializationKeys.lfmPercentImpaired] = lfmPercentImpaired
    dictionary[SerializationKeys.sdOrangeSuccessL1] = sdOrangeSuccessL1
    dictionary[SerializationKeys.lfmLemonCycleL3] = lfmLemonCycleL3
    dictionary[SerializationKeys.p75orangeSuccessUndefended] = p75orangeSuccessUndefended
    dictionary[SerializationKeys.sdAvgLemonsScored] = sdAvgLemonsScored
    dictionary[SerializationKeys.sdOrangeSuccessAll] = sdOrangeSuccessAll
    dictionary[SerializationKeys.p75lemonSuccessAll] = p75lemonSuccessAll
    dictionary[SerializationKeys.lfmAvgLemonsScored] = lfmAvgLemonsScored
    dictionary[SerializationKeys.lemonCycleL1] = lemonCycleL1
    dictionary[SerializationKeys.habLineSuccessL1] = habLineSuccessL1
    dictionary[SerializationKeys.sdLemonSuccessUndefended] = sdLemonSuccessUndefended
    dictionary[SerializationKeys.orangeCycleL2] = orangeCycleL2
    dictionary[SerializationKeys.p75habLineSuccessL2] = p75habLineSuccessL2
    dictionary[SerializationKeys.sdOrangeSuccessDefended] = sdOrangeSuccessDefended
    dictionary[SerializationKeys.p75lemonSuccessFromSide] = p75lemonSuccessFromSide
    dictionary[SerializationKeys.lfmAvgTimeClimbing] = lfmAvgTimeClimbing
    dictionary[SerializationKeys.p75habLineSuccessL1] = p75habLineSuccessL1
    dictionary[SerializationKeys.lemonSuccessUndefended] = lemonSuccessUndefended
    dictionary[SerializationKeys.p75avgOrangesSpilled] = p75avgOrangesSpilled
    dictionary[SerializationKeys.orangeSuccessL2] = orangeSuccessL2
    dictionary[SerializationKeys.p75orangeSuccessAll] = p75orangeSuccessAll
    dictionary[SerializationKeys.p75orangeCycleAll] = p75orangeCycleAll
    dictionary[SerializationKeys.lfmLemonLoadSuccess] = lfmLemonLoadSuccess
    dictionary[SerializationKeys.p75orangeSuccessDefended] = p75orangeSuccessDefended
    dictionary[SerializationKeys.predictedDedicatedOrangeCycles] = predictedDedicatedOrangeCycles
    dictionary[SerializationKeys.predictedSeed] = predictedSeed
    dictionary[SerializationKeys.habLineSuccessL2] = habLineSuccessL2
    dictionary[SerializationKeys.lemonCycleL3] = lemonCycleL3
    dictionary[SerializationKeys.lemonSuccessFromSide] = lemonSuccessFromSide
    dictionary[SerializationKeys.sdLemonCycleAll] = sdLemonCycleAll
    dictionary[SerializationKeys.lfmOrangeCycleL1] = lfmOrangeCycleL1
    dictionary[SerializationKeys.lemonSuccessL2] = lemonSuccessL2
    dictionary[SerializationKeys.lfmOrangeSuccessDefended] = lfmOrangeSuccessDefended
    dictionary[SerializationKeys.p75lemonSuccessDefended] = p75lemonSuccessDefended
    dictionary[SerializationKeys.sdHabLineSuccessL2] = sdHabLineSuccessL2
    dictionary[SerializationKeys.sdAvgTimeClimbing] = sdAvgTimeClimbing
    dictionary[SerializationKeys.sdOrangeCycleAll] = sdOrangeCycleAll
    dictionary[SerializationKeys.lfmLemonCycleAll] = lfmLemonCycleAll
    dictionary[SerializationKeys.sdOrangeSuccessUndefended] = sdOrangeSuccessUndefended
    dictionary[SerializationKeys.p75orangeSuccessL3] = p75orangeSuccessL3
    dictionary[SerializationKeys.lemonSuccessL3] = lemonSuccessL3
    dictionary[SerializationKeys.lfmLemonSuccessAll] = lfmLemonSuccessAll
    dictionary[SerializationKeys.avgLemonsScored] = avgLemonsScored
    dictionary[SerializationKeys.p75lemonCycleAll] = p75lemonCycleAll
    dictionary[SerializationKeys.orangeSuccessL1] = orangeSuccessL1
    dictionary[SerializationKeys.sdLemonSuccessL1] = sdLemonSuccessL1
    dictionary[SerializationKeys.sdHabLineSuccessL1] = sdHabLineSuccessL1
    dictionary[SerializationKeys.lfmLemonSuccessFromSide] = lfmLemonSuccessFromSide
    dictionary[SerializationKeys.lfmAvgGoodDecisions] = lfmAvgGoodDecisions
    dictionary[SerializationKeys.sdOrangeSuccessL3] = sdOrangeSuccessL3
    dictionary[SerializationKeys.sdLemonCycleL3] = sdLemonCycleL3
    dictionary[SerializationKeys.lfmOrangeCycleL2] = lfmOrangeCycleL2
    dictionary[SerializationKeys.sdOrangeCycleL3] = sdOrangeCycleL3
    dictionary[SerializationKeys.lfmHabLineSuccessL2] = lfmHabLineSuccessL2
    dictionary[SerializationKeys.sdLemonCycleL1] = sdLemonCycleL1
    dictionary[SerializationKeys.p75lemonSuccessL2] = p75lemonSuccessL2
    dictionary[SerializationKeys.sdAvgGoodDecisions] = sdAvgGoodDecisions
    dictionary[SerializationKeys.sdPercentImpaired] = sdPercentImpaired
    dictionary[SerializationKeys.sdPercentNoShow] = sdPercentNoShow
    dictionary[SerializationKeys.sdOrangeCycleL1] = sdOrangeCycleL1
    dictionary[SerializationKeys.avgGoodDecisions] = avgGoodDecisions
    dictionary[SerializationKeys.secondPickAbility] = secondPickAbility
    dictionary[SerializationKeys.orangeCycleL1] = orangeCycleL1
    dictionary[SerializationKeys.lfmLemonCycleL1] = lfmLemonCycleL1
    dictionary[SerializationKeys.lfmLemonSuccessL2] = lfmLemonSuccessL2
    dictionary[SerializationKeys.sdOrangeSuccessL2] = sdOrangeSuccessL2
    dictionary[SerializationKeys.sdAvgBadDecisions] = sdAvgBadDecisions
    dictionary[SerializationKeys.p75avgLemonsScored] = p75avgLemonsScored
    dictionary[SerializationKeys.avgBadDecisions] = avgBadDecisions
    dictionary[SerializationKeys.p75orangeCycleL3] = p75orangeCycleL3
    dictionary[SerializationKeys.lfmAvgBadDecisions] = lfmAvgBadDecisions
    dictionary[SerializationKeys.orangeAbility] = orangeAbility
    dictionary[SerializationKeys.sdLemonCycleL2] = sdLemonCycleL2
    dictionary[SerializationKeys.p75avgOrangesScored] = p75avgOrangesScored
    dictionary[SerializationKeys.sdAvgOrangesScored] = sdAvgOrangesScored
    dictionary[SerializationKeys.lfmOrangeSuccessL1] = lfmOrangeSuccessL1
    dictionary[SerializationKeys.avgOrangesSpilled] = avgOrangesSpilled
    dictionary[SerializationKeys.sdAvgOrangesSpilled] = sdAvgOrangesSpilled
    dictionary[SerializationKeys.lemonLoadSuccess] = lemonLoadSuccess
    dictionary[SerializationKeys.p75orangeCycleL2] = p75orangeCycleL2
    dictionary[SerializationKeys.lemonSuccessDefended] = lemonSuccessDefended
    dictionary[SerializationKeys.avgTimeClimbing] = avgTimeClimbing
    dictionary[SerializationKeys.lfmOrangeSuccessUndefended] = lfmOrangeSuccessUndefended
    dictionary[SerializationKeys.p75percentNoShow] = p75percentNoShow
    dictionary[SerializationKeys.orangeSuccessUndefended] = orangeSuccessUndefended
    dictionary[SerializationKeys.lfmLemonSuccessDefended] = lfmLemonSuccessDefended
    dictionary[SerializationKeys.p75lemonSuccessL1] = p75lemonSuccessL1
    dictionary[SerializationKeys.lfmAvgTimeImpaired] = lfmAvgTimeImpaired
    dictionary[SerializationKeys.sdPercentIncap] = sdPercentIncap
    dictionary[SerializationKeys.sdPercentIncapEntireMatch] = sdPercentIncapEntireMatch
    dictionary[SerializationKeys.orangeSuccessDefended] = orangeSuccessDefended
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
    dictionary[SerializationKeys.avgTimeImpaired] = avgTimeImpaired
    dictionary[SerializationKeys.p75lemonCycleL1] = p75lemonCycleL1
    dictionary[SerializationKeys.lfmHabLineSuccessL1] = lfmHabLineSuccessL1
    dictionary[SerializationKeys.p75lemonCycleL3] = p75lemonCycleL3
    dictionary[SerializationKeys.lfmOrangeCycleL3] = lfmOrangeCycleL3
    dictionary[SerializationKeys.sdOrangeCycleL2] = sdOrangeCycleL2
    dictionary[SerializationKeys.sdAvgTimeIncap] = sdAvgTimeIncap
    dictionary[SerializationKeys.p75orangeSuccessL2] = p75orangeSuccessL2
    dictionary[SerializationKeys.lfmOrangeSuccessL2] = lfmOrangeSuccessL2
    dictionary[SerializationKeys.p75lemonSuccessL3] = p75lemonSuccessL3
    dictionary[SerializationKeys.p75percentImpaired] = p75percentImpaired
    dictionary[SerializationKeys.p75avgBadDecisions] = p75avgBadDecisions
    dictionary[SerializationKeys.lfmPercentIncap] = lfmPercentIncap
    dictionary[SerializationKeys.lfmPercentIncapEntireMatch] = lfmPercentIncapEntireMatch
    dictionary[SerializationKeys.lemonSuccessAll] = lemonSuccessAll
    dictionary[SerializationKeys.p75lemonSuccessUndefended] = p75lemonSuccessUndefended
    dictionary[SerializationKeys.lfmLemonSuccessL1] = lfmLemonSuccessL1
    dictionary[SerializationKeys.orangeSuccessAll] = orangeSuccessAll
    dictionary[SerializationKeys.lemonSuccessL1] = lemonSuccessL1
    dictionary[SerializationKeys.sdLemonLoadSuccess] = sdLemonLoadSuccess
    dictionary[SerializationKeys.lfmOrangeCycleAll] = lfmOrangeCycleAll
    dictionary[SerializationKeys.orangeCycleAll] = orangeCycleAll
    dictionary[SerializationKeys.lfmAvgTimeIncap] = lfmAvgTimeIncap
    dictionary[SerializationKeys.p75orangeSuccessL1] = p75orangeSuccessL1
    dictionary[SerializationKeys.lfmLemonSuccessL3] = lfmLemonSuccessL3
    dictionary[SerializationKeys.lfmOrangeSuccessAll] = lfmOrangeSuccessAll
    dictionary[SerializationKeys.sdLemonSuccessAll] = sdLemonSuccessAll
    dictionary[SerializationKeys.p75avgGoodDecisions] = p75avgGoodDecisions
    dictionary[SerializationKeys.lfmAvgOrangesSpilled] = lfmAvgOrangesSpilled
    dictionary[SerializationKeys.avgLemonsSpilled] = avgLemonsSpilled
    dictionary[SerializationKeys.p75avgLemonsSpilled] = p75avgLemonsSpilled
    dictionary[SerializationKeys.lfmAvgLemonsSpilled] = lfmAvgLemonsSpilled
    dictionary[SerializationKeys.sdAvgLemonsSpilled] = sdAvgLemonsSpilled
    dictionary[SerializationKeys.avgOrangesScored] = avgOrangesScored
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avgOrangesScored = aDecoder.decodeFloat(forKey: SerializationKeys.avgOrangesScored)
    self.predictedDedicatedLemonCycles = aDecoder.decodeFloat(forKey: SerializationKeys.predictedDedicatedLemonCycles)
    self.avgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeIncap)
    self.hasLemonGroundIntake = aDecoder.decodeBool(forKey: SerializationKeys.hasLemonGroundIntake)
    self.sdLemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessFromSide)
    self.percentImpaired = aDecoder.decodeInteger(forKey: SerializationKeys.percentImpaired)
    self.p75lemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonLoadSuccess)
    self.p75percentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentIncap)
    self.p75percentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentIncapEntireMatch)
    self.orangeSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.orangeSuccessL3)
    self.lemonCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.lemonCycleL2)
    self.p75avgTimeImpaired = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgTimeImpaired)
    self.sdAvgTimeImpaired = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgTimeImpaired)
    self.lfmOrangeSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmOrangeSuccessL3)
    self.orangeCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.orangeCycleL3)
    self.predictedRPs = aDecoder.decodeFloat(forKey: SerializationKeys.predictedRPs)
    self.p75lemonCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleL2)
    self.p75avgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgTimeIncap)
    self.p75orangeCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.p75orangeCycleL1)
    self.lfmPercentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentNoShow)
    self.lfmAvgOrangesScored = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgOrangesScored)
    self.lfmPercentImpaired = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentImpaired)
    self.sdOrangeSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdOrangeSuccessL1)
    self.lfmLemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmLemonCycleL3)
    self.p75orangeSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75orangeSuccessUndefended)
    self.sdAvgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgLemonsScored)
    self.sdOrangeSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.sdOrangeSuccessAll)
    self.p75lemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessAll)
    self.lfmAvgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgLemonsScored)
    self.lemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lemonCycleL1)
    self.habLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.habLineSuccessL1)
    self.sdLemonSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessUndefended)
    self.orangeCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.orangeCycleL2)
    self.p75habLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75habLineSuccessL2)
    self.sdOrangeSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdOrangeSuccessDefended)
    self.p75lemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessFromSide)
    self.lfmAvgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgTimeClimbing)
    self.p75habLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75habLineSuccessL1)
    self.lemonSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessUndefended)
    self.p75avgOrangesSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgOrangesSpilled)
    self.orangeSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.orangeSuccessL2)
    self.p75orangeSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.p75orangeSuccessAll)
    self.p75orangeCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.p75orangeCycleAll)
    self.lfmLemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonLoadSuccess)
    self.actualSeed = aDecoder.decodeInteger(forKey: SerializationKeys.actualSeed)
    self.p75orangeSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75orangeSuccessDefended)
    self.predictedDedicatedOrangeCycles = aDecoder.decodeFloat(forKey: SerializationKeys.predictedDedicatedOrangeCycles)
    self.predictedSeed = aDecoder.decodeInteger(forKey: SerializationKeys.predictedSeed)
    self.habLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.habLineSuccessL2)
    self.lemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lemonCycleL3)
    self.lemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessFromSide)
    self.sdLemonCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleAll)
    self.lfmOrangeCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmOrangeCycleL1)
    self.lemonSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessL2)
    self.lfmOrangeSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmOrangeSuccessDefended)
    self.percentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.percentIncap)
    self.percentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.percentIncapEntireMatch)
    self.p75lemonSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessDefended)
    self.sdHabLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdHabLineSuccessL2)
    self.sdAvgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgTimeClimbing)
    self.sdOrangeCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.sdOrangeCycleAll)
    self.lfmLemonCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.lfmLemonCycleAll)
    self.sdOrangeSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.sdOrangeSuccessUndefended)
    self.p75orangeSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.p75orangeSuccessL3)
    self.lemonSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessL3)
    self.lfmLemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessAll)
    self.avgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsScored)
    self.p75lemonCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleAll)
    self.orangeSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.orangeSuccessL1)
    self.sdLemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessL1)
    self.sdHabLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.sdHabLineSuccessL1)
    self.lfmLemonSuccessFromSide = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessFromSide)
    self.lfmAvgGoodDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgGoodDecisions)
    self.sdOrangeSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.sdOrangeSuccessL3)
    self.sdLemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleL3)
    self.lfmOrangeCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmOrangeCycleL2)
    self.hasOrangeGroundIntake = aDecoder.decodeBool(forKey: SerializationKeys.hasOrangeGroundIntake)
    self.sdOrangeCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.sdOrangeCycleL3)
    self.lfmHabLineSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmHabLineSuccessL2)
    self.sdLemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleL1)
    self.p75lemonSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessL2)
    self.sdAvgGoodDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgGoodDecisions)
    self.sdPercentImpaired = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentImpaired)
    self.sdPercentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentNoShow)
    self.sdOrangeCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.sdOrangeCycleL1)
    self.avgGoodDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.avgGoodDecisions)
    self.secondPickAbility = aDecoder.decodeFloat(forKey: SerializationKeys.secondPickAbility)
    self.orangeCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.orangeCycleL1)
    self.lfmLemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmLemonCycleL1)
    self.lfmLemonSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessL2)
    self.sdOrangeSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.sdOrangeSuccessL2)
    self.sdAvgBadDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgBadDecisions)
    self.p75avgLemonsScored = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgLemonsScored)
    self.avgBadDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.avgBadDecisions)
    self.p75orangeCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.p75orangeCycleL3)
    self.lfmAvgBadDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgBadDecisions)
    self.orangeAbility = aDecoder.decodeFloat(forKey: SerializationKeys.orangeAbility)
    self.sdLemonCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.sdLemonCycleL2)
    self.p75avgOrangesScored = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgOrangesScored)
    self.sdAvgOrangesScored = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgOrangesScored)
    self.lfmOrangeSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmOrangeSuccessL1)
    //self.avgOrangesSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.orangesSpilled)
    self.sdAvgOrangesSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgOrangesSpilled)
    self.lemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.lemonLoadSuccess)
    self.p75orangeCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.p75orangeCycleL2)
    self.lemonSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessDefended)
    self.avgTimeClimbing = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeClimbing)
    self.lfmOrangeSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmOrangeSuccessUndefended)
    self.p75percentNoShow = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentNoShow)
    self.orangeSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.orangeSuccessUndefended)
    self.lfmLemonSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessDefended)
    self.p75lemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessL1)
    self.lfmAvgTimeImpaired = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgTimeImpaired)
    self.didPreloadLemon = aDecoder.decodeBool(forKey: SerializationKeys.didPreloadLemon)
    self.sdPercentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentIncap)
    self.sdPercentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.sdPercentIncapEntireMatch)
    self.orangeSuccessDefended = aDecoder.decodeInteger(forKey: SerializationKeys.orangeSuccessDefended)
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
    self.avgTimeImpaired = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeImpaired)
    self.p75lemonCycleL1 = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleL1)
    self.lfmHabLineSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmHabLineSuccessL1)
    self.p75lemonCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.p75lemonCycleL3)
    self.lfmOrangeCycleL3 = aDecoder.decodeFloat(forKey: SerializationKeys.lfmOrangeCycleL3)
    self.sdOrangeCycleL2 = aDecoder.decodeFloat(forKey: SerializationKeys.sdOrangeCycleL2)
    self.sdAvgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgTimeIncap)
    self.p75orangeSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.p75orangeSuccessL2)
    self.lfmOrangeSuccessL2 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmOrangeSuccessL2)
    self.p75lemonSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessL3)
    self.p75percentImpaired = aDecoder.decodeInteger(forKey: SerializationKeys.p75percentImpaired)
    self.p75avgBadDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgBadDecisions)
    self.lfmPercentIncap = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentIncap)
    self.lfmPercentIncapEntireMatch = aDecoder.decodeInteger(forKey: SerializationKeys.lfmPercentIncapEntireMatch)
    self.lemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessAll)
    self.p75lemonSuccessUndefended = aDecoder.decodeInteger(forKey: SerializationKeys.p75lemonSuccessUndefended)
    self.lfmLemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessL1)
    self.orangeSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.orangeSuccessAll)
    self.didPreloadOrange = aDecoder.decodeBool(forKey: SerializationKeys.didPreloadOrange)
    self.lemonSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.lemonSuccessL1)
    self.sdLemonLoadSuccess = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonLoadSuccess)
    self.lfmOrangeCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.lfmOrangeCycleAll)
    self.orangeCycleAll = aDecoder.decodeFloat(forKey: SerializationKeys.orangeCycleAll)
    self.lfmAvgTimeIncap = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgTimeIncap)
    self.p75orangeSuccessL1 = aDecoder.decodeInteger(forKey: SerializationKeys.p75orangeSuccessL1)
    self.lfmLemonSuccessL3 = aDecoder.decodeInteger(forKey: SerializationKeys.lfmLemonSuccessL3)
    self.lfmOrangeSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.lfmOrangeSuccessAll)
    self.sdLemonSuccessAll = aDecoder.decodeInteger(forKey: SerializationKeys.sdLemonSuccessAll)
    self.p75avgGoodDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgGoodDecisions)
    self.firstPickAbility = aDecoder.decodeFloat(forKey: SerializationKeys.firstPickAbility)
    self.lfmAvgOrangesSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgOrangesSpilled)
    self.avgLemonsSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.avgLemonsSpilled)
    self.p75avgLemonsSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.p75avgLemonsSpilled)
    self.lfmAvgLemonsSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgLemonsSpilled)
    self.sdAvgLemonsSpilled = aDecoder.decodeFloat(forKey: SerializationKeys.sdAvgLemonsSpilled)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avgOrangesScored, forKey: SerializationKeys.avgOrangesScored)
    aCoder.encode(predictedDedicatedLemonCycles, forKey: SerializationKeys.predictedDedicatedLemonCycles)
    aCoder.encode(avgTimeIncap, forKey: SerializationKeys.avgTimeIncap)
    aCoder.encode(hasLemonGroundIntake, forKey: SerializationKeys.hasLemonGroundIntake)
    aCoder.encode(sdLemonSuccessFromSide, forKey: SerializationKeys.sdLemonSuccessFromSide)
    aCoder.encode(percentImpaired, forKey: SerializationKeys.percentImpaired)
    aCoder.encode(p75lemonLoadSuccess, forKey: SerializationKeys.p75lemonLoadSuccess)
    aCoder.encode(p75percentIncap, forKey: SerializationKeys.p75percentIncap)
    aCoder.encode(p75percentIncapEntireMatch, forKey: SerializationKeys.p75percentIncapEntireMatch)
    aCoder.encode(orangeSuccessL3, forKey: SerializationKeys.orangeSuccessL3)
    aCoder.encode(lemonCycleL2, forKey: SerializationKeys.lemonCycleL2)
    aCoder.encode(p75avgTimeImpaired, forKey: SerializationKeys.p75avgTimeImpaired)
    aCoder.encode(sdAvgTimeImpaired, forKey: SerializationKeys.sdAvgTimeImpaired)
    aCoder.encode(lfmOrangeSuccessL3, forKey: SerializationKeys.lfmOrangeSuccessL3)
    aCoder.encode(orangeCycleL3, forKey: SerializationKeys.orangeCycleL3)
    aCoder.encode(predictedRPs, forKey: SerializationKeys.predictedRPs)
    aCoder.encode(p75lemonCycleL2, forKey: SerializationKeys.p75lemonCycleL2)
    aCoder.encode(p75avgTimeIncap, forKey: SerializationKeys.p75avgTimeIncap)
    aCoder.encode(p75orangeCycleL1, forKey: SerializationKeys.p75orangeCycleL1)
    aCoder.encode(lfmPercentNoShow, forKey: SerializationKeys.lfmPercentNoShow)
    aCoder.encode(lfmAvgOrangesScored, forKey: SerializationKeys.lfmAvgOrangesScored)
    aCoder.encode(lfmPercentImpaired, forKey: SerializationKeys.lfmPercentImpaired)
    aCoder.encode(sdOrangeSuccessL1, forKey: SerializationKeys.sdOrangeSuccessL1)
    aCoder.encode(lfmLemonCycleL3, forKey: SerializationKeys.lfmLemonCycleL3)
    aCoder.encode(p75orangeSuccessUndefended, forKey: SerializationKeys.p75orangeSuccessUndefended)
    aCoder.encode(sdAvgLemonsScored, forKey: SerializationKeys.sdAvgLemonsScored)
    aCoder.encode(sdOrangeSuccessAll, forKey: SerializationKeys.sdOrangeSuccessAll)
    aCoder.encode(p75lemonSuccessAll, forKey: SerializationKeys.p75lemonSuccessAll)
    aCoder.encode(lfmAvgLemonsScored, forKey: SerializationKeys.lfmAvgLemonsScored)
    aCoder.encode(lemonCycleL1, forKey: SerializationKeys.lemonCycleL1)
    aCoder.encode(habLineSuccessL1, forKey: SerializationKeys.habLineSuccessL1)
    aCoder.encode(sdLemonSuccessUndefended, forKey: SerializationKeys.sdLemonSuccessUndefended)
    aCoder.encode(orangeCycleL2, forKey: SerializationKeys.orangeCycleL2)
    aCoder.encode(p75habLineSuccessL2, forKey: SerializationKeys.p75habLineSuccessL2)
    aCoder.encode(sdOrangeSuccessDefended, forKey: SerializationKeys.sdOrangeSuccessDefended)
    aCoder.encode(p75lemonSuccessFromSide, forKey: SerializationKeys.p75lemonSuccessFromSide)
    aCoder.encode(lfmAvgTimeClimbing, forKey: SerializationKeys.lfmAvgTimeClimbing)
    aCoder.encode(p75habLineSuccessL1, forKey: SerializationKeys.p75habLineSuccessL1)
    aCoder.encode(lemonSuccessUndefended, forKey: SerializationKeys.lemonSuccessUndefended)
    aCoder.encode(p75avgOrangesSpilled, forKey: SerializationKeys.p75avgOrangesSpilled)
    aCoder.encode(orangeSuccessL2, forKey: SerializationKeys.orangeSuccessL2)
    aCoder.encode(p75orangeSuccessAll, forKey: SerializationKeys.p75orangeSuccessAll)
    aCoder.encode(p75orangeCycleAll, forKey: SerializationKeys.p75orangeCycleAll)
    aCoder.encode(lfmLemonLoadSuccess, forKey: SerializationKeys.lfmLemonLoadSuccess)
    aCoder.encode(actualSeed, forKey: SerializationKeys.actualSeed)
    aCoder.encode(p75orangeSuccessDefended, forKey: SerializationKeys.p75orangeSuccessDefended)
    aCoder.encode(predictedDedicatedOrangeCycles, forKey: SerializationKeys.predictedDedicatedOrangeCycles)
    aCoder.encode(predictedSeed, forKey: SerializationKeys.predictedSeed)
    aCoder.encode(habLineSuccessL2, forKey: SerializationKeys.habLineSuccessL2)
    aCoder.encode(lemonCycleL3, forKey: SerializationKeys.lemonCycleL3)
    aCoder.encode(lemonSuccessFromSide, forKey: SerializationKeys.lemonSuccessFromSide)
    aCoder.encode(sdLemonCycleAll, forKey: SerializationKeys.sdLemonCycleAll)
    aCoder.encode(lfmOrangeCycleL1, forKey: SerializationKeys.lfmOrangeCycleL1)
    aCoder.encode(lemonSuccessL2, forKey: SerializationKeys.lemonSuccessL2)
    aCoder.encode(lfmOrangeSuccessDefended, forKey: SerializationKeys.lfmOrangeSuccessDefended)
    aCoder.encode(percentIncap, forKey: SerializationKeys.percentIncap)
    aCoder.encode(percentIncapEntireMatch, forKey: SerializationKeys.percentIncapEntireMatch)
    aCoder.encode(p75lemonSuccessDefended, forKey: SerializationKeys.p75lemonSuccessDefended)
    aCoder.encode(sdHabLineSuccessL2, forKey: SerializationKeys.sdHabLineSuccessL2)
    aCoder.encode(sdAvgTimeClimbing, forKey: SerializationKeys.sdAvgTimeClimbing)
    aCoder.encode(sdOrangeCycleAll, forKey: SerializationKeys.sdOrangeCycleAll)
    aCoder.encode(lfmLemonCycleAll, forKey: SerializationKeys.lfmLemonCycleAll)
    aCoder.encode(sdOrangeSuccessUndefended, forKey: SerializationKeys.sdOrangeSuccessUndefended)
    aCoder.encode(p75orangeSuccessL3, forKey: SerializationKeys.p75orangeSuccessL3)
    aCoder.encode(lemonSuccessL3, forKey: SerializationKeys.lemonSuccessL3)
    aCoder.encode(lfmLemonSuccessAll, forKey: SerializationKeys.lfmLemonSuccessAll)
    aCoder.encode(avgLemonsScored, forKey: SerializationKeys.avgLemonsScored)
    aCoder.encode(p75lemonCycleAll, forKey: SerializationKeys.p75lemonCycleAll)
    aCoder.encode(orangeSuccessL1, forKey: SerializationKeys.orangeSuccessL1)
    aCoder.encode(sdLemonSuccessL1, forKey: SerializationKeys.sdLemonSuccessL1)
    aCoder.encode(sdHabLineSuccessL1, forKey: SerializationKeys.sdHabLineSuccessL1)
    aCoder.encode(lfmLemonSuccessFromSide, forKey: SerializationKeys.lfmLemonSuccessFromSide)
    aCoder.encode(lfmAvgGoodDecisions, forKey: SerializationKeys.lfmAvgGoodDecisions)
    aCoder.encode(sdOrangeSuccessL3, forKey: SerializationKeys.sdOrangeSuccessL3)
    aCoder.encode(sdLemonCycleL3, forKey: SerializationKeys.sdLemonCycleL3)
    aCoder.encode(lfmOrangeCycleL2, forKey: SerializationKeys.lfmOrangeCycleL2)
    aCoder.encode(hasOrangeGroundIntake, forKey: SerializationKeys.hasOrangeGroundIntake)
    aCoder.encode(sdOrangeCycleL3, forKey: SerializationKeys.sdOrangeCycleL3)
    aCoder.encode(lfmHabLineSuccessL2, forKey: SerializationKeys.lfmHabLineSuccessL2)
    aCoder.encode(sdLemonCycleL1, forKey: SerializationKeys.sdLemonCycleL1)
    aCoder.encode(p75lemonSuccessL2, forKey: SerializationKeys.p75lemonSuccessL2)
    aCoder.encode(sdAvgGoodDecisions, forKey: SerializationKeys.sdAvgGoodDecisions)
    aCoder.encode(sdPercentImpaired, forKey: SerializationKeys.sdPercentImpaired)
    aCoder.encode(sdPercentNoShow, forKey: SerializationKeys.sdPercentNoShow)
    aCoder.encode(sdOrangeCycleL1, forKey: SerializationKeys.sdOrangeCycleL1)
    aCoder.encode(avgGoodDecisions, forKey: SerializationKeys.avgGoodDecisions)
    aCoder.encode(secondPickAbility, forKey: SerializationKeys.secondPickAbility)
    aCoder.encode(orangeCycleL1, forKey: SerializationKeys.orangeCycleL1)
    aCoder.encode(lfmLemonCycleL1, forKey: SerializationKeys.lfmLemonCycleL1)
    aCoder.encode(lfmLemonSuccessL2, forKey: SerializationKeys.lfmLemonSuccessL2)
    aCoder.encode(sdOrangeSuccessL2, forKey: SerializationKeys.sdOrangeSuccessL2)
    aCoder.encode(sdAvgBadDecisions, forKey: SerializationKeys.sdAvgBadDecisions)
    aCoder.encode(p75avgLemonsScored, forKey: SerializationKeys.p75avgLemonsScored)
    aCoder.encode(avgBadDecisions, forKey: SerializationKeys.avgBadDecisions)
    aCoder.encode(p75orangeCycleL3, forKey: SerializationKeys.p75orangeCycleL3)
    aCoder.encode(lfmAvgBadDecisions, forKey: SerializationKeys.lfmAvgBadDecisions)
    aCoder.encode(orangeAbility, forKey: SerializationKeys.orangeAbility)
    aCoder.encode(sdLemonCycleL2, forKey: SerializationKeys.sdLemonCycleL2)
    aCoder.encode(p75avgOrangesScored, forKey: SerializationKeys.p75avgOrangesScored)
    aCoder.encode(sdAvgOrangesScored, forKey: SerializationKeys.sdAvgOrangesScored)
    aCoder.encode(lfmOrangeSuccessL1, forKey: SerializationKeys.lfmOrangeSuccessL1)
    aCoder.encode(avgOrangesSpilled, forKey: SerializationKeys.avgOrangesSpilled)
    aCoder.encode(sdAvgOrangesSpilled, forKey: SerializationKeys.sdAvgOrangesSpilled)
    aCoder.encode(lemonLoadSuccess, forKey: SerializationKeys.lemonLoadSuccess)
    aCoder.encode(p75orangeCycleL2, forKey: SerializationKeys.p75orangeCycleL2)
    aCoder.encode(lemonSuccessDefended, forKey: SerializationKeys.lemonSuccessDefended)
    aCoder.encode(avgTimeClimbing, forKey: SerializationKeys.avgTimeClimbing)
    aCoder.encode(lfmOrangeSuccessUndefended, forKey: SerializationKeys.lfmOrangeSuccessUndefended)
    aCoder.encode(p75percentNoShow, forKey: SerializationKeys.p75percentNoShow)
    aCoder.encode(orangeSuccessUndefended, forKey: SerializationKeys.orangeSuccessUndefended)
    aCoder.encode(lfmLemonSuccessDefended, forKey: SerializationKeys.lfmLemonSuccessDefended)
    aCoder.encode(p75lemonSuccessL1, forKey: SerializationKeys.p75lemonSuccessL1)
    aCoder.encode(lfmAvgTimeImpaired, forKey: SerializationKeys.lfmAvgTimeImpaired)
    aCoder.encode(didPreloadLemon, forKey: SerializationKeys.didPreloadLemon)
    aCoder.encode(sdPercentIncap, forKey: SerializationKeys.sdPercentIncap)
    aCoder.encode(sdPercentIncapEntireMatch, forKey: SerializationKeys.sdPercentIncapEntireMatch)
    aCoder.encode(orangeSuccessDefended, forKey: SerializationKeys.orangeSuccessDefended)
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
    aCoder.encode(avgTimeImpaired, forKey: SerializationKeys.avgTimeImpaired)
    aCoder.encode(p75lemonCycleL1, forKey: SerializationKeys.p75lemonCycleL1)
    aCoder.encode(lfmHabLineSuccessL1, forKey: SerializationKeys.lfmHabLineSuccessL1)
    aCoder.encode(p75lemonCycleL3, forKey: SerializationKeys.p75lemonCycleL3)
    aCoder.encode(lfmOrangeCycleL3, forKey: SerializationKeys.lfmOrangeCycleL3)
    aCoder.encode(sdOrangeCycleL2, forKey: SerializationKeys.sdOrangeCycleL2)
    aCoder.encode(sdAvgTimeIncap, forKey: SerializationKeys.sdAvgTimeIncap)
    aCoder.encode(p75orangeSuccessL2, forKey: SerializationKeys.p75orangeSuccessL2)
    aCoder.encode(lfmOrangeSuccessL2, forKey: SerializationKeys.lfmOrangeSuccessL2)
    aCoder.encode(p75lemonSuccessL3, forKey: SerializationKeys.p75lemonSuccessL3)
    aCoder.encode(p75percentImpaired, forKey: SerializationKeys.p75percentImpaired)
    aCoder.encode(p75avgBadDecisions, forKey: SerializationKeys.p75avgBadDecisions)
    aCoder.encode(lfmPercentIncap, forKey: SerializationKeys.lfmPercentIncap)
    aCoder.encode(lfmPercentIncapEntireMatch, forKey: SerializationKeys.lfmPercentIncapEntireMatch)
    aCoder.encode(lemonSuccessAll, forKey: SerializationKeys.lemonSuccessAll)
    aCoder.encode(p75lemonSuccessUndefended, forKey: SerializationKeys.p75lemonSuccessUndefended)
    aCoder.encode(lfmLemonSuccessL1, forKey: SerializationKeys.lfmLemonSuccessL1)
    aCoder.encode(orangeSuccessAll, forKey: SerializationKeys.orangeSuccessAll)
    aCoder.encode(didPreloadOrange, forKey: SerializationKeys.didPreloadOrange)
    aCoder.encode(lemonSuccessL1, forKey: SerializationKeys.lemonSuccessL1)
    aCoder.encode(sdLemonLoadSuccess, forKey: SerializationKeys.sdLemonLoadSuccess)
    aCoder.encode(lfmOrangeCycleAll, forKey: SerializationKeys.lfmOrangeCycleAll)
    aCoder.encode(orangeCycleAll, forKey: SerializationKeys.orangeCycleAll)
    aCoder.encode(lfmAvgTimeIncap, forKey: SerializationKeys.lfmAvgTimeIncap)
    aCoder.encode(p75orangeSuccessL1, forKey: SerializationKeys.p75orangeSuccessL1)
    aCoder.encode(lfmLemonSuccessL3, forKey: SerializationKeys.lfmLemonSuccessL3)
    aCoder.encode(lfmOrangeSuccessAll, forKey: SerializationKeys.lfmOrangeSuccessAll)
    aCoder.encode(sdLemonSuccessAll, forKey: SerializationKeys.sdLemonSuccessAll)
    aCoder.encode(p75avgGoodDecisions, forKey: SerializationKeys.p75avgGoodDecisions)
    aCoder.encode(firstPickAbility, forKey: SerializationKeys.firstPickAbility)
    aCoder.encode(lfmAvgOrangesSpilled, forKey: SerializationKeys.lfmAvgOrangesSpilled)
    aCoder.encode(avgLemonsSpilled, forKey: SerializationKeys.avgLemonsSpilled)
    aCoder.encode(p75avgLemonsSpilled, forKey: SerializationKeys.p75avgLemonsSpilled)
    aCoder.encode(lfmAvgLemonsSpilled, forKey: SerializationKeys.lfmAvgLemonsSpilled)
    aCoder.encode(sdAvgLemonsSpilled, forKey: SerializationKeys.sdAvgLemonsSpilled)
  }

}
