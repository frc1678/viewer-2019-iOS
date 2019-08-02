//
//  Utils.swift
//  scout-viewer-2016-iOS
//
//  Created by Citrus Circuits on 2/19/15.
//  Copyright (c) 2016 Citrus Circuits. All rights reserved.
//
import Foundation


/**
 Rounds a value.
 - parameter value: Value to be rounded
 - parameter numDecimalPlaces: How many decimal places it should be rounded to
 */
func roundValue(_ value: AnyObject?, toDecimalPlaces numDecimalPlaces: Int) -> String {
    if let val = value as? NSNumber {
        let f = NumberFormatter()
        f.numberStyle = NumberFormatter.Style.decimal
        f.maximumFractionDigits = numDecimalPlaces
        
        if val == 0 {
            return "0"
        }
        // Hack
        return f.string(from: val as NSNumber!)!
    }
    
    return ""
}

/**
 Converts a float value into a percentage.
 - parameter number: Float value
 */
func percentageValueOf(_ number: AnyObject?) -> String {
    if let n = number as? Float {
        return "\(roundValue(NSNumber(value: n * 100), toDecimalPlaces: 1))%"
    }
    
    return ""
}

/**
 Inserts commas and spaces between capitals in a string.
 - parameter string: String to be change
 */
func insertCommasAndSpacesBetweenCapitalsInString(_ string: String) -> String {
    var toReturn = ""
    for char in string.characters {
        if "\(char)".uppercased() == "\(char)" {
            toReturn += ", \(char)"
        } else {
            toReturn.append(char)
        }
    }
    
    for _ in 0...1 {
        toReturn.remove(at: string.startIndex)
    }
    
    return toReturn
}

/**
 Turns an NSNumArray into an Int Array
 - parameter nsNumberArray: NSNumberArray to be converted
 */
func nsNumArrayToIntArray(_ nsNumberArray: [NSNumber]) -> [Int] {
    var values: [Int] = []
    for num in nsNumberArray {
        if let int = Int("\(num)") {
            values.append(int)
        }
    }
    
    return values
}

/**
 A class filled with undoubtably underwhelmingly useful utilities.
 */
@objc class Utils: NSObject {
    static let teamDetailsKeys = TeamDetailsKeys()
    struct TeamDetailsKeys {
        
        let yesNoKeys : [String] = [
            "pitHasCamera",
            "pitIsPanelSpecialist",
            "calculatedData.hasCargoGroundIntake",
            "calculatedData.hasPanelGroundIntake"
        ]

        let abilityKeys = [
            "calculatedData.firstPickAbility",
            "calculatedData.secondPickAbility",
            "calculatedData.avgSpeed",
            "calculatedData.avgDefense",
            "calculatedData.actualNumRPs",
            "calculatedData.predictedRPs"
        ]

        let allTeamKeys = [
            "pitWidth",
            "pitLength",
            "pitWeight",
            "pitWheelDiameter",
            "pitDrivetrain",
            "pitProgrammingLanguage",
            "pitClimbType",
            "pitHasCamera",
            "pitSEALsRampRanking",
            "pitIsPanelSpecialist",
            "pitNumDriveTrainMotors",
            "pitDriveTrainMotorType",
            "teamNumber",
            "name",
            "matchesPlayed",
            "actualRPs",
            "calculatedData.totalNotes",
            "actualSeed",
            "calculatedData.pushAbility",
            "calculatedData.predictedRPs",
            "calculatedData.predictedSeed",
            "calculatedData.hasCargoGroundIntake",
            "calculatedData.hasPanelGroundIntake",
            "calculatedData.didPreloadCargo",
            "calculatedData.didPreloadPanel",
            "calculatedData.avgCargoScored",
            "calculatedData.avgCargoScoredL1",
            "calculatedData.avgCargoScoredL2",
            "calculatedData.avgCargoScoredL3",
            "calculatedData.cargoScored",
            "calculatedData.cargoScoredL1",
            "calculatedData.cargoScoredL2",
            "calculatedData.cargoScoredL3",
            "calculatedData.avgCargoScoredSandstorm",
            "calculatedData.avgCargoScoredTeleL1",
            "calculatedData.avgCargoScoredTeleL2",
            "calculatedData.avgCargoScoredTeleL3",
            "calculatedData.avgPanelsScored",
            "calculatedData.avgPanelsScoredL1",
            "calculatedData.avgPanelsScoredL2",
            "calculatedData.avgPanelsScoredL3",
            "calculatedData.avgPanelsScoredSandstorm",
            "calculatedData.avgPanelsScoredTeleL1",
            "calculatedData.avgPanelsScoredTeleL2",
            "calculatedData.avgPanelsScoredTeleL3",
            "calculatedData.avgPinningFouls",
            "calculatedData.panelLoadSuccess",
            "calculatedData.cargoCycleAll",
            "calculatedData.cargoCycleL1",
            "calculatedData.cargoCycleL2",
            "calculatedData.cargoCycleL3",
            "calculatedData.panelCycleAll",
            "calculatedData.panelCycleL1",
            "calculatedData.panelCycleL2",
            "calculatedData.panelCycleL3",
            "calculatedData.cargoSuccessAll",
            "calculatedData.cargoSuccessDefended",
            "calculatedData.cargoSuccessUndefended",
            "calculatedData.cargoSuccessL1",
            "calculatedData.cargoSuccessL2",
            "calculatedData.cargoSuccessL3",
            "calculatedData.panelSuccessAll",
            "calculatedData.panelSuccessDefended",
            "calculatedData.panelSuccessUndefended",
            "calculatedData.panelSuccessL1",
            "calculatedData.panelSuccessL2",
            "calculatedData.panelSuccessL3",
            "calculatedData.panelSuccessFromSide",
            "calculatedData.habLineSuccessL1",
            "calculatedData.habLineSuccessL2",
            "calculatedData.habLineAttemptsL1",
            "calculatedData.habLineAttemptsL2",
            "calculatedData.avgTimeIncap",
            "calculatedData.avgTimeClimbing",
            "calculatedData.percentDysfunctional",
            "calculatedData.percentIncap",
            "calculatedData.percentIncapEntireMatch",
            "calculatedData.percentNoShow",
            "calculatedData.predictedDedicatedPanelCycles",
            "calculatedData.predictedDedicatedCargoCycles",
            "calculatedData.predictedSoloPoints",
            "calculatedData.cargoAbility",
            "calculatedData.panelAbility",
            "calculatedData.firstPickAbility",
            "calculatedData.secondPickAbility",
            "calculatedData.lfmAvgCargoScored",
            "calculatedData.lfmAvgPanelsScored",
            "calculatedData.lfmAvgPinningFouls",
            "calculatedData.lfmPanelLoadSuccess",
            "calculatedData.lfmCargoCycleAll",
            "calculatedData.lfmCargoCycleL1",
            "calculatedData.lfmCargoCycleL2",
            "calculatedData.lfmCargoCycleL3",
            "calculatedData.lfmPanelCycleAll",
            "calculatedData.lfmPanelCycleL1",
            "calculatedData.lfmPanelCycleL2",
            "calculatedData.lfmPanelCycleL3",
            "calculatedData.lfmCargoSuccessAll",
            "calculatedData.lfmCargoSuccessDefended",
            "calculatedData.lfmCargoSuccessUndefended",
            "calculatedData.lfmCargoSuccessL1",
            "calculatedData.lfmCargoSuccessL2",
            "calculatedData.lfmCargoSuccessL3",
            "calculatedData.lfmPanelSuccessAll",
            "calculatedData.lfmPanelSuccessDefended",
            "calculatedData.lfmPanelSuccessUndefended",
            "calculatedData.lfmPanelSuccessL1",
            "calculatedData.lfmPanelSuccessL2",
            "calculatedData.lfmPanelSuccessL3",
            "calculatedData.lfmPanelSuccessFromSide",
            "calculatedData.lfmHabLineSuccessL1",
            "calculatedData.lfmHabLineSuccessL2",
            "calculatedData.lfmAvgTimeIncap",
            "calculatedData.lfmAvgTimeClimbing",
            "calculatedData.lfmPercentIncap",
            "calculatedData.lfmPercentIncapEntireMatch",
            "calculatedData.lfmPercentNoShow",
            "calculatedData.sdAvgCargoScored",
            "calculatedData.sdAvgPanelsScored",
            "calculatedData.sdAvgPinningFouls",
            "calculatedData.sdPanelLoadSuccess",
            "calculatedData.sdCargoCycleAll",
            "calculatedData.sdCargoCycleL1",
            "calculatedData.sdCargoCycleL2",
            "calculatedData.sdCargoCycleL3",
            "calculatedData.sdPanelCycleAll",
            "calculatedData.sdPanelCycleL1",
            "calculatedData.sdPanelCycleL2",
            "calculatedData.sdPanelCycleL3",
            "calculatedData.sdCargoSuccessAll",
            "calculatedData.sdCargoSuccessDefended",
            "calculatedData.sdCargoSuccessUndefended",
            "calculatedData.sdCargoSuccessL1",
            "calculatedData.sdCargoSuccessL2",
            "calculatedData.sdCargoSuccessL3",
            "calculatedData.sdPanelSuccessAll",
            "calculatedData.sdPanelSuccessDefended",
            "calculatedData.sdPanelSuccessUndefended",
            "calculatedData.sdPanelSuccessL1",
            "calculatedData.sdPanelSuccessL2",
            "calculatedData.sdPanelSuccessL3",
            "calculatedData.sdPanelSuccessFromSide",
            "calculatedData.sdHabLineSuccessL1",
            "calculatedData.sdHabLineSuccessL2",
            "calculatedData.sdAvgTimeIncap",
            "calculatedData.sdAvgTimeClimbing",
            "calculatedData.sdPercentIncap",
            "calculatedData.sdPercentIncapEntireMatch",
            "calculatedData.sdPercentNoShow",
            "calculatedData.p75avgCargoScored",
            "calculatedData.p75avgPanelsScored",
            "calculatedData.p75avgPinningFouls",
            "calculatedData.p75panelLoadSuccess",
            "calculatedData.p75cargoCycleAll",
            "calculatedData.p75cargoCycleL1",
            "calculatedData.p75cargoCycleL2",
            "calculatedData.p75cargoCycleL3",
            "calculatedData.p75panelCycleAll",
            "calculatedData.p75panelCycleL1",
            "calculatedData.p75panelCycleL2",
            "calculatedData.p75panelCycleL3",
            "calculatedData.p75cargoSuccessAll",
            "calculatedData.p75cargoSuccessDefended",
            "calculatedData.p75cargoSuccessUndefended",
            "calculatedData.p75cargoSuccessL1",
            "calculatedData.p75cargoSuccessL2",
            "calculatedData.p75cargoSuccessL3",
            "calculatedData.p75panelSuccessAll",
            "calculatedData.p75panelSuccessDefended",
            "calculatedData.p75panelSuccessUndefended",
            "calculatedData.p75panelSuccessL1",
            "calculatedData.p75panelSuccessL2",
            "calculatedData.p75panelSuccessL3",
            "calculatedData.p75panelSuccessFromSide",
            "calculatedData.p75habLineSuccessL1",
            "calculatedData.p75habLineSuccessL2",
            "calculatedData.p75avgTimeIncap",
            "calculatedData.p75avgTimeClimbing",
            "calculatedData.p75percentIncap",
            "calculatedData.p75percentIncapEntireMatch",
            "calculatedData.p75percentNoShow",
            "calculatedData.climbAttemptsL1",
            "calculatedData.climbAttemptsL2",
            "calculatedData.climbAttemptsL3",
            "calculatedData.climbSuccessL1",
            "calculatedData.climbSuccessL2",
            "calculatedData.climbSuccessL3",
            "calculatedData.selfClimbLevel",
            "calculatedData.robot1ClimbLevel",
            "calculatedData.robot2ClimbLevel",
            "calculatedData.failedCyclesCaused",
            "calculatedData.avgRankDefense",
            "calculatedData.totalTimeDefending",
            "calculatedData.timeDefending",
            "calculatedData.totalFailedCyclesCaused",
            "calculatedData.avgFailedCyclesCaused",
            "calculatedData.failedCyclesCausedPerSecond",
            "calculatedData.lastMatch",
            "calculatedData.avgTimeDefending",
            "calculatedData.matchesDefended",
            "calculatedData.avgPointsPrevented",
            "calculatedData.avgPanelPointsPrevented",
            "calculatedData.avgCargoPointsPrevented",
            "calculatedData.pointsPrevented",
            "calculatedData.panelPointsPrevented",
            "calculatedData.cargoPointsPrevented"
        ]

        /**
         Values that should not be graphed
         */
        let notGraphingValues = [
            "First Pick Ability",
            "Second Pick Ability",
            "Avg. Driving Ability",
            "Picklist Position",
            "Percent Incap",
            "Percent Entirely Incap Matches",
            "Cargo Ground Intake",
            "Panel Ground Intake",
            "Lvl. 1 Climb Attempts",
            "Lvl. 2 Climb Attempts",
            "Lvl. 3 Climb Attempts",
            "Lvl. 1 Hab Line Attempts"
        ]

        /** Values that should be displayed as long text cells */
        let TIMDLongTextCells : [String] = [
            ]

        let longTextCells : [String] = [
            "pitSEALsNotes",
            "pitClimbType",
        ]

        let unrankedCells = [
            "selectedImageURL",
            "otherUrls",
            "calculatedData.climbAttemptsL1",
            "calculatedData.climbAttemptsL2",
            "calculatedData.climbAttemptsL3",
            "calculatedData.habLineAttemptsL1",
            "calculatedData.habLineAttemptsL2"
        ]

        /** Values to be displayed as percentages. */
        let percentageValues : [String] = [
        ]

        let addCommasBetweenCapitals : [String] = []

        let boolValues = [
            "pitHasCamera",
            "pitIsPanelSpecialist",
            "calculatedData.hasCargoGroundIntake",
            "calculatedData.hasPanelGroundIntake"
        ]


        let keySetNamesOld = [
            "Information",
            "Ability - High Level",
            "Autonomous",
            "TeleOp",
            "Percentages",
            "Pit Scouting / Robot Design",
            "Additional Info"
        ]
        // MARK: KeySets, TeamDetails keys.
        func keySetNames(_ minimalist : Bool) -> [String] {
            if minimalist {
                return  [
                    "",
                    //"High Level",
                    "Autonomous",
                    "Teleoperated",
                    "Siege",
                    "Status"
                    //superKeys,
                    //pitKeys,
                    //"SEALS"
                ]
            }
            return [
                "Default",
                "Status",
                "Autonomous",
                "Teleoperated",
                "Defense",
                "End Game",
                "Pit Scout",
                "SEALs",
                "High Level",
            ]
        }
        
        /** Sections of teamDetails view. */
        func keySets(_ minimalist : Bool) -> [[String]] {
            return [
                defaultKeys,
                statusKeys,
                autoKeys,
                teleKeys,
                defenseKeys,
                endGame,
                pitKeys,
                sealKeys,
                highLevel,
            ]
        }

        /** Segues to schedules, things unrelated to data */
        let defaultKeys = [
            "TeamInMatchDatas",
            "matchDatas"
        ]

        let highLevel : [String] = [ //needed
            "calculatedData.firstPickAbility",
            "calculatedData.secondPickAbility"
        ]

        /** Keys relating to autonomous to be displayed on teamDetails. */
        let autoKeys: [String] = [
            //Some stuff is not needed
            "calculatedData.habLineSuccessL1",
            "calculatedData.habLineSuccessL2",
            "calculatedData.habLineAttemptsL1",
            "calculatedData.habLineAttemptsL2",
        ]

        /** Keys relating to Teleoperated to be displayed on teamDetails */
        let teleKeys: [String] = [
            "calculatedData.hasCargoGroundIntake",
            "calculatedData.hasPanelGroundIntake",
            "calculatedData.avgCargoScored",
            "calculatedData.avgPanelsScored",
            "calculatedData.avgPinningFouls",
        ]
        
        let defenseKeys: [String] = [
            "calculatedData.totalTimeDefending",
            "calculatedData.avgPointsPrevented",
            "calculatedData.avgPanelPointsPrevented",
            "calculatedData.avgCargoPointsPrevented"
        ]
        
        /** Dict translating a key for a teamDetails datapoint to the key for the respective TIMD datapoint. Does not include "calculatedData." in the keys. */
        let teamDetailsToTIMD = [

            //status
            "avgTimeIncap" : "calculatedData.timeIncap",
            "percentNoShow" : "isNoShow",

            //scoring stuff
            "avgCargoScored" : "calculatedData.cargoScored",
            "avgCargoScoredL1" : "calculatedData.cargoScoredL1",
            "avgCargoScoredL2" : "calculatedData.cargoScoredL2",
            "avgCargoScoredL3" : "calculatedData.cargoScoredL3",
            "avgCargoScoredSandstorm" : "calculatedData.cargoScoredSandstorm",
            "avgCargoScoredTeleL1" : "calculatedData.cargoScoredTeleL1",
            "avgCargoScoredTeleL2" : "calculatedData.cargoScoredTeleL2",
            "avgCargoScoredTeleL3" : "calculatedData.cargoScoredTeleL3",
            "avgPanelsScored" : "calculatedData.panelsScored",
            "avgPanelsScoredL1" : "calculatedData.panelsScoredL1",
            "avgPanelsScoredL2" : "calculatedData.panelsScoredL2",
            "avgPanelsScoredL3" : "calculatedData.panelsScoredL3",
            "avgPanelsScoredSandstorm" : "calculatedData.panelsScoredSandstorm",
            "avgPanelsScoredTeleL1" : "calculatedData.panelsScoredTeleL1",
            "avgPanelsScoredTeleL2" : "calculatedData.panelsScoredTeleL2",
            "avgPanelsScoredTeleL3" : "calculatedData.panelsScoredTeleL3",
            "avgPinningFouls" : "calculatedData.pinningFouls",
            "habLineSuccessL1" : "crossedHabLine",
            "habLineSuccessL2" : "crossedHabLine",
            "avgTimeClimbing" : "calculatedData.timeClimbing",
            "climbSuccessL1" : "calculatedData.selfClimbLevel",
            "climbSuccessL2" : "calculatedData.selfClimbLevel",
            "climbSuccessL3" : "calculatedData.selfClimbLevel",

            //super data
            "avgSpeed" : "rankSpeed",
            "avgAgility" : "rankAgility",
            "avgDrivingAbility" : "calculatedData.drivingAbility",
            "avgDefense" : "rankDefense",

            //RScore super data
            "RScoreDrivingAbility" : "calculatedData.drivingAbility",
            "RScoreAgility" : "rankAgility",
            "RScoreDefense" : "rankDefense",
            "RScoreSpeed" : "rankSpeed",

            //Misc
            "actualNumRPs" : "calculatedData.numRPs",
            "numAutoPoints" : "calculatedData.numAutoPoints",
            "failedCyclesCaused" : "calculatedData.totalFailedCyclesCaused",
            "avgRankDefense" : "calculatedData.avgRankDefense",
            "totalTimeDefending" : "calculatedData.timeDefending",
            "avgPointsPrevented" : "calculatedData.pointsPrevented",
            "avgPanelPointsPrevented" : "calculatedData.panelPointsPrevented",
            "avgCargoPointsPrevented" : "calculatedData.cargoPointsPrevented"
        ]

        /** Keys relating to the portions of the game that occur in the end (climbing, challenging, etc) */
        let endGame : [String] = [
            "calculatedData.avgTimeClimbing",
            "calculatedData.climbAttemptsL1",
            "calculatedData.climbAttemptsL2",
            "calculatedData.climbAttemptsL3",
            "calculatedData.climbSuccessL1",
            "calculatedData.climbSuccessL2",
            "calculatedData.climbSuccessL3"
        ]

        /** Keys relating to the status of a robot to be displayed on teamDetails */
        let statusKeys : [String] = [
            "calculatedData.avgTimeIncap",
            "calculatedData.percentIncap",
            "calculatedData.percentIncapEntireMatch",
            "calculatedData.percentNoShow"
        ]
        
        /** calculatedData keys that are strings in the database */
        let calculatedStrings : [String] = [
            "calculatedData.climbAttemptsL1",
            "calculatedData.climbAttemptsL2",
            "calculatedData.climbAttemptsL3",
            "calculatedData.habLineAttemptsL1",
            "calculatedData.habLineAttemptsL2"
        ]

        /** Keys relating to the data the pit scout collects to be displayed on teamDetails */
        let pitKeys = [
            "pitDrivetrain",
            "pitWidth",
            "pitLength",
            "pitProgrammingLanguage",
            "pitWheelDiameter",
            "pitHasCamera",
            "pitWeight",
            "pitClimbType",
            "pitSEALsRampRanking",
            "pitIsPanelSpecialist",
            "pitNumDriveTrainMotors",
            "pitDriveTrainMotorType"
        ]
        /** pitKeys that are strings */
        let pitStrings = [
            "pitDrivetrain",
            "pitProgrammingLanguage",
            "pitWheelDiameter",
            "pitDriveTrainMotorType"
        ]
        /** pitKeys that are integers */
        let pitInts = [
            "pitWidth",
            "pitLength",
            "pitSEALsRampRanking",
            "pitNumDriveTrainMotors"
        ]

        /** Data collected by SEALS */
        let sealKeys = [
            "pitSEALsNotes",
            ]

        /** Human readable names for CTIMD keys */
        let calculatedTeamInMatchDataHumanReadableKeys = [
            "First Pick Ability",
            "R Score Speed",
            "Number of RPs",
            "R Score Defense",
            "R Score Driving Ability",
            "Second Pick Ability",
            "Overall Second Pick Ability",
            "Score Contribution"
        ]
    }

    /*static let superKeys = [
        "calculatedData.avgDrivingAbility",
        "calculatedData.avgSpeed",
        "calculatedData.avgAgility",
        "calculatedData.avgDefense",
        "calculatedData.totalNumGoodDecisions",
        "calculatedData.totalNumBadDecisions"
    ]*/

    static let statusKeys : [String] = []
    static let miscKeys = ["uploadedData.miscellaneousNotes"]

    /** Keys that should be booleans in graphs */
    static let boolGraphs : [String] = [
    ]

    // MARK: TIMD keys
    /** Keys relating to the Autonomous period to be displayed in the TIMD view */
    static let TIMDAutoKeys : [String] = [
        "startingLevel",
        "crossedHabLine",
        "startingLocation",
        "preload",
    ]

    /** Keys relating to the Teleoperated period to be displayed in the TIMD view */
    static let TIMDTeleKeys : [String] = [
        "calculatedData.cargoScored",
        "calculatedData.panelsScored",
        "calculatedData.panelLoadSuccess",
        "calculatedData.cargoSuccessDefended",
        "calculatedData.cargoSuccessL2",
        "calculatedData.cargoSuccessL3",
        "calculatedData.panelSuccessDefended",
        "calculatedData.panelSuccessL2",
        "calculatedData.panelSuccessL3",
        "calculatedData.timeClimbing",
        "calculatedData.panelsSpilled",
    ]

    /** Keys relating to the status of a robot to be displayed in the TIMD view */
    static let TIMDStatusKeys : [String] = [
        "isNoShow",
        "calculatedData.timeIncap"
    ]

    /** Keys relating to the data Super Scouts collect to be displayed in the TIMD view */
    static let TIMDSuperKeys = [
        "rankSpeed",
        "rankAgility",
        //"rankDefense",
    ]

    /** All sections of the TIMD view */
    static let TIMDKeys = [
        TIMDAutoKeys,
        TIMDTeleKeys,
        TIMDStatusKeys,
        TIMDSuperKeys
    ]

    /** A dictionary turning TIMD keys into teamDetails keys */
    static let graphTitleSwitch = [
        "calculatedData.RScoreSpeed" : "calculatedData.avgSpeed",
    ]

    /** Team Details keys? */
    static let teamCalcKeys = [
        "actualSeed",
        "avgDefense",
        "avgSpeed",
        "firstPickAbility",
        "actualNumRPs",
        "predictedRPs",
        "predictedSeed",
        "secondPickAbility"
    ]

    /** Calculated TIMD keys */
    static let calculatedTeamInMatchDataKeys = [
        "calculatedData.firstPickAbility",
        "calculatedData.numRPs",
        "calculatedData.secondPickAbility"
    ]

    /** A dictionary with datapoints as keys and Human Readable versions as values */
    static let humanReadableNames = [
        "pitWidth" : "Robot Width",
        "pitLength" : "Robot Length",
        "pitWeight" : "Robot Weight",
        "pitWheelDiameter" : "Wheel Diameter",
        "pitDrivetrain" : "Drive Train",
        "pitProgrammingLanguage" : "Programming Language",
        "pitClimbType" : "Climb Type",
        "pitHasCamera" : "Has Camera",
        "pitSEALsRampRanking" : "Ramp Ability",
        "pitIsPanelSpecialist" : "Hatch Specialist",
        "pitNumDriveTrainMotors" : "# of Motors on Drive Train",
        "pitDriveTrainMotorType" : "Type of Motor on Drive Train",
        "teamNumber" : "Team Number",
        "name" : "Name",
        "matchesPlayed" : "Matches Played",
        "actualRPs" : "Avg. RPs",
        "matchDatas" : "Matches",
        "calculatedData" : "Calculated Data",
        "actualSeed" : "Seed",
        "calculatedData.pushAbility" : "Push Ability",
        "calculatedData.totalNotes" : "All Super Notes",
        "calculatedData.predictedRPs" : "Predicted RPs",
        "calculatedData.predictedSeed" : "Predicted Seed",
        "calculatedData.hasCargoGroundIntake" : "Cargo Ground Intake",
        "calculatedData.hasPanelGroundIntake" : "Panel Ground Intake",
        "calculatedData.didPreloadCargo" : "Has Preloaded Cargo",
        "calculatedData.didPreloadPanel" : "Has Preloaded Panel",
        "calculatedData.avgCargoScored" : "Avg. Cargo Scored",
        "calculatedData.avgCargoScoredL1" : "Avg. Cargo Scored in Lvl 1",
        "calculatedData.avgCargoScoredL2" : "Avg. Cargo Scored in Lvl 2",
        "calculatedData.avgCargoScoredL3" : "Avg. Cargo Scored in Lvl 3",
        "calculatedData.avgCargoScoredSandstorm" : "Avg. Cargo Scored in Sandstorm",
        "calculatedData.avgCargoScoredTeleL1" : "Avg. Cargo Scored in Lvl 1 Tele",
        "calculatedData.avgCargoScoredTeleL2" : "Avg. Cargo Scored in Lvl 2 Tele",
        "calculatedData.avgCargoScoredTeleL3" : "Avg. Cargo Scored in Lvl 3 Tele",
        "calculatedData.avgPanelsScored" : "Avg. Panels Scored",
        "calculatedData.avgPanelsScoredL1" : "Avg. Panels Scored in Lvl 1",
        "calculatedData.avgPanelsScoredL2" : "Avg. Panels Scored in Lvl 2",
        "calculatedData.avgPanelsScoredL3" : "Avg. Panels Scored in Lvl 3",
        "calculatedData.avgPanelsScoredSandstorm" : "Avg. Panels Scored in Sandstorm",
        "calculatedData.avgPanelsScoredTeleL1" : "Avg. Panels Scored in Lvl 1 Tele",
        "calculatedData.avgPanelsScoredTeleL2" : "Avg. Panels Scored in Lvl 2 Tele",
        "calculatedData.avgPanelsScoredTeleL3" : "Avg. Panels Scored in Lvl 3 Tele",
        "calculatedData.avgPinningFouls" : "Avg. Pinning Fouls",
        "calculatedData.cargoCycleAll" : "Cargo Cycle Times",
        "calculatedData.cargoCycleL1" : "Cargo Cycle L1",
        "calculatedData.cargoCycleL2" : "Cargo Cycle L2",
        "calculatedData.cargoCycleL3" : "Cargo Cycle L3",
        "calculatedData.panelCycleAll" : "Panel Cycle Times",
        "calculatedData.panelCycleL1" : "Panel Cycle L1",
        "calculatedData.panelCycleL2" : "Panel Cycle L2",
        "calculatedData.panelCycleL3" : "Panel Cycle L3",
        "calculatedData.cargoSuccessAll" : "Cargo Success",
        "calculatedData.cargoSuccessDefended" : "Cargo Defended Success",
        "calculatedData.cargoSuccessUndefended" : "Cargo Undefended Success",
        "calculatedData.cargoSuccessL1" : "Cargo Success L1",
        "calculatedData.cargoSuccessL2" : "Cargo Success L2",
        "calculatedData.cargoSuccessL3" : "Cargo Success L3",
        "calculatedData.panelSuccessAll" : "Panel Success",
        "calculatedData.panelSuccessDefended" : "Panel Defended Success",
        "calculatedData.panelSuccessUndefended" : "Panel Undefended Success",
        "calculatedData.panelSuccessL1" : "Panel Success L1",
        "calculatedData.panelSuccessL2" : "Panel Success L2",
        "calculatedData.panelSuccessL3" : "Panel Success L3",
        "calculatedData.panelSuccessFromSide" : "Panel Side Success",
        "calculatedData.habLineSuccessL1" : "Hab Line Success L1",
        "calculatedData.habLineSuccessL2" : "Hab Line Success L2",
        "calculatedData.habLineAttemptsL1" : "Hab Line Attempts L1",
        "calculatedData.habLineAttemptsL2" : "Hab Line Attempts L2",
        "calculatedData.avgTimeIncap" : "Avg. Time Incap",
        "calculatedData.avgTimeClimbing" : "Avg. Time Climbing",
        "calculatedData.percentDysfunctional" : "Percent Dysfuntional",
        "calculatedData.percentIncap" : "Percent Incap",
        "calculatedData.percentIncapEntireMatch" : "Percent Entirely Incap Matches",
        "calculatedData.percentNoShow" : "Percent No Show",
        "calculatedData.predictedDedicatedPanelCycles" : "Predicted Panel Cycle Time",
        "calculatedData.predictedDedicatedCargoCycles" : "Predicted Cargo Cycle Time",
        "calculatedData.predictedSoloPoints" : "Predicted Solo Points",
        "calculatedData.cargoAbility" : "Cargo Ability",
        "calculatedData.panelAbility" : "Panel Ability",
        "calculatedData.firstPickAbility" : "First Pick Ability",
        "calculatedData.secondPickAbility" : "Second Pick Ability",
        "calculatedData.lfmAvgCargoScored" : "LFM Avg. Cargo Scored",
        "calculatedData.lfmAvgPanelsScored" : "LFM Avg. Panels Scored",
        "calculatedData.lfmAvgPinningFouls" : "LFM Avg. Pinning Fouls",
        "calculatedData.lfmPanelLoadSuccess" : "LFM Panel Loading Success",
        "calculatedData.lfmCargoCycleAll" : "LFM Cargo Cycle Times",
        "calculatedData.lfmCargoCycleL1" : "LFM Cargo Cycle L1",
        "calculatedData.lfmCargoCycleL2" : "LFM Cargo Cycle L2",
        "calculatedData.lfmCargoCycleL3" : "LFM Cargo Cycle L3",
        "calculatedData.lfmPanelCycleAll" : "LFM Panel Cycle Times",
        "calculatedData.lfmPanelCycleL1" : "LFM Panel Cycle L1",
        "calculatedData.lfmPanelCycleL2" : "LFM Panel Cycle L2",
        "calculatedData.lfmPanelCycleL3" : "LFM Panel Cycle L3",
        "calculatedData.lfmCargoSuccessAll" : "LFM Cargo Success",
        "calculatedData.lfmCargoSuccessDefended" : "LFM Defended Cargo Success",
        "calculatedData.lfmCargoSuccessUndefended" : "LFM Undefended Cargo Success",
        "calculatedData.lfmCargoSuccessL1" : "LFM Cargo Success L1",
        "calculatedData.lfmCargoSuccessL2" : "LFM Cargo Success L2",
        "calculatedData.lfmCargoSuccessL3" : "LFM Cargo Success L3",
        "calculatedData.lfmPanelSuccessAll" : "LFM Panel Success",
        "calculatedData.lfmPanelSuccessDefended" : "LFM Defended Panel Success",
        "calculatedData.lfmPanelSuccessUndefended" : "LFM Undefended Panel Success",
        "calculatedData.lfmPanelSuccessL1" : "LFM Panel Success L1",
        "calculatedData.lfmPanelSuccessL2" : "LFM Panel Success L2",
        "calculatedData.lfmPanelSuccessL3" : "LFM Panel Success L3",
        "calculatedData.lfmPanelSuccessFromSide" : "LFM Panel Side Success",
        "calculatedData.lfmHabLineSuccessL1" : "LFM Hab Line Success L1",
        "calculatedData.lfmHabLineSuccessL2" : "LFM Hab Line Success L2",
        "calculatedData.lfmAvgTimeIncap" : "LFM Avg. Time Incap",
        "calculatedData.lfmAvgTimeClimbing" : "LFM Avg. Time Climbing",
        "calculatedData.lfmPercentIncap" : "LFM Percent Incap",
        "calculatedData.lfmPercentIncapEntireMatch" : "LFM Percent Entirely Incap Matches",
        "calculatedData.lfmPercentNoShow" : "LFM Percent No Show",
        "calculatedData.sdAvgCargoScored" : "σ Cargo Scored",
        "calculatedData.sdAvgPanelsScored" : "σ Panels Scored",
        "calculatedData.sdAvgPinningFouls" : "σ Pinning Fouls",
        "calculatedData.sdPanelLoadSuccess" : "σ Panel Loading Success",
        "calculatedData.sdCargoCycleAll" : "σ Cargo Cycle Times",
        "calculatedData.sdCargoCycleL1" : "σ Cargo Cycle L1",
        "calculatedData.sdCargoCycleL2" : "σ Cargo Cycle L2",
        "calculatedData.sdCargoCycleL3" : "σ Cargo Cycle L3",
        "calculatedData.sdPanelCycleAll" : "σ Panel Cycle Times",
        "calculatedData.sdPanelCycleL1" : "σ Panel Cycle L1",
        "calculatedData.sdPanelCycleL2" : "σ Panel Cycle L2",
        "calculatedData.sdPanelCycleL3" : "σ Panel Cycle L3",
        "calculatedData.sdCargoSuccessAll" : "σ Cargo Success",
        "calculatedData.sdCargoSuccessDefended" : "σ Defended Cargo Success",
        "calculatedData.sdCargoSuccessUndefended" : "σ Undefended Cargo Success",
        "calculatedData.sdCargoSuccessL1" : "σ Cargo Success L1",
        "calculatedData.sdCargoSuccessL2" : "σ Cargo Success L2",
        "calculatedData.sdCargoSuccessL3" : "σ Cargo Success L3",
        "calculatedData.sdPanelSuccessAll" : "σ Panel Success",
        "calculatedData.sdPanelSuccessDefended" : "σ Defended Panel Success",
        "calculatedData.sdPanelSuccessUndefended" : "σ Undefended Panel Success",
        "calculatedData.sdPanelSuccessL1" : "σ Panel Success L1",
        "calculatedData.sdPanelSuccessL2" : "σ Panel Success L2",
        "calculatedData.sdPanelSuccessL3" : "σ Panel Success L3",
        "calculatedData.sdPanelSuccessFromSide" : "σ Panel Side Success",
        "calculatedData.sdHabLineSuccessL1" : "σ Hab Line Success L1",
        "calculatedData.sdHabLineSuccessL2" : "σ Hab Line Success L2",
        "calculatedData.sdAvgTimeIncap" : "σ Time Incap",
        "calculatedData.sdAvgTimeClimbing" : "σ Time Climbing",
        "calculatedData.sdPercentIncap" : "σ Percent Incap",
        "calculatedData.sdPercentIncapEntireMatch" : "σ Percent Entirely Incap Matches",
        "calculatedData.sdPercentNoShow" : "σ Percent No Show",
        "calculatedData.p75avgCargoScored" : "75% Avg. Cargo Scored",
        "calculatedData.p75avgPanelsScored" : "75% Avg. Panels Scored",
        "calculatedData.p75avgPinningFouls" : "75% Avg. Pinning Fouls",
        "calculatedData.p75panelLoadSuccess" : "75% Panel Loading Success",
        "calculatedData.p75cargoCycleAll" : "75% Cargo Cycle Times",
        "calculatedData.p75cargoCycleL1" : "75% Cargo Cycle L1",
        "calculatedData.p75cargoCycleL2" : "75% Cargo Cycle L2",
        "calculatedData.p75cargoCycleL3" : "75% Cargo Cycle L3",
        "calculatedData.p75panelCycleAll" : "75% Panel Cycle Times",
        "calculatedData.p75panelCycleL1" : "75% Panel Cycle L1",
        "calculatedData.p75panelCycleL2" : "75% Panel Cycle L2",
        "calculatedData.p75panelCycleL3" : "75% Panel Cycle L3",
        "calculatedData.p75cargoSuccessAll" : "75% Cargo Success",
        "calculatedData.p75cargoSuccessDefended" : "75% Defended Cargo Success",
        "calculatedData.p75cargoSuccessUndefended" : "75% Undefended Cargo Success",
        "calculatedData.p75cargoSuccessL1" : "75% Cargo Success L1",
        "calculatedData.p75cargoSuccessL2" : "75% Cargo Success L2",
        "calculatedData.p75cargoSuccessL3" : "75% Cargo Success L3",
        "calculatedData.p75panelSuccessAll" : "75% Panel Success",
        "calculatedData.p75panelSuccessDefended" : "75% Defended Panel Success",
        "calculatedData.p75panelSuccessUndefended" : "75% Undefended Panel Success",
        "calculatedData.p75panelSuccessL1" : "75% Panel Success L1",
        "calculatedData.p75panelSuccessL2" : "75% Panel Success L2",
        "calculatedData.p75panelSuccessL3" : "75% Panel Success L3",
        "calculatedData.p75panelSuccessFromSide" : "75% Panel Side Success",
        "calculatedData.p75habLineSuccessL1" : "75% Hab Line Success L1",
        "calculatedData.p75habLineSuccessL2" : "75% Hab Line Success L2",
        "calculatedData.p75avgTimeIncap" : "75% Avg. Time Incap",
        "calculatedData.p75avgTimeClimbing" : "75% Avg. Time Climbing",
        "calculatedData.p75percentIncap" : "75% Percent Incap",
        "calculatedData.p75percentIncapEntireMatch" : "75% Percent Entirely Incap Matches",
        "calculatedData.p75percentNoShow" : "75% Percent No Show",
        "timeline" : "Timeline",
        "type" : "Type of Action",
        "time" : "Time",
        "piece" : "Piece",
        "location" : "Location",
        "didSucceed" : "Success",
        "wasDefended" : "Defended",
        "structure" : "Structure",
        "side" : "Side",
        "level" : "Level",
        "attempted" : "Attempted Climb",
        "self" : "Self",
        "robot1" : "Robot 1",
        "robot2" : "Robot 2",
        "actual" : "Actual Climb",
        "matchNumber" : "Match Number",
        "startingLevel" : "Starting Level",
        "crossedHabLine" : "Crossed Hab Line",
        "startingLocation" : "Starting Location",
        "preload" : "Preloaded Gamepiece",
        "redCargoShipPreloads" : "Red Cargo Ship Preloads",
        "blueCargoShipPreloads" : "Blue Cargo Ship Preloads",
        "driverStation" : "Driver Station",
        "isNoShow" : "No Show",
        "calculatedData.cargoScored" : "Cargo Scored",
        "calculatedData.cargoScoredL1" : "Cargo Scored in Lvl 1",
        "calculatedData.cargoScoredL2" : "Cargo Scored in Lvl 2",
        "calculatedData.cargoScoredL3" : "Cargo Scored in Lvl 3",
        "calculatedData.cargoScoredSandstorm" : "Cargo Scored in Sandstorm",
        "calculatedData.cargoScoredTeleL1" : "Cargo Scored in Lvl 1 Tele",
        "calculatedData.cargoScoredTeleL2" : "Cargo Scored in Lvl 2 Tele",
        "calculatedData.cargoScoredTeleL3" : "Cargo Scored in Lvl 3 Tele",
        "calculatedData.panelsScored" : "Panels Scored",
        "calculatedData.panelsScoredL1" : "Panels Scored in Lvl 1",
        "calculatedData.panelsScoredL2" : "Panels Scored in Lvl 2",
        "calculatedData.panelsScoredL3" : "Panels Scored in Lvl 3",
        "calculatedData.panelsScoredSandstorm" : "Panels Scored in Sandstorm",
        "calculatedData.panelsScoredTeleL1" : "Panels Scored in Lvl 1 Tele",
        "calculatedData.panelsScoredTeleL2" : "Panels Scored in Lvl 2 Tele",
        "calculatedData.panelsScoredTeleL3" : "Panels Scored in Lvl 3 Tele",
        "calculatedData.pinningFouls" : "Pinning Fouls",
        "calculatedData.panelLoadSuccess" : "Panel Loading Success",
        "calculatedData.timeIncap" : "Time Incap",
        "calculatedData.timeClimbing" : "Time Climbing",
        "leftNear" : "Left-Near",
        "leftMid" : "Left-Mid",
        "leftFar" : "Left-Right",
        "rightNear" : "Right-Near",
        "rightMid" : "Right-Mid",
        "rightFar" : "Right-Far",
        "blueTeams" : "Blue Teams",
        "redTeams" : "Red Teams",
        "noShowTeams" : "No Show Teams",
        "blueActualScore" : "Blue Score",
        "redActualScore" : "Red Score",
        "blueFoulPoints" : "Blue Fouls",
        "redFoulPoints" : "Red Fouls",
        "blueActualRPs" : "Blue RPs",
        "redActualRPs" : "Red RPs",
        "blueDidRocketRP" : "Blue Rocket RP",
        "redDidRocketRP" : "Red Rocket RP",
        "blueDidClimbRP" : "Blue Climb RP",
        "redDidClimbRP" : "Red Climb RP",
        "calculatedData.blueChanceRocketRP" : "Blue Rocket RP Chance",
        "calculatedData.redChanceRocketRP" : "Red Rocket RP Chance",
        "calculatedData.blueChanceClimbRP" : "Blue Climb RP Chance",
        "calculatedData.redChanceClimbRP" : "Red Climb RP Chance",
        "calculatedData.bluePredictedScore" : "Blue Predicted Score",
        "calculatedData.redPredictedScore" : "Red Predicted Score",
        "calculatedData.blueChanceWin" : "Blue Win Chance",
        "calculatedData.redChanceWin" : "Red Win Chance",
        "calculatedData.bluePredictedClimbPoints" : "Blue Predicted Climb Points",
        "calculatedData.redPredictedClimbPoints" : "Red Predicted Climb Points",
        "calculatedData.climbAttemptsL1" : "Lvl. 1 Climb Attempts",
        "calculatedData.climbAttemptsL2" : "Lvl. 2 Climb Attempts",
        "calculatedData.climbAttemptsL3" : "Lvl. 3 Climb Attempts",
        "calculatedData.climbSuccessL1" : "Level 1 Climb Success",
        "calculatedData.climbSuccessL2" : "Level 2 Climb Success",
        "calculatedData.climbSuccessL3" : "Level 3 Climb Success",
        "rankSpeed" : "Speed",
        "rankAgility" : "Agility",
        "calculatedData.selfClimbLevel" : "Self Climb Level",
        "calculatedData.robot1ClimbLevel" : "1st Assisted Climb Level",
        "calculatedData.robot2ClimbLevel" : "2nd Assisted Climb Level",
        "calculatedData.failedCyclesCaused" : "Cycles Defended",
        "calculatedData.avgRankDefense" : "Avg. Rank Defense",
        "calculatedData.totalTimeDefending" : "Total Time Defending",
        "calculatedData.timeDefending" : "Time Defending",
        "calculatedData.totalFailedCyclesCaused" : "Total Cycles Defended",
        "calculatedData.avgFailedCyclesCaused" : "Avg. Cycles Defended",
        "calculatedData.failedCyclesCausedPerSecond" : "Cycles Defended Per Second",
        "calculatedData.lastMatch" : "Last Match",
        "calculatedData.avgTimeDefending" : "Avg. Time Defending",
        "calculatedData.matchesDefended" : "Matches Defended",
        "calculatedData.avgPointsPrevented" : "Avg. Points Prevented",
        "calculatedData.avgPanelPointsPrevented" : "Avg. Panel Points Prevented",
        "calculatedData.avgCargoPointsPrevented" : "Avg. Cargo Points Prevented",
        "calculatedData.pointsPrevented" : "Points Prevented",
        "calculatedData.panelPointsPrevented" : "Panel Points Prevented",
        "calculatedData.cargoPointsPrevented" : "Cargo Points Prevented"
    ]

    /**
     Rounds a given float value to a given number of decimal places.
     - parameter value: Input value
     - parameter numDecimalPlaces: Number of decimal places
     */
    @objc class func roundValue(_ value: Float, toDecimalPlaces numDecimalPlaces: Int) -> String {
        let val = value as NSNumber
        let f = NumberFormatter()
        f.numberStyle = NumberFormatter.Style.decimal
        f.maximumFractionDigits = numDecimalPlaces

        if val == 0 {
            return "0"
        }

        return f.string(from: val)!
    }

    /**
     Rounds a given double value to a given number of decimal places.
     - parameter value: Input value
     - parameter toDecimalPlaces: Number of decimal places to round to
     */
    class func roundDoubleValue(_ value: Double, toDecimalPlaces numDecimalPlaces: Int) -> String {
        let val = value as NSNumber
        let f = NumberFormatter()
        f.numberStyle = NumberFormatter.Style.decimal
        f.maximumFractionDigits = numDecimalPlaces

        if val == 0 {
            return "0"
        }

        return f.string(from: val)!
    }

    /** Returns a human readable name for a given key. */
    class func getHumanReadableNameForKey(_ key: String) -> String? {
        return humanReadableNames[key]
    }

    /** Returns the key for a human readable name */
    class func findKeyForValue(_ value: String) ->String?
    {
        for (key, stringValue) in humanReadableNames
        {
            if (stringValue == value)
            {
                return key
            }
        }
        return nil
    }

    /**
     Returns a key for a given Human Readable Name.
     - parameter name: Human Readable Name
     */
    class func getKeyForHumanReadableName(_ name: String) -> String? {
        var computerReadableNames = [String: String]()
        for (key, value) in humanReadableNames {
            computerReadableNames[value] = key
        }
        return computerReadableNames[name]
    }

    /** Detects if a given value is null. */
    class func isNull(_ object: AnyObject?) -> Bool {
        if object_getClass(object) == object_getClass(NSNull()) {
            return true
        }
        return false
    }

    /** Converts a value to one that is presentable as a string on the screen. It won't have Optional() or anything like that in it. */
    class func sp(thing : Any?) -> String {
        if thing != nil {
            if let s = thing as? String {
                return s
            } else if ((thing as? Int) != nil) || ((thing as? Float) != nil) || ((thing as? Double) != nil) {
                return "\(thing!)"
            } else if let n = thing as? NSNumber {
                return n.stringValue
            } else {
                print("Presentable String Unknown Type")
                return "\(thing)"
            }
        } else {
            return ""
        }
    }

    /**Conversion of bool value to string "Yes" or "No".*/
    class func boolToString(b: Bool?) -> String? {
        let stringBool : String? = b?.description ?? nil
        let boolToStringValues = [
            "true" : "Yes",
            "false" : "No"
        ]

        if stringBool != nil {
            let stringReadable = boolToStringValues[stringBool!]
            return (stringReadable)
        }
        return(nil)
    }

    /**
     Unwraps a value.
     */
    class func unwrap(any:Any) -> Any {

        let mi = Mirror(reflecting: any)
        if mi.displayStyle != .optional {
            return any
        }
        if mi.children.count == 0 { return NSNull() }
        let (_, some) = mi.children.first!
        return some
    }

    /** Gets the human readable name from a key... use humanReadableNames instead */
    class func humanReadableNameFromKey(key: String) -> String {
        let noCalculatedDataKey = key.replacingOccurrences(of: "calculatedData.", with: "").replacingOccurrences(of: "pit", with: "pitScout")
        var indiciesToAddSpaces = [Int]()
        for i in 0..<noCalculatedDataKey.characters.count {
            if i != 0 {
                let currentChar = Array(noCalculatedDataKey.characters)[i]
                let previousChar = Array(noCalculatedDataKey.characters)[i-1]
                if !self.isLowercase(string: String(currentChar)) && self.isLowercase(string: String(previousChar)) {
                    indiciesToAddSpaces.append(i)
                }
            }
        }
        var finalName = noCalculatedDataKey
        indiciesToAddSpaces.sort()
        for i in 0..<indiciesToAddSpaces.count {
            let ind = indiciesToAddSpaces[i] + i //Adding i to ajust for the fact that we are adding characters as we go here
            finalName = finalName.insert(string: " ", ind: ind)
        }
        finalName = String(Array(finalName.characters)[0]).uppercased() + String(finalName.characters.dropFirst())
        return finalName
    }

    static func isLowercase(string: String) -> Bool {
        let set = CharacterSet.lowercaseLetters

        if let scala = UnicodeScalar(string) {
            return set.contains(scala)
        } else {
            return false
        }
    }
}

extension String {
    func insert(string:String,ind:Int) -> String {
        return  String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count-ind))
    }
}
