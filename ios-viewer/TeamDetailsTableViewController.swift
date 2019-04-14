//
//  TeamDetailsTableViewController.swift
//  scout-viewer-2016-iOS
//
//  Created by Citrus Circuits on 2/18/15.
//  Copyright (c) 2016 Citrus Circuits. All rights reserved.
//

import UIKit
import Haneke      

//TableViewDataSource/Delegate allows vc to contain a table view/pass in info.
class TeamDetailsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIDocumentInteractionControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    var firebaseFetcher = AppDelegate.getAppDelegate().firebaseFetcher
    //setup visuals
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var teamNumberLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamSelectedImageView: UIImageView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var seed: UILabel!
    @IBOutlet weak var predictedSeed: UILabel!
    
    @objc var team: Team? = nil {
        didSet {
            num = self.team?.teamNumber
            updateTitleAndTopInfo()
            reload()
        }
    }
    
    var num: Int? = nil
    var showMinimalistTeamDetails = false
    var shareController: UIDocumentInteractionController!
    
    func reload() {
        if team != nil {
            if team?.teamNumber != nil {
                tableView?.reloadData()
                self.updateTitleAndTopInfo()
                self.resetTableViewHeight()
            }
        }
        
    }

    //reset the height of the table so info doesn't go off
    func resetTableViewHeight() {
        DispatchQueue.main.async(execute: { () -> Void in
            // set height constraint as equal to the size of the content
            self.tableViewHeightConstraint?.constant = (self.tableView.contentSize.height)
            //if scrollview and tableview exist
            if self.scrollView != nil && self.tableView != nil {
                //scrollview height is set correctly
                self.scrollView.contentSize.height = self.tableViewHeightConstraint.constant + self.tableView.frame.origin.y
                self.scrollView.setNeedsDisplay()
                self.tableView.setNeedsDisplay()
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reload()
        NotificationCenter.default.addObserver(self, selector: #selector(TeamDetailsTableViewController.reloadTableView(_:)), name:NSNotification.Name(rawValue: "updateLeftTable"), object:nil)
        
       //set up the tableView
        tableView.register(UINib(nibName: "MultiCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MultiCellTableViewCell")
        tableView.delegate = self
        
        self.navigationController?.delegate = self
        self.scrollView.delegate = self

        //constraints
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 1
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tableView.estimatedSectionHeaderHeight = 1
        self.tableView.estimatedSectionFooterHeight = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //self.reload()
        //reloadImage()

    }
    
    
    
    //Not used
    func didLongPressForMoreDetail(_ recognizer: UIGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.recognized {
            self.showMinimalistTeamDetails = !self.showMinimalistTeamDetails
            self.reload()
            self.teamNumberLabel.textColor = UIColor.black
        } else if recognizer.state == UIGestureRecognizerState.began {
            self.teamNumberLabel.textColor = UIColor.green
        } 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.delegate = nil
        super.viewWillDisappear(animated)
    }
    
    @IBAction func exportTeamPDFs(_ sender: UIBarButtonItem) {
        
    }
    
    //set title of section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return team == nil ? nil : Utils.teamDetailsKeys.keySetNames(self.showMinimalistTeamDetails)[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return team == nil ? 1 : Utils.teamDetailsKeys.keySetNames(self.showMinimalistTeamDetails).count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Utils.teamDetailsKeys.keySetNames(self.showMinimalistTeamDetails)[section] != "super" {
            return team == nil ? 1 : Utils.teamDetailsKeys.keySets(self.showMinimalistTeamDetails)[section].count
        } else {
            return team == nil ? 1 : Utils.teamDetailsKeys.keySets(self.showMinimalistTeamDetails)[section].count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get cell
        var cell = UITableViewCell()
        //if team exists
        if team != nil {
            //if team is not real (team number)
            if team!.teamNumber == -1 {
                //no team number
                cell = tableView.dequeueReusableCell(withIdentifier: "TeamInMatchDetailStringCell", for: indexPath)
                cell.textLabel?.text = "No team yet..."
                cell.accessoryType = UITableViewCellAccessoryType.none
                return cell
            }
            //set datakey to the appropriate key
            let dataKey: String = Utils.teamDetailsKeys.keySets(self.showMinimalistTeamDetails)[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
            
            //NOTE: This is if NOT a default key! Don't go looking thru this thinking it will run if it's a default key, you will waste your time.
            if !Utils.teamDetailsKeys.defaultKeys.contains(dataKey) { //Default keys are currently just 'matchDatas' and 'TeamInMatchDatas'... if NOT a default key
                var dataPoint = AnyObject?.init(nilLiteral: ())
                var secondDataPoint = AnyObject?.init(nilLiteral: ())
                if dataKey.contains("calculatedData") {
                    dataPoint = team!.value(forKeyPath: dataKey) as AnyObject
                } else {
                    dataPoint = (team!.dictionaryRepresentation() as NSDictionary).object(forKey: dataKey) as AnyObject
                }
                
                if secondDataPoint as? String == "" {
                    secondDataPoint = nil
                }
                
                //notes
                if Utils.teamDetailsKeys.TIMDLongTextCells.contains(dataKey) {
                    //get cell
                    let notesCell: ResizableNotesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TeamInMatchDetailStringCell", for: indexPath) as! ResizableNotesTableViewCell
                    //set title
                        notesCell.titleLabel?.text = Utils.humanReadableNames[dataKey]
                    //get and sort timds by match num
                    var TIMDs: [TeamInMatchData]? = []
                    TIMDs = firebaseFetcher?.getTIMDataForTeam(self.team!).sorted { $0.matchNumber! < $1.matchNumber! }
                    var datas = [String]()
                    //iterate thru timds
                    for TIMD in TIMDs! {
                        //navigate to key
                        if let data = TIMD.value(forKey: dataKey) {
                            //add "Q##: Notes"
                            let dataString = "Q\(TIMD.matchNumber!): \(data)"
                            datas.append(dataString)
                        }
                    }
 
                    //consolidate into a single string file like so:
                    /*
                     Q#: Notes
                     Q#: Notes
                     Q#: Notes
                     */
                    notesCell.notesLabel.text = datas.reduce(String()) { previous, new in "\(previous)\n\(new)" }
                    //notesCell.heightAnchor
                    notesCell.selectionStyle = UITableViewCellSelectionStyle.none
                    cell = notesCell
                    
                } else if Utils.teamDetailsKeys.longTextCells.contains(dataKey) {
                    let notesCell: ResizableNotesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TeamInMatchDetailStringCell", for: indexPath) as! ResizableNotesTableViewCell
                    notesCell.titleLabel?.text = Utils.humanReadableNames[dataKey]
                    if dataKey == "pitSEALsNotes" {
                         notesCell.notesLabel.text = team!.pitSEALsNotes
                    }
                    else if dataKey == "pitClimbType" {
                        notesCell.notesLabel!.text = "Self:  \(String(describing: team!.pitClimbType?["self"] ?? 0)), Robot 1:  \(String(describing: team!.pitClimbType?["robot1"] ?? 0)), Robot 2:  \(String(describing: team!.pitClimbType?["robot2"] ?? 0))"
                    }
                    notesCell.selectionStyle = UITableViewCellSelectionStyle.none
                    cell = notesCell
                
                } else if Utils.teamDetailsKeys.unrankedCells.contains(dataKey) || dataKey.contains("pit") { //pit keys
                    //get cell
                    let unrankedCell: UnrankedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UnrankedCell", for: indexPath) as! UnrankedTableViewCell
                    
                    //titleLabel is the humanReadable version of dataKey
                    unrankedCell.titleLabel.text = Utils.humanReadableNames[dataKey]
                    
                    if "\(String(describing: dataPoint))".isEmpty {
                        unrankedCell.detailLabel.text = ""
                    } else if Utils.teamDetailsKeys.pitStrings.contains(dataKey) {
                        unrankedCell.detailLabel!.text = dataPoint as? String ?? ""
                    } else if Utils.teamDetailsKeys.pitInts.contains(dataKey) {
                        unrankedCell.detailLabel!.text = String(describing: dataPoint ?? 0 as AnyObject)
                    } else if Utils.teamDetailsKeys.addCommasBetweenCapitals.contains(dataKey) {
                        unrankedCell.detailLabel.text = "\(insertCommasAndSpacesBetweenCapitalsInString(roundValue(dataPoint!, toDecimalPlaces: 2)))"
                    } else if Utils.teamDetailsKeys.boolValues.contains(dataKey) {
                        unrankedCell.detailLabel.text = "\(boolToBoolString(dataPoint as? Bool ?? false))"
                    } else if Utils.teamDetailsKeys.calculatedStrings.contains(dataKey) {
                        unrankedCell.detailLabel.text = dataPoint as? String
                    } else {
                        unrankedCell.detailLabel.text = "\(roundValue(dataPoint!, toDecimalPlaces: 2))"
                    }
                    
                    unrankedCell.selectionStyle = UITableViewCellSelectionStyle.none
                    cell = unrankedCell
                    
                } else {
                    //get cell
                    let multiCell: MultiCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MultiCellTableViewCell", for: indexPath) as! MultiCellTableViewCell
                    
                    //label is humanReadable version of dataKey
                    multiCell.teamLabel!.text = Utils.humanReadableNames[dataKey]
                    
                    if secondDataPoint != nil { //This means that it is a defense crossing (Deprecated)
                        if secondDataPoint as? String != "" && dataPoint as? String != "" {
                            if let ff = dataPoint as? Float {
                                dataPoint = roundValue(ff as AnyObject?, toDecimalPlaces: 1) as AnyObject?? ?? "" as AnyObject?
                            }
                            multiCell.scoreLabel?.text = "A: \(dataPoint!) T: \(secondDataPoint!)"
                        }
                    } else {
                        
                        if Utils.teamDetailsKeys.percentageValues.contains(dataKey) {
                            //value needs to be displayed as a percentage
                             var size: CGFloat = CGFloat((firebaseFetcher?.currentMatchManager.textSize)!)
                            multiCell.scoreLabel.font = multiCell.scoreLabel.font.withSize(size)
                            multiCell.scoreLabel!.text = "\(percentageValueOf(dataPoint!))"
                        } else {
                            if dataPoint as? String != "" {
                                 if Utils.teamDetailsKeys.yesNoKeys.contains(dataKey) {
                                    //value needs to be displayed as Yes or No
                                    if dataPoint! as! Bool == true {
                                        multiCell.scoreLabel?.text = "Yes"
                                    } else {
                                        multiCell.scoreLabel?.text = "No"
                                    }
                                } else { // it is neither a yes/no or a +1 key.
                                    multiCell.scoreLabel!.text = "\(roundValue(dataPoint!, toDecimalPlaces: 2))"
                                }
                            } else {
                                multiCell.scoreLabel?.text = ""
                            }
                        }
                        if multiCell.teamLabel?.text?.range(of: "Accuracy") != nil || multiCell.teamLabel?.text?.range(of: "Consistency") != nil { //Anything with the words "Accuracy" or "Consistency" should be a percentage
                            multiCell.scoreLabel!.text = percentageValueOf(dataPoint!)
                        }
                        
                    }
                    cell = multiCell
                    multiCell.rankLabel!.text = "\((firebaseFetcher?.rankOfTeam(team!, withCharacteristic: dataKey))! as Int)"
                }
            } else { //is a defaultKey
                let unrankedCell: UnrankedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UnrankedCell", for: indexPath) as! UnrankedTableViewCell
                
                //title is humanReadable dataKey
                unrankedCell.titleLabel.text = Utils.humanReadableNames[dataKey]
                
                unrankedCell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator

                if dataKey == "TeamInMatchDatas"{
                    unrankedCell.titleLabel.text = "TIMDs"
                }
                
                if dataKey == "matchDatas" {
                    let matchesUntilNextMatch : String = firebaseFetcher?.matchesUntilTeamNextMatch((team?.teamNumber)!) ?? "NA"
                    
                    //label: "Matches - #  Remaining
                    unrankedCell.titleLabel.text = (unrankedCell.titleLabel.text)! + ": \(Utils.sp(thing: firebaseFetcher?.remainingMatchesForTeam((team?.teamNumber)!))) Left - Next in \(matchesUntilNextMatch)"
                }
                cell = unrankedCell
            }
            
            
        } else {
            //get empty cell
            cell = tableView.dequeueReusableCell(withIdentifier: "TeamInMatchDetailStringCell", for: indexPath)
            cell.textLabel?.text = "No team yet..."
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //
    }
    
    /**
     Translates numbers into what it actually means.
     
     - parameter numString: e.g. "0" -> "C++"
     
     - returns: A string with the human readable prog lang name.
     */
    func pitProgrammingLanguageForNumberString(_ numString: String) -> String {
        var translated = ""
        switch numString {
        case "0": translated = "C++"
        case "1": translated = "Java"
        case "2": translated = "Labview"
        case "3": translated = "Other"
        default: break
        }
        return translated

    }
    
    //updates title
    func updateTitleAndTopInfo() {
        if self.teamNameLabel != nil {
            if self.teamNameLabel.text == "" || self.teamNameLabel.text == "Unknown name..." {
                let numText: String
                let nameText: String
                switch (team?.teamNumber, team?.name) {
                case (.some(let num), .some(let name)):
                    title = "\(num) - \(name)"
                    numText = "\(num)"
                    nameText = "\(name)"
                case (.some(let num), .none):
                    title = "\(num) - ???"
                    numText = "\(num)"
                    nameText = "Unknown name..."
                case (.none, .some(let name)):
                    title = "??? - \(name)"
                    numText = "????"
                    nameText = "\(name)"
                default:
                    title = "??? - ???"
                    numText = "????"
                    nameText = "Unknown name..."
                }
                
                teamNameLabel?.text = nameText
                teamNumberLabel?.text = numText
            }
            
            
            var seedText = "?"
            var predSeedText = "?"
            if let seed = team?.actualSeed, seed > 0 {
                seedText = "Seed: \(seed)"
            }
            
            if let predSeed = team?.calculatedData!.predictedSeed, predSeed > 0 {
                predSeedText = "Pred. Seed: \(predSeed)"
            }
            
            
            seed?.text = seedText
            predictedSeed?.text = predSeedText
        }
    }
    
    //preparing to change viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sortedRankSegue" {
            if let dest = segue.destination as? SortedRankTableViewController {
                dest.keyPath = sender as! String
            }
          
        } else if segue.identifier == "Matches" {
          
            let matchesForTeamController = segue.destination as! SpecificTeamScheduleTableViewController
            
            //if team exists
            if let teamNum = team?.teamNumber {
                //set team number
                matchesForTeamController.teamNumber = teamNum
            }
        } else if segue.identifier == "TIMDs" {
            //Navigate to a vc to pick which match, then to TIMD vc
            let TIMDScheduleForTeamController = segue.destination as! TIMDScheduleViewController
            
            //if team exists
            if let teamNum = team?.teamNumber {
                //set team number
                TIMDScheduleForTeamController.teamNumber = teamNum
            }
        } else if segue.identifier == "CTIMDGraph" {
            //this is called for every timd graph, not just ctimds
            let graphViewController = segue.destination as! GraphViewController
            //if team number is not nil
            if let teamNum = team?.teamNumber {
                //get indexpath
                let indexPath = sender as! IndexPath
                //if the cell exists
                if let cell = tableView.cellForRow(at: indexPath) as? MultiCellTableViewCell {
                    //set titles
                    graphViewController.graphTitle = "\(cell.teamLabel!.text!)"
                    graphViewController.displayTitle = "\(graphViewController.graphTitle): "
                    //get the key
                    var key = Utils.getKeyForHumanReadableName(graphViewController.graphTitle)
                    
                    //get rid of calculatedData in key
                    key = key?.replacingOccurrences(of: "calculatedData.", with: "")
                    //turn the key from a teamDetailsKey to a TIMD key
                    key = Utils.teamDetailsKeys.teamDetailsToTIMD[key!]
                    
                    var values: [Float]
                    let altMapping : [CGFloat: String]?
                    //if the key is predictedRPs
                    if key == "calculatedData.predictedRPs" {
                        //do stuff... we don't really use this?
                        (values, altMapping) = (firebaseFetcher!.getMatchDataValuesForTeamForPath(key!, forTeam: team!))
                    } else {
                        //get the values in timds for this key
                        (values, altMapping) = (firebaseFetcher?.getMatchValuesForTeamForPath(key!, forTeam: team!))!
                    }
                    //if the key contains accuracy, it's a percentage graph
                    if key?.range(of: "Accuracy") != nil {
                        graphViewController.isPercentageGraph = true
                    }
                    var nilValueIndecies = [Int]()
                    //iterate thru all timd values
                    for i in 0..<values.count {
                        //if the value is marked as empty, add the value
                        if values[i] == -1111.1 {
                            nilValueIndecies.append(i)
                        }
                    }
                    //iterate thru empty values and remove them
                    for i in nilValueIndecies.reversed() {
                        values.remove(at: i)
                    }
                    //set values
                    graphViewController.values = (values as NSArray).map { CGFloat($0 as! Float) }
                    //set left title
                    graphViewController.subDisplayLeftTitle = "Match: "
                    //set values
                    graphViewController.subValuesLeft = nsNumArrayToIntArray(firebaseFetcher!.matchNumbersForTeamNumber((team?.teamNumber)!) as [NSNumber]) as [AnyObject]
                    //iterate thru the values for the subvalues and remove empties
                    for i in nilValueIndecies.reversed() {
                        graphViewController.subValuesLeft.remove(at: i)
                    }
                    //replace with altmapping
                   if altMapping != nil {
                        graphViewController.zeroAndOneReplacementValues = altMapping!
                    }
                    //set title
                    graphViewController.subDisplayRightTitle = "Team: "
                    //set... something
                    graphViewController.subValuesRight = [teamNum as AnyObject,teamNum as AnyObject,teamNum as AnyObject,teamNum as AnyObject,teamNum as AnyObject]
                    
                    
                }
            }
        }
        else if segue.identifier == "TGraph" {
            let graphViewController = segue.destination as! GraphViewController
            
            if (team?.teamNumber) != nil {
                let indexPath = sender as! IndexPath
                let cell = tableView.cellForRow(at: indexPath) as! MultiCellTableViewCell
                graphViewController.graphTitle = "\(cell.teamLabel!.text!)"
                graphViewController.displayTitle = "\(graphViewController.graphTitle): "
                //keys that don't graph right: Incap, disabled, baseline, liftoff percentage, defense, agility, all super except driving ability- none of these are CTIMDs, but some normal timds work
                var values: [Float]
                let altMapping : [CGFloat: String]?
                var key = Utils.getKeyForHumanReadableName(graphViewController.graphTitle)
                key = Utils.teamDetailsKeys.teamDetailsToTIMD[key!]
                (values, altMapping) = (firebaseFetcher?.getMatchValuesForTeamForPath(key!, forTeam: team!))!
                graphViewController.values = (values as NSArray).map { CGFloat($0 as! Float) }
            }
        }
    }
    
    /** 
    Converts a boolean value to a string value.
     
    - parameter b: Bool to be converted.
     
    - returns: Yes or No for inputted true or false respectively.
     */
    func boolToBoolString(_ b: Bool) -> String {
        let strings = [false : "No", true : "Yes"]
        return strings[b]!
    }
    
    func setupControllerWithURL(_ fileURL: URL, usingDelegate: UIDocumentInteractionControllerDelegate) -> UIDocumentInteractionController {
        let interactionController = UIDocumentInteractionController(url: fileURL)
        interactionController.delegate = usingDelegate
        
        return interactionController
    }
    
    //Row has been selected, perform segue to appropriate vc
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if the cell can be an unranked table view cell
        if let cell = tableView.cellForRow(at: indexPath) as? UnrankedTableViewCell {
            //if the title contains Matches
            if cell.titleLabel.text?.range(of: "Matches") != nil {
                //go to matches
                performSegue(withIdentifier: "Matches", sender: nil)
            //if the title contains TIMDs
            } else if cell.titleLabel.text?.range(of: "TIMDs") != nil {
                //go to timds
                performSegue(withIdentifier: "TIMDs", sender: nil)
            }
        //if the cell is a multicelltableviewcell
        } else if let cell = tableView.cellForRow(at: indexPath) as? MultiCellTableViewCell {
            //get the text on the team label
            let cs = cell.teamLabel!.text
            //if there is a key for the human readable name
            if((Utils.getKeyForHumanReadableName(cs!)) != nil) {
                //if it's not a notGraphingValue and it is not a standard deviation, segue into CTIMDGraph. Note: all timd graphs
                if !Utils.teamDetailsKeys.notGraphingValues.contains(cs!) && !cs!.contains("σ") { performSegue(withIdentifier: "CTIMDGraph", sender: indexPath) }
            } else {
                performSegue(withIdentifier: "TGraph", sender: indexPath)
            }
            
        } else if let cell = tableView.cellForRow(at: indexPath) as? ResizableNotesTableViewCell {
            //Notes do not segue anymore
            if cell.textLabel?.text == "Pit Notes" {
                performSegue(withIdentifier: "NotesSegue", sender: indexPath)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @objc func reloadTableView(_ note: Notification) {
        if note.name.rawValue == "updateLeftTable" {
            if let t = note.object as? Team {
                if t.teamNumber == team?.teamNumber {
                    self.team = t
                    self.reload()
                }
            }
            
        }
    }
    
    //Rankable row has been long-pressed, perform segue
    @objc func rankingDetailsSegue(_ gesture: UIGestureRecognizer) {
        
        if(gesture.state == UIGestureRecognizerState.began) {
            let p = gesture.location(in: self.tableView)
            let indexPath = self.tableView.indexPathForRow(at: p)
            if let index = indexPath {
                if let cell = self.tableView.cellForRow(at: index) as? MultiCellTableViewCell {
                    if cell.teamLabel!.text!.contains("Crossed") == false {
                        performSegue(withIdentifier: "sortedRankSegue", sender: cell.teamLabel!.text)
                    }
                }
            }
        }
    }
}


