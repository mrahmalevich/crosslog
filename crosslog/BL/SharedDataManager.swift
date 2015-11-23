//
//  SharedDataManager.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 20.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

class SharedDataManager {

    // MARK - Initialization
    static let sharedInstance: SharedDataManager = {
        let instance = SharedDataManager()
        return instance
    }()

    // MARK - Public mehtods
    func updateExercisesWithCompletion(completion: ErrorClosure?) {
        let exercise1 = ["id":"1",
            "name":"Squat",
            "abbr":"Squat",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercise2 = ["id":"2",
            "name":"Power Snatch",
            "abbr":"PS",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercise3 = ["id":"3",
            "name":"Snatch",
            "abbr":"Snatch",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercise4 = ["id":"4",
            "name":"Power Clean",
            "abbr":"PC",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercise5 = ["id":"5",
            "name":"Clean",
            "abbr":"Clean",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercise6 = ["id":"6",
            "name":"Clean & Jerk",
            "abbr":"CJ",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercise7 = ["id":"7",
            "name":"Deadlift",
            "abbr":"DL",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercise8 = ["id":"8",
            "name":"Bench Press",
            "abbr":"BP",
            "weighted":true,
            "optionalWeighted":false,
            "type":0,
            "units":0]
        
        let exercisesArray = [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8]
        
        // import fetched exercises to persistent store
        let context: NSManagedObjectContext = NSManagedObjectContext.MR_context()
        for rawExercise in exercisesArray {
            Exercise.MR_importFromObject(rawExercise, inContext: context)
        }
        context.MR_saveToPersistentStoreAndWait()
        
        if let completion = completion {
            completion(error: nil)
        }
    }
}