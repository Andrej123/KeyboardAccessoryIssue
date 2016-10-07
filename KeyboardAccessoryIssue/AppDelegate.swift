//
//  AppDelegate.swift
//  KeyboardAccessoryIssue
//
//  Created by Andrej Krizmancic on 07/10/2016.
//  Copyright © 2016 Andrej Krizmancic. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in

            switch granted {
            case true:
                print("notifications allowed")
            case false:
                print("notifications not allowed")
            }
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
     }

    func applicationDidEnterBackground(_ application: UIApplication) {

        scheduleNotification()
     }

    func applicationWillEnterForeground(_ application: UIApplication) {
     }

    func applicationDidBecomeActive(_ application: UIApplication) {
     }

    func applicationWillTerminate(_ application: UIApplication) {
     }

    // MARK: Helpers
    func scheduleNotification() {

        // Prepare notification content
        let content = UNMutableNotificationContent()
        content.title = "Intorduction to Notifications"
        content.subtitle = "Session 707 & 708 (advanced)"
        content.body = "Woah! These new notifications look amazing! Don't you agree?"
        content.categoryIdentifier = "myNotificationCategory"
        content.badge = 0

        // Set notification trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

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

