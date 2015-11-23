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
    func updateSessionsWithCompletion(completion: ErrorClosure?) {

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
                                               "exerciseId":"1"],
                                              ["id":"2",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":"2"]]],
                                    ["id":"2",
                                     "comment":"this is workout 2",
                                     "items":[["id":"3",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":"3"],
                                              ["id":"4",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":"4"]]]]]

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
                                               "exerciseId":"5"],
                                              ["id":"6",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":"6"]]],
                                    ["id":"4",
                                     "comment":"this is workout 4",
                                     "items":[["id":"7",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":"7"],
                                              ["id":"8",
                                               "count":0,
                                               "minCount":0,
                                               "weight":100,
                                               "extraWeight":true,
                                               "units":0,
                                               "exerciseId":"8"]]]]]
        let rawSessions = [session1, session2]
        
        // import sessions to persistent store
        let context = NSManagedObjectContext.MR_context()
        for sessionDict in rawSessions {
            Training.MR_importFromObject(sessionDict, inContext: context)
        }
        context.MR_saveToPersistentStoreAndWait()

        // call completion handler
        if let completion = completion {
            completion(error: nil)
        }
    }
}
