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
            "pitHasVision",
            "pitHasGyro",
            "pitHasEncoders",
            "pitIsLemonSpecialist",
            "calculatedData.hasOrangeGroundIntake",
            "calculatedData.hasLemonGroundIntake"
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
            "pitHasVision",
            "pitHasGyro",
            "pitHasEncoders",
            "pitSandstormNavigationType",
            "pitSEALsRampRanking",
            "pitHasOrangeShooter",
            "pitIsLemonSpecialist",
            "pitNumDriveTrainMotors",
            "pitDriveTrainMotorType",
            "teamNumber",
            "name",
            "matchesPlayed",
            "actualRPs",
            "calculatedData.totalNotes",
            "actualSeed",
            "calculatedData.predictedRPs",
            "calculatedData.predictedSeed",
            "calculatedData.hasOrangeGroundIntake",
            "calculatedData.hasLemonGroundIntake",
            "calculatedData.didPreloadOrange",
            "calculatedData.didPreloadLemon",
            "calculatedData.avgOrangesScored",
            "calculatedData.avgOrangesScoredL1",
            "calculatedData.avgOrangesScoredL2",
            "calculatedData.avgOrangesScoredL3",
            "calculatedData.orangesScored",
            "calculatedData.orangesScoredL1",
            "calculatedData.orangesScoredL2",
            "calculatedData.orangesScoredL3",
            "calculatedData.avgOrangesScoredSandstorm",
            "calculatedData.avgOrangesScoredTeleL1",
            "calculatedData.avgOrangesScoredTeleL2",
            "calculatedData.avgOrangesScoredTeleL3",
            "calculatedData.avgLemonsScored",
            "calculatedData.avgLemonsScoredL1",
            "calculatedData.avgLemonsScoredL2",
            "calculatedData.avgLemonsScoredL3",
            "calculatedData.avgLemonsScoredSandstorm",
            "calculatedData.avgLemonsScoredTeleL1",
            "calculatedData.avgLemonsScoredTeleL2",
            "calculatedData.avgLemonsScoredTeleL3",
            "calculatedData.avgPinningFouls",
            "calculatedData.lemonLoadSuccess",
            "calculatedData.orangeCycleAll",
            "calculatedData.orangeCycleL1",
            "calculatedData.orangeCycleL2",
            "calculatedData.orangeCycleL3",
            "calculatedData.lemonCycleAll",
            "calculatedData.lemonCycleL1",
            "calculatedData.lemonCycleL2",
            "calculatedData.lemonCycleL3",
            "calculatedData.orangeSuccessAll",
            "calculatedData.orangeSuccessDefended",
            "calculatedData.orangeSuccessUndefended",
            "calculatedData.orangeSuccessL1",
            "calculatedData.orangeSuccessL2",
            "calculatedData.orangeSuccessL3",
            "calculatedData.lemonSuccessAll",
            "calculatedData.lemonSuccessDefended",
            "calculatedData.lemonSuccessUndefended",
            "calculatedData.lemonSuccessL1",
            "calculatedData.lemonSuccessL2",
            "calculatedData.lemonSuccessL3",
            "calculatedData.lemonSuccessFromSide",
            "calculatedData.habLineSuccessL1",
            "calculatedData.habLineSuccessL2",
            //"calculatedData.habLineAttemptsL1",
            //"calculatedData.habLineAttemptsL2",
            "calculatedData.numHabLineAttemptsL1",
            "calculatedData.numHabLineAttemptsL2",
            "calculatedData.avgTimeIncap",
            "calculatedData.avgTimeClimbing",
            "calculatedData.percentDysfunctional",
            "calculatedData.percentIncap",
            "calculatedData.percentIncapEntireMatch",
            "calculatedData.percentNoShow",
            "calculatedData.predictedDedicatedLemonCycles",
            "calculatedData.predictedDedicatedOrangeCycles",
            "calculatedData.predictedSoloPoints",
            "calculatedData.orangeAbility",
            "calculatedData.lemonAbility",
            "calculatedData.firstPickAbility",
            "calculatedData.secondPickAbility",
            "calculatedData.lfmAvgOrangesScored",
            "calculatedData.lfmAvgLemonsScored",
            "calculatedData.lfmAvgPinningFouls",
            "calculatedData.lfmLemonLoadSuccess",
            "calculatedData.lfmOrangeCycleAll",
            "calculatedData.lfmOrangeCycleL1",
            "calculatedData.lfmOrangeCycleL2",
            "calculatedData.lfmOrangeCycleL3",
            "calculatedData.lfmLemonCycleAll",
            "calculatedData.lfmLemonCycleL1",
            "calculatedData.lfmLemonCycleL2",
            "calculatedData.lfmLemonCycleL3",
            "calculatedData.lfmOrangeSuccessAll",
            "calculatedData.lfmOrangeSuccessDefended",
            "calculatedData.lfmOrangeSuccessUndefended",
            "calculatedData.lfmOrangeSuccessL1",
            "calculatedData.lfmOrangeSuccessL2",
            "calculatedData.lfmOrangeSuccessL3",
            "calculatedData.lfmLemonSuccessAll",
            "calculatedData.lfmLemonSuccessDefended",
            "calculatedData.lfmLemonSuccessUndefended",
            "calculatedData.lfmLemonSuccessL1",
            "calculatedData.lfmLemonSuccessL2",
            "calculatedData.lfmLemonSuccessL3",
            "calculatedData.lfmLemonSuccessFromSide",
            "calculatedData.lfmHabLineSuccessL1",
            "calculatedData.lfmHabLineSuccessL2",
            "calculatedData.lfmAvgTimeIncap",
            "calculatedData.lfmAvgTimeClimbing",
            "calculatedData.lfmPercentIncap",
            "calculatedData.lfmPercentIncapEntireMatch",
            "calculatedData.lfmPercentNoShow",
            "calculatedData.sdAvgOrangesScored",
            "calculatedData.sdAvgLemonsScored",
            "calculatedData.sdAvgPinningFouls",
            "calculatedData.sdLemonLoadSuccess",
            "calculatedData.sdOrangeCycleAll",
            "calculatedData.sdOrangeCycleL1",
            "calculatedData.sdOrangeCycleL2",
            "calculatedData.sdOrangeCycleL3",
            "calculatedData.sdLemonCycleAll",
            "calculatedData.sdLemonCycleL1",
            "calculatedData.sdLemonCycleL2",
            "calculatedData.sdLemonCycleL3",
            "calculatedData.sdOrangeSuccessAll",
            "calculatedData.sdOrangeSuccessDefended",
            "calculatedData.sdOrangeSuccessUndefended",
            "calculatedData.sdOrangeSuccessL1",
            "calculatedData.sdOrangeSuccessL2",
            "calculatedData.sdOrangeSuccessL3",
            "calculatedData.sdLemonSuccessAll",
            "calculatedData.sdLemonSuccessDefended",
            "calculatedData.sdLemonSuccessUndefended",
            "calculatedData.sdLemonSuccessL1",
            "calculatedData.sdLemonSuccessL2",
            "calculatedData.sdLemonSuccessL3",
            "calculatedData.sdLemonSuccessFromSide",
            "calculatedData.sdHabLineSuccessL1",
            "calculatedData.sdHabLineSuccessL2",
            "calculatedData.sdAvgTimeIncap",
            "calculatedData.sdAvgTimeClimbing",
            "calculatedData.sdPercentIncap",
            "calculatedData.sdPercentIncapEntireMatch",
            "calculatedData.sdPercentNoShow",
            "calculatedData.p75avgOrangesScored",
            "calculatedData.p75avgLemonsScored",
            "calculatedData.p75avgPinningFouls",
            "calculatedData.p75lemonLoadSuccess",
            "calculatedData.p75orangeCycleAll",
            "calculatedData.p75orangeCycleL1",
            "calculatedData.p75orangeCycleL2",
            "calculatedData.p75orangeCycleL3",
            "calculatedData.p75lemonCycleAll",
            "calculatedData.p75lemonCycleL1",
            "calculatedData.p75lemonCycleL2",
            "calculatedData.p75lemonCycleL3",
            "calculatedData.p75orangeSuccessAll",
            "calculatedData.p75orangeSuccessDefended",
            "calculatedData.p75orangeSuccessUndefended",
            "calculatedData.p75orangeSuccessL1",
            "calculatedData.p75orangeSuccessL2",
            "calculatedData.p75orangeSuccessL3",
            "calculatedData.p75lemonSuccessAll",
            "calculatedData.p75lemonSuccessDefended",
            "calculatedData.p75lemonSuccessUndefended",
            "calculatedData.p75lemonSuccessL1",
            "calculatedData.p75lemonSuccessL2",
            "calculatedData.p75lemonSuccessL3",
            "calculatedData.p75lemonSuccessFromSide",
            "calculatedData.p75habLineSuccessL1",
            "calculatedData.p75habLineSuccessL2",
            "calculatedData.p75avgTimeIncap",
            "calculatedData.p75avgTimeClimbing",
            "calculatedData.p75percentIncap",
            "calculatedData.p75percentIncapEntireMatch",
            "calculatedData.p75percentNoShow",
            //"calculatedData.climbAttemptsL1",
            //"calculatedData.climbAttemptsL2",
            //"calculatedData.climbAttemptsL3",
            "calculatedData.numClimbAttemptsL1",
            "calculatedData.numClimbAttemptsL2",
            "calculatedData.numClimbAttemptsL3",
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
            "calculatedData.avgLemonPointsPrevented",
            "calculatedData.avgOrangePointsPrevented",
            "calculatedData.pointsPrevented",
            "calculatedData.lemonPointsPrevented",
            "calculatedData.orangePointsPrevented"
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
            "# of Attempts to Lvl. 1",
            "# of Attempts to Lvl. 2",
            "# of Attempts to Lvl. 3",
            "# of Attempts from Lvl. 1",
            "# of Attempts from Lvl. 2"
            //"Lvl. 1 Climb Attempts",
            //"Lvl. 2 Climb Attempts",
            //"Lvl. 3 Climb Attempts"
        ]

        /** Values that should be displayed as long text cells */
        let TIMDLongTextCells : [String] = [
            "superNotes",
            "notes"
            ]

        let longTextCells : [String] = [
            "pitSEALsNotes",
            "pitClimbType",
            "notes"
        ]

        let unrankedCells = [
            "selectedImageURL",
            "otherUrls"
        ]

        /** Values to be displayed as percentages. */
        let percentageValues : [String] = [
        ]

        let addCommasBetweenCapitals : [String] = []

        let boolValues = [
            "pitHasCamera",
            "pitHasVision",
            "pitHasGyro",
            "pitHasEncoders",
            "pitIsLemonSpecialist",
            "calculatedData.hasOrangeGroundIntake",
            "calculatedData.hasLemonGroundIntake"
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
                "SEALS",
                "Autonomous",
                "Teleoperated",
                "Defense",
                "End Game",
                "Super Scout",
                "Pit Scout",
                "High Level",
            ]
        }
        
        /** Sections of teamDetails view. */
        func keySets(_ minimalist : Bool) -> [[String]] {
            return [
                defaultKeys,
                statusKeys,
                sealKeys,
                autoKeys,
                teleKeys,
                defenseKeys,
                endGame,
                superKeys,
                pitKeys,
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
            //"calculatedData.habLineAttemptsL1",
            //"calculatedData.habLineAttemptsL2",
            "calculatedData.numHabLineAttemptsL1",
            "calculatedData.numHabLineAttemptsL2"
        ]

        /** Keys relating to Teleoperated to be displayed on teamDetails */
        let teleKeys: [String] = [
            "calculatedData.hasOrangeGroundIntake",
            "calculatedData.hasLemonGroundIntake",
            "calculatedData.avgOrangesScored",
            "calculatedData.avgLemonsScored",
            "calculatedData.avgPinningFouls",
        ]
        
        let defenseKeys: [String] = [
            "calculatedData.totalTimeDefending",
            "calculatedData.avgPointsPrevented",
            "calculatedData.avgLemonPointsPrevented",
            "calculatedData.avgOrangePointsPrevented"
        ]
        
        /** Dict translating a key for a teamDetails datapoint to the key for the respective TIMD datapoint. Does not include "calculatedData." in the keys. */
        let teamDetailsToTIMD = [

            //status
            "avgTimeIncap" : "calculatedData.timeIncap",
            "percentNoShow" : "isNoShow",

            //scoring stuff
            "avgOrangesScored" : "calculatedData.orangesScored",
            "avgOrangesScoredL1" : "calculatedData.orangesScoredL1",
            "avgOrangesScoredL2" : "calculatedData.orangesScoredL2",
            "avgOrangesScoredL3" : "calculatedData.orangesScoredL3",
            "avgOrangesScoredSandstorm" : "calculatedData.orangesScoredSandstorm",
            "avgOrangesScoredTeleL1" : "calculatedData.orangesScoredTeleL1",
            "avgOrangesScoredTeleL2" : "calculatedData.orangesScoredTeleL2",
            "avgOrangesScoredTeleL3" : "calculatedData.orangesScoredTeleL3",
            "avgLemonsScored" : "calculatedData.lemonsScored",
            "avgLemonsScoredL1" : "calculatedData.lemonsScoredL1",
            "avgLemonsScoredL2" : "calculatedData.lemonsScoredL2",
            "avgLemonsScoredL3" : "calculatedData.lemonsScoredL3",
            "avgLemonsScoredSandstorm" : "calculatedData.lemonsScoredSandstorm",
            "avgLemonsScoredTeleL1" : "calculatedData.lemonsScoredTeleL1",
            "avgLemonsScoredTeleL2" : "calculatedData.lemonsScoredTeleL2",
            "avgLemonsScoredTeleL3" : "calculatedData.lemonsScoredTeleL3",
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
            "avgLemonPointsPrevented" : "calculatedData.lemonPointsPrevented",
            "avgOrangePointsPrevented" : "calculatedData.orangePointsPrevented"
        ]

        /** Keys relating to the portions of the game that occur in the end (climbing, challenging, etc) */
        let endGame : [String] = [
            "calculatedData.avgTimeClimbing",
            //"calculatedData.climbAttemptsL1",
            //"calculatedData.climbAttemptsL2",
            //"calculatedData.climbAttemptsL3",
            "calculatedData.numClimbAttemptsL1",
            "calculatedData.numClimbAttemptsL2",
            "calculatedData.numClimbAttemptsL3",
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
        
       /* let calculatedStrings : [String] = [
            "calculatedData.climbAttemptsL1",
            "calculatedData.climbAttemptsL2",
            "calculatedData.climbAttemptsL3",
            "calculatedData.habLineAttemptsL2"
        ] */

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
            "pitHasVision",
            "pitHasGyro",
            "pitHasEncoders",
            "pitSandstormNavigationType",
            "pitSEALsRampRanking",
            "pitIsLemonSpecialist",
            "pitNumDriveTrainMotors",
            "pitDriveTrainMotorType"
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

    static let superKeys = [
        //superNotes- They're in TIMDs, so see TeamDetails for more info
        "notes",
        //"calculatedData.avgDrivingAbility",
        //"calculatedData.avgSpeed",
        //"calculatedData.avgAgility",
        //"calculatedData.avgDefense",
        //"calculatedData.totalNumGoodDecisions",
        //"calculatedData.totalNumBadDecisions"
    ]

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
        "calculatedData.orangesScored",
        "calculatedData.lemonsScored",
        "calculatedData.lemonLoadSuccess",
        "calculatedData.orangeSuccessDefended",
        "calculatedData.orangeSuccessL2",
        "calculatedData.orangeSuccessL3",
        "calculatedData.lemonSuccessDefended",
        "calculatedData.lemonSuccessL2",
        "calculatedData.lemonSuccessL3",
        "calculatedData.timeClimbing",
        "calculatedData.lemonsSpilled",
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
        "notes",
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
        "pitHasVision" : "Has Vision",
        "pitHasGyro" : "Has Gyro",
        "pitHasEncoders" : "Has Encoders",
        "pitSandstormNavigationType" : "Sandstorm Nav.",
        "pitSEALsRampRanking" : "Ramp Ability",
        "pitHasOrangeShooter" : "Cargo Shooter",
        "pitIsLemonSpecialist" : "Hatch Specialist",
        "pitNumDriveTrainMotors" : "# of Motors on Drive Train",
        "pitDriveTrainMotorType" : "Type of Motor on Drive Train",
        "teamNumber" : "Team Number",
        "name" : "Name",
        "matchesPlayed" : "Matches Played",
        "actualRPs" : "Avg. RPs",
        "matchDatas" : "Matches",
        "calculatedData" : "Calculated Data",
        "actualSeed" : "Seed",
        "calculatedData.totalNotes" : "All Super Notes",
        "calculatedData.predictedRPs" : "Predicted RPs",
        "calculatedData.predictedSeed" : "Predicted Seed",
        "calculatedData.hasOrangeGroundIntake" : "Cargo Ground Intake",
        "calculatedData.hasLemonGroundIntake" : "Panel Ground Intake",
        "calculatedData.didPreloadOrange" : "Has Preloaded Cargo",
        "calculatedData.didPreloadLemon" : "Has Preloaded Panel",
        "calculatedData.avgOrangesScored" : "Avg. Cargo Scored",
        "calculatedData.avgOrangesScoredL1" : "Avg. Cargo Scored in Lvl 1",
        "calculatedData.avgOrangesScoredL2" : "Avg. Cargo Scored in Lvl 2",
        "calculatedData.avgOrangesScoredL3" : "Avg. Cargo Scored in Lvl 3",
        "calculatedData.avgOrangesScoredSandstorm" : "Avg. Cargo Scored in Sandstorm",
        "calculatedData.avgOrangesScoredTeleL1" : "Avg. Cargo Scored in Lvl 1 Tele",
        "calculatedData.avgOrangesScoredTeleL2" : "Avg. Cargo Scored in Lvl 2 Tele",
        "calculatedData.avgOrangesScoredTeleL3" : "Avg. Cargo Scored in Lvl 3 Tele",
        "calculatedData.avgLemonsScored" : "Avg. Panels Scored",
        "calculatedData.avgLemonsScoredL1" : "Avg. Panels Scored in Lvl 1",
        "calculatedData.avgLemonsScoredL2" : "Avg. Panels Scored in Lvl 2",
        "calculatedData.avgLemonsScoredL3" : "Avg. Panels Scored in Lvl 3",
        "calculatedData.avgLemonsScoredSandstorm" : "Avg. Panels Scored in Sandstorm",
        "calculatedData.avgLemonsScoredTeleL1" : "Avg. Panels Scored in Lvl 1 Tele",
        "calculatedData.avgLemonsScoredTeleL2" : "Avg. Panels Scored in Lvl 2 Tele",
        "calculatedData.avgLemonsScoredTeleL3" : "Avg. Panels Scored in Lvl 3 Tele",
        "calculatedData.avgPinningFouls" : "Avg. Pinning Fouls",
        "calculatedData.orangeCycleAll" : "Cargo Cycle Times",
        "calculatedData.orangeCycleL1" : "Cargo Cycle L1",
        "calculatedData.orangeCycleL2" : "Cargo Cycle L2",
        "calculatedData.orangeCycleL3" : "Cargo Cycle L3",
        "calculatedData.lemonCycleAll" : "Panel Cycle Times",
        "calculatedData.lemonCycleL1" : "Panel Cycle L1",
        "calculatedData.lemonCycleL2" : "Panel Cycle L2",
        "calculatedData.lemonCycleL3" : "Panel Cycle L3",
        "calculatedData.orangeSuccessAll" : "Cargo Success",
        "calculatedData.orangeSuccessDefended" : "Cargo Defended Success",
        "calculatedData.orangeSuccessUndefended" : "Cargo Undefended Success",
        "calculatedData.orangeSuccessL1" : "Cargo Success L1",
        "calculatedData.orangeSuccessL2" : "Cargo Success L2",
        "calculatedData.orangeSuccessL3" : "Cargo Success L3",
        "calculatedData.lemonSuccessAll" : "Panel Success",
        "calculatedData.lemonSuccessDefended" : "Panel Defended Success",
        "calculatedData.lemonSuccessUndefended" : "Panel Undefended Success",
        "calculatedData.lemonSuccessL1" : "Panel Success L1",
        "calculatedData.lemonSuccessL2" : "Panel Success L2",
        "calculatedData.lemonSuccessL3" : "Panel Success L3",
        "calculatedData.lemonSuccessFromSide" : "Panel Side Success",
        "calculatedData.habLineSuccessL1" : "Hab Line Success L1",
        "calculatedData.habLineSuccessL2" : "Hab Line Success L2",
        //"calculatedData.habLineAttemptsL1" : "Hab Line Attempts L1",
        //"calculatedData.habLineAttemptsL2" : "Hab Line Attempts L2",
        "calculatedData.numHabLineAttemptsL1" : "# of Attempts from Lvl. 1",
        "calculatedData.numHabLineAttemptsL2" : "# of Attempts from Lvl. 2",
        "calculatedData.avgTimeIncap" : "Avg. Time Incap",
        "calculatedData.avgTimeClimbing" : "Avg. Time Climbing",
        "calculatedData.percentDysfunctional" : "Percent Dysfuntional",
        "calculatedData.percentIncap" : "Percent Incap",
        "calculatedData.percentIncapEntireMatch" : "Percent Entirely Incap Matches",
        "calculatedData.percentNoShow" : "Percent No Show",
        "calculatedData.predictedDedicatedLemonCycles" : "Predicted Panel Cycle Time",
        "calculatedData.predictedDedicatedOrangeCycles" : "Predicted Orange Cycle Time",
        "calculatedData.predictedSoloPoints" : "Predicted Solo Points",
        "calculatedData.orangeAbility" : "Cargo Ability",
        "calculatedData.lemonAbility" : "Panel Ability",
        "calculatedData.firstPickAbility" : "First Pick Ability",
        "calculatedData.secondPickAbility" : "Second Pick Ability",
        "calculatedData.lfmAvgOrangesScored" : "LFM Avg. Cargo Scored",
        "calculatedData.lfmAvgLemonsScored" : "LFM Avg. Panels Scored",
        "calculatedData.lfmAvgPinningFouls" : "LFM Avg. Pinning Fouls",
        "calculatedData.lfmLemonLoadSuccess" : "LFM Panel Loading Success",
        "calculatedData.lfmOrangeCycleAll" : "LFM Cargo Cycle Times",
        "calculatedData.lfmOrangeCycleL1" : "LFM Cargo Cycle L1",
        "calculatedData.lfmOrangeCycleL2" : "LFM Cargo Cycle L2",
        "calculatedData.lfmOrangeCycleL3" : "LFM Cargo Cycle L3",
        "calculatedData.lfmLemonCycleAll" : "LFM Panel Cycle Times",
        "calculatedData.lfmLemonCycleL1" : "LFM Panel Cycle L1",
        "calculatedData.lfmLemonCycleL2" : "LFM Panel Cycle L2",
        "calculatedData.lfmLemonCycleL3" : "LFM Panel Cycle L3",
        "calculatedData.lfmOrangeSuccessAll" : "LFM Cargo Success",
        "calculatedData.lfmOrangeSuccessDefended" : "LFM Defended Cargo Success",
        "calculatedData.lfmOrangeSuccessUndefended" : "LFM Undefended Cargo Success",
        "calculatedData.lfmOrangeSuccessL1" : "LFM Cargo Success L1",
        "calculatedData.lfmOrangeSuccessL2" : "LFM Cargo Success L2",
        "calculatedData.lfmOrangeSuccessL3" : "LFM Cargo Success L3",
        "calculatedData.lfmLemonSuccessAll" : "LFM Panel Success",
        "calculatedData.lfmLemonSuccessDefended" : "LFM Defended Panel Success",
        "calculatedData.lfmLemonSuccessUndefended" : "LFM Undefended Panel Success",
        "calculatedData.lfmLemonSuccessL1" : "LFM Panel Success L1",
        "calculatedData.lfmLemonSuccessL2" : "LFM Panel Success L2",
        "calculatedData.lfmLemonSuccessL3" : "LFM Panel Success L3",
        "calculatedData.lfmLemonSuccessFromSide" : "LFM Panel Side Success",
        "calculatedData.lfmHabLineSuccessL1" : "LFM Hab Line Success L1",
        "calculatedData.lfmHabLineSuccessL2" : "LFM Hab Line Success L2",
        "calculatedData.lfmAvgTimeIncap" : "LFM Avg. Time Incap",
        "calculatedData.lfmAvgTimeClimbing" : "LFM Avg. Time Climbing",
        "calculatedData.lfmPercentIncap" : "LFM Percent Incap",
        "calculatedData.lfmPercentIncapEntireMatch" : "LFM Percent Entirely Incap Matches",
        "calculatedData.lfmPercentNoShow" : "LFM Percent No Show",
        "calculatedData.sdAvgOrangesScored" : "σ Cargo Scored",
        "calculatedData.sdAvgLemonsScored" : "σ Panels Scored",
        "calculatedData.sdAvgPinningFouls" : "σ Pinning Fouls",
        "calculatedData.sdLemonLoadSuccess" : "σ Panel Loading Success",
        "calculatedData.sdOrangeCycleAll" : "σ Cargo Cycle Times",
        "calculatedData.sdOrangeCycleL1" : "σ Cargo Cycle L1",
        "calculatedData.sdOrangeCycleL2" : "σ Cargo Cycle L2",
        "calculatedData.sdOrangeCycleL3" : "σ Cargo Cycle L3",
        "calculatedData.sdLemonCycleAll" : "σ Panel Cycle Times",
        "calculatedData.sdLemonCycleL1" : "σ Panel Cycle L1",
        "calculatedData.sdLemonCycleL2" : "σ Panel Cycle L2",
        "calculatedData.sdLemonCycleL3" : "σ Panel Cycle L3",
        "calculatedData.sdOrangeSuccessAll" : "σ Cargo Success",
        "calculatedData.sdOrangeSuccessDefended" : "σ Defended Cargo Success",
        "calculatedData.sdOrangeSuccessUndefended" : "σ Undefended Cargo Success",
        "calculatedData.sdOrangeSuccessL1" : "σ Cargo Success L1",
        "calculatedData.sdOrangeSuccessL2" : "σ Cargo Success L2",
        "calculatedData.sdOrangeSuccessL3" : "σ Cargo Success L3",
        "calculatedData.sdLemonSuccessAll" : "σ Panel Success",
        "calculatedData.sdLemonSuccessDefended" : "σ Defended Panel Success",
        "calculatedData.sdLemonSuccessUndefended" : "σ Undefended Panel Success",
        "calculatedData.sdLemonSuccessL1" : "σ Panel Success L1",
        "calculatedData.sdLemonSuccessL2" : "σ Panel Success L2",
        "calculatedData.sdLemonSuccessL3" : "σ Panel Success L3",
        "calculatedData.sdLemonSuccessFromSide" : "σ Panel Side Success",
        "calculatedData.sdHabLineSuccessL1" : "σ Hab Line Success L1",
        "calculatedData.sdHabLineSuccessL2" : "σ Hab Line Success L2",
        "calculatedData.sdAvgTimeIncap" : "σ Time Incap",
        "calculatedData.sdAvgTimeClimbing" : "σ Time Climbing",
        "calculatedData.sdPercentIncap" : "σ Percent Incap",
        "calculatedData.sdPercentIncapEntireMatch" : "σ Percent Entirely Incap Matches",
        "calculatedData.sdPercentNoShow" : "σ Percent No Show",
        "calculatedData.p75avgOrangesScored" : "75% Avg. Cargo Scored",
        "calculatedData.p75avgLemonsScored" : "75% Avg. Panels Scored",
        "calculatedData.p75avgPinningFouls" : "75% Avg. Pinning Fouls",
        "calculatedData.p75lemonLoadSuccess" : "75% Panel Loading Success",
        "calculatedData.p75orangeCycleAll" : "75% Cargo Cycle Times",
        "calculatedData.p75orangeCycleL1" : "75% Cargo Cycle L1",
        "calculatedData.p75orangeCycleL2" : "75% Cargo Cycle L2",
        "calculatedData.p75orangeCycleL3" : "75% Cargo Cycle L3",
        "calculatedData.p75lemonCycleAll" : "75% Panel Cycle Times",
        "calculatedData.p75lemonCycleL1" : "75% Panel Cycle L1",
        "calculatedData.p75lemonCycleL2" : "75% Panel Cycle L2",
        "calculatedData.p75lemonCycleL3" : "75% Panel Cycle L3",
        "calculatedData.p75orangeSuccessAll" : "75% Cargo Success",
        "calculatedData.p75orangeSuccessDefended" : "75% Defended Cargo Success",
        "calculatedData.p75orangeSuccessUndefended" : "75% Undefended Cargo Success",
        "calculatedData.p75orangeSuccessL1" : "75% Cargo Success L1",
        "calculatedData.p75orangeSuccessL2" : "75% Cargo Success L2",
        "calculatedData.p75orangeSuccessL3" : "75% Cargo Success L3",
        "calculatedData.p75lemonSuccessAll" : "75% Panel Success",
        "calculatedData.p75lemonSuccessDefended" : "75% Defended Panel Success",
        "calculatedData.p75lemonSuccessUndefended" : "75% Undefended Panel Success",
        "calculatedData.p75lemonSuccessL1" : "75% Panel Success L1",
        "calculatedData.p75lemonSuccessL2" : "75% Panel Success L2",
        "calculatedData.p75lemonSuccessL3" : "75% Panel Success L3",
        "calculatedData.p75lemonSuccessFromSide" : "75% Panel Side Success",
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
        "calculatedData.orangesScored" : "Cargo Scored",
        "calculatedData.orangesScoredL1" : "Cargo Scored in Lvl 1",
        "calculatedData.orangesScoredL2" : "Cargo Scored in Lvl 2",
        "calculatedData.orangesScoredL3" : "Cargo Scored in Lvl 3",
        "calculatedData.orangesScoredSandstorm" : "Cargo Scored in Sandstorm",
        "calculatedData.orangesScoredTeleL1" : "Cargo Scored in Lvl 1 Tele",
        "calculatedData.orangesScoredTeleL2" : "Cargo Scored in Lvl 2 Tele",
        "calculatedData.orangesScoredTeleL3" : "Cargo Scored in Lvl 3 Tele",
        "calculatedData.lemonsScored" : "Panels Scored",
        "calculatedData.lemonsScoredL1" : "Panels Scored in Lvl 1",
        "calculatedData.lemonsScoredL2" : "Panels Scored in Lvl 2",
        "calculatedData.lemonsScoredL3" : "Panels Scored in Lvl 3",
        "calculatedData.lemonsScoredSandstorm" : "Panels Scored in Sandstorm",
        "calculatedData.lemonsScoredTeleL1" : "Panels Scored in Lvl 1 Tele",
        "calculatedData.lemonsScoredTeleL2" : "Panels Scored in Lvl 2 Tele",
        "calculatedData.lemonsScoredTeleL3" : "Panels Scored in Lvl 3 Tele",
        "calculatedData.pinningFouls" : "Pinning Fouls",
        "calculatedData.lemonLoadSuccess" : "Panel Loading Success",
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
        //"calculatedData.climbAttemptsL1" : "Lvl. 1 Climb Attempts",
        //"calculatedData.climbAttemptsL2" : "Lvl. 2 Climb Attempts",
        //"calculatedData.climbAttemptsL3" : "Lvl. 3 Climb Attempts",
        "calculatedData.numClimbAttemptsL1" : "# of Attempts to Lvl. 1",
        "calculatedData.numClimbAttemptsL2" : "# of Attempts to Lvl. 2",
        "calculatedData.numClimbAttemptsL3" : "# of Attempts to Lvl. 3",
        "calculatedData.climbSuccessL1" : "Level 1 Climb Success",
        "calculatedData.climbSuccessL2" : "Level 2 Climb Success",
        "calculatedData.climbSuccessL3" : "Level 3 Climb Success",
        "rankSpeed" : "Speed",
        "rankAgility" : "Agility",
        "notes" : "Super Notes:",
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
        "calculatedData.avgLemonPointsPrevented" : "Avg. Panel Points Prevented",
        "calculatedData.avgOrangePointsPrevented" : "Avg. Cargo Points Prevented",
        "calculatedData.pointsPrevented" : "Points Prevented",
        "calculatedData.lemonPointsPrevented" : "Panel Points Prevented",
        "calculatedData.orangePointsPrevented" : "Orange Points Prevented"
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
