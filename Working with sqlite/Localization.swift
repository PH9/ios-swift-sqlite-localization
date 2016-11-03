//
//  Localization.swift
//  Working with sqlite
//
//  Created by Wasith Theerapattrathamrong on 11/3/2559 BE.
//  Copyright © 2559 Wasith Theerapattrathamrong. All rights reserved.
//

import Foundation
import FMDB

class Localization {

    private var wordHash: [String: String] = [:]
    private let sqlitePath: String
    private let KEY = "ui_key"
    private(set) internal var currentLanguage: String

    static var shared: Localization!

    init(sqlitePath: String, language: String) {
        self.sqlitePath = sqlitePath
        self.currentLanguage = language
        self.wordHash = self.load(language: self.currentLanguage)
    }

    func stringForKey(key: String) -> String {
        return self.stringForKey(key, default: key)
    }

    func stringForKey(key: String, default defaultString: String) -> String {
        return self.wordHash[key] ?? defaultString
    }

    func switchToLanguage(language: String) {
        if self.currentLanguage == language {
            return
        }

        self.currentLanguage = language
        self.wordHash = self.load(language: self.currentLanguage )
    }

    private func load(language language: String) -> [String: String] {
        guard let database = FMDatabase(path: self.sqlitePath) else {
            print("unable to create database")
            return self.wordHash
        }

        guard database.open() else {
            print("Unable to open database")
            return self.wordHash
        }

        var localWordHash: [String: String] = [:]
        do {
            let rs = try database.executeQuery("select \(KEY), \(currentLanguage) from messages", values: nil)
            while rs.next() {
                guard let key = rs.stringForColumn(self.KEY) else {
                    continue
                }

                guard let value = rs.stringForColumn(self.currentLanguage) else {
                    continue
                }

                localWordHash[key] = value
            }
        } catch {
            return self.wordHash
        }
        
        database.close()
        return localWordHash
    }
}


// MARK: String extension -> localized: String
extension String {

    /// return string from db by key
    var localized: String {
        return Localization.shared.stringForKey(self)
    }
}
