//
//  ViewController.swift
//  KeyboardAccessoryIssue
//
//  Created by Andrej Krizmancic on 07/10/2016.
//  Copyright © 2016 Andrej Krizmancic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak fileprivate var textField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()

    }

}

