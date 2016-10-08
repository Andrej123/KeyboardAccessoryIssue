//
//  Constants.swift
//  ttnotdd
//
//  Created by Andrej Krizmancic on 05/10/2016.
//  Copyright © 2016 Andrej Krizmancic. All rights reserved.
//

import Foundation
import UserNotifications


struct Constant {
    static let speechAction     = "speech-action"
    static let typeAction       = "type-action"
    static let scheduleAction   = "schedule-action"
    static let commentAction    = "comment-action"
    static let dismissAction    = "dismiss"
    static let notificationCategory = "myNotificationCategory"
}

struct Util {
    static func scheduleNotification() {

        // Prepare notification content
        let content = UNMutableNotificationContent()
        content.title = "Intorduction to Notifications"
        content.subtitle = "Session 707 & 708 (advanced)"
        content.body = "Woah! These new notifications look amazing! Don't you agree?"
        content.categoryIdentifier = "myNotificationCategory"
        content.badge = 0

        // Set notification trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

        // Prepare notification request
        let request = UNNotificationRequest(identifier: "FiveSeconds", content: content, trigger: trigger)

        // Add to notification center
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if error != nil {
                print(error)
            }
        }

        
    }
}
