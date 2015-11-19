//
//  FeedDataController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

// TODO: feed fetching with options (feed of user, feed of box)

class FeedDataController: NSObject {
    
    let user: User?
    let gym: Gym?
    var sessions: NSArray = NSArray()
    
    // MARK - Initialization
    init(user: User?, gym: Gym?) {
        self.user = user
        self.gym = gym
        super.init()
        
        sessions = NSArray()
    }
    
    override convenience init() {
        self.init(user: nil, gym: nil)
    }
    
    // MARK - Public mehtods
    func updateSessions() {

        let session1 = ["id":"1",
                        "date":"2015-01-01",
                        "workouts":[["id":"1",
                                     "comment":"this is workout 1",
                                     "items":[["id":"1",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exercizeId":1],
                                              ["id":"2",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":2]]],
                                    ["id":"2",
                                     "comment":"this is workout 2",
                                     "items":[["id":"3",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exercizeId":3],
                                              ["id":"4",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":4]]]]]

        let session2 = ["id":"2",
                        "date":"2015-01-02",
                        "workouts":[["id":"3",
                                     "comment":"this is workout 3",
                                     "items":[["id":"5",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exercizeId":5],
                                              ["id":"6",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":6]]],
                                    ["id":"4",
                                     "comment":"this is workout 4",
                                     "items":[["id":"7",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exercizeId":7],
                                              ["id":"8",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":8]]]]]
        let rawSessions = [session1, session2]
        
        print("\(rawSessions.count)")
    }
    
    func updateExercises() {
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
            let newExercise: Exercise = Exercise.MR_importFromObject(rawExercise, inContext: context)
            print(newExercise)
        }
        context.MR_saveToPersistentStoreAndWait()
    }
}
