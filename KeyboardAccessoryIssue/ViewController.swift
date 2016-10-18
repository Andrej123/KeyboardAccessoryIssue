//
//  ViewController.swift
//  KeyboardAccessoryIssue
//
//  Created by Andrej Krizmancic on 07/10/2016.
//  Copyright © 2016 Andrej Krizmancic. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    var accessoryView = AccesoryView()

    @IBAction func buttonTapped(sender: AnyObject) {
        accessoryView.isHidden = false
        accessoryView.becomeFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        accessoryView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
        accessoryView.isHidden = true
        setNotificationCategory()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override var inputAccessoryView: UIView? {
        return accessoryView
    }

    // MARK: Helpers
    func setNotificationCategory() {
        let speeakAction = UNNotificationAction(
            identifier: Constant.speechAction,
            title: "Speeak recent moment"
        )
        let typeAction = UNNotificationAction(
            identifier: Constant.typeAction,
            title: "Type ..."
        )
        let scheduleAction = UNNotificationAction(
            identifier: Constant.scheduleAction,
            title: "Schedule new notification"
        )

        let commentAction = UNTextInputNotificationAction(
            identifier: Constant.commentAction,
            title: "Comment",
            options: [],
            textInputButtonTitle: "Send",
            textInputPlaceholder: "Please, enter text here...")

        let dismiss = UNNotificationAction(
            identifier: Constant.dismissAction,
            title: "Dismiss",
            options: [.destructive]
        )
        let category = UNNotificationCategory(
            identifier: Constant.notificationCategory,
//            actions: [speeakAction, typeAction, scheduleAction, commentAction, dismiss],
            actions: [],
            intentIdentifiers: []
        )

        UNUserNotificationCenter.current().setNotificationCategories([category])
    }

}

