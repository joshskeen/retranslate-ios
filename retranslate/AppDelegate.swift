//
//  AppDelegate.swift
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let translationDataStore = RetranslateDataStore()
        let rtc = RetranslateController(retranslateDataStore: translationDataStore)
//        let rvc = ResultsViewController(retranslateDataStore: translationDataStore)
        let nav = UINavigationController(rootViewController: rtc)
        
        window!.backgroundColor = UIColor.blackColor()
        window!.rootViewController  = nav
        window!.makeKeyAndVisible()
        return true
    }

}