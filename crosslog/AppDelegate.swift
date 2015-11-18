//
//  AppDelegate.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 22.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import UIKit
import Parse
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        MagicalRecord.setupAutoMigratingCoreDataStack()
        MagicalRecord.enableShorthandMethods()
        
        Parse.setApplicationId(kParseAppID,
            clientKey: kParseClientKey)
        
        if UserService.sharedInstance.isAuthorized {
            TransitionsMediator.sharedInstance.processAuthorization(animated: false)
        } else {
            TransitionsMediator.sharedInstance.showAuthorization(animated: false)
        }
        
        return true
    }

}

