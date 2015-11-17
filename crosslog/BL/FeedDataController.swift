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
        
        sessions = NSArray(objects: "a", "b", "c")
    }
    
    override convenience init() {
        self.init(user: nil, gym: nil)
    }
}
