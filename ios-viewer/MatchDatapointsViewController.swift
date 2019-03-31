//
//  MatchDatapointsViewController.swift
//  ios-viewer
//
//  Created by Carter Luck on 5/9/18.
//  Copyright © 2018 brytonmoeller. All rights reserved.
//

import UIKit

class MatchDatapointsViewController: ArrayTableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetDatapoints))
    }
    
    override func filteredArray(forSearchText text: String!, inScope scope: Int) -> [Any]! {
        return Utils.teamDetailsKeys.allTeamKeys.filter { Utils.humanReadableNames[$0]!.lowercased().contains(text!.lowercased()) }
    }
    
    override func cellIdentifier() -> String! {
        return "TIMDTableCell"
    }
    
    @objc func resetDatapoints() {
        self.firebaseFetcher?.currentMatchManager.matchDetailsDatapoints = (self.firebaseFetcher?.currentMatchManager.defaultMatchDetailsDatapoints)!
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if filteredArray != nil {
            count = filteredArray.count
        } else {
            count = Utils.teamDetailsKeys.allTeamKeys.count
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TIMDTableViewCell", for: indexPath) as! TIMDTableViewCell
        cell.valueLabel.text = ""
        if filteredArray != nil {
            cell.datapointLabel.text = Utils.humanReadableNames[filteredArray[indexPath.row] as! String]
            if (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.contains(Utils.teamDetailsKeys.allTeamKeys[indexPath.row]))! {
                cell.backgroundColor = UIColor.green
            } else {
                cell.backgroundColor = UIColor.clear
            }
        } else {
            cell.datapointLabel.text = Utils.humanReadableNames[Utils.teamDetailsKeys.allTeamKeys[indexPath.row]]
            if (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.contains(Utils.teamDetailsKeys.allTeamKeys[indexPath.row]))! {
                cell.backgroundColor = UIColor.green
            } else {
                cell.backgroundColor = UIColor.clear
            }
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if filteredArray != nil {
            if (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.contains(filteredArray![indexPath.row] as! String))! {
                firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.remove(at: (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.index(of: filteredArray[indexPath.row] as! String))!)
            } else {
                firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.append(filteredArray![indexPath.row] as! String)
            }
            self.tableView.reloadData()
        } else {
            if (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.contains(Utils.teamDetailsKeys.allTeamKeys[indexPath.row]))! {
                firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.remove(at: (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.index(of: Utils.teamDetailsKeys.allTeamKeys[indexPath.row]))!)
            } else {
                firebaseFetcher?.currentMatchManager.matchDetailsDatapoints.append(Utils.teamDetailsKeys.allTeamKeys[indexPath.row])
            }
            self.tableView.reloadData()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
