//
//  Localization.swift
//  Working with sqlite
//
//  Created by Wasith Theerapattrathamrong on 11/3/2559 BE.
//  Copyright © 2559 Wasith Theerapattrathamrong. All rights reserved.
//

import Foundation

class Localization: NSObject {

    var wordHash: [String: String] = [:]
    var currentLanguage: String = "th"

    override init() {
        super.init()
        self.load(language: self.currentLanguage)
    }

    init(language: String) {
        super.init()
        self.currentLanguage = language
        self.load(language: self.currentLanguage)
    }

    private func load(language: String) {

    }
}
