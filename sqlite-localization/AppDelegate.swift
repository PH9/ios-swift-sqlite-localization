//
//  AppDelegate.swift
//  sqlite-localization
//
//  Created by Wasith Theerapattrathamrong on 11/3/2559 BE.
//  Copyright © 2559 Wasith Theerapattrathamrong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        let sqlitePath = NSBundle.mainBundle().pathForResource("sample.sqlite", ofType: nil)!
        Localization.shared = Localization(sqlitePath: sqlitePath, language: "th")
        return true
    }
}

