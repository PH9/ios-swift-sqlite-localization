//
//  ViewController.swift
//  sqlite-localization
//
//  Created by Wasith Theerapattrathamrong on 11/3/2559 BE.
//  Copyright © 2559 Wasith Theerapattrathamrong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var helperLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.keyTextField.text = "prepaid.registration.summary.title"
        self.helperLabel.text = String(
            format: "%@\n%@\n%@",
            "- Change segment control to select language.",
            "- Reload label value from db by click load button.",
            "- To look for keys please see in sample.sqlite file."
        )
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

    @IBAction func onLoadButtonClicked(sender: AnyObject) {
        self.sampleLabel.text = self.keyTextField.text?.localized
    }
}
