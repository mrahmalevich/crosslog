//
//  Enumerations.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

enum WeightUnits: Int {
    case Kilos = 0
    case Pounds = 1
    
    func titleString() -> String {
        switch self {
        case .Kilos:
            return "kg"
        case Pounds:
            return "lb"
        }
    }
}

enum ExerciseUnits: Int {
    case Reps = 0
    case Meters = 1
    case Seconds = 2
    case Kalories = 3
    
    func titleString() -> String {
        switch self {
        case .Reps:
            return "reps"
        case .Meters:
            return "meters"
        case .Seconds:
            return "secs"
        case .Kalories:
            return "kals"
        }
    }
}