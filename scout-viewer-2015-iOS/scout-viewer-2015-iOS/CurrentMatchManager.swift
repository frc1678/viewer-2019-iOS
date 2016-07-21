//
//  CurrentMatchManager.swift
//  Pods
//
//  Created by Samuel Resendez on 4/3/16.
//
//

import UIKit
import Haneke

class CurrentMatchManager: NSObject {
    
    let notificationManager : NotificationManager
    let cache = Shared.dataCache
    
    override init() {
        self.notificationManager = NotificationManager(secsBetweenUpdates: 5, notifications: [])
        super.init()
        self.notificationManager.notifications.append(NotificationManager.Notification(name: "currentMatchUpdated", selector: "notificationTriggeredCheckForNotification:", object: nil))
        self.setUp()
    }
    
    func setUp() {
        cache.fetch(key: "starredMatches").onSuccess { (d) -> () in
            if let starred = NSKeyedUnarchiver.unarchiveObjectWithData(d) as? [String] {
                if self.starredMatchesArray != starred {
                    self.starredMatchesArray = starred
                }
            } else {
                self.starredMatchesArray = [String]()
            }
        }
    }
    
    var currentMatch = 0 {
        didSet {
            if currentMatch != oldValue {
                let currentMatchFetch = AppDelegate.getAppDelegate().firebaseFetcher.getMatch(currentMatch)
                let m : [String: AnyObject] = ["num":currentMatch, "redTeams": currentMatchFetch.redAllianceTeamNumbers!, "blueTeams": currentMatchFetch.blueAllianceTeamNumbers!]
                NSUserDefaults.standardUserDefaults().setObject(m, forKey: "match")
                notifyIfNeeded()
            }
        }
    }
    
    var starredMatchesArray = [String]() {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedDataWithRootObject(starredMatchesArray ?? NSMutableArray()), key: "starredMatches")
        }
    }
    
    func notifyIfNeeded() {
        let notifyForNumMatchesAway = 2
        
        for n in 0..<notifyForNumMatchesAway {
            if starredMatchesArray.contains(String(currentMatch + n)) {
                postNotification("Starred match coming up: " + String(currentMatch + n))
            }
        }
    }
    
    func postNotification(notificationBody: String) {
        let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 1)
        localNotification.alertBody = notificationBody
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    func notificationTriggeredCheckForNotification(note: NSNotification) {
        notifyIfNeeded()
    }
}