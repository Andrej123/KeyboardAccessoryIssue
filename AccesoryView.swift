//
//  AccesoryView.swift
//  ttnotdd
//
//  Created by Andrej Krizmancic on 06/10/2016.
//  Copyright © 2016 Andrej Krizmancic. All rights reserved.
//

import UIKit

class AccesoryView: UIView, UIKeyInput {

    // MARK: Outlets
    @IBOutlet weak fileprivate var textField:UITextField!

    
    // MARK: Actions
    @IBAction func buttonTapped(sender: AnyObject) {
        print("Tapped \(sender.tag!)")
        becomeFirstResponder()
    }


    // MARK: - Requierd
    fileprivate let nibName = "AccesoryView"
    fileprivate var view: UIView!

    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self) )
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    // MARK: - UIKeyInput Protocol
    var hasText: Bool {
        return textField.text?.isEmpty ?? false
    }

    func insertText(_ text: String) {
        print("insertText(\(text)) called.")
        textField.text = (textField.text ?? "") + text
    }

    func deleteBackward() {
        if let text = textField.text, !text.isEmpty {
            let newText = text.substring(to: text.index(before: text.endIndex))
            textField.text = newText
        }
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func layoutSubviews() {
//        becomeFirstResponder()
    }

}


extension AccesoryView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("delegate for textField(\(string)) called.")

        return true
    }
}

