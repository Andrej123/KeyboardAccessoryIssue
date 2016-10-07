//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by Andrej Krizmancic on 07/10/2016.
//  Copyright © 2016 Andrej Krizmancic. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
