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

        Util.scheduleNotification()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}

