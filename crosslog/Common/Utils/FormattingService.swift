//
//  FormattingService.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 22.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

@objc class FormattingService: NSObject {
 
    private static var sharedDateFormattersDictionary = Dictionary<String, NSDateFormatter>()

    // MARK: - Dates
    static func dateFormatterWithFormat(format: String) -> NSDateFormatter {
        var resultFormatter = FormattingService.sharedDateFormattersDictionary[format]
        if resultFormatter == nil {
            resultFormatter = NSDateFormatter()
            resultFormatter!.dateFormat = format
            FormattingService.sharedDateFormattersDictionary[format] = resultFormatter
        }
        return resultFormatter!
    }
    
    // MARK: - Untis
    static func weightUnitsString() -> String {
        let units = WeightUnits(rawValue: SettingsService.sharedInstance.settingsValueForKey(kWeightUnitsKey) as! Int)!
        return units.titleString()
    }
    
    static func exerciseUnitsStringForUnits(units: Int) -> String {
        return ExerciseUnits(rawValue: units)!.titleString()
    }
}