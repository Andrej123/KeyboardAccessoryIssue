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
    var accessoryView = AccesoryView()


    override func viewDidLoad() {
        super.viewDidLoad()
        accessoryView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping
        (UNNotificationContentExtensionResponseOption) -> Void) {

        switch response.actionIdentifier {

        case Constant.speechAction:
            print("Open screen and start speech recognition")

        case Constant.typeAction:
            print("Open app and show keyboard")

        case Constant.scheduleAction:
            Util.scheduleNotification()
            print("schedule new notification")

        case Constant.commentAction:
//            accessoryView.becomeFirstResponder()

            print("didRecive, tapped on Comment.")
            if let textResponse = response as? UNTextInputNotificationResponse {
                self.label?.text = (self.label?.text ?? "") + " " + textResponse.userText
            }

            delay(delay: 2, clousure: {
                completion(.dismiss)
            })

        case Constant.dismissAction:
            completion(.dismiss)

        default:
            print("Error: 1234") // should never happen
            completion(.dismiss)
        }
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override var inputAccessoryView: UIView? {
        return accessoryView
    }

    func delay(delay: Double, clousure: @escaping ()->() ) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when) {
            clousure()
        }
    }


}
