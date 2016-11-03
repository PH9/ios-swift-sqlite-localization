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

    let localization = Localization()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loadLabelClicked(sender: AnyObject) {
        self.sampleLabel.text = localization.stringForKey(self.keyTextField.text!)
    }

    @IBAction func onSegmentChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            localization.switchToLanguage("th")
            break
        case 1:
            localization.switchToLanguage("en")
            break
        case 2:
            localization.switchToLanguage("ch")
            break
        default:
            break
        }
    }


}

