//
//  AppDelegate.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 22.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        Parse.setApplicationId(kParseAppID,
            clientKey: kParseClientKey)
        
        return true
    }

}

