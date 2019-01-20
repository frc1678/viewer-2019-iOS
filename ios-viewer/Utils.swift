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
            "self",
            "robot1",
            "robot2",
            "pitHasCamera",
            "pitHasVision",
            "pitHasPid",
            "pitHasGyro",
            "pitHasEncoders",
            "pitCanBuddyStartLevel2",
            "pitSandstormNavigationType",
            "pitHasOrangeShooter",
            "number",
            "name",
            "actualRPs",
            "matchesPlayed",
            "calculatedData",
            "actualSeed",
            "predictedRPs",
            "predictedSeed",
            "hasOrangeGroundIntake",
            "hasLemonGroundIntake",
            "didPreloadOrange",
            "didPreloadLemon",
            "avgOrangesScored",
            "avgLemonsScored",
            "avgOrangeFouls",
            "lemonLoadSuccess",
            "orangeCycleAll",
            "orangeCycleL1",
            "orangeCycleL2",
            "orangeCycleL3",
            "lemonCycleAll",
            "lemonCycleL1",
            "lemonCycleL2",
            "lemonCycleL3",
            "orangeSuccessAll",
            "orangeSuccessDefended",
            "orangeSuccessUndefended",
            "orangeSuccessL1",
            "orangeSuccessL2",
            "orangeSuccessL3",
            "lemonSuccessAll",
            "lemonSuccessDefended",
            "lemonSuccessUndefended",
            "lemonSuccessL1",
            "lemonSuccessL2",
            "lemonSuccessL3",
            "lemonSuccessFromSide",
            "habLineSuccessL1",
            "habLineSuccessL2",
            "avgGoodDecisions",
            "avgBadDecisions",
            "avgTimeIncap",
            "avgTimeImpaired",
            "avgTimeClimbing",
            "percentIncap",
            "percentImpaired",
            "percentNoShow",
            "predictedDedicatedLemonCycles",
            "predictedDedicatedOrangeCycles",
            "predictedSoloPoints",
            "orangeAbility",
            "lemonAbility",
            "firstPickAbility",
            "secondPickAbility",
            "lfmAvgOrangesScored",
            "lfmAvgLemonsScored",
            "lfmAvgOrangeFouls",
            "lfmLemonLoadSuccess",
            "lfmOrangeCycleAll",
            "lfmOrangeCycleL1",
            "lfmOrangeCycleL2",
            "lfmOrangeCycleL3",
            "lfmLemonCycleAll",
            "lfmLemonCycleL1",
            "lfmLemonCycleL2",
            "lfmLemonCycleL3",
            "lfmOrangeSuccessAll",
            "lfmOrangeSuccessDefended",
            "lfmOrangeSuccessUndefended",
            "lfmOrangeSuccessL1",
            "lfmOrangeSuccessL2",
            "lfmOrangeSuccessL3",
            "lfmLemonSuccessAll",
            "lfmLemonSuccessDefended",
            "lfmLemonSuccessUndefended",
            "lfmLemonSuccessL1",
            "lfmLemonSuccessL2",
            "lfmLemonSuccessL3",
            "lfmLemonSuccessFromSide",
            "lfmHabLineSuccessL1",
            "lfmHabLineSuccessL2",
            "lfmAvgGoodDecisions",
            "lfmAvgBadDecisions",
            "lfmAvgTimeIncap",
            "lfmAvgTimeImpaired",
            "lfmAvgTimeClimbing",
            "lfmPercentIncap",
            "lfmPercentImpaired",
            "lfmPercentNoShow",
            "sdAvgOrangesScored",
            "sdAvgLemonsScored",
            "sdAvgOrangeFouls",
            "sdLemonLoadSuccess",
            "sdOrangeCycleAll",
            "sdOrangeCycleL1",
            "sdOrangeCycleL2",
            "sdOrangeCycleL3",
            "sdLemonCycleAll",
            "sdLemonCycleL1",
            "sdLemonCycleL2",
            "sdLemonCycleL3",
            "sdOrangeSuccessAll",
            "sdOrangeSuccessDefended",
            "sdOrangeSuccessUndefended",
            "sdOrangeSuccessL1",
            "sdOrangeSuccessL2",
            "sdOrangeSuccessL3",
            "sdLemonSuccessAll",
            "sdLemonSuccessDefended",
            "sdLemonSuccessUndefended",
            "sdLemonSuccessL1",
            "sdLemonSuccessL2",
            "sdLemonSuccessL3",
            "sdLemonSuccessFromSide",
            "sdHabLineSuccessL1",
            "sdHabLineSuccessL2",
            "sdAvgGoodDecisions",
            "sdAvgBadDecisions",
            "sdAvgTimeIncap",
            "sdAvgTimeImpaired",
            "sdAvgTimeClimbing",
            "sdPercentIncap",
            "sdPercentImpaired",
            "sdPercentNoShow",
            "p75avgOrangesScored",
            "p75avgLemonsScored",
            "p75avgOrangeFouls",
            "p75lemonLoadSuccess",
            "p75orangeCycleAll",
            "p75orangeCycleL1",
            "p75orangeCycleL2",
            "p75orangeCycleL3",
            "p75lemonCycleAll",
            "p75lemonCycleL1",
            "p75lemonCycleL2",
            "p75lemonCycleL3",
            "p75orangeSuccessAll",
            "p75orangeSuccessDefended",
            "p75orangeSuccessUndefended",
            "p75orangeSuccessL1",
            "p75orangeSuccessL2",
            "p75orangeSuccessL3",
            "p75lemonSuccessAll",
            "p75lemonSuccessDefended",
            "p75lemonSuccessUndefended",
            "p75lemonSuccessL1",
            "p75lemonSuccessL2",
            "p75lemonSuccessL3",
            "p75lemonSuccessFromSide",
            "p75habLineSuccessL1",
            "p75habLineSuccessL2",
            "p75avgGoodDecisions",
            "p75avgBadDecisions",
            "p75avgTimeIncap",
            "p75avgTimeImpaired",
            "p75avgTimeClimbing",
            "p75percentIncap",
            "p75percentImpaired",
            "p75percentNoShow",
        ]
        
        /**
         Values that should not be graphed
         */
        let notGraphingValues = [
            "First Pick Ability",
            "Second Pick Ability",
            "Avg. Driving Ability",
            "Picklist Position",
        ]
        
        /** Values that should be displayed as long text cells */
        let TIMDLongTextCells : [String] = [
            "superNotes"
        ]
        
        let longTextCells : [String] = [
            "pitSEALsNotes"
        ]
        
        let unrankedCells = [
            "selectedImageURL",
            "otherUrls",
            "picklistPosition",
        ]
        
        /** Values to be displayed as percentages. */
        let percentageValues : [String] = [
        ]
        
        let addCommasBetweenCapitals : [String] = []
        
        let boolValues = [
            "pitHasCamera",
        ]
        
        
        let keySetNamesOld = [
            "Information",
            "Ability - High Level",
            "Autonomous",
            "TeleOp",
            "Percentages",
            "Pit Scouting / Robot Design",
            "Additional Info",
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
                    "Status",
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
             "calculatedData.secondPickAbility",
             "picklistPosition",
        ]
        
        /** Keys relating to autonomous to be displayed on teamDetails. */
        let autoKeys: [String] = [
        //Some stuff is not needed
        ]
        
        /** Keys relating to Teleoperated to be displayed on teamDetails */
        let teleKeys: [String] = [
        ]
        
        /** Dict translating a key for a teamDetails datapoint to the key for the respective TIMD datapoint. Does not include "calculatedData." in the keys. */
        let teamDetailsToTIMD = [
            //status
            //scoring stuff
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
            "numAutoPoints" : "calculatedData.numAutoPoints",
            
            ]
        
        /** Keys relating to the portions of the game that occur in the end (climbing, challenging, etc) */
        let endGame : [String] = [
        ]
        
        /** Keys relating to the status of a robot to be displayed on teamDetails */
        let statusKeys : [String] = [
        ]
        
        /** Keys relating to the data the pit scout collects to be displayed on teamDetails */
        let pitKeys = [
            "pitDrivetrain",
            "pitAvailableWeight",
            "pitWidth",
            "pitLength",
            "pitProgrammingLanguage",
            "pitWheelDiameter",
            "pitHasCamera",
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
        "calculatedData.avgDrivingAbility",
        "calculatedData.avgSpeed",
        "calculatedData.avgAgility",
        "calculatedData.avgDefense",
        "calculatedData.totalNumGoodDecisions",
        "calculatedData.totalNumBadDecisions"
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
        "calculatedData.totalNumBadDecisions" : "numBadDecisions",
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
        "secondPickAbility",
    ]
    
    /** Calculated TIMD keys */
    static let calculatedTeamInMatchDataKeys = [
        "calculatedData.firstPickAbility",
        "calculatedData.numRPs",
        "calculatedData.secondPickAbility",
    ]
    
    /** A dictionary with datapoints as keys and Human Readable versions as values */
    static let humanReadableNames = [
        "superNotes": "Super Scout Notes",
        "pitSEALsNotes" : "SEALs Notes",
        "calculatedData.actualSeed" : "Seed",
        "calculatedData.driverAbility" : "Driver Ability",
        "calculatedData.firstPickAbility" : "First Pick Ability",
        "calculatedData.numRPs" : "Number of RPs",
        "calculatedData.actualNumRPs": "# of RPs",
        "calculatedData.predictedRPs" : "Predicted # of RPs",
        "calculatedData.predictedSeed" : "Predicted Seed",
        "calculatedData.secondPickAbility" : "Second Pick Ability",
        "matchDatas" : "Matches",
        "TeamInMatchDatas" : "TIMDs",
        "calculatedData.RScoreDrivingAbility": "R Score Driving Ability",
        "calculatedData.drivingAbility": "Driving Ability",
        "pitDriveBaseWidth" : "Drive Base Width",
        "pitDriveBaseLength" : "Drive Base Length",
        "pitNotes" : "Pit Notes",
        "pitCheesecakeAbility" : "Cheesecake Ease",
        "pitProgrammingLanguage": "Prog. Lang.",
        "pitAvailableWeight" : "Avail. Weight",
        "pitOrganization" : "Pit Organization",
        "pitCanCheesecake": "Cheesecakable",
        "rankDefense" : "Defense Rank",
        "rankAgility" : "Agility Rank",
        "rankSpeed" : "Speed Rank",
        "calculatedData.RScoreSpeed" : "R Score Speed",
        "calculatedData.RScoreAgility": "R Score Agility",
        "calculatedData.RScoreDefense": "R Score Defense",
        "calculatedData.avgAgility": "Avg. Agility",
        "calculatedData.avgDefense": "Avg. Defense",
        "calculatedData.avgSpeed": "Avg. Speed",
        "calculatedData.avgDrivingAbility": "Avg. Driving Ability",
        "pitDrivetrain" : "Drive Train",
        "calculatedData.totalNumGoodDecisions" : "Total # of Good Decisions",
        "calculatedData.totalNumBadDecisions" : "Total # of Bad Decisions",
        "numGoodDecisions" : "Good Decisions",
        "numBadDecisions" : "Bad Decisions",
        "pitWidth" : "Robot Width",
        "pitLength" : "Robot Length",
        "picklistPosition" : "Picklist Position",
        "pitHasCamera" : "Has Camera",
        "name" : "Name",
        "number" : "Number",
        "calculatedData" : "Calculated Data",
        "pitSelectedImage" : "Selected Image",
        "pitAllImageURLs" : "All Image URLs",
        "pitImageKeys" : "Image Keys",
        "pitHasPid" : "PID On Drive Train",
        "pitHasGyro" : "Has Gyro",
        "pitHasEncoders" : "Encoders On Both Sides",
        "matchesPlayed" : "Matches Played",
        "calculatedData.avgNumGoodDecisions" : "Avg. Good Decisions",
        "calculatedData.avgNumBadDecisions" : "Avg. Bad Decisions",
        "calculatedData.totalSuperNotes" : "Super Notes",
        "calculatedData.predictedTotalNumRPs" : "Predicted RPs",
        "calculatedData.totalNumRPs" : "Total RPs",
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

