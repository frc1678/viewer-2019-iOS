//
//  FirebaseDataFetcher.swift
//  scout-viewer-2016-iOS
//
//  Created by Samuel Resendez on 1/23/16.
//  Copyright © 2016 Citrus Circuits. All rights reserved.
//

import UIKit
import Firebase
import Haneke
import UserNotifications
import SwiftyJSON

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class FirebaseDataFetcher: NSObject, UITableViewDelegate {
    var notificationCounter = 0
    let cache = Shared.dataCache
    let imageCache = Shared.imageCache
    let notificationManager : NotificationManager
    var NSCounter = -2
    var hasUpdatedMatchOnSetup = false
    var firstCurrentMatchUpdate = true
    @objc let currentMatchManager : CurrentMatchManager
    
    var matchCounter = 0
    var TIMDCounter = 0
    var teamCounter = 0
    
    var teams = [Team]()
    //beginning of url for firebase
    let firebaseURLFirstPart = "https://1678-scouting-2016.firebaseio.com/"
    
    let scoutingToken = "qVIARBnAD93iykeZSGG8mWOwGegminXUUGF2q0ee"
    let dev3Token = "AEduO6VFlZKD4v10eW81u9j3ZNopr5h2R32SPpeq"
    let dev2Token = "hL8fStivTbHUXM8A0KXBYPg2cMsl80EcD7vgwJ1u"
    let devToken = "j1r2wo3RUPMeUZosxwvVSFEFVcrXuuMAGjk6uPOc"
    let stratDevToken = "IMXOxXD3FjOOUoMGJlkAK5pAtn89mGIWAEnaKJhP"
    //array of all matches
    @objc var matches = [Match]()
    //array of all TIMDs
    var teamInMatches = [TeamInMatchData]()
    //image urls
    var imageUrls = [Int: String]()
    var allTheData = NSDictionary()
    //picklists
    @objc var picklistPassword = ""
    @objc var firstPicklist = [Int]()
    var secondPicklist = [Int]()
    var slackProfiles = [String:SlackProfile]()
    var activeProfiles = [String:SlackProfile]()

    var firebase : DatabaseReference
    
    override init() {
        //reference to firebase
        firebase = Database.database().reference()
        //initiate currentmatchmanager
        self.currentMatchManager = CurrentMatchManager()
        //initiate notification manager
        self.notificationManager = NotificationManager(secsBetweenUpdates: 5, notifications: [])
        super.init()
        
        self.notificationManager.notifications.append(NotificationManager.Notification(name: "updateLeftTable"))
        
        //retrieve data
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.getSlackProfiles()
            self.getPicks()
            self.currentMatchManager.cache_wait.notify(queue: .main) {
                self.getAllTheData()
            }
        }
        
    }
    
    /** Gets the slack profiles on firebase. */
    func getSlackProfiles() {
        self.firebase.observeSingleEvent(of: .value, with: { (snapshot) -> Void in
            var profiles : [String:SlackProfile] = [:]
            if let snappy = snapshot.childSnapshot(forPath: "slackProfiles").value as? [String:[String:Any]] {
                for i in snappy.values {
                    profiles[(snappy as NSDictionary?)?.allKeys(for: i)[0] as! String] = SlackProfile(json: JSON(snapshot.childSnapshot(forPath: "slackProfiles").childSnapshot(forPath: (snapshot.childSnapshot(forPath: "slackProfiles").value as? [String:[String:Any]] as NSDictionary?)?.allKeys(for: i)[0] as! String).value))
                }
                if profiles.count != 0 {
                    self.slackProfiles = profiles
                } else {
                    print("Problem getting slack profiles: Profiles not castable")
                }
            } else {
                print("Problem getting slack profiles: Profiles really not castable (probably nil)")
            }
            if let snappy = snapshot.childSnapshot(forPath: "activeSlackProfiles").value as? [String:[String:Any]] {
                for i in snappy.values {
                    self.activeProfiles[(snappy as NSDictionary?)?.allKeys(for: i)[0] as! String] = SlackProfile(json: JSON(i))
                }
            } else {
                print("Problem getting slack profiles: Profiles really not castable (probably nil)")
            }
        })
    }
    
    /** Gets the picklist password. */
    @objc func getPicks() {
        self.firebase = Database.database().reference()
        self.firebase.observe(.value, with: { (snapshot) -> Void in
            if let password = snapshot.childSnapshot(forPath: "PicklistPassword").value as? String, snapshot.childSnapshot(forPath: "PicklistPassword").value as? String != "" {
                self.picklistPassword = password
                print("Done getting picklist and password. Password is \(self.picklistPassword)")
            } else {
                self.firebase.child("PicklistPassword").setValue("password")
            }
            if let firstPicks = snapshot.childSnapshot(forPath: "picklist").value as? [Int] {
                let thingENum = snapshot.childSnapshot(forPath: "picklist").children
                var thingArray: [Int] = []
                for i in thingENum {
                    thingArray.append((i as! DataSnapshot).value as! Int)
                }
                self.firstPicklist = firstPicks
            } else {
                for i in self.getFirstPickList() {
                    self.firstPicklist.append(i.teamNumber)
                }
            }
            for i in self.getOverallSecondPickList() {
                self.secondPicklist.append(i.teamNumber)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pickBoi"), object:self)
        })
    }
    
    /** 
        Returns a match given a snapshot.
        - parameter snapshot: The snapshot of a match.
    */
    func makeMatchFromSnapshot(_ snapshot: DataSnapshot) -> Match {
        
        return Match(json: JSON(snapshot.value!))
    }
    
    /**
        Returns a team given a snapshot.
        - parameter snapshot: The snapshot of a team.
     */
    func makeTeamFromSnapshot(_ snapshot: DataSnapshot) -> Team {
        return Team(json: JSON(snapshot.value!))
    }
    
    // MARK: Image Fetching Methods
    func getDataFromUrl(_ url:URL, completion: @escaping ((_ data: Data?, _ error: NSError? ) -> Void)) {
        URLSession.shared.dataTask(with: url, completionHandler: {  (data, _, error) in //Should already be async
            completion(data, error as NSError?)
            URLSession.shared.invalidateAndCancel()
            }) .resume()
    }
    
    /**
        Caches an image.
        - parameter teamNum: The team to cache the image to.
        - parameter url: The url of the image (from firebase)
     */
    func cacheImage(_ teamNum : Int, url : String?) {
        if let urlString = url {
            let url = URL(string: urlString)
            //get the info from the url that's passed in
            getDataFromUrl(url!) { [unowned self] (data, error) in
                guard let data = data , error == nil else { return }
                //cache the image to the team
                self.imageCache.set(value: UIImage(data: data) ?? UIImage(), key: "\(teamNum)")
                //warn that memory updated?
                UIApplication.shared.perform(Selector(("_performMemoryWarning")))
            }
        }
    }
    
    /** 
        Gets an image for a team.
        - parameter teamNumber: Team for which it is getting the image.
     */
    func getImageForTeam(_ teamNumber : Int, fetchedCallback : @escaping (UIImage)->(), couldNotFetch: @escaping ()->()) { // Is already async
        //go into the cache and find a team. get the image from the team
        self.imageCache.fetch(key: "\(teamNumber)").onSuccess { (image) -> () in
            fetchedCallback(image)
            }.onFailure { (E) -> () in
                couldNotFetch()
        }
    }
    
    /** 
        Caches a new team photo if the it has changed and agressive photo downloading is enabled.
        - parameter team: Team to download photo for
        - parameter snap: Snapshot of the firebase to pull images from
    */
    func updateCacheIfNeeded(_ snap : DataSnapshot, team : Team) {
        let defaults = UserDefaults.standard
        //check if the user wants to aggressively download
        /*let shouldAggressivelyDownload = defaults.bool(forKey: "predownloadPreference")
        if shouldAggressivelyDownload {
            //look for the selected image url on firebase
            if let newURL = snap.childSnapshot(forPath: "selectedImageURL").value {
                //if the url has changed
                if team.pitSelectedImage != newURL as? String {
                    //cache the new image under the team's number
                    cacheImage(snap.childSnapshot(forPath: "number").value as! Int, url: newURL as? String)
                }
            }
        }*/
    }
    
    // MARK: Data Fetching
    /**
        Retrieves many datas
    */
    func getAllTheData() {
            //create a firebase reference that points to Matches
            let matchReference = self.firebase.child("Matches")
            
            //if a child is added to the matches on firebase, make a snapshot
            matchReference.observe(.childAdded, with: { [unowned self] snapshot in
                //appends a match for the current snapshot to the matches
                let tempMatch = self.makeMatchFromSnapshot(snapshot)
                if (self.currentMatchManager.matches.filter { $0.matchNumber == tempMatch.matchNumber }).count == 0 {
                    self.currentMatchManager.matches.append(tempMatch)
                }
                self.currentMatchManager.currentMatch = self.currentMatchManager.currentMatch
                if self.hasUpdatedMatchOnSetup == false {
                    self.hasUpdatedMatchOnSetup = true
                    self.notificationManager.queueNote("updateLeftTable", specialObject: nil)
                }
                })
            //if a child has changed, make a snapshot
            matchReference.observe(.childChanged, with: { [unowned self] snapshot in
                //increase matchCounter
                self.matchCounter += 1
                print("Current Match Updated. New: \(self.currentMatchManager.currentMatch)")
                self.currentMatchManager.currentMatch = self.currentMatchManager.currentMatch
                //gets the match number
                let number = (snapshot.childSnapshot(forPath: "matchNumber").value as? Int)!
                for matchIndex in 0..<self.currentMatchManager.matches.count {
                    let match = self.currentMatchManager.matches[matchIndex]
                    if match.matchNumber == number {
                        //update the appropriate match
                        self.currentMatchManager.matches[matchIndex] = self.makeMatchFromSnapshot(snapshot)
                        
                        if match.redActualScore == -1 && self.currentMatchManager.matches[matchIndex].redActualScore != -1 {
                        }
                        self.notificationManager.queueNote("updateLeftTable", specialObject: nil)
                    }
                }
                })
            //create a reference to teams
            let teamReference = self.firebase.child("Teams")
            //if there's a new child, make a snapshot
            teamReference.observe(.childAdded, with: { [unowned self] snapshot in
                DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                    //makes a team
                    let team = self.makeTeamFromSnapshot(snapshot)
                    //if the team is a real team
                    if team.teamNumber != -1 && (self.currentMatchManager.teams.filter { $0.teamNumber == team.teamNumber }).count == 0 {
                        //update cache
                        self.updateCacheIfNeeded(snapshot, team: team)
                        DispatchQueue.main.async {
                            //add the team to the list
                            self.currentMatchManager.teams.append(team)
                            self.notificationManager.queueNote("updateLeftTable", specialObject: team)
                        }
                    }
                }
                })
            
            //if a team has changed
            teamReference.observe(.childChanged, with: { [unowned self] snapshot in
               DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                    //increase the team counter
                    self.teamCounter += 1
                    //make a team out of the snapshot
                    let team = self.makeTeamFromSnapshot(snapshot)
                    //if the team's real
                    if team.teamNumber != -1 {
                        //update cache (images)
                        self.updateCacheIfNeeded(snapshot, team: team)
                        DispatchQueue.main.async {
                            //filter the teams to find the changed team
                            let te = self.currentMatchManager.teams.filter({ (t) -> Bool in
                                if t.teamNumber == team.teamNumber { return true }
                                return false
                            })
                            if te.count > 0 {
                            if let index = self.currentMatchManager.teams.index(of: te[0]) {
                                self.currentMatchManager.teams[index] = team
                                
                                self.notificationManager.queueNote("updateLeftTable", specialObject: team)
                                self.NSCounter = 0
                                self.teamCounter = 0
                                
                            }
                            }
                        }
                    }
                }
                })
            //get a ref to timds
            let timdRef = self.firebase.child("TIMDs")
            //if a new timd was added
            timdRef.observe(.childAdded, with: { [unowned self] (snap) -> Void in
                DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                    //get a timd for the snapshot
                    let timd = TeamInMatchData(json: JSON(snap.value!))
                    DispatchQueue.main.async {
                        //add the timd to the list
                        self.teamInMatches.append(timd)
                        self.notificationManager.queueNote("updateLeftTable", specialObject: nil)
                    }
                }
                })
            
            //if a timd was updated
            timdRef.observe(.childChanged, with: { [unowned self] (snap) -> Void in
                DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                    //increase the counter
                    self.TIMDCounter += 1
                    //get the timd
                    let timd = TeamInMatchData(json: JSON(snap.value!))
                    DispatchQueue.main.async {
                        //filter to get the appropriate match
                        let tm = self.teamInMatches.filter({ (t) -> Bool in
                            if t.teamNumber == timd.teamNumber && t.matchNumber == timd.matchNumber { return true }
                            return false
                        })
                        //find the index of the timd
                        if let index = self.teamInMatches.index(of: tm[0]) {
                            //replace the timd
                            self.teamInMatches[index] = timd
                        }
                        
                    }
                }
                })
            
            self.firstCurrentMatchUpdate = false
            
            //get the current match
            let currentMatchFetch = self.getMatch(self.currentMatchManager.currentMatch)
            
            let m : [String: Any] = ["num":self.currentMatchManager.currentMatch, "redTeams": currentMatchFetch?.redTeams ?? [0,0,0], "blueTeams": currentMatchFetch?.blueTeams ?? [0,0,0]]
            UserDefaults.standard.set(m, forKey: "match")
        
    }
    
    /**
        Gets an array of all TIMDs for a team
        - parameter team: Team for which TIMDs are to be retrieved
    */
    func getTIMDataForTeam(_ team: Team) -> [TeamInMatchData] {
        print("All TIMDs for our team: \(self.teamInMatches.filter { $0.teamNumber == team.teamNumber })")
        return self.teamInMatches.filter { $0.teamNumber == team.teamNumber }
    }
    
    /**
        Retrieves a TIMD given a team and match
        - parameter team: Team for which the TIMD is being retrieved
        - parameter inMatch: Match for which the TIMD is being retrieved
    */
    func getTIMDataForTeamInMatch(_ team:Team, inMatch: Match) -> TeamInMatchData? {
        //gets timds for the team
        let TIMData = self.getTIMDataForTeam(team)
        //if the team has timds
        if TIMData.count > 0 {
            //filter to get the timd with the match number of inMatch
            let correctTIMDs = TIMData.filter { $0.matchNumber == inMatch.matchNumber} //Hopefully there is exactly one
            
            if correctTIMDs.count == 1 {
                return correctTIMDs[0]
            }
        }
        print("Problem geting TIMData. There was not exactly 1 match for the specifications.")
        return nil
    }
    
    /**
     Gets an array of team objects
     - parameter teamNums: Array of team numbers
     */
    @objc func getTeamsFromNumbers(_ teamNums: [Int]?) -> [Team] {
        var teams = [Team]()
        if teamNums != nil {
            for teamNum in teamNums! {
                if let team = self.getTeam(teamNum) {
                    teams.append(team)
                }
            }
        }
        return teams
    }
    
    
    /**
        Gets team object given team number
        - parameter teamNum: Number of the team
    */
    func getTeam(_ teamNum: Int) -> Team? {
        //filter to end up with only the team(s) with the given number
        let myTeams = self.currentMatchManager.teams.filter { $0.teamNumber == teamNum }
        if myTeams.count == 1 { return myTeams[0] }
        else if myTeams.count > 1 {
            print("More than 1 team with number \(teamNum)")
            return nil
        } else {
            print("No Teams with number \(teamNum)")
            return nil
        }
    }
    
    /**
        Retrieves a match object given a match number
        - parameter matchNum: Number of the match
    */
    func getMatch(_ matchNum: Int) -> Match? {
        //filter to get the match(es) with the given number
        let myMatches = self.currentMatchManager.matches.filter { $0.matchNumber == matchNum }
        if myMatches.count == 1 { return myMatches[0] }
        else if myMatches.count > 1 {
            print("More than 1 match with number \(matchNum)")
            return nil
        } else {
            print("No Matches with number \(matchNum)")
            return nil
        }
    }
    

    /**
        Retrieves every team in the form of a team object in a given match
        - parameter match: Match object for which to retrieve teams
    */
    func allTeamsInMatch(_ match: Match) -> [Team]  {
        let redTeams = getTeamsFromNumbers(match.redTeams! as [Int])
        let blueTeams = getTeamsFromNumbers(match.blueTeams! as [Int])
        return redTeams + blueTeams
    }
    
    /**
        Gets all matches containing a team
        - parameter number: Number of the team for which to retrieve matches
    */
    func getMatchesForTeamWithNumber(_ number:Int) -> [Match] {
        var array = [Match]()
        //iterate thru all matches
        for match in self.currentMatchManager.matches {
            //iterate thru all red teams
            for teamNumber in match.redTeams! {
                //if the team matches, add that match
                if (teamNumber as Int) == number {
                    array.append(match)
                }
            }
            //iterate thru all blue teams
            for teamNumber in match.blueTeams! {
                //if the team matches, add that match
                if (teamNumber as Int) == number {
                    array.append(match)
                }
            }
        }
        //sort array by # and return it
        return array.sorted { $0.matchNumber < $1.matchNumber }
    }
    
    /**
        Gets an array of match numbers that a team is in
        - parameter number: Number of team to get match nums for
    */
    func matchNumbersForTeamNumber(_ number: Int) -> [Int] {
        func matchNum(_ match : Match) -> Int {
            return match.matchNumber
        }
        return self.getMatchesForTeamWithNumber(number).map(matchNum)
    }
    
    /** See getMatchesForTeamWithNumber */
    func getMatchesForTeam(_ teamNumber: Int) -> [Match] {
        var importantMatches = [Match]()
        //iterate thru all matches
        for match in self.currentMatchManager.matches {
            //get all teams
            let teamNumArray = match.redTeams! + match.blueTeams!
            //iterate thru all teams
            for number in teamNumArray {
                //if the match contains the team
                if (number as Int) == (teamNumber as Int) {
                    //this is an important match
                    importantMatches.append(match)
                }
            }
        }
        //sort
        importantMatches.sort { $0.matchNumber > $1.matchNumber }
        //return
        return importantMatches
    }
    
    
    // MARK: Rank
    /** Returns first pick list */
    @objc func getFirstPickList() -> [Team] {
        //sorts teams by first pick ability
        return currentMatchManager.teams.sorted { $0.calculatedData?.firstPickAbility > $1.calculatedData!.firstPickAbility }
    }
    
    /** Returns second pick list */
    @objc func getOverallSecondPickList() -> [Team] {
        return self.currentMatchManager.teams.sorted { $0.calculatedData?.secondPickAbility > $1.calculatedData?.secondPickAbility }
    }
    
    /** Get list of teams sorted by seed */
    @objc func seedList() -> [Team] {
        return (currentMatchManager.teams.sorted { $0.calculatedData!.actualSeed < $1.calculatedData!.actualSeed }).filter { $0.calculatedData?.actualSeed != 0 }
    }
    
    /** Get list of teams sorted by predicted seed */
    @objc func predSeedList() -> [Team] {
        return currentMatchManager.teams.sorted { $0.calculatedData!.predictedSeed < $1.calculatedData!.predictedSeed }
    }
    
    /** 
        Gets rps predicted for a given team and match
        - parameter teamNumber: Team number to calculate RPs for
        - parameter matchNum: Match number to calculate RPs for
    */
    func predictedRPsKeyForTeamNum(_ teamNumber: Int, matchNum: Int) -> String {
        let match = getMatch(matchNum)
        if (match?.redTeams!.contains(teamNumber))! {
                    return "calculatedData.predictedRedRPs"
        } else {
            return "calculatedData.predictedBlueRPs"
        }
    }
    
    /** 
        Gets the rank of a team given a certain characteristic
        - parameter team: Team to find rank for
        - parameter withCharacteristic: Characteristic to rank by
    */
    @objc func rankOfTeam(_ team: Team, withCharacteristic: String) -> Int {
        var counter = 0
        //sort teams by the characteristic
        let sortedTeams : [Team] = self.getSortedListbyString(withCharacteristic)
        
        //iterate thru the sorted teams
        for loopTeam in sortedTeams {
            //increase the counter
            counter += 1
            //if team is found
            if loopTeam.teamNumber == team.teamNumber {
                //return rank (how many teams it went thru before it got this team)
                return counter
            }
        }
        return counter
    }
    
    /** See rankOfTeam, reverses */
    @objc func reverseRankOfTeam(_ team: Team, withCharacteristic:String) -> Int {
        var counter = 0
        let sortedTeams : [Team] = self.getSortedListbyString(withCharacteristic).reversed().filter { $0.calculatedData?.actualSeed != 0 }
        
        for loopTeam in sortedTeams {
            counter += 1
            if loopTeam.teamNumber == team.teamNumber {
                return counter
            }
        }
        return counter
    }
    
    func ranksOfTeamInMatchDatasWithCharacteristic(_ characteristic: NSString, forTeam: Team) -> [Int] {
        var array = [Int]()
        let TIMDatas = getTIMDataForTeam(forTeam)
        for timData in TIMDatas {
            array.append(self.rankOfTeamInMatchData(timData, withCharacteristic: characteristic))
        }
        return array
    }
    
    func rankOfTeamInMatchData(_ timData: TeamInMatchData, withCharacteristic: NSString) -> Int {
        var values = [Int]()
        //gets team number from timd
        let teamNum = timData.teamNumber!
        //gets timds for the number
        let TIMDatas = getTIMDataForTeam(self.getTeam(teamNum)!)
        //iterate thru team's timds
        for timData in TIMDatas {
            //add match's number
            values.append(timData.matchNumber!)
        }
        //at this point values is an array of all match numbers the team plays in
        //return one more than the position the team's number is?
        return values.index(of: teamNum)! + 1
    }
    
    /** 
        Ranks all teams by a characteristic
        - parameter characteristic: Characteristic to rank teams by
    */
    func ranksOfTeamsWithCharacteristic(_ characteristic: NSString) -> [Int] {
        var array = [Int]()
        for team in self.currentMatchManager.teams {
            array.append(self.rankOfTeam(team, withCharacteristic: characteristic as String))
        }
        //array of all teams in numerical order, represented by rank with characteristic
        return array
    }
    
    func getSortedListbyString(_ path: String) -> [Team] {
        
        return currentMatchManager.teams.sorted(by: { (t1, t2) -> Bool in
            
            if let t1v = t1.value(forKeyPath: path) {
                if let t2v = t2.value(forKeyPath: path) {
                    if (t1v as AnyObject).doubleValue > (t2v as AnyObject).doubleValue {
                        return true
                    }
                }
            }
            
            return false
        })
    }
    
    // MARK: Search Bar
    /** 
        Filters matches according to the search string when set to matches
        - parameter searchString: String to filter results by
    */
    @objc func filteredMatchesForMatchSearchString(_ searchString:String) -> [Match] {
        var filteredMatches = [Match]()
        var searchArray: [String] = []
        var tempWord = ""
        for char in searchString {
            if char != "," {
                tempWord.append(char)
            } else {
                searchArray.append(tempWord)
                tempWord = ""
            }
        }
        searchArray.append(tempWord)
        for match in self.currentMatchManager.matches  {
            for i in searchArray {
                if !filteredMatches.contains(match) {
                    //if the match contains the search field
                    if String(describing: match.matchNumber).range(of: i) != nil {
                        filteredMatches.append(match)
                    }
                }
            }
        }
        return filteredMatches
    }
    
    /** Filters matches according to the search string when set to teams. See filteredMatchesForMatchSearchString */
    @objc func filteredMatchesforTeamSearchString(_ searchString: String) -> [Match] {
        var filteredMatches = [Match]()
        var searchArray: [String] = []
        var tempWord = ""
        for char in searchString {
            if char != "," {
                tempWord.append(char)
            } else {
                searchArray.append(tempWord)
                tempWord = ""
            }
        }
        searchArray.append(tempWord)
        for match in self.matches  {
            for i in searchArray {
                for teamNum in match.redTeams! {
                    if filteredMatches.contains(match) != true {
                        if String(describing: teamNum).range(of: i) != nil || String(describing: getTeam(teamNum)?.name).range(of: i) != nil {
                            filteredMatches.append(match)
                        }
                    }
                }
                for teamNum in match.blueTeams! {
                    if filteredMatches.contains(match) != true {
                        if String(describing: teamNum).range(of: i) != nil || String(describing: getTeam(teamNum)?.name).range(of: i) != nil {
                            filteredMatches.append(match)
                        }
                    }
                }
            }
        }
        return filteredMatches
    }
    
    /** 
        Filters general searches
        - parameter searchString: String to filter results by
    */
    @objc func filteredTeamsForSearchString(_ searchString: String) -> [Team] {
        var filteredTeams = [Team]()
        for team in self.currentMatchManager.teams {
            //if team number contains search field
            if String(describing: team.teamNumber).range(of: searchString) != nil {
                filteredTeams.append(team)
            }
        }
        return filteredTeams
    }
    
    
    
    // MARK: Grapher Class
    /** 
        Creates an NSArray of all values in TIMDs for a given team at a certain path
        - parameter path: Value to list
        - parameter forTeam: Team to get values for
    */
    func valuesInTeamMatchesOfPath(_ path: NSString, forTeam: Team) -> NSArray {
        let array = NSMutableArray()
        //get timds
        let teamInMatchDatas = self.getTIMDataForTeam(forTeam)
        //iterate thru timds
        for data in teamInMatchDatas {
            //add the value for the timd at the path to array
            array.add((data.value(forKeyPath: path as String)! as? Int)!)
        }
        return array
    }
    
    /**
        Gets an array containing a certain value for every team
        - parameter path: The location of the value
    */
    func valuesInCompetitionOfPathForTeams(_ path: String) -> NSArray {
        let array = NSMutableArray()
        //iterate thru all teams
        for team in self.currentMatchManager.teams {
            //if the team's value for the key you put in exists
            if team.value(forKeyPath: path) != nil {
                //add to the array the value
                array.add(team.value(forKeyPath: path)!)
            }
        }
        //so this is an array of all of the non-nil values for a certain path, for every team
        return array
    }
    
    /** 
        Returns the bool version of a value
        - parameter value: Value to be converted
    */
    func boolValue(value: Any) -> Bool? {
        let boolValue: Bool
        if let boolBoolValue = value as? Bool { //Such ugly
            boolValue = boolBoolValue
        } else {
            boolValue = value as? String == "true" ? true : false
        }
        return boolValue
    }
    
    /**
     Used by the graphing class If you get -1111.1 for any of the values, that means you haz problem.
     
     - parameter path:    Path to datapoint. Uses `match.valueForKeyPath(path)`.
     - parameter forTeam: The team you want the datapoint for.
     
     - returns: The second value in the tuple is the alternate value mapping. E.g. Yes and No instead of 1 and 0
     */
    func getMatchDataValuesForTeamForPath(_ path: String, forTeam: Team) -> ([Float], [CGFloat : String]?) {
        let matches = getMatchesForTeam(forTeam.teamNumber)
        var valueArray = [Float]()
        var altValueMapping : [CGFloat : String]?
        
        for match in matches {
            let value : AnyObject?
            var newPath = path
            if path == "calculatedData.predictedRPs" {
                newPath = predictedRPsKeyForTeamNum(forTeam.teamNumber, matchNum: match.matchNumber)
            }
            value = match.value(forKeyPath: newPath) as AnyObject?
            
            if value != nil {
                if let floatVal = value as? Float {
                    valueArray.append(floatVal)
                } else { // Pretty much, if its false it's 0, if its true it's 1
                    altValueMapping = [CGFloat(1.0): "Yes", CGFloat(0.0): "No"]
                    valueArray.append((boolValue(value: value!)! ? 1.0 : 0.0))
                }
            } else {
                print("In getMatchDataValuesForTeamForPath, the value for the key \(path) seems to be nil.")
                valueArray.append(-1111.1)
            }
        }
        return (valueArray, altValueMapping)
    }
    /**
     See Description for `getMatchDataValuesForTeamForPath`
     */
    func getMatchValuesForTeamForPath(_ path: String, forTeam: Team) -> ([Float], [CGFloat : String]?) {
        let TIMDs = getTIMDataForTeam(forTeam).sorted { Int($0.matchNumber!) < Int($1.matchNumber!) }
        
        var valueArray = [Float]()
        var altValueMapping : [CGFloat: String]?
        
        for TIMD in TIMDs {
            var value : Any?
            if path.contains("calculatedData") {
                value = (TIMD.calculatedData!.dictionaryRepresentation() as NSDictionary).object(forKey: path.replacingOccurrences(of: "calculatedData.", with: ""))
            } else {
                value = (TIMD.dictionaryRepresentation() as NSDictionary).object(forKey: path)
            }
            if value != nil {
                if let floatValue = value as? Float {
                    valueArray.append(floatValue)
                } else if let intVal = value as? Int {
                    valueArray.append(Float(intVal))
                } else { // Pretty much, if its false it's 0, if its true it's 1
                    altValueMapping = [CGFloat(1.0): "Yes", CGFloat(0.0): "No"]
                    valueArray.append((boolValue(value: value!)! ? 1.0 : 0.0))
                }
            } else {
                print("In getMatchValuesForTeamForPath, the value for the key \(path) seems to be nil.")
                valueArray.append(-1111.1)
            }
        }
        return (valueArray, altValueMapping)
    }
    
    // MARK: Dealing With Current Match
    /**
     This puts up the little banner at the top, and increases the badge number on the app.  This should not be used currently.
     
     - parameter notificationBody: What the text of the notification should be (that the person reads).
     */
    func postNotification(_ notificationBody:String) {
        let content = UNMutableNotificationContent()
        content.body = notificationBody
        content.sound = UNNotificationSound.default()
        content.badge = NSNumber(integerLiteral: UIApplication.shared.applicationIconBadgeNumber + 1)
        content.title = "Upcoming Starred Match"
        let localNotification = UNNotificationRequest(identifier: "ViewerNotification", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(localNotification, withCompletionHandler: nil)
    }
    
    /** 
        Calculates how many matches are to be played until the next match that contains a specified team
        - parameter teamNumber: Specified team
    */
    func matchesUntilTeamNextMatch(_ teamNumber : Int) -> String? {
        //sort matches by match num
        let sortedMatches = self.currentMatchManager.matches.sorted { $0.matchNumber < $1.matchNumber }
        //if currentmatch is a real match
        if self.currentMatchManager.currentMatch < sortedMatches.count {
            //get the index of the current match. In theory, this should just be currentMatch - 1, right???
            if let indexOfCurrentMatch = sortedMatches.index(of: self.getMatch(self.currentMatchManager.currentMatch) ?? sortedMatches[0]) {
                var counter = 0
                //iterate thru all of the matches after current match
                for i in indexOfCurrentMatch + 1..<self.currentMatchManager.matches.count {
                    let match = sortedMatches[i]
                    counter += 1
                    //if the red or blue team numbers contain the given team
                    if (match.redTeams?.filter { Int($0) == teamNumber }.count != 0) || (match.blueTeams?.filter { Int($0) == teamNumber }.count != 0) {
                        return "\(counter)"
                    }
                }
            }
        }
        return nil
    }
    
    /** 
        Returns how many matches are left for a specified team to play
        - parameter teamNum: Specified team
    */
    func remainingMatchesForTeam(_ teamNum:Int) -> Int {
        //get matches
        let matchArray = getMatchesForTeam(teamNum)
        var remainingArray = [Match]()
        for match in matchArray {
            //if match hasn't happened
            if match.matchNumber > self.currentMatchManager.currentMatch {
                //append match
                remainingArray.append(match)
            }
        }
        //return how many matches are left
        return remainingArray.count
    }
    
}

/// Custom Class for managing NSNotifications about things. Not to be confused with the kind of notifications that pop up and make a dinging sound on your phone.
class NotificationManager : NSObject {
    let timer = Timer()
    let secsBetweenUpdates : Double
    var notifications : [Notification]
    var notificationNamesToPost = [String: AnyObject?]()
    
    struct Notification {
        let name : String
        var selector : String?
        var object : AnyObject?
        
        init(name : String, selector : String?, object: AnyObject?) {
            self.selector = nil
            if selector != nil {
                if selector!.range(of: ":") == nil {
                    print("Notification Selector Function Must have exactly one parameter, an NSNotification Object")
                    self.selector = selector
                }
            }
            self.name = name
            self.object = object
        }
        
        init(name : String) {
            self.name = name
            self.selector = nil
            self.object = nil
        }
    }
    
    init (secsBetweenUpdates : Double, notifications: [Notification]) {
        self.secsBetweenUpdates = secsBetweenUpdates
        self.notifications = notifications
        super.init()
        
        for note in notifications {
            if let selector = note.selector {
                NotificationCenter.default.addObserver(self, selector: Selector(selector), name: NSNotification.Name(rawValue: note.name), object: nil)
            }
        }
        Timer.scheduledTimer(timeInterval: secsBetweenUpdates, target: self, selector: #selector(NotificationManager.notify(_:)), userInfo: nil, repeats: false)
        
    }
    
    func queueNote(_ name: String, specialObject: AnyObject?) {
        self.notificationNamesToPost[name] = specialObject
    }
    
    func postNotification(_ noteName : String, specialObject : AnyObject?) {
        let noteArray = self.notifications.filter { $0.name == noteName }
        if noteArray.count > 0 {
            let note = noteArray[0]
            if specialObject != nil {
                NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: note.name), object: specialObject, userInfo: nil)
            } else {
                NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: note.name), object: note.object, userInfo: nil)
            }
        }
    }
    
    @objc func notify(_ timer : Timer) {
        for (noteName, specialObject) in self.notificationNamesToPost {
            postNotification(noteName, specialObject: specialObject)
        }
        notificationNamesToPost = [String: AnyObject?]()
        self.timer.invalidate()
        Timer.scheduledTimer(timeInterval: secsBetweenUpdates, target: self, selector: #selector(NotificationManager.notify(_:)), userInfo: nil, repeats: false)
    }
}
