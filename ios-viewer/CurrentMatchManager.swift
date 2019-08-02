//
//  CurrentMatchManager.swift
//  Pods
//
//  Created by Samuel Resendez on 4/3/16.
//
//

//NOTE: Using a different method for notifications (banners). Get server people to send notifications. Important: This is where current match is stored, do not delete!

import UIKit
import Haneke
import UserNotifications
import Firebase

class CurrentMatchManager: NSObject {
    
    let notificationManager : NotificationManager
    let cache = Shared.dataCache
    let firebase: DatabaseReference
    var cache_wait = DispatchGroup()
    
    override init() {
        firebase = Database.database().reference()
        cache_wait.enter()
        self.notificationManager = NotificationManager(secsBetweenUpdates: 5, notifications: [])
        self.showRP = false
        self.highlightDysfunc = false
        self.matchDetailsDatapoints = self.defaultMatchDetailsDatapoints
        super.init()
        self.notificationManager.notifications.append(NotificationManager.Notification(name: "currentMatchUpdated", selector: "notificationTriggeredCheckForNotification:", object: nil))
        firebase.child("currentMatchNum").observe(.value) { (snap) in
            self.currentMatch = snap.value as? Int ?? -1
        }
        self.setUp()
    }
    
    func setUp() {
        cache.fetch(key: "teams").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? [Team] {
                if self.teams != id {
                    self.teams = id
                }
            } else {
                self.teams = []
            }
        }
        cache.fetch(key: "matches").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? [Match] {
                if self.matches != id {
                    self.matches = id
                }
            } else {
                self.matches = []
            }
            self.cache_wait.leave()
        }.onFailure { (d) in
                self.cache_wait.leave()
        }
        cache.fetch(key: "starredMatches").onSuccess { (d) -> () in
            if let starred = NSKeyedUnarchiver.unarchiveObject(with: d) as? [Int] {
                if self.starredMatchesArray != starred {
                    self.starredMatchesArray = starred
                }
            } else {
                self.starredMatchesArray = [Int]()
            }
        }
        cache.fetch(key: "slackId").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? String {
                if self.slackId != id {
                    self.slackId = id
                }
            } else {
                self.slackId = nil
            }
        }
        cache.fetch(key: "showRP").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? Bool {
                if self.showRP != id {
                    self.showRP = id
                }
            } else {
                self.showRP = true
            }
        }
        cache.fetch(key: "matchDetailsScroll").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? Bool {
                if self.matchDetailsScroll != id {
                    self.matchDetailsScroll = id
                }
            } else {
                self.matchDetailsScroll = false
            }
        }
        cache.fetch(key: "highlightDysfunc").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? Bool {
                if self.highlightDysfunc != id {
                    self.highlightDysfunc = id
                }
            } else {
                self.highlightDysfunc = false
            }
        }
        cache.fetch(key: "matchDetailsDatapoints").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? [String] {
                if self.matchDetailsDatapoints != id {
                    self.matchDetailsDatapoints = id
                }
            } else {
                self.matchDetailsDatapoints = self.defaultMatchDetailsDatapoints
            }
        }
        cache.fetch(key: "textSize").onSuccess { (d) -> () in
            if let id = NSKeyedUnarchiver.unarchiveObject(with: d) as? Int {
                if self.textSize != id {
                    self.textSize = id
                }
            } else {
                self.textSize = 8
            }
        }
    }
    
    @objc var textSize: Int = 8 {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: textSize), key: "textSize")
        }
    }
    
    @objc var matches: [Match] = [] {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: matches), key: "matches")
        }
    }
    
    @objc var teams: [Team] = [] {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: teams), key: "teams")
        }
    }
    
    @objc var currentMatch = 0 {
        didSet {
            if currentMatch != oldValue && currentMatch != -1 {
                if let currentMatchFetch = AppDelegate.getAppDelegate().firebaseFetcher.getMatch(currentMatch) {
                    let m : [String: AnyObject] = ["num":currentMatch as AnyObject, "redTeams": currentMatchFetch.redTeams! as AnyObject, "blueTeams": currentMatchFetch.blueTeams! as AnyObject]
                    UserDefaults.standard.set(m, forKey: "match")
                    notifyIfNeeded()
                }
            }
        }
    }
    
    var defaultMatchDetailsDatapoints: [String] = [
        "calculatedData.percentIncap",
        "calculatedData.avgCargoScored",
        "calculatedData.avgPanelsScored",
        "calculatedData.climbSuccessL3",
        "calculatedData.climbSuccessL1",
        "calculatedData.habLineSuccessL1",
        "calculatedData.habLineSuccessL2",
    ]
    
    @objc var matchDetailsDatapoints = [String]() {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: matchDetailsDatapoints), key: "matchDetailsDatapoints")
        }
    }
    
    @objc var starredMatchesArray = [Int]() {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: starredMatchesArray), key: "starredMatches")
        }
    }
    
    @objc var showRP: Bool {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: showRP), key: "showRP")
        }
    }
    
    @objc var highlightDysfunc: Bool {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: highlightDysfunc), key: "highlightDysfunc")
        }
    }
    
    var matchDetailsScroll: Bool? = false {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: matchDetailsScroll!), key: "matchDetailsScroll")
        }
    }
    
    var preNotify: Int? {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: preNotify!), key: "preNotify")
        }
    }
    
    @objc var slackId: String? {
        didSet {
            cache.set(value: NSKeyedArchiver.archivedData(withRootObject: slackId!), key: "slackId")
        }
    }
    
    func notifyIfNeeded() {
        let notifyForNumMatchesAway = 2
        
        for n in 0..<notifyForNumMatchesAway {
            if starredMatchesArray.contains(currentMatch + n) {
                postNotification("Starred match coming up: " + String(currentMatch + n))
            }
        }
    }
    
    func postNotification(_ notificationBody:String) {
        let content = UNMutableNotificationContent()
        content.body = notificationBody
        content.sound = UNNotificationSound.default()
        content.badge = NSNumber(integerLiteral: UIApplication.shared.applicationIconBadgeNumber + 1)
        content.title = "Upcoming Starred Match"
        let localNotification = UNNotificationRequest(identifier: "ViewerNotification", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(localNotification, withCompletionHandler: nil)
    }
    
    func notificationTriggeredCheckForNotification(_ note: Notification) {
        notifyIfNeeded()
    }
}
