//
//  OptionsViewController.swift
//  ios-viewer
//
//  Created by Carter Luck on 4/14/18.
//  Copyright © 2018 brytonmoeller. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController, UITableViewDelegate {
    
    var firebaseFetcher: FirebaseDataFetcher?
    
    @IBOutlet weak var scrollingMatchSwitch: UISwitch!
    @IBOutlet weak var showRPSwitch: UISwitch!
    @IBOutlet weak var hiDysfuncSwitch: UISwitch!
    @IBOutlet weak var textSizeSlider: UISlider!
    
    override func viewDidLoad() {
        firebaseFetcher = AppDelegate.getAppDelegate().firebaseFetcher
        if let showRPs = firebaseFetcher?.currentMatchManager.showRP {
            // this sets the default of showRPs to on
            showRPSwitch.setOn(showRPs, animated: true)
        }
        if let scrollMatch = firebaseFetcher?.currentMatchManager.matchDetailsScroll {
            // this sets the default of scrollMatch to off
            scrollingMatchSwitch.setOn(scrollMatch, animated: false)
        }
        if let hiDysfunc = firebaseFetcher?.currentMatchManager.highlightDysfunc {
            // this sets the default of hiDysfunc to on
            hiDysfuncSwitch.setOn(hiDysfunc, animated: true)
        }
        if let textSize = firebaseFetcher?.currentMatchManager.textSize {
            // this sets the textSize to textSizeSlider value
            self.textSizeSlider.value = Float(textSize)
            // this sets the textSize minimumValue to 15
            textSizeSlider.minimumValue = 15;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? SlackTableViewController {
            //actually need to do nothing
        }
    }
    
    @IBAction func textSizeSliderChanged(_ sender: Any) {
        firebaseFetcher?.currentMatchManager.textSize = Int((sender as! UISlider).value.rounded())
    }
    
    @IBAction func hiDysfuncToggle(_ sender: Any) {
        self.firebaseFetcher?.currentMatchManager.highlightDysfunc = (sender as! UISwitch).isOn
    }
    
    @IBAction func matchScrollToggle(_ sender: Any) {
        firebaseFetcher?.currentMatchManager.matchDetailsScroll = (sender as! UISwitch).isOn
    }
    
    @IBAction func showRPToggled(_ sender: Any) {
        firebaseFetcher?.currentMatchManager.showRP = (sender as! UISwitch).isOn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
