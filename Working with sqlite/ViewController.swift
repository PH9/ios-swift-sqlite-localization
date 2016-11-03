//
//  ViewController.swift
//  Working with sqlite
//
//  Created by Wasith Theerapattrathamrong on 11/2/2559 BE.
//  Copyright © 2559 Wasith Theerapattrathamrong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var sampleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.keyTextField.text = "prepaid.registration.summary.title"
    }

    @IBAction func loadLabelClicked(sender: AnyObject) {
        self.sampleLabel.text = self.keyTextField.text?.localized
    }

    @IBAction func onSegmentChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Localization.shared.switchToLanguage("th")
            break
        case 1:
            Localization.shared.switchToLanguage("en")
            break
        case 2:
            Localization.shared.switchToLanguage("ch")
            break
        default:
            break
        }
    }
}
