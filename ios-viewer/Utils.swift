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
            "pitCanBuddyStartLevel2",
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
            "pitMinHeight",
            "pitMaxHeight",
            "pitWeight",
            "pitWheelDiameter",
            "pitDrivetrain",
            "pitProgrammingLanguage",
            "pitClimbType",
            "pitHasCamera",
            "pitHasVision",
            "pitHasGyro",
            "pitHasEncoders",
            "pitCanBuddyStartLevel2",
            "pitSandstormNavigationType",
            "pitHasOrangeShooter",
            "teamNumber",
            "name",
            "matchesPlayed",
            "actualRPs",
            "calculatedData.totalSuperNotes",
            "calculatedData.actualSeed",
            "calculatedData.predictedRPs",
            "calculatedData.predictedSeed",
            "calculatedData.hasOrangeGroundIntake",
            "calculatedData.hasLemonGroundIntake",
            "calculatedData.didPreloadOrange",
            "calculatedData.didPreloadLemon",
            "calculatedData.avgOrangesScored",
            "calculatedData.avgLemonsScored",
            "calculatedData.avgLemonsSpilled",
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
            "calculatedData.avgGoodDecisions",
            "calculatedData.avgBadDecisions",
            "calculatedData.avgTimeIncap",
            "calculatedData.avgTimeImpaired",
            "calculatedData.avgTimeClimbing",
            "calculatedData.percentIncap",
            "calculatedData.percentIncapEntireMatch",
            "calculatedData.percentImpaired",
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
            "calculatedData.lfmAvgLemonsSpilled",
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
            "calculatedData.lfmAvgGoodDecisions",
            "calculatedData.lfmAvgBadDecisions",
            "calculatedData.lfmAvgTimeIncap",
            "calculatedData.lfmAvgTimeImpaired",
            "calculatedData.lfmAvgTimeClimbing",
            "calculatedData.lfmPercentIncap",
            "calculatedData.lfmPercentIncapEntireMatch",
            "calculatedData.lfmPercentImpaired",
            "calculatedData.lfmPercentNoShow",
            "calculatedData.sdAvgOrangesScored",
            "calculatedData.sdAvgLemonsScored",
            "calculatedData.sdAvgLemonsSpilled",
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
            "calculatedData.sdAvgGoodDecisions",
            "calculatedData.sdAvgBadDecisions",
            "calculatedData.sdAvgTimeIncap",
            "calculatedData.sdAvgTimeImpaired",
            "calculatedData.sdAvgTimeClimbing",
            "calculatedData.sdPercentIncap",
            "calculatedData.sdPercentIncapEntireMatch",
            "calculatedData.sdPercentImpaired",
            "calculatedData.sdPercentNoShow",
            "calculatedData.p75avgOrangesScored",
            "calculatedData.p75avgLemonsScored",
            "calculatedData.p75avgLemonsSpilled",
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
            "calculatedData.p75avgGoodDecisions",
            "calculatedData.p75avgBadDecisions",
            "calculatedData.p75avgTimeIncap",
            "calculatedData.p75avgTimeImpaired",
            "calculatedData.p75avgTimeClimbing",
            "calculatedData.p75percentIncap",
            "calculatedData.p75percentIncapEntireMatch",
            "calculatedData.p75percentImpaired",
            "calculatedData.p75percentNoShow",
            "calculatedData.climbSuccessL1",
            "calculatedData.climbSuccessL2",
            "calculatedData.climbSuccessL3"
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
            "Percent Impaired",
            "Cargo Ground Intake",
            "Panel Ground Intake",
            "Avg. Good Decisions",
            "Avg. Bad Decisions"
        ]

        /** Values that should be displayed as long text cells */
        let TIMDLongTextCells : [String] = [
            "superNotes",
            ]

        let longTextCells : [String] = [
            "pitSEALsNotes",
            "pitClimbType"
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
            "pitCanBuddyStartLevel2",
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
                "High Level",
                "Status",
                "Autonomous",
                "Teleoperated",
                "End Game",
                "Super Scout",
                "Pit Scout",
                "SEALS"
            ]
        }
        
        /** Sections of teamDetails view. */
        func keySets(_ minimalist : Bool) -> [[String]] {
            return [
                defaultKeys,
                highLevel,
                statusKeys,
                autoKeys,
                teleKeys,
                endGame,
                superKeys,
                pitKeys,
                sealKeys
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
            "calculatedData.habLineSuccessL2"
        ]

        /** Keys relating to Teleoperated to be displayed on teamDetails */
        let teleKeys: [String] = [
            "calculatedData.hasOrangeGroundIntake",
            "calculatedData.hasLemonGroundIntake",
            "calculatedData.avgOrangesScored",
            "calculatedData.avgLemonsScored",
            "calculatedData.avgLemonsSpilled",
            "calculatedData.avgGoodDecisions",
        ]
        
        /** Dict translating a key for a teamDetails datapoint to the key for the respective TIMD datapoint. Does not include "calculatedData." in the keys. */
        let teamDetailsToTIMD = [

            //status
            "avgTimeIncap" : "calculatedData.timeIncap",
            "avgTimeImpaired" : "calculatedData.timeImpaired",
            "percentNoShow" : "isNoShow",

            //scoring stuff
            "avgOrangesScored" : "calculatedData.orangesScored",
            "avgLemonsScored" : "calculatedData.lemonsScored",
            "avgLemonsSpilled" : "calculatedData.lemonsSpilled",
            "habLineSuccessL1" : "crossedHabLine",
            "habLineSuccessL2" : "crossedHabLine",
            "avgTimeClimbing" : "calculatedData.timeClimbing",

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
            "totalNumGoodDecisions" : "numGoodDecisions",
            "totalNumBadDecisions" : "numBadDecisions",

            //Misc
            "actualNumRPs" : "calculatedData.numRPs",
            "numAutoPoints" : "calculatedData.numAutoPoints"
        ]

        /** Keys relating to the portions of the game that occur in the end (climbing, challenging, etc) */
        let endGame : [String] = [
            "calculatedData.avgTimeClimbing",
            "calculatedData.climbSuccessL1",
            "calculatedData.climbSuccessL2",
            "calculatedData.climbSuccessL3"
        ]

        /** Keys relating to the status of a robot to be displayed on teamDetails */
        let statusKeys : [String] = [
            "calculatedData.avgTimeIncap",
            "calculatedData.avgTimeImpaired",
            "calculatedData.percentIncap",
            "calculatedData.percentIncapEntireMatch",
            "calculatedData.percentImpaired",
            "calculatedData.percentNoShow"
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
            "pitHasVision",
            "pitHasGyro",
            "pitHasEncoders",
            "pitCanBuddyStartLevel2",
            "pitSandstormNavigationType"
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
        "superNotes",
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
    ]

    /** Keys relating to the Teleoperated period to be displayed in the TIMD view */
    static let TIMDTeleKeys : [String] = [
    ]

    /** Keys relating to the status of a robot to be displayed in the TIMD view */
    static let TIMDStatusKeys : [String] = [
    ]

    /** Keys relating to the data Super Scouts collect to be displayed in the TIMD view */
    static let TIMDSuperKeys = [
        "rankSpeed",
        "rankAgility",
        "rankDefense",
        "superNotes",
        "numGoodDecisions",
        "numBadDecisions"
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
        "calculatedData.totalNumGoodDecisions" : "numGoodDecisions",
        "calculatedData.totalNumBadDecisions" : "numBadDecisions"
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
        "pitMinHeight" : "Min. Height",
        "pitMaxHeight" : "Max. Height",
        "pitWeight" : "Robot Weight",
        "pitWheelDiameter" : "Wheel Diameter",
        "pitDrivetrain" : "Drive Train",
        "pitProgrammingLanguage" : "Programming Language",
        "pitClimbType" : "Climb Type",
        "pitHasCamera" : "Has Camera",
        "pitHasVision" : "Has Vision",
        "pitHasGyro" : "Has Gyro",
        "pitHasEncoders" : "Has Encoders",
        "pitCanBuddyStartLevel2" : "Buddy Start L2",
        "pitSandstormNavigationType" : "Sandstorm Nav.",
        "pitHasOrangeShooter" : "Cargo Shooter",
        "teamNumber" : "Team Number",
        "name" : "Name",
        "matchesPlayed" : "Matches Played",
        "actualRPs" : "Avg. RPs",
        "matchDatas" : "Matches",
        "calculatedData" : "Calculated Data",
        "calculatedData.actualSeed" : "Seed",
        "calculatedData.totalSuperNotes" : "Total Super Notes",
        "calculatedData.predictedRPs" : "Predicted RPs",
        "calculatedData.predictedSeed" : "Predicted Seed",
        "calculatedData.hasOrangeGroundIntake" : "Cargo Ground Intake",
        "calculatedData.hasLemonGroundIntake" : "Panel Ground Intake",
        "calculatedData.didPreloadOrange" : "Has Preloaded Cargo",
        "calculatedData.didPreloadLemon" : "Has Preloaded Panel",
        "calculatedData.avgOrangesScored" : "Avg. Cargo Scored",
        "calculatedData.avgLemonsScored" : "Avg. Panels Scored",
        "calculatedData.avgLemonsSpilled" : "Avg. Panel Spills",
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
        "calculatedData.avgGoodDecisions" : "Avg. Good Decisions",
        "calculatedData.avgBadDecisions" : "Avg. Bad Decisions",
        "calculatedData.avgTimeIncap" : "Avg. Time Incap",
        "calculatedData.avgTimeImpaired" : "Avg. Time Impaired",
        "calculatedData.avgTimeClimbing" : "Avg. Time Climbing",
        "calculatedData.percentIncap" : "Percent Incap",
        "calculatedData.percentIncapEntireMatch" : "Percent Entirely Incap Matches",
        "calculatedData.percentImpaired" : "Percent Impaired",
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
        "calculatedData.lfmAvgLemonsSpilled" : "LFM Avg. Panel Spills",
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
        "calculatedData.lfmAvgGoodDecisions" : "LFM Avg. Good Decisions",
        "calculatedData.lfmAvgBadDecisions" : "LFM Avg. Bad Decisions",
        "calculatedData.lfmAvgTimeIncap" : "LFM Avg. Time Incap",
        "calculatedData.lfmAvgTimeImpaired" : "LFM Avg. Time Impaired",
        "calculatedData.lfmAvgTimeClimbing" : "LFM Avg. Time Climbing",
        "calculatedData.lfmPercentIncap" : "LFM Percent Incap",
        "calculatedData.lfmPercentIncapEntireMatch" : "LFM Percent Entirely Incap Matches",
        "calculatedData.lfmPercentImpaired" : "LFM Percent Impaired",
        "calculatedData.lfmPercentNoShow" : "LFM Percent No Show",
        "calculatedData.sdAvgOrangesScored" : "σ Cargo Scored",
        "calculatedData.sdAvgLemonsScored" : "σ Panels Scored",
        "calculatedData.sdAvgLemonsSpilled" : "σ Panel Spills",
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
        "calculatedData.sdAvgGoodDecisions" : "σ Good Decisions",
        "calculatedData.sdAvgBadDecisions" : "σ Bad Decisions",
        "calculatedData.sdAvgTimeIncap" : "σ Time Incap",
        "calculatedData.sdAvgTimeImpaired" : "σ Time Impaired",
        "calculatedData.sdAvgTimeClimbing" : "σ Time Climbing",
        "calculatedData.sdPercentIncap" : "σ Percent Incap",
        "calculatedData.sdPercentIncapEntireMatch" : "σ Percent Entirely Incap Matches",
        "calculatedData.sdPercentImpaired" : "σ Percent Impaired",
        "calculatedData.sdPercentNoShow" : "σ Percent No Show",
        "calculatedData.p75avgOrangesScored" : "75% Avg. Cargo Scored",
        "calculatedData.p75avgLemonsScored" : "75% Avg. Panels Scored",
        "calculatedData.p75avgLemonsSpilled" : "75% Avg. Panel Spills",
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
        "calculatedData.p75avgGoodDecisions" : "75% Avg. Good Decisions",
        "calculatedData.p75avgBadDecisions" : "75% Avg. Bad Decisions",
        "calculatedData.p75avgTimeIncap" : "75% Avg. Time Incap",
        "calculatedData.p75avgTimeImpaired" : "75% Avg. Time Impaired",
        "calculatedData.p75avgTimeClimbing" : "75% Avg. Time Climbing",
        "calculatedData.p75percentIncap" : "75% Percent Incap",
        "calculatedData.p75percentIncapEntireMatch" : "75% Percent Entirely Incap Matches",
        "calculatedData.p75percentImpaired" : "75% Percent Impaired",
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
        "cause" : "Cause",
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
        "calculatedData.lemonsScored" : "Panels Scored",
        "calculatedData.lemonsSpilled" : "Panel Spills",
        "calculatedData.lemonLoadSuccess" : "Panel Loading Success",
        "calculatedData.timeIncap" : "Time Incap",
        "calculatedData.timeImpaired" : "Time Impaired",
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
        "calculatedData.climbSuccessL1" : "Level 1 Climb Success",
        "calculatedData.climbSuccessL2" : "Level 2 Climb Success",
        "calculatedData.climbSuccessL3" : "Level 3 Climb Success"
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
