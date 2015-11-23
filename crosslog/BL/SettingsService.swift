//
//  SettingsService.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

let kWeightUnitsKey = "kWeightUnitsKey"
private let kAppWasLaunchedBefore = "kAppWasLaunchedBefore"

class SettingsService {
    let isFirstLaunch: Bool
    
    // MARK: - Initialization
    static let sharedInstance: SettingsService = SettingsService()
    
    init () {
        self.isFirstLaunch = NSUserDefaults.standardUserDefaults().valueForKey(kAppWasLaunchedBefore)?.boolValue == nil
        if isFirstLaunch {
            NSUserDefaults.standardUserDefaults().setValue(true, forKey: kAppWasLaunchedBefore)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.setDefaultsValues()
        }
    }
    
    // MARK: - Settings update
    func settingsValueForKey(key: String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().valueForKey(key)
    }
    
    func setSettingsValue(value: AnyObject?, key: String) {
        NSUserDefaults.standardUserDefaults().setValue(value, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    // MARK: - Defaults
    func setDefaultsValues() {
        self.setSettingsValue(WeightUnits.Kilos.rawValue, key: kWeightUnitsKey)
    }
}